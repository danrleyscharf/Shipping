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
								window.location = '<c:url value="/funcionarios/"/>';
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
		            	<h1>Cadastro de Funcionarios</h1>
						<form id="frm" action="<c:url value="/funcionarios/"/>"
								method="POST" class="well span6">
							
							<div class="form-group">
								<label for="id">Código:</label>
								<input type="text" id="id" name="id" value="${funcionarios.id}"
								readonly class="form-control" />
							</div>		
							
							<div class="form-group">
								<label for="nome">Nome:</label>
								<input type="text" id="nome" name="nome"
								class="form-control" value="${funcionarios.nome}" />
							</div>
							
							<div class="form-group">
								<label for="dataNasc">Data Nasc.:</label>
								<input type="date" id="dataNasc" name="dataNasc"
								class="form-control" value="${funcionarios.dataNasc}" />
							</div>
							
							<div class="form-group">
								<label for="cpf">CPF:</label>
								<input type="text" id="cpf" name="cpf"
								class="form-control" value="${funcionarios.cpf}" />
							</div>
							
							<div class="form-group">
							<label for="usuario">Usuario:</label>
								<select id="usuario" name="usuario" class="form-control">
									<option value="">(Selecione)</option>
									<c:forEach var="usuario" items="${usuario}">
										<option value="${usuario.id}"
												${usuario.id==funcionarios.usuario.id ? 'selected' : ''}>
										${usuario.nome}</option>
									</c:forEach>
								</select>	
							</div>
							
							<div class="form-group">
							<label for="Cargos">cargo:</label>
								<select id="cargos" name="cargo" class="form-control">
									<option value="">(Selecione)</option>
									<c:forEach var="cargos" items="${cargos}">
										<option value="${cargos.id}"
												${cargos.id==funcionarios.cargos.id ? 'selected' : ''}>
										${cargos.descricao}</option>
									</c:forEach>
								</select>	
							</div>
							
							<div class="form-group">
							<label for="centrosDistribuicao">Centro Distribuição:</label>
								<select id="centrosDistribuicao" name="centrosDistribuicao" class="form-control">
									<option value="">(Selecione)</option>
									<c:forEach var="centrosDistribuicao" items="${centrosDistribuicao}">
										<option value="${centrosDistribuicao.id}"
												${centrosDistribuicao.id==funcionarios.centrosDistribuicao.id ? 'selected' : ''}>
										${centrosDistribuicao.descricao}</option>
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