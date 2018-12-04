<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags/layout" prefix="layout" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<layout:template>
	<jsp:attribute name="cssEspecificos">
	</jsp:attribute>
	<jsp:attribute name="scriptsEspecificos">
		<script type="text/javascript">
			$("#frm").submit(function() {
				$.ajax({
					type : $("#frm").attr('method'),
					url : $("#frm").attr('action'),
					data : $('#frm').serialize(),
					success : function(data) {
						swal({   
							title: "Salvo!",   
							text: "Registro salvo com sucesso.",   
							type: "success",   
							showCancelButton: false,   
							confirmButtonColor: "#DD6B5",   
							confirmButtonText: "Ok",   
							closeOnConfirm: false }, 
							function(){
								window.location = '<c:url value="/vincularEncomendas/"/>';
						});
					},//Fim success
					error : function() {
						swal("Falha!","Falha ao salvar registro.",
								"error");
					}
				});//Fim ajax
				return false;
			}); //Fim submit
		</script>
		<script type="text/javascript">
		function adicionar(idViagem,idEncomenda) {
			swal({   
				title: "Confirma a inclusão do registro?!",   
				text: "Isso irá vincular a encomenda à viagem!",   
				type: "warning",   
				showCancelButton: true,   
				confirmButtonColor: "#DD6B55",
				cancelButtonText: "Cancelar",   
				confirmButtonText: "Adicionar",   
				closeOnConfirm: false 
				}, 
				function(){   
					var destino = '<c:url value="/vincularEncomendas/adicionar/"/>' + idViagem + '/' + idEncomenda;
					$.ajax({
						type : 'GET',
						url : destino,
						success : function(data) {
							if (data.situacao == "OK"){
								$('#row_' + id).add();
								swal("Vinculado!", "Registro vinculado com sucesso.", "success");
							}else{
								swal("Erro!", "Falha ao vincular registro.", "error");
							}
						},//Fim success
						error : function() {
							swal("Erro!", "Falha ao vincular registro.", "error");
						}
					}); //Fim ajax
			}); //Fim swal
		}
	</script>
	<script type="text/javascript">
		function remover(id,row) {
			swal({   
				title: "Confirma a exclusão do registro?!",   
				text: "Isso irá desvincular a encomenda da viagem!",   
				type: "warning",   
				showCancelButton: true,   
				confirmButtonColor: "#DD6B55",
				cancelButtonText: "Cancelar",   
				confirmButtonText: "Remover",   
				closeOnConfirm: false 
				}, 
				function(){   
					var destino = '<c:url value="/Encomendas_ViagensController/remover/' + id '"/>';
					$.ajax({
						type : 'GET',
						url : destino,
						success : function(data) {
							if (data.situacao == "OK"){
								$('#row_' + id).remove();
								swal("Vinculado!", "Registro removido com sucesso.", "success");
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
				<div class="row">
		            	<h1>Vincular Encomendas à Viagem</h1>
						<div class="spacer"></div>
						<div class="form-group">
							<table>
								<tr>
									<td>Código: </td>
									<td>${viagens.id}</td>
								</tr>
								<tr>
										<td>Data de Saída: </td>
										<td><fmt:formatDate pattern = "dd/MM/yyyy" 
											value = "${viagens.dataSaida}" /></td>
								</tr>
								<tr>
										<td>Data de Chegada: </td>
										<td><fmt:formatDate pattern = "dd/MM/yyyy" 
											value = "${viagens.dataChegada}" /></td>
								</tr>
							</table>
						</div>		
							
						<div class="spacer"></div>	
							<table id="dados" data-id-field="id" data-unique-id="id"
								class="table table-striped table-bordered display"
								style="width: 100%">
								<thead>
									<tr>
										<th class="col-md-2" >Código</th>
										<th>Descrição</th>
										<th>Chave de Rastreio</th>
										<th class="col-md-2">Anexar</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="encomenda" items="${encomendas}">
										<tr id="row_${encomenda.id}">
											<td>${encomenda.id}</td>
											<td>${encomenda.descricao}</td>
											<td>${encomenda.chaveRastreio}</td>
											<td>
												<a class="edit btn btn-primary" title="Anexar"
													href="javascript:adicionar(${viagens.id},${encomenda.id})">
													<i class="li_clip" aria-hidden="true"></i></a>
												<a class="remove btn btn-danger" title="Remover"
													href="javascript:remover(${encomenda.id})">
													<i class="fa fa-trash" aria-hidden="true"></i></a>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
					</div>
		</section>
	</jsp:body>
</layout:template>