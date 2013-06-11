<%@ page import="biblioteca.Ejemplar" %>


<table border="1">
<tr>
<div class="fieldcontain ${hasErrors(bean: ejemplarInstance, field: 'estado', 'error')} ">
	<td><label for="estado">
		<g:message code="ejemplar.estado.label" default="Disponible:" />
		
	</label></td>
	<td><g:checkBox name="estado" value="${ejemplarInstance?.estado}" /></td>
</div>
</tr>
<tr>
<div class="fieldcontain ${hasErrors(bean: ejemplarInstance, field: 'libros', 'error')} ">
	<td><label for="libros">
		<g:message code="ejemplar.libros.label" default="Libros" />
		
	</label></td>
	<td><g:select name="libros" from="${biblioteca.Libro.list()}" multiple="multiple" optionKey="id" size="5" value="${ejemplarInstance?.libros*.id}" class="many-to-many"/></td>
</div>
</tr>
</table>
