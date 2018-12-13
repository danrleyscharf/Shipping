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
								window.location = '<c:url value="/viagens/"/>';
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
		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<script type="text/javascript">		
		$( function() {
			$( "#dataSaida" ).datepicker( "option", "dateFormat", "dd/mm/yy" );
			$( "#dataChegada" ).datepicker("option", "dateFormat", "dd/mm/yy");
		  } );
		</script>
	</jsp:attribute>

	<jsp:body>
		<section class="wrapper">	
				<div class="row">
		            <div class="col-md-3 col-md-offset-3">	
		            <h1>Cadastro de Viagens</h1>
						<form id="frm" action="<c:url value="/viagens/"/>"
								method="POST" class="well span6">
							
							<div class="form-group">
								<label for="id">Código:</label>
								<input type="text" id="id" name="id" value="${viagens.id}"
								readonly class="form-control" />
							</div>		
							
							<div class="form-group">
								<label for="dataSaida">Data de Saida:</label>
								<input type="text" id="dataSaida" name="dataSaida"
								class="form-control" value="<fmt:formatDate pattern = "dd/MM/yyyy" 
         							value = "${viagens.dataSaida}" />"  />
							</div>
							
							<div class="form-group">
								<label for="dataChegada">Data de Chegada:</label>
								<input type="text" id="dataChegada" name="dataChegada"
								class="form-control" value="<fmt:formatDate pattern = "dd/MM/yyyy" 
         							value = "${viagens.dataChegada}" />" />
							</div>
														
							<div class="form-group">
							<label for="cddOrigem">CDD Origem:</label>
								<select id="cddOrigem" name="cddOrigem" class="form-control">
									<option value="">(Selecione)</option>
									<c:forEach var="cddOrigem" items="${centrosDistribuicao}">
										<option value="${cddOrigem.id}"
												${cddOrigem.id==viagens.cddOrigem.id ? 'selected' : ''}>
										${cddOrigem.descricao}</option>
									</c:forEach>
								</select>	
							</div>
							
							<div class="form-group">
							<label for="cddDestino">CDD Destino:</label>
								<select id="cddDestino" name="cddDestino" class="form-control">
									<option value="">(Selecione)</option>
									<c:forEach var="cddDestino" items="${centrosDistribuicao}">
										<option value="${cddDestino.id}"
												${cddDestino.id==viagens.cddDestino.id ? 'selected' : ''}>
										${cddDestino.descricao}</option>
									</c:forEach>
								</select>	
							</div>
							
							<div class="form-group">
							<label for="funcionarios">Funcionario:</label>
								<select id="funcionarios" name="funcionarios" class="form-control">
									<option value="">(Selecione)</option>
									<c:forEach var="funcionario" items="${funcionarios}">
										<option value="${funcionario.id}"
												${funcionario.id==viagens.funcionarios.id ? 'selected' : ''}>
										${funcionario.nome}</option>
									</c:forEach>
								</select>	
							</div>
							
							<div class="form-group">
							<label for="veiculos">Veiculo:</label>
								<select id="veiculos" name="veiculos" class="form-control">
									<option value="">(Selecione)</option>
									<c:forEach var="veiculo" items="${veiculos}">
										<option value="${veiculo.id}"
												${veiculo.id==viagens.veiculos.id ? 'selected' : ''}>
										${veiculo.descricao}</option>
									</c:forEach>
								</select>	
							</div>
							
							<button type="reset" class="btn btn-default">Limpar</button>
							<button type="submit" class="btn btn-primary">Salvar</button>
						</form>
					</div>
				</div>
		</section>
	</jsp:body>
</layout:template>