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
								window.location = '<c:url value="/estados/"/>';
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
		            	<h1>Cadastro de Estados</h1>
						<form id="frm" action="<c:url value="/estados/"/>"
								method="POST" class="well span6">
							<div class="form-group">
								<label for="id">Código:</label>
								<input type="text" id="id" name="id" value="${estados.id}"
								readonly class="form-control" />
							</div>		
							<div class="form-group">
								<label for="descricao">Estado:</label>
								<input type="text" id="estado" name="estado"
								class="form-control" value="${estados.estado}" />
							</div>
							<div class="form-group">
								<label for="descricao">UF:</label>
								<input type="text" id="uf" name="uf"
								class="form-control" value="${estados.uf}" />
							</div>
							<button type="reset" class="btn btn-default">Limpar</button>
							<button type="submit" class="btn btn-primary">Salvar</button>
						</form>
					</div>
				</div>
		</section>
	</jsp:body>
</layout:template>