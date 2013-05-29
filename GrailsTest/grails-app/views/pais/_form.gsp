<%@ page import="org.javamexico.grailstest.Pais" %>



<div class="fieldcontain ${hasErrors(bean: paisInstance, field: 'idPais', 'error')} required">
	<label for="idPais">
		<g:message code="pais.idPais.label" default="Id Pais" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="idPais" required="" value="${paisInstance?.idPais}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: paisInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="pais.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${paisInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: paisInstance, field: 'continente', 'error')} ">
	<label for="continente">
		<g:message code="pais.continente.label" default="Continente" />
		
	</label>
	<g:textField name="continente" value="${paisInstance?.continente}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: paisInstance, field: 'poblacion', 'error')} ">
	<label for="poblacion">
		<g:message code="pais.poblacion.label" default="Poblacion" />
		
	</label>
	<g:field name="poblacion" type="number" value="${paisInstance.poblacion}"/>
</div>

