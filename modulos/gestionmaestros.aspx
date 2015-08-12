<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GestionProfesores.aspx.cs" Inherits="MonitorEquipos.modulos.GestionProfesores" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Gesti&oacute;n de Profesores</title>
    <link rel="stylesheet" href="../css/main.css"/>
    <link href="../css/Estilo.css" rel="stylesheet" />
	<script src="../js/jquery-2.1.4.min.js"></script>
	<%--<script src="../js/html5-qrcode.min.js"></script>--%>
	<%--<script src="../js/app.js"></script>--%>
    <link href="../css/pure-min.css" rel="stylesheet" />
</head>
<body>
    <div>
        <h2>Gesti&oacute;n de Profesores</h2>
    </div>
    
    <form id="form1" runat="server">
        <div class="pure-g">
        
    <div class="pure-u-12-24">
        <asp:GridView ID="GridView1" class="pure-table tabla" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="Clave" HeaderText="Clave" SortExpression="Clave" />
                <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                <asp:BoundField DataField="Apellido" HeaderText="Apellido" SortExpression="Apellido" />
                <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
            </Columns>
        </asp:GridView>
    </div>
    <div class="pure-u-12-24">
         <asp:FormView ID="FormView1" class="tabla" runat="server" DataKeyNames="id" DataSourceID="SqlDataSource1" AllowPaging="True">
             <EditItemTemplate>
                 id:
                 <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' />
                 <br />
                 Clave:
                 <asp:TextBox ID="ClaveTextBox" runat="server" Text='<%# Bind("Clave") %>' />
                 <br />
                 Nombre:
                 <asp:TextBox ID="NombreTextBox" runat="server" Text='<%# Bind("Nombre") %>' />
                 <br />
                 Apellido:
                 <asp:TextBox ID="ApellidoTextBox" runat="server" Text='<%# Bind("Apellido") %>' />
                 <br />
                 Password:
                 <asp:TextBox ID="PasswordTextBox" runat="server" Text='<%# Bind("Password") %>' />
                 <br />
                 <asp:LinkButton ID="UpdateButton" class="pure-button button-large" runat="server" CausesValidation="True" CommandName="Update" Text="Actualizar" />
                 &nbsp;<asp:LinkButton ID="UpdateCancelButton" class="pure-button button-large" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
             </EditItemTemplate>
             <InsertItemTemplate>
                 Clave:
                 <asp:TextBox ID="ClaveTextBox" runat="server" Text='<%# Bind("Clave") %>' />
                 <br />
                 Nombre:
                 <asp:TextBox ID="NombreTextBox" runat="server" Text='<%# Bind("Nombre") %>' />
                 <br />
                 Apellido:
                 <asp:TextBox ID="ApellidoTextBox" runat="server" Text='<%# Bind("Apellido") %>' />
                 <br />
                 Password:
                 <asp:TextBox ID="PasswordTextBox" runat="server" Text='<%# Bind("Password") %>' />
                 <br />
                 <asp:LinkButton ID="InsertButton" class="pure-button button-large" runat="server" CausesValidation="True" CommandName="Insert" Text="Insertar" />
                 &nbsp;<asp:LinkButton ID="InsertCancelButton" class="pure-button button-large" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
             </InsertItemTemplate>
             <ItemTemplate>
                 id:
                 <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                 <br />
                 Clave:
                 <asp:Label ID="ClaveLabel" runat="server" Text='<%# Bind("Clave") %>' />
                 <br />
                 Nombre:
                 <asp:Label ID="NombreLabel" runat="server" Text='<%# Bind("Nombre") %>' />
                 <br />
                 Apellido:
                 <asp:Label ID="ApellidoLabel" runat="server" Text='<%# Bind("Apellido") %>' />
                 <br />
                 Password:
                 <asp:Label ID="PasswordLabel" runat="server" Text='<%# Bind("Password") %>' />
                 <br />
                 <asp:LinkButton ID="EditButton" class="pure-button button-large" runat="server" CausesValidation="False" CommandName="Edit" Text="Editar" />
                 &nbsp;<asp:LinkButton ID="DeleteButton" class="pure-button button-large" runat="server" CausesValidation="False" CommandName="Delete" Text="Eliminar" />
                 &nbsp;<asp:LinkButton ID="NewButton" class="pure-button button-large" runat="server" CausesValidation="False" CommandName="New" Text="Nuevo" />
             </ItemTemplate>
         </asp:FormView>
    </div>
            </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ProyectoDTConnectionString %>" DeleteCommand="DELETE FROM [Profesor] WHERE [id] = @id" InsertCommand="INSERT INTO [Profesor] ([Clave], [Nombre], [Apellido], [Password]) VALUES (@Clave, @Nombre, @Apellido, @Password)" SelectCommand="SELECT * FROM [Profesor]" UpdateCommand="UPDATE [Profesor] SET [Clave] = @Clave, [Nombre] = @Nombre, [Apellido] = @Apellido, [Password] = @Password WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Clave" Type="String" />
                <asp:Parameter Name="Nombre" Type="String" />
                <asp:Parameter Name="Apellido" Type="String" />
                <asp:Parameter Name="Password" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Clave" Type="String" />
                <asp:Parameter Name="Nombre" Type="String" />
                <asp:Parameter Name="Apellido" Type="String" />
                <asp:Parameter Name="Password" Type="String" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
