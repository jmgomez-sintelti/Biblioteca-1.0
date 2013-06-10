<%@ page import="biblioteca.Autor" %>


<table border="1">
<tr>
<div class="fieldcontain ${hasErrors(bean: autorInstance, field: 'nombre', 'error')} ">
	<td><label for="nombre">
		<g:message code="autor.nombre.label" default="Nombre" />
		
	</label></td>
	<td><g:textField name="nombre" maxlength="50" value="${autorInstance?.nombre}"/></td>
</div>
</tr>
<tr>
<div class="fieldcontain ${hasErrors(bean: autorInstance, field: 'aPaterno', 'error')} ">
	<td><label for="aPaterno">
		<g:message code="autor.aPaterno.label" default="AP aterno" />
		
	</label></td>
	<td><g:textField name="aPaterno" maxlength="50" value="${autorInstance?.aPaterno}"/></td>
</div>
</tr>
<tr>
<div class="fieldcontain ${hasErrors(bean: autorInstance, field: 'aMaterno', 'error')} ">
	<td><label for="aMaterno">
		<g:message code="autor.aMaterno.label" default="AM aterno" />
		
	</label></td>
	<td><g:textField name="aMaterno" maxlength="50" value="${autorInstance?.aMaterno}"/></td>
</div>
</tr>
<tr>
<div class="fieldcontain ${hasErrors(bean: autorInstance, field: 'libros', 'error')} ">
	<td><label for="libros">
		<g:message code="autor.libros.label" default="Libros" />
		
	</label></td>
	
</div>
</tr>
</table>
