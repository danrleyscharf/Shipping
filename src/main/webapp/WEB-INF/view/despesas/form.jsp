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
								window.location = '<c:url value="/despesas/"/>';
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
		    $( "#dataDespesa" ).datepicker();
		  } );
		</script>
	</jsp:attribute>

	<jsp:body>
		<section class="wrapper">	
				<div class="row">
		            <div class="col-md-3 col-md-offset-3">	
		            	<h1>Cadastro de Despesas</h1>
						<form id="frm" action="<c:url value="/despesas/"/>"
								method="POST" class="well span6">
							
							<div class="form-group">
								<label for="id">Código:</label>
								<input type="text" id="id" name="id" value="${despesas.id}"
								readonly class="form-control" />
							</div>		
							
							<div class="form-group">
								<label for="descricao">Descrição:</label>
								<input type="text" id="descricao" name="descricao"
								class="form-control" value="${despesas.descricao}" />
							</div>
							
							<div class="form-group">
								<label for="dataDespesa">Data:</label>
								<input type="text" id="dataDespesa" name="dataDespesa"
								class="form-control" value="<fmt:formatDate pattern = "dd/MM/yyyy" 
         							value = "${despesas.dataDespesa}" />" />
							</div>
							
							<div class="form-group">
								<label for="valor">Valor:</label>
								<input type="text" id="valor" name="valor"
								class="form-control" value="${despesas.valor}" />
							</div>
							
							<div class="form-group">
							<label for="tiposDespesa">Tipo Despesa:</label>
								<select id="tiposDespesa" name="tiposDespesa" class="form-control">
									<option value="">(Selecione)</option>
									<c:forEach var="tipoDespesa" items="${tiposDespesa}">
										<option value="${tipoDespesa.id}"
												${tipoDespesa.id==despesas.tiposDespesa.id ? 'selected' : ''}>
										${tipoDespesa.descricao}</option>
									</c:forEach>
								</select>	
							</div>
							
							<div class="form-group">
							<label for="viagens">Viagem:</label>
								<select id="viagens" name="viagens" class="form-control">
									<option value="">(Selecione)</option>
									<c:forEach var="viagem" items="${viagens}">
										<option value="${viagem.id}"
												${viagem.id==despesas.viagens.id ? 'selected' : ''}>
										${viagem.id}</option>
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