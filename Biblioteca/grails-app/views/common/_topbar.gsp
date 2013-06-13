
<div id="menu">
	<nobr>
	<sec:ifLoggedIn>
	<label id="hola">Bienvenido</label>	 :<label id="nombreDeUsuario"><sec:loggedInUserInfo field="username"/></label>
	<br/><div id="salir"><a href="${createLink(uri: '/logout')}">Salir</a></div>
	</sec:ifLoggedIn>
	<sec:ifNotLoggedIn>
	<a href="${createLink(uri: '/login')}"><div id="imagen"><div id="log" align="center">Login</div></div></a>
	</sec:ifNotLoggedIn>
	</nobr>
</div>

