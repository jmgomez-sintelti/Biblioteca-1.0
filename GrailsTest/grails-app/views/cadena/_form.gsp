<%@ page import="org.javamexico.grailstest.Cadena" %>



<div class="fieldcontain ${hasErrors(bean: cadenaInstance, field: 'cadenaRecibida', 'error')} required">
	<label for="cadenaRecibida">
		<g:message code="cadena.cadenaRecibida.label" default="Cadena Recibida" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="cadenaRecibida" required="" value="${cadenaInstance?.cadenaRecibida}"/>
</div>

