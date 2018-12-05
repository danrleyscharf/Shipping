<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib tagdir="/WEB-INF/tags/layout" prefix="layout"%>

<layout:templateRastreio>
<jsp:attribute name="cssEspecificos">
</jsp:attribute>

<jsp:attribute name="scriptsEspecificos">
</jsp:attribute>

	<jsp:body>
		<section class="wrapper">
			<h1>Rastreio de Encomenda</h1>
			<h2>Dados da Encomenda Rastreada:</h2>
			<div class="form-group">
				<label for="descricao">Descrição:</label>
				<input type="text" id="descricao" name="descricao" value="${encomendas.descricao}"
				readonly class="form-control" />
			</div>
			<div class="form-group">
				<label for="chaveRastreio">Chave de Rastreio:</label>
				<input type="text" id="chaveRastreio" name="chaveRastreio" value="${encomendas.chaveRastreio}"
				readonly class="form-control" />
			</div>
			<div class="form-group">
				<label for="entidadeOrigem">Remetente:</label>
				<input type="text" id="entidadeOrigem" name="entidadeOrigem" value="${encomendas.entidadeOrigem.nome}"
				readonly class="form-control" />
			</div>
			<div class="form-group">
				<label for="entidadeDestino">Destinatário:</label>
				<input type="text" id="entidadeDestino" name="entidadeDestino" value="${encomendas.entidadeDestino}"
				readonly class="form-control" />
			</div>
			<div class="spacer"></div>
			<h3>Histórico</h3>
			<table id="dados" data-id-field="id" data-unique-id="id"
				class="table table-striped table-bordered display"
				style="width: 100%">
				<thead>
					<tr>
						<th class="col-md-2" >Código</th>
						<th>Data de Saída</th>
						<th>Data de Chegada</th>
						<th>Origem</th>
						<th>Destino</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="viagem" items="${viagens}">
				<tr id="row_${viagem.id}">
					<td>${viagem.id}</td>
					<td><fmt:formatDate pattern = "dd/mm/yyyy" 
						value = "${viagem.dataSaida}" /> </td>
						<td><fmt:formatDate pattern = "dd/mm/yyyy" 
							value = "${viagem.dataChegada}" /> </td>
					<td>${viagem.cddOrigem.descricao}</td>
					<td>${viagem.cddDestino.descricao}</td>
					<td></td>
				</tr>
				</c:forEach>
				</tbody>
			</table>
			<div class="spacer"></div>
			<h3>Tentativas de Entrega</h3>
			<table id="dados" data-id-field="id" data-unique-id="id"
				class="table table-striped table-bordered display"
				style="width: 100%">
				<thead>
					<tr>
						<th class="col-md-2" >Código</th>
						<th>Data da Tentativa</th>
						<th>Observações</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="entrega" items="${entregas}">
				<tr id="row_${entrega.id}">
					<td>${entrega.id}</td>
					<td><fmt:formatDate pattern = "dd/mm/yyyy" 
						value = "${entrega.dataEntrega}" /> </td>
					<td>${entrega.obs}</td>
				</tr>
				</c:forEach>
				</tbody>
			</table>
			<div class="spacer"></div>
		</section>
	</jsp:body>
</layout:templateRastreio>