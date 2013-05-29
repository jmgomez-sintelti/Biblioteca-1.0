<%@ page import="org.javamexico.grailstest.Estado" %>



<div class="fieldcontain ${hasErrors(bean: estadoInstance, field: 'idEstado', 'error')} required">
	<label for="idEstado">
		<g:message code="estado.idEstado.label" default="Id Estado" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="idEstado" required="" value="${estadoInstance?.idEstado}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: estadoInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="estado.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${estadoInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: estadoInstance, field: 'pais', 'error')} required">
	<label for="pais">
		<g:message code="estado.pais.label" default="Pais" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="pais" name="pais.id" from="${org.javamexico.grailstest.Pais.list()}" optionKey="id" required="" value="${estadoInstance?.pais?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: estadoInstance, field: 'poblacion', 'error')} required">
	<label for="poblacion">
		<g:message code="estado.poblacion.label" default="Poblacion" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="poblacion" type="number" value="${estadoInstance.poblacion}" required=""/>
</div>

