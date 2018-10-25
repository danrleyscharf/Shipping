<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib tagdir="/WEB-INF/tags/layout" prefix="layout"%>

<layout:template>
<jsp:attribute name="cssEspecificos">
</jsp:attribute>

<jsp:attribute name="scriptsEspecificos">
	</jsp:attribute>

	<jsp:body>
		<section class="wrapper">
			<h1>Rastreio de Encomenda</h1>
			<div class="spacer"></div>
			<table id="dados" data-id-field="id" data-unique-id="id"
				class="table table-striped table-bordered display"
				style="width: 100%">
				<thead>
					<tr>
						<th class="col-md-2" >Código</th>
						<th>Descrição</th>
						<th>Chave de Rastreio</th>
						<th>Data da Coleta</th>
						<th>Previsão de Entrega</th>
						<th>Origem</th>
						<th>Destino</th>
						<th class="col-md-2">Ação</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="encomenda" items="${encomendas}">
				<tr id="row_${encomendas.id}">
					<td>${encomenda.id}</td>
					<td>${encomenda.descricao}</td>
					<td>${encomenda.chaveRastreio}</td>
					<td>${encomenda.dataColeta}</td>
					<td>${encomenda.prevEntrega}</td>
				    <td>${encomenda.entidadeOrigem.cidades.cidade}</td>
					<td>${encomenda.entidadeDestino.cidades.cidade}</td>
					<td>
						<a class="edit btn btn-primary" title="Editar"
							href="<c:url value="/encomendas/form/${encomenda.id}"/>">
							<i class="fa fa-pencil" aria-hidden="true"></i></a>
						<a class="remove btn btn-danger" title="Remover"
							href="javascript:remover(${encomenda.id})">
							<i class="fa fa-trash" aria-hidden="true"></i></a>
					</td>
				</tr>
			</c:forEach>
				</tbody>
			</table>
			<div class="spacer"></div>
		</section>
	</jsp:body>
</layout:template>