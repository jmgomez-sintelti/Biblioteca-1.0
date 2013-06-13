<%@ page import="biblioteca.Editorial" %>



<div class="fieldcontain ${hasErrors(bean: editorialInstance, field: 'nombre', 'error')} ">
<table>	
	<tr>	
	<td><label for="nombre">
		<g:message code="editorial.nombre.label" default="Nombre" />
		
	</label></td>
	<td><g:textField name="nombre" maxlength="30" value="${editorialInstance?.nombre}"/></td>
	</tr>
</table>
</div>

