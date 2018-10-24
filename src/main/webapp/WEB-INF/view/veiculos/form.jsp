<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags/layout" prefix="layout"%>
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
								window.location = '<c:url value="/veiculos/"/>';
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
	</jsp:attribute>

	<jsp:body>
		<section class="wrapper">	
				<div class="row">
		            <div class="col-md-3 col-md-offset-3">	
		            	<h1>Cadastro de Veículos</h1>
						<form id="frm" action="<c:url value="/veiculos/"/>"
								method="POST" class="well span6">
							
							<div class="form-group">
								<label for="id">Código:</label>
								<input type="text" id="id" name="id" value="${veiculos.id}"
								readonly class="form-control" />
							</div>		
							
							<div class="form-group">
								<label for="descricao">Descrição:</label>
								<input type="text" id="descricao" name="descricao"
								class="form-control" value="${veiculos.descricao}" />
							</div>
							
							<div class="form-group">
								<label for="fabricante">Fabricante:</label>
								<input type="text" id="fabricante" name="fabricante"
								class="form-control" value="${veiculos.fabricante}" />
							</div>
							
							<div class="form-group">
								<label for="modelo">Modelo:</label>
								<input type="text" id="modelo" name="modelo"
								class="form-control" value="${veiculos.modelo}" />
							</div>
							
							<div class="form-group">
								<label for="placa1">Placa 1:</label>
								<input type="text" id="placa1" name="placa1"
								class="form-control" value="${veiculos.placa1}" />
							</div>
							
							<div class="form-group">
								<label for="placa2">Placa 2:</label>
								<input type="text" id="placa2" name="placa2"
								class="form-control" value="${veiculos.placa2}" />
							</div>
							
							<div class="form-group">
								<label for="placa3">Placa 3:</label>
								<input type="text" id="placa3" name="placa3"
								class="form-control" value="${veiculos.placa3}" />
							</div>
							
							<div class="form-group">
								<label for="anoModelo">Ano Modelo:</label>
								<input type="text" id="anoModelo" name="anoModelo"
								class="form-control" value="${veiculos.anoModelo}" />
							</div>
							
							<div class="form-group">
								<label for="anoFabricacao">Ano Fabricação:</label>
								<input type="text" id="anoFabricacao" name="anoFabricacao"
								class="form-control" value="${veiculos.anoFabricacao}" />
							</div>
							
							<div class="form-group">
								<label for="pesoMax">Peso Máximo:</label>
								<input type="text" id="pesoMax" name="pesoMax"
								class="form-control" value="${veiculos.pesoMax}" />
							</div>
														
							<button type="reset" class="btn btn-default">Limpar</button>
							<button type="submit" class="btn btn-primary">Salvar</button>
						</form>
					</div>
				</div>
		</section>
	</jsp:body>
</layout:template>