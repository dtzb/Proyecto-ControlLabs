<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="MonitorEquipos.login" %>

<!DOCTYPE html>
<html lang="en">
<head id="Head1" runat="server">
	<title>Monitor Laboratorios</title>

	<link rel="stylesheet" href="./css/theme.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">

	<script src="./js/jquery-2.1.4.min.js"></script>
	<script src="./js/app.js"></script>
</head>
<body>

<form action="logon.aspx?accion=login" method="POST">
	<div id="loginform">
		<h1>Sistema de Administración de Laboratorios</h1>
        <div id="errores" runat="server"></div>
        <div class="campo modos">
        	<input type="radio" name="modo" id="modoAdmin" value="admin" checked >
        	<label for="modoAdmin">Modo Administrador</label>
        	<input type="radio" name="modo" value="maestro" id="modoMaestro">
        	<label for="modoMaestro">Modo Maestro</label>
        </div>
		<div class="campo">
			<i class="fa fa-user"></i>
			<input type="text" placeholder="Nombre de usuario o clave" id="user" name="user" autofocus>
		</div>
		<div class="campo">
			<i class="fa fa-lock"></i>
			<input type="password" placeholder="Contraseña" id="pass" name="pass">
		</div>
		<button type="submit">Iniciar Sesión</button>
	</div>
</form>
</body>
</html>