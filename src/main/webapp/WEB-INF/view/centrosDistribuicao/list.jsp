<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib tagdir="/WEB-INF/tags/layout" prefix="layout"%>

<layout:template>
<jsp:attribute name="cssEspecificos">
</jsp:attribute>

<jsp:attribute name="scriptsEspecificos">
	<script type="text/javascript">
		function remover(id,row) {
			swal({   
				title: "Confirma a remoção do registro?!",   
				text: "Esta ação não pode ser desfeita!",   
				type: "warning",   
				showCancelButton: true,   
				confirmButtonColor: "#DD6B55",
				cancelButtonText: "Cancelar",   
				confirmButtonText: "Remover",   
				closeOnConfirm: false 
				}, 
				function(){   
					var destino = '<c:url value="/centrosDistribuicao/delete/"/>' + id;
					$.ajax({
						type : 'POST',
						url : destino,
						success : function(data) {
							if (data.situacao == "OK"){
								$('#row_' + id).remove();
								swal("Removido!", "Registro removido com sucesso.", "success");
							}else{
								swal("Erro!", "Falha ao remover registro.", "error");
							}
						},//Fim success
						error : function() {
							swal("Erro!", "Falha ao remover registro.", "error");
						}
					}); //Fim ajax
			}); //Fim swal
		}
	</script>


	</jsp:attribute>

	<jsp:body>
		<section class="wrapper">
			<h1>Lista de Centros de Distribuição</h1>
			<a class="btn btn-primary" href="<c:url value="/centrosDistribuicao/form"/>" 
				id="novo"><i class="fa fa-plus" aria-hidden="true"></i> Novo</a>
			<br />
			<div class="spacer"></div>
			<table id="dados" data-id-field="id" data-unique-id="id"
				class="table table-striped table-bordered display"
				style="width: 100%">
				<thead>
					<tr>
						<th class="col-md-2" >Código</th>
						<th>Descrição</th>
						<th>Cidade</th>
						<th class="col-md-2">Ação</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="centrosDistribuicao" items="${centrosDistribuicao}">
				<tr id="row_${centrosDistribuicao.id}">
					<td>${centrosDistribuicao.id}</td>
					<td>${centrosDistribuicao.descricao}</td>
					<td>${cidades.cidades.cidade}</td>
					<td>
						<a class="edit btn btn-primary" title="Editar"
							href="<c:url value="/centrosDistribuicao/form/${centrosDistribuicao.id}"/>">
							<i class="fa fa-pencil" aria-hidden="true"></i></a>
						<a class="remove btn btn-danger" title="Remover"
							href="javascript:remover(${centrosDistribuicao.id})">
							<i class="fa fa-trash" aria-hidden="true"></i></a>
					</td>
				</tr>
			</c:forEach>
				</tbody>
			</table>
			<div class="spacer"></div>
		</section>
	</jsp:body>
</layout:template>