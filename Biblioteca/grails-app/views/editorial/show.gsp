
<%@ page import="biblioteca.Editorial" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'editorial.label', default: 'Editorial')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<!--<a href="#show-editorial" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>-->
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-editorial" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list editorial">
			
				<g:if test="${editorialInstance?.nombre}">
				<table >
					<tr>
						<td>
							<span id="nombre-label" class="property-label"><g:message code="editorial.nombre.label" default="Editorial:" /></span>
						</td>
					
						<td><span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${editorialInstance}" field="nombre"/></span></td>
					</tr>
				</table>
				</g:if>
			
			</ol>
			<g:form>
				
					<g:hiddenField name="id" value="${editorialInstance?.id}" />
					<g:link class="edit" action="edit" id="${editorialInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				
			</g:form>
		</div>
	</body>
</html>
