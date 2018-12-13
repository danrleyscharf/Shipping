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
								window.location = '<c:url value="/entregas/"/>';
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
		    $( "#dataEntrega" ).datepicker();
		  } );
		</script>
	</jsp:attribute>

	<jsp:body>
		<section class="wrapper">	
				<div class="row">
		            <div class="col-md-3 col-md-offset-3">	
		            	<h1>Cadastro de Cidades</h1>
						<form id="frm" action="<c:url value="/entregas/"/>"
								method="POST" class="well span6">
							
							<div class="form-group">
								<label for="id">Código:</label>
								<input type="text" id="id" name="id" value="${entregas.id}"
								readonly class="form-control" />
							</div>		

							<div class="form-group">
								<label for="encomendas">Encomenda:</label>
									<select id="encomendas" name="encomendas" class="form-control">
										<option value="">(Selecione)</option>
										<c:forEach var="encomenda" items="${encomendas}">
											<option value="${encomenda.id}"
													${encomenda.id==entregas.encomendas.id ? 'selected' : ''}>
											${encomenda.chaveRastreio}</option>
										</c:forEach>
									</select>	
							</div>
							
							<div class="form-group">
								<label for="dataEntrega">Data da entrega:</label>
								<input type="text" id="dataEntrega" name="dataEntrega"
								class="form-control" value="<fmt:formatDate pattern = "dd/MM/yyyy" 
         							value = "${entregas.dataEntrega}" />" />
							</div>
							
							<div class="form-group">
								<label for="obs">Observações:</label>
								<textarea rows="4" cols="50" wrap="hard" maxlength="255"
									id="obs" name="obs" maxlength="255"
									class="form-control" >
								</textarea>
							</div>

							<div class="form-group">
								<label for="sucesso">Entrega Realizada:</label>
								<input type="checkbox" id="sucesso" name="sucesso"
								class="form-control" />
							</div>
							
							<button type="reset" class="btn btn-default">Limpar</button>
							<button type="submit" class="btn btn-primary">Salvar</button>
						</form>
					</div>
				</div>
		</section>
	</jsp:body>
</layout:template>