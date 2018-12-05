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
	$(document).ready(function (){
		$( "#dataColeta" ).datepicker();
		$( "#prevEntrega" ).datepicker();
		});
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
					var destino = '<c:url value="/encomendas/delete/"/>' + id;
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
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script type="text/javascript">		
	$( function() {
		$( "#dataColeta" ).datepicker( "option", "dateFormat", "dd/mm/yy" );
		$( "#prevEntrega" ).datepicker("option", "dateFormat", "dd/mm/yy");
		} );
	</script>
	</jsp:attribute>

	<jsp:body>
		<section class="wrapper">
			<h1>Lista de Encomendas</h1>
			<a class="btn btn-primary" href="<c:url value="/encomendas/form"/>" 
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
						<th>Chave de Rastreio</th>
						<th>Data da Coleta</th>
						<th>Previsão de Entrega</th>
						<th>Origem</th>
						<th>Destino</th>
						<th class="col-md-2">Ação</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="encomenda" items="${encomendas}">
				<tr id="row_${encomenda.id}">
					<td>${encomenda.id}</td>
					<td>${encomenda.descricao}</td>
					<td>${encomenda.chaveRastreio}</td>
					<td><fmt:formatDate pattern = "dd/MM/yyyy" 
						value="${encomenda.dataColeta}" /></td>
					<td><fmt:formatDate pattern = "dd/MM/yyyy" 
						value="${encomenda.prevEntrega}" /></td>
				    <td>${encomenda.entidadeOrigem.cidades.cidade}</td>
					<td>${encomenda.entidadeDestino.cidades.cidade}</td>
					<td>
						<a class="edit btn btn-primary" title="Editar"
							href="<c:url value="/encomendas/form/${encomenda.id}"/>">
							<i class="fa fa-pencil" aria-hidden="true"></i></a>
						<a class="remove btn btn-danger" title="Remover"
							href="javascript:remover(${encomenda.id})">
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