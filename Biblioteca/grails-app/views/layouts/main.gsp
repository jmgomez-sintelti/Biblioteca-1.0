<!DOCTYPE html>
<html>
	<head>
		<title>
			<g:layoutTitle default="Sistema de biblioteca" />
		</title>
		<link rel="stylesheet" href="${createLinkTo(dir:'css',file:'main2.css')}" />
		<link rel="shortcut icon" href="${createLinkTo(dir:'images',file:'icono_libro.gif')}" type="image/x-icon" />
		<g:layoutHead />
		<g:javascript library="application" />
	</head>
	<body>
		<div id="page">
		
			<div id="topbar">
				<g:render template="/common/topbar" />
			</div>
			<div id="header">
				<h1>Sistema de biblioteca</h1>
			</div>
			<div id="content">
				<g:layoutBody />
			</div>
			<div id="sidebar">
				<g:render template="/common/buddies" />
			</div>
			<div id="footer">
				<g:render template="/common/footer" />
			</div>
		</div>
	</body>
</html>
