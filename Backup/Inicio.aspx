<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="MonitorEquipos.Inicio" %>
<!DOCTYPE html>
<html lang="en">
<head id="Head1" runat="server">
	<title>Monitor Laboratorios - Inicio</title>

	<link rel="stylesheet" href="./css/theme.css">
	<link rel="stylesheet" href="./css/font-awesome.min.css">

	<script src="./js/jquery-2.1.4.min.js"></script>
	<script src="./js/app.js"></script>
</head>
<body>
<div class="header">
	<div class="logo">
		<img src="./img/logo.utm.png" alt="">
	</div>
	<div class="userinfo">
			<div>
				<span id="userpic"><i class="fa fa-user"></i></span>
			</div>
			<div>
				<div id="username" runat="server"></div>
			</div>
			<div>
				<a href="/logon.aspx?accion=logout" id="logoutbtn">
					<i class="fa fa-power-off"></i>
				</a>
			</div>
	</div>
</div>
<div class="sidebar">
    <%string tipo = Session["Tipo"].ToString(); %>
    <% if(tipo=="admin"){ %>
	<ul class="menu">
		<li><a href="./modulos/gestionlaboratorios.aspx" target="mainframe"><i class="fa fa-desktop"></i> Registro de equipos</a></li>
		<li><a href="./modulos/gestionmaestros.aspx" target="mainframe"><i class="fa fa-users"></i> Usuarios</a></li>
	</ul>
    <% } %>


    <%if(tipo == "maestro"){ %>
        <ul class="menu" >
		    <li><a href="./modulos/formularioMaestros.aspx" target="mainframe"><i class="fa fa-info-circle"></i> Formulario de Maestros</a></li>
	    </ul>
    <% } %>
</div>
<div class="frame">
    
	<iframe src="" frameborder="0" id="mainframe" name="mainframe" runat="server"></iframe>
</div>
</body>
</html>