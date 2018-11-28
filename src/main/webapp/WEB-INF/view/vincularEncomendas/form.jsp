<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags/layout" prefix="layout" %>
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
		function adicionar(id,id_encomenda) {
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
					var destino = '<c:url value="/vincularEncomendas/adicionar/"/>' + id + '/' + id_encomenda;
					$.ajax({
						type : 'GET',
						url : destino,
						success : function(data) {
							if (data.situacao == "OK"){
								$('#row_' + id).remove();
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
						type : 'POST',
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
		            <div class="col-md-3 col-md-offset-3">	
		            	<h1>Vincular Encomendas à Viagem</h1>
						<div class="spacer"></div>
							<div class="form-group">
								<label for="id">Código:</label>
								<input type="text" id="id" name="id" value="${viagens.id}"
								readonly class="form-control" />
							</div>		
							
							<div class="form-group">
								<label for="dataSaida">Data de Saida:</label>
								<input type="text" id="dataSaida" name="dataSaida"
								class="form-control" value="${viagens.dataSaida}" />
							</div>
							
							<div class="form-group">
								<label for="dataChegada">Data de Chegada:</label>
								<input type="text" id="dataChegada" name="dataChegada"
								class="form-control" value="${viagens.dataChegada}" />
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
										<th class="col-md-2">Ação</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="encomenda" items="${encomendas}">
										<tr id="row_${encomenda.id}">
											<td>${encomenda.descricao}</td>
											<td>${encomenda.chaveRastreio}</td>
											<td>
												<a class="edit btn btn-primary" title="Editar"
													href="javascript:adicionar(${dadosViagem.viagem.id},${encomenda.id})">
													<i class="fa fa-pencil" aria-hidden="true"></i></a>
												<a class="remove btn btn-danger" title="Remover"
													href="javascript:remover(${encomenda.id})">
													<i class="fa fa-trash" aria-hidden="true"></i></a>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
					</div>
				</div>
		</section>
	</jsp:body>
</layout:template>