<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="prestamos.aspx.cs" Inherits="MonitorEquipos.Index" %>
<!DOCTYPE html>
<html lang="en">
<head runat="server">
	<meta charset="UTF-8">
	<title>Monitor Laboratorios</title>

	<link rel="stylesheet" href="../css/main.css">
    <link href="../css/Estilo.css" rel="stylesheet" />
	<script src="../js/jquery-2.1.4.min.js"></script>
	<script src="../js/html5-qrcode.min.js"></script>
	<script src="../js/prestamos.js"></script>
    <link href="../css/pure-min.css" rel="stylesheet" />


</head>
<body>
	<div id="header">
		<h1>Monitor Laboratorios</h1>
	</div>
	<div id="content">
		<div id="lista-laboratorios">
				
		</div>
		<div id="sidebar">
			<div id="qr-reader">
                <%-- Lector QR --%>
			</div>
			
			<div id="informacion-maestro">
                <div class="field"><span class="label">Clave: </span><span class="caption" id="field_clave">-</span></div>
                <div class="field"><span class="label">Nombre: </span><span class="caption" id="field_nombre">-</span></div>
				<div class="field"><span class="label">Apellido: </span><span class="caption" id="field_apellido">-</span></div>
           </div>
		</div>
	</div>
</body>
</html>