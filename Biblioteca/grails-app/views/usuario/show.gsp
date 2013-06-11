
<%@ page import="biblioteca.Usuario" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<!--<a href="#show-usuario" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>-->
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-usuario" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list usuario">
			<table>
				<g:if test="${usuarioInstance?.nombre}">
				<tr>
					<td><span id="nombre-label" class="property-label"><g:message code="usuario.nombre.label" default="Nombre:" /></span></td>
					
						<td><span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${usuarioInstance}" field="nombre"/></span></td>
					
				</tr>
				</g:if>
			
				<g:if test="${usuarioInstance?.aPaterno}">
				<tr>
					<td><span id="aPaterno-label" class="property-label"><g:message code="usuario.aPaterno.label" default="AP aterno" /></span></td>
					
						<td><span class="property-value" aria-labelledby="aPaterno-label"><g:fieldValue bean="${usuarioInstance}" field="aPaterno"/></span></td>
					
				</tr>
				</g:if>
			
				<g:if test="${usuarioInstance?.aMaterno}">
				<tr>
					<td><span id="aMaterno-label" class="property-label"><g:message code="usuario.aMaterno.label" default="AM aterno" /></span></td>
					
						<td><span class="property-value" aria-labelledby="aMaterno-label"><g:fieldValue bean="${usuarioInstance}" field="aMaterno"/></span></td>
					
				</tr>
				</g:if>
			
				<g:if test="${usuarioInstance?.direccion}">
				<tr>
					<td><span id="direccion-label" class="property-label"><g:message code="usuario.direccion.label" default="Direccion" /></span></td>
					
						<td><span class="property-value" aria-labelledby="direccion-label"><g:fieldValue bean="${usuarioInstance}" field="direccion"/></span></td>
					
				</tr>
				</g:if>
			</table>	
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${usuarioInstance?.id}" />
					<g:link class="edit" action="edit" id="${usuarioInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
