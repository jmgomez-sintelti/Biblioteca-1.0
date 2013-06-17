
<%@ page import="biblioteca.Prestamo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'prestamo.label', default: 'Prestamo')}" />
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
		<div id="show-prestamo" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
				<table>
				<g:if test="${prestamoInstance?.ejemplares}">
				<tr>
					<td><span id="ejemplares-label" class="property-label"><g:message code="prestamo.ejemplares.label" default="Ejemplares" /></span></td>
					
						<td><g:each in="${prestamoInstance.ejemplares}" var="e">
						<span class="property-value" aria-labelledby="ejemplares-label"><g:link controller="ejemplar" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></span>
						</g:each></td>
					
				</tr>
				</g:if>
			
				<g:if test="${prestamoInstance?.estado}">
				<tr>
					<td><span id="estado-label" class="property-label"><g:message code="prestamo.estado.label" default="Estado" /></span></td>
					
						<td><span class="property-value" aria-labelledby="estado-label"><g:formatBoolean boolean="${prestamoInstance?.estado}" /></span></td>
					
				</tr>
				</g:if>
			
				<g:if test="${prestamoInstance?.fEntrega}">
				<tr>
					<td><span id="fEntrega-label" class="property-label"><g:message code="prestamo.fEntrega.label" default="Fecha de Entrega" /></span></td>
					
						<td><span class="property-value" aria-labelledby="fEntrega-label"><g:formatDate date="${prestamoInstance?.fEntrega}" /></span></td>
					
				</tr>
				</g:if>
			
				<g:if test="${prestamoInstance?.fPrestamo}">
				<tr>
					<td><span id="fPrestamo-label" class="property-label"><g:message code="prestamo.fPrestamo.label" default="Fecha de Prestamo" /></span></td>
					
						<td><span class="property-value" aria-labelledby="fPrestamo-label"><g:formatDate date="${prestamoInstance?.fPrestamo}" /></span></td>
					
				</tr>
				</g:if>
			
				<g:if test="${prestamoInstance?.usuarios}">
				<tr>
					<td><span id="usuarios-label" class="property-label"><g:message code="prestamo.usuarios.label" default="Usuarios" /></span></td>
					
						<td><g:each in="${prestamoInstance.usuarios}" var="u">
						<span class="property-value" aria-labelledby="usuarios-label"><g:link controller="usuario" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></span>
						</g:each></td>
					
				</tr>
				</g:if>
			</table>
			<g:form>
				
					<g:hiddenField name="id" value="${prestamoInstance?.id}" />
					<g:link class="edit" action="edit" id="${prestamoInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				
			</g:form>
		</div>
	</body>
</html>
