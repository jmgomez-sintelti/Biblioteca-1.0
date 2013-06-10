<%@ page import="biblioteca.Libro" %>


<table border="1">
<tr>
<div class="fieldcontain ${hasErrors(bean: libroInstance, field: 'titulo', 'error')} ">
	<td><label for="titulo">
		<g:message code="libro.titulo.label" default="Titulo" />
		
	</label></td>
	<td><g:textField name="titulo" maxlength="50" value="${libroInstance?.titulo}"/></td>
</div>
</tr>
<tr>
<div class="fieldcontain ${hasErrors(bean: libroInstance, field: 'edicion', 'error')} ">
	<td><label for="edicion">
		<g:message code="libro.edicion.label" default="Edicion" />
		
	</label></td>
	<td><g:textField name="edicion" maxlength="50" value="${libroInstance?.edicion}"/></td>
</div>
</tr>
<tr>
<div class="fieldcontain ${hasErrors(bean: libroInstance, field: 'isbn', 'error')} ">
	<td><label for="isbn">
		<g:message code="libro.isbn.label" default="ISBN" />
		
	</label></td>
	<td><g:textField name="isbn" maxlength="50" value="${libroInstance?.isbn}"/></td>
</div>
</tr>
<tr>
<div class="fieldcontain ${hasErrors(bean: libroInstance, field: 'autores', 'error')} ">
	<td><label for="autores">
		<g:message code="libro.autores.label" default="Autores" />
		
	</label></td>
	<td><g:select name="autores" from="${biblioteca.Autor.list()}" multiple="multiple" optionKey="id" size="5" value="${libroInstance?.autores*.id}" class="many-to-many"/></td>
</div>
</tr>
<tr>
<div class="fieldcontain ${hasErrors(bean: libroInstance, field: 'editoriales', 'error')} ">
	<td><label for="editoriales">
		<g:message code="libro.editoriales.label" default="Editoriales" />
		
	</label></td>
	<td><g:select name="editoriales" from="${biblioteca.Editorial.list()}" multiple="multiple" optionKey="id" size="5" value="${libroInstance?.editoriales*.id}" class="many-to-many"/></td>
</div>
</tr>
</table>
