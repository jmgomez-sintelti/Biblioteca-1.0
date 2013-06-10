<%@ page import="biblioteca.Editorial" %>



<div class="fieldcontain ${hasErrors(bean: editorialInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="editorial.nombre.label" default="Nombre" />
		
	</label>
	<g:textField name="nombre" maxlength="30" value="${editorialInstance?.nombre}"/>
</div>

