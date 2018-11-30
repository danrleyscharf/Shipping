<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags/layout" prefix="layout"%>
<layout:template>
	<jsp:attribute name="cssEspecificos">
	</jsp:attribute>
	<jsp:attribute name="scriptsEspecificos">
		<script type="text/javascript">
			
		</script>
	</jsp:attribute>

	<jsp:body>
		<section class="wrapper">	
				<div class="row">
		            <div class="col-md-3 col-md-offset-3">	
		            	<h1>Rastrear encomenda</h1>
						<form id="frm" action="<c:url value="/rastreioEncomenda/"/>"
								method="POST" class="well span6">
							
							<div class="form-group">
								<label for="chaveRastreio">Chave de Rastreio:</label>
								<input type="text" id="id" name="chaveRastreio" 
								class="form-control" />
							</div>		

							<button type="reset" class="btn btn-default">Limpar</button>
							<button type="submit" class="btn btn-primary">Rastrear</button>
						</form>
					</div>
				</div>
		</section>
	</jsp:body>
</layout:template>