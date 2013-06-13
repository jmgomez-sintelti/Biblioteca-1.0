
<%@ page import="biblioteca.Autor" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'autor.label', default: 'Autor')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-autor" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list autor">
	
			<table >
				<g:if test="${autorInstance?.nombre}">
				<tr>				
					<td><span id="nombre-label" class="property-label"><g:message code="autor.nombre.label" default="Nombre:" /></span></td>
					<td><span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${autorInstance}" field="nombre"/></span></td>
				</tr>
				</g:if>
				<g:if test="${autorInstance?.aPaterno}">
				<tr>				
					<td><span id="aPaterno-label" class="property-label"><g:message code="autor.aPaterno.label" default="Apellido Paterno:" /></span></td>
					<td>	<span class="property-value" aria-labelledby="aPaterno-label"><g:fieldValue bean="${autorInstance}" field="aPaterno"/></span></td>
				</tr>					
				</g:if>
				<g:if test="${autorInstance?.aMaterno}">
				<tr>				
					<td><span id="aMaterno-label" class="property-label"><g:message code="autor.aMaterno.label" default="Apellido Materno:" /></span></td>
					<td><span class="property-value" aria-labelledby="aMaterno-label"><g:fieldValue bean="${autorInstance}" field="aMaterno"/></span></td>
				</tr>
				</g:if>
				<g:if test="${autorInstance?.libros}">
					<tr>				
						<td><span id="libros-label" class="property-label"><g:message code="autor.libros.label" default="Libro(s):" /></span></td>
						<td><g:each in="${autorInstance.libros}" var="l">
							<span class="property-value" aria-labelledby="libros-label"><g:link controller="libro" action="show" id="${l.id}">${l?.encodeAsHTML()}</g:link></span><br/>
							</g:each></td>
					</tr>
				</g:if>
			</table>
			</ol>
			<g:form>
				
					<g:hiddenField name="id" value="${autorInstance?.id}" />
					<g:link class="edit" action="edit" id="${autorInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				
			</g:form>
		</div>
	</body>
</html>
