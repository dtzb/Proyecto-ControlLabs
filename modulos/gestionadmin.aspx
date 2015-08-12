﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gestionadmin.aspx.cs" Inherits="MonitorEquipos.modulos.gestionadmin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Gesti&oacute;n de Profesores</title>
    <link rel="stylesheet" href="../css/main.css"/>
    <link href="../css/Estilo.css" rel="stylesheet" />
<%--	<script src="../js/jquery-2.1.4.min.js"></script>
	<script src="../js/html5-qrcode.min.js"></script>
	<script src="../js/app.js"></script>--%>
    <link href="../css/pure-min.css" rel="stylesheet" />
</head>
<body>
    <div>
        <h2>Gesti&oacute;n de Profesores</h2>
    </div>
    
    <form id="form1" runat="server">
        <div class="pure-g">
        
    <div class="pure-u-24-24">
        <asp:GridView ID="GridView1" class="pure-table tabla" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                <asp:BoundField DataField="Apellido" HeaderText="Apellido" SortExpression="Apellido" />
                <asp:BoundField DataField="Tipo" HeaderText="Tipo" SortExpression="Tipo" />
                <asp:BoundField DataField="Usuario" HeaderText="Usuario" SortExpression="Usuario" />
                <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            </Columns>
        </asp:GridView>
    </div>
            </div>
         <div class="pure-g">
    <div class="pure-u-24-24">
         <asp:FormView ID="FormView1" class="pure-table tabla" runat="server" DataKeyNames="id" DataSourceID="SqlDataSource1" AllowPaging="True">
             <EditItemTemplate>
                 id:
                 <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' />
                 <br />
                 Nombre:
                 <asp:TextBox ID="NombreTextBox" runat="server" Text='<%# Bind("Nombre") %>' />
                 <br />
                 Apellido:
                 <asp:TextBox ID="ApellidoTextBox" runat="server" Text='<%# Bind("Apellido") %>' />
                 <br />
                 Tipo:
                 <asp:TextBox ID="TipoTextBox" runat="server" Text='<%# Bind("Tipo") %>' />
                 <br />
                 Usuario:
                 <asp:TextBox ID="UsuarioTextBox" runat="server" Text='<%# Bind("Usuario") %>' />
                 <br />
                 Password:
                 <asp:TextBox ID="PasswordTextBox" runat="server" Text='<%# Bind("Password") %>' />
                 <br />
                 Email:
                 <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
                 <br />
                 <asp:LinkButton ID="UpdateButton" class="pure-button button-large" runat="server" CausesValidation="True" CommandName="Update" Text="Actualizar" />
                 &nbsp;<asp:LinkButton ID="UpdateCancelButton" class="pure-button button-large" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
             </EditItemTemplate>
             <InsertItemTemplate>
                 Nombre:
                 <asp:TextBox ID="NombreTextBox" runat="server" Text='<%# Bind("Nombre") %>' />
                 <br />
                 Apellido:
                 <asp:TextBox ID="ApellidoTextBox" runat="server" Text='<%# Bind("Apellido") %>' />
                 <br />
                 Tipo:
                 <asp:TextBox ID="TipoTextBox" runat="server" Text='<%# Bind("Tipo") %>' />
                 <br />
                 Usuario:
                 <asp:TextBox ID="UsuarioTextBox" runat="server" Text='<%# Bind("Usuario") %>' />
                 <br />
                 Password:
                 <asp:TextBox ID="PasswordTextBox" runat="server" Text='<%# Bind("Password") %>' />
                 <br />
                 Email:
                 <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
                 <br />
                 <asp:LinkButton ID="InsertButton" class="pure-button button-large" runat="server" CausesValidation="True" CommandName="Insert" Text="Insertar" />
             &nbsp;<asp:LinkButton ID="InsertCancelButton" class="pure-button button-large" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
             </InsertItemTemplate>
             <ItemTemplate>
                 id:
                 <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                 <br />
                 Nombre:
                 <asp:Label ID="NombreLabel" runat="server" Text='<%# Bind("Nombre") %>' />
                 <br />
                 Apellido:
                 <asp:Label ID="ApellidoLabel" runat="server" Text='<%# Bind("Apellido") %>' />
                 <br />
                 Tipo:
                 <asp:Label ID="TipoLabel" runat="server" Text='<%# Bind("Tipo") %>' />
                 <br />
                 Usuario:
                 <asp:Label ID="UsuarioLabel" runat="server" Text='<%# Bind("Usuario") %>' />
                 <br />
                 Password:
                 <asp:Label ID="PasswordLabel" runat="server" Text='<%# Bind("Password") %>' />
                 <br />
                 Email:
                 <asp:Label ID="EmailLabel" runat="server" Text='<%# Bind("Email") %>' />
                 <br />
                 <asp:LinkButton ID="EditButton" class="pure-button button-large" runat="server" CausesValidation="False" CommandName="Edit" Text="Editar" />
                 &nbsp;<asp:LinkButton ID="DeleteButton" class="pure-button button-large" runat="server" CausesValidation="False" CommandName="Delete" Text="Eliminar" />
             &nbsp;<asp:LinkButton ID="NewButton" class="pure-button button-large" runat="server" CausesValidation="False" CommandName="New" Text="Nuevo" />
             </ItemTemplate>
         </asp:FormView>
    </div>
            </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ProyectoDTConnectionString %>" DeleteCommand="DELETE FROM [usuarios] WHERE [id] = @id" InsertCommand="INSERT INTO [usuarios] ([Nombre], [Apellido], [Tipo], [Usuario], [Password], [Email]) VALUES (@Nombre, @Apellido, @Tipo, @Usuario, @Password, @Email)" SelectCommand="SELECT * FROM [usuarios]" UpdateCommand="UPDATE [usuarios] SET [Nombre] = @Nombre, [Apellido] = @Apellido, [Tipo] = @Tipo, [Usuario] = @Usuario, [Password] = @Password, [Email] = @Email WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Nombre" Type="String" />
                <asp:Parameter Name="Apellido" Type="String" />
                <asp:Parameter Name="Tipo" Type="String" />
                <asp:Parameter Name="Usuario" Type="String" />
                <asp:Parameter Name="Password" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Nombre" Type="String" />
                <asp:Parameter Name="Apellido" Type="String" />
                <asp:Parameter Name="Tipo" Type="String" />
                <asp:Parameter Name="Usuario" Type="String" />
                <asp:Parameter Name="Password" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>