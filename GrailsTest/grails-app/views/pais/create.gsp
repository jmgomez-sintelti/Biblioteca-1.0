<%@ page import="org.javamexico.grailstest.Pais" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:setProvider library="jquery"/>
		<g:javascript library='jquery'/>
		<g:set var="entityName" value="${message(code: 'pais.label', default: 'Pais')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#create-pais" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="create-pais" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${paisInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${paisInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<!--<g:form action="save" >
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</g:form>
			-->
			<fieldset class="texto">
				Nombre:<g:field type="text" name="nombres" />
				Continente:<g:field type="text" name="continentes" />
				Poblacion<g:field type="number" name="poblacions" />	
			</fieldset>
			<fieldset>
			<button name="b" type="button" 
						onclick="${remoteFunction(action:'save',
			params: '{nombre: nombres.value, continente: continentes.value, poblacion: poblacions.value}')}" >Registrar pais</button>
			</fieldset>	
		</div>
	</body>
</html>
