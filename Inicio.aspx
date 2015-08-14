<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="MonitorEquipos.Inicio" %>
<!DOCTYPE html>
<html lang="en">
<head id="Head1" runat="server">
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	<title>Monitor Laboratorios - Inicio</title>
	<link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>
	<link rel="stylesheet" href="./css/font-awesome.min.css">

	<script src="./js/jquery-2.1.4.min.js"></script>
	<script type="text/javascript" src="./js/materialize.min.js"></script>
	<script>
		$(document).ready(function(){
			$('.button-collapse').sideNav({
					menuWidth: 240, // Default is 240
					edge: 'left', // Choose the horizontal origin
					closeOnClick: true // Closes side-nav on <a> clicks, useful for Angular/Meteor
				}
			);
		});
			 

	</script>
	<style>
		html,
		body{
			height:100%;
		}
		header, main, footer {
			padding-left: 240px;
		}
		@media only screen and (max-width : 992px) {
			header, main, footer {
				padding-left: 0;
			}
		}
		main{
			position:relative;
			height:calc(100% - 70px);
		}
		main>div{
			position:relative;
			height:100%;
			width:100%;	
		}
		#mainframe{
			width:100%;
			height:100%;
			background-color:#effeef;
		}
	</style>
</head>
<body>
<header>
	<div class="navbar-fixed">
		<nav>
			<div class="nav-wrapper green accent-3">
				<div class="container">
				 <a href="#" data-activates="slide-out" class="button-collapse"><i class="mdi-navigation-menu"></i></a>
				
				<ul id="nav-mobile" class="right" >
					<li><a href="#edit_user_profile" runat="server" id="username" title="Editar Perfil"><i class="fa fa-user left"></i></a></li>
					<li><a href="/logon.aspx?accion=logout">Logout</a></li>
				</ul>
			</div>
		</nav>
	</div>
	
	<ul id="slide-out" class="side-nav fixed">
				<li class="logo green accent-3">
					<a href="#" class="logo-container"><img src="./img/logo.utm.png" height="100%">
					</a>
				</li>
		<%
		string tipo = Session["Tipo"].ToString();
		if(tipo=="admin"){
		%>
		<li><a href="./modulos/prestamos.aspx" target="mainframe"><i class="fa fa-desktop"></i> Registro de equipos</a></li>
		<li><a href="./modulos/gestionmaestros.aspx" target="mainframe"><i class="fa fa-users"></i> Usuarios</a></li>
		<li><a href="./modulos/gestionlaboratorios.aspx" target="mainframe"><i class="fa fa-key"></i> Laboratorios</a></li>
		<li><a href="./modulos/gestionadmin.aspx" target="mainframe"><i class="fa fa-key"></i> Administradores</a></li>
		
		<li><a href="./modulos/reporteincidentes.aspx" target="mainframe"><i class="fa fa-exclamation-triangle"></i> Reporte de Incidencias</a></li>
		<li><a href="./modulos/reporteprestamos.aspx" target="mainframe"><i class="fa fa-bar-chart"></i> Reporte de Pr&eacute;stamos</a></li>

		<% 
		} 
		if(tipo == "maestro"){ 
		%>
		<li><a href="./modulos/registroincidencias.aspx" target="mainframe"><i class="fa fa-info-circle"></i> Formulario de Maestros</a></li>
		<% } %>
		</ul>
</header>
<main>
	<div class="col s12">
		<iframe src="" frameborder="0" id="mainframe" name="mainframe" runat="server"></iframe>
	</div>
</main>

</body>
</html>