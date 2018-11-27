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
								window.location = '<c:url value="/entidades/"/>';
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
			var fmt = {
		            dateFormat: $.datepicker.TIMESTAMP
		        };
			
		    $( "#dataNasc" ).datepicker();
		  } );
		</script>
	</jsp:attribute>

	<jsp:body>
		<section class="wrapper">	
				<div class="row">
		            <div class="col-md-3 col-md-offset-3">	
		            	<h1>Cadastro de Entidades</h1>
						<form id="frm" action="<c:url value="/entidades/"/>"
								method="POST" class="well span6">
							
							<div class="form-group">
								<label for="id">Código:</label>
								<input type="text" id="id" name="id" value="${entidades.id}"
								readonly class="form-control" />
							</div>		
							
							<div class="form-group">
								<label for="nome">Nome:</label>
								<input type="text" id="nome" name="nome"
								class="form-control" value="${entidades.nome}" />
							</div>
							
							<div class="form-group">
								<label for="cpfCnpj">CPF/CNPJ:</label>
								<input type="text" id="cpfCnpj" name="cpfCnpj"
								class="form-control" value="${entidades.cpfCnpj}" />
							</div>
							
							<div class="form-group">
								<label for="dataNasc">Data Nascimento:</label>
								<input type="text" id="dataNasc" name="dataNasc"
								class="form-control" value="<fmt:formatDate pattern = "dd/MM/yyyy" 
         							value = "${entidades.dataNasc}" />" />
							</div>
							
							<div class="form-group">
								<label for="cpfCnpj">Endereço:</label>
								<input type="text" id="endereco" name="endereco"
								class="form-control" value="${entidades.endereco}" />
							</div>
							
							<div class="form-group">
								<label for="numero">Número:</label>
								<input type="text" id="numero" name="numero"
								class="form-control" value="${entidades.numero}" />
							</div>
							
							<div class="form-group">
								<label for="bairro">Bairro:</label>
								<input type="text" id="bairro" name="bairro"
								class="form-control" value="${entidades.bairro}" />
							</div>
							
							<div class="form-group">
								<label for="cep">CEP:</label>
								<input type="text" id="cep" name="cep" 
								class="form-control" value="${entidades.cep}" />
							</div>
							
							<div class="form-group">
								<label for="complemento">Complemento:</label>
								<input type="text" id="complemento" name="complemento"
								class="form-control" value="${entidades.complemento}" />
							</div>
							
							<div class="form-group">
							<label for="cidades">Cidade:</label>
								<select id="cidades" name="cidades" class="form-control">
									<option value="">(Selecione)</option>
									<c:forEach var="cidades" items="${cidades}">
										<option value="${cidades.id}"
												${cidades.id==entidades.cidades.id ? 'selected' : ''}>
										${cidades.cidade}</option>
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