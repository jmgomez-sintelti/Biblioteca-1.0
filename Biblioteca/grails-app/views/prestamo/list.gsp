
<%@ page import="biblioteca.Prestamo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'prestamo.label', default: 'Prestamo')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<!--<a href="#list-prestamo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>-->
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-prestamo" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
						<g:sortableColumn property="estado" title="${message(code: 'prestamo.estado.label',default: 'Prestamo activo')}" />
						<g:sortableColumn property="fEntrega" title="${message(code: 'prestamo.fEntrega.label', default: 'Fecha de Entrega')}" />
						<g:sortableColumn property="fPrestamo" title="${message(code: 'prestamo.fPrestamo.label', default: 'Fecha de Prestamo')}" />
						<g:sortableColumn property="usuario" title="${message(code: 'prestamo.fPrestamo.label', default: 'Usuario')}" />
						
					</tr>
				</thead>
				<tbody>
				<g:each in="${prestamoInstanceList}" status="i" var="prestamoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${prestamoInstance.id}">${fieldValue(bean: prestamoInstance, field: "estado")}</g:link></td>					
						<td><g:link action="show" id="${prestamoInstance.id}">${fieldValue(bean: prestamoInstance, field: "fEntrega")}</g:link></td>
						<td><g:formatDate date="${prestamoInstance.fPrestamo}" /></td>
						<td><g:link action="show" id="${prestamoInstance.id}">${fieldValue(bean: prestamoInstance, field: "usuarios")}</g:link> </td>
						
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${prestamoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
