
<%@ page import="org.javamexico.grailstest.Pais" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'pais.label', default: 'Pais')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-pais" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-pais" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list pais">
			
				<g:if test="${paisInstance?.idPais}">
				<li class="fieldcontain">
					<span id="idPais-label" class="property-label"><g:message code="pais.idPais.label" default="Id Pais" /></span>
					
						<span class="property-value" aria-labelledby="idPais-label"><g:fieldValue bean="${paisInstance}" field="idPais"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${paisInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="pais.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${paisInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${paisInstance?.continente}">
				<li class="fieldcontain">
					<span id="continente-label" class="property-label"><g:message code="pais.continente.label" default="Continente" /></span>
					
						<span class="property-value" aria-labelledby="continente-label"><g:fieldValue bean="${paisInstance}" field="continente"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${paisInstance?.poblacion}">
				<li class="fieldcontain">
					<span id="poblacion-label" class="property-label"><g:message code="pais.poblacion.label" default="Poblacion" /></span>
					
						<span class="property-value" aria-labelledby="poblacion-label"><g:fieldValue bean="${paisInstance}" field="poblacion"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${paisInstance?.id}" />
					<g:link class="edit" action="edit" id="${paisInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
