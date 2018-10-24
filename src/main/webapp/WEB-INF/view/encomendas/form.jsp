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
								window.location = '<c:url value="/encomendas/"/>';
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
		            	<h1>Cadastro de Encomendas</h1>
						<form id="frm" action="<c:url value="/encomendas/"/>"
								method="POST" class="well span6">
							
							<div class="form-group">
								<label for="id">Código:</label>
								<input type="text" id="id" name="id" value="${encomendas.id}"
								readonly class="form-control" />
							</div>		
							
							<div class="form-group">
								<label for="descricao">Descrição:</label>
								<input type="text" id="descricao" name="descricao"
								class="form-control" value="${encomendas.descricao}" />
							</div>
							
							<div class="form-group">
								<label for="chaveRastreio">Chave de Rastreio:</label>
								<input type="text" id="chaveRastreio" name="chaveRastreio"
								class="form-control" value="${encomendas.chaveRastreio}" />
							</div>
							
							<div class="form-group">
								<label for="peso">Peso (Kg):</label>
								<input type="text" id="peso" name="peso"
								class="form-control" value="${encomendas.peso}" />
							</div>
							
							<div class="form-group">
								<label for="valor">Valor:</label>
								<input type="text" id="valor" name="valor"
								class="form-control" value="${encomendas.valor}" />
							</div>
							
							<div class="form-group">
								<label for="dataColeta">Coleta:</label>
								<input type="date" id="dataColeta" name="dataColeta"
								class="form-control" value="${encomendas.dataColeta}" />
							</div>
							
							<div class="form-group">
								<label for="prevEntrega">Previsão de Entrega:</label>
								<input type="date" id="prevEntrega" name="prevEntrega"
								class="form-control" value="${encomendas.prevEntrega}" />
							</div>
							
							<div class="form-group">
								<label for="fragil">Frágil:</label>
								<input type="checkbox" id="fragil" name="fragil" 
								class="form-control" value="${encomendas.fragil}" />
							</div>
							
							<div class="form-group">
								<label for="altura">Altura (cm):</label>
								<input type="number" id="altura" name="altura"
								class="form-control" value="${encomendas.altura}" />
							</div>
							
							<div class="form-group">
								<label for="largura">Largura (cm):</label>
								<input type="number" id="largura" name="largura"
								class="form-control" value="${encomendas.largura}" />
							</div>
							
							<div class="form-group">
								<label for="profundidade">Profundidade (cm):</label>
								<input type="number" id="profundidade" name="profundidade"
								class="form-control" value="${encomendas.profundidade}" />
							</div>
							
							<div class="form-group">
							<label for="entidadeOrigem">Entidade de Origem:</label>
								<select id="entidadeOrigem" name="entidadeOrigem" class="form-control">
									<option value="">(Selecione)</option>
									<c:forEach var="entidadeOrigem" items="${entidades}">
										<option value="${entidades.id}"
												${entidades.id==encomendas.entidades.id ? 'selected' : ''}>
										${entidades.nome}</option>
									</c:forEach>
								</select>	
							</div>
							
							<div class="form-group">
							<label for="entidadeDestino">Entidade de Destino:</label>
								<select id="entidades" name="entidades" class="form-control">
									<option value="">(Selecione)</option>
									<c:forEach var="entidades" items="${entidades}">
										<option value="${entidades.id}"
												${entidades.id==encomendas.entidades.id ? 'selected' : ''}>
										${entidades.nome}</option>
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