<%@ page import="biblioteca.Prestamo" %>



<table border="1">
<tr>
<div class="fieldcontain ${hasErrors(bean: prestamoInstance, field: 'ejemplares', 'error')} ">
	<td><label for="ejemplares">
		<g:message code="prestamo.ejemplares.label" default="Ejemplares:" />
		
	</label></td>
	<td><g:select name="ejemplares" from="${biblioteca.Ejemplar.list()}" multiple="multiple" optionKey="id" size="5" value="${prestamoInstance?.ejemplares*.id}" class="many-to-many"/></td>
</div>
</tr>
<tr>
<div class="fieldcontain ${hasErrors(bean: prestamoInstance, field: 'fEntrega', 'error')} required">
	<td><label for="fEntrega">
		<g:message code="prestamo.fEntrega.label" default="Fecha de Entrega" />
		<span class="required-indicator">*</span>
	</label></td>
	<td><g:datePicker name="fEntrega" precision="day"  value="${prestamoInstance?.fEntrega}"  /></td>
</div>
</tr>
<tr>
<div class="fieldcontain ${hasErrors(bean: prestamoInstance, field: 'fPrestamo', 'error')} required">
	<td><label for="fPrestamo">
		<g:message code="prestamo.fPrestamo.label" default="Fecha de Prestamo" />
		<span class="required-indicator">*</span>
	</label></td>
	<td><g:datePicker name="fPrestamo" precision="day"  value="${prestamoInstance?.fPrestamo}"  /></td>
</div>
</tr>
<tr>
<div class="fieldcontain ${hasErrors(bean: prestamoInstance, field: 'usuarios', 'error')} ">
	<td><label for="usuarios">
		<g:message code="prestamo.usuarios.label" default="Usuario:" />
		
	</label></td>
	<td><g:select name="usuarios" from="${biblioteca.Usuario.list()}" multiple="multiple" optionKey="id" size="5" value="${prestamoInstance?.usuarios*.id}" class="many-to-many"/></td>
</div>
</tr>
</table>