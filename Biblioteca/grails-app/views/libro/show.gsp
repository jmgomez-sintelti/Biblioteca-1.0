
<%@ page import="biblioteca.Libro" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'libro.label', default: 'Libro')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-libro" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-libro" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list libro">
				<table >
				<g:if test="${libroInstance?.titulo}">
				<tr>
					<td><span id="titulo-label" class="property-label"><g:message code="libro.titulo.label" default="Titulo" /></span></td>
					
						<td><span class="property-value" aria-labelledby="titulo-label"><g:fieldValue bean="${libroInstance}" field="titulo"/></span></td>
					
				</tr>
				</g:if>
			
				<g:if test="${libroInstance?.edicion}">
				<tr>
					<td><span id="edicion-label" class="property-label"><g:message code="libro.edicion.label" default="Edicion" /></span></td>
					
						<td><span class="property-value" aria-labelledby="edicion-label"><g:fieldValue bean="${libroInstance}" field="edicion"/></span></td>
					
				</tr>
				</g:if>
			
				<g:if test="${libroInstance?.isbn}">
				<tr>
					<td><span id="isbn-label" class="property-label"><g:message code="libro.isbn.label" default="ISBN" /></span></td>
					
						<td><span class="property-value" aria-labelledby="isbn-label"><g:fieldValue bean="${libroInstance}" field="isbn"/></span></td>
					
				</tr>
				</g:if>
			
				<g:if test="${libroInstance?.autores}">
				<tr>
					<td><span id="autores-label" class="property-label"><g:message code="libro.autores.label" default="Autor(es):" /></span></td>
					
						<td><g:each in="${libroInstance.autores}" var="a">
						<span class="property-value" aria-labelledby="autores-label"><g:link controller="autor" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each></td>
					
				</tr>
				</g:if>
			
				<g:if test="${libroInstance?.editoriales}">
				<tr>
					<td><span id="editoriales-label" class="property-label"><g:message code="libro.editoriales.label" default="Editorial" /></span></td>
					
						<td><g:each in="${libroInstance.editoriales}" var="e">
						<span class="property-value" aria-labelledby="editoriales-label"><g:link controller="editorial" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></span>
						</g:each></td>
					
				</tr>
				</g:if>
			</table>
			</ol>
		
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${libroInstance?.id}" />
					<g:link class="edit" action="edit" id="${libroInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
