<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib tagdir="/WEB-INF/tags/layout" prefix="layout"%>

<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

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
					var destino = '<c:url value="/viagens/delete/"/>' + id;
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
			<h1>Lista de Viagens</h1>
			<a class="btn btn-primary" href="<c:url value="/viagens/form"/>" 
				id="novo"><i class="fa fa-plus" aria-hidden="true"></i> Novo</a>
			<br />
			<div class="spacer"></div>
			<table id="dados" data-id-field="id" data-unique-id="id"
				class="table table-striped table-bordered display"
				style="width: 100%">
				<thead>
					<tr>
						<th class="col-md-2" >Código</th>
						<th>Data Saida</th>
						<th>Cdd Origem</th>
						<th>Cdd Destino</th>
						<th>Funcionario</th>
						<th>Veiculo</th>
						<th class="col-md-2">Ação</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="viagens" items="${viagens}">
				<tr id="row_${viagens.id}">
					<td>${viagens.id}</td>
					<td><fmt:formatDate pattern = "dd/MM/yyyy" 
         							value = "${viagens.dataSaida}" /></td>
					<td>${viagens.cddOrigem.descricao}</td>
					<td>${viagens.cddDestino.descricao}</td>
					<td>${viagens.funcionarios.nome}</td>
					<td>${viagens.veiculos.descricao}</td>
					<td>
						<a class="edit btn btn-primary" title="Editar"
							href="<c:url value="/viagens/form/${viagens.id}"/>">
							<i class="fa fa-pencil" aria-hidden="true"></i></a>
						<a class="remove btn btn-danger" title="Remover"
							href="javascript:remover(${viagens.id})">
							<i class="fa fa-trash" aria-hidden="true"></i></a>
						<a class="edit btn btn-primary" title="Vincular"
							href="<c:url value="/vincularEncomendas/form/${viagens.id}"/>">
							<i class="li_clip" aria-hidden="true"></i></a>	
					</td>
				</tr>
			</c:forEach>
				</tbody>
			</table>
			<div class="spacer"></div>
		</section>
	</jsp:body>
</layout:template>