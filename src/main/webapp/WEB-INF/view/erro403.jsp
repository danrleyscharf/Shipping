<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags/layout" prefix="layout"%>

<layout:template>
	<jsp:attribute name="cssEspecificos">
		<link href="<c:url value="/static/css/geral.css" />" rel="stylesheet" />
	</jsp:attribute>
	<jsp:attribute name="scriptsEspecificos"></jsp:attribute>
	<jsp:body>
		<div class="container">	
       		<br />
       		<br />
       		<br />
       		<br />
       		<h1>${info}</h1>
		</div>
	</jsp:body>
</layout:template>