
<div id="menu">
	<nobr>
	<g:if test="${session.user}">
		<b>${session.user?.nombre}&nbsp;${session.user?.apellido}</b> 
	<g:link controller="user" action="logout">Logout</g:link>
	</g:if>
	<g:else>
	<g:link controller="user" action="login"><div id="imagen"><div id="log" align="center">Login</div></div></g:link>
	</g:else>
	</nobr>
</div>

