<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gestionlaboratorios.aspx.cs" Inherits="MonitorEquipos.modulos.gestionlaboratorios" %>

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
        
    <div class="pure-u-12-24">
        <asp:GridView ID="GridView1" class="pure-table tabla" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" OnRowDataBound="GridView1_RowDataBound">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="Numero" HeaderText="Número" SortExpression="Numero" />
                <asp:BoundField DataField="Estado" HeaderText="Estado" SortExpression="Estado" />
                
            </Columns>
        </asp:GridView>
    </div>
    <div class="pure-u-12-24">
         <asp:FormView ID="FormView1" class="pure-table tabla" runat="server" DataKeyNames="id" DataSourceID="SqlDataSource1" AllowPaging="True">
             <EditItemTemplate>
                 id:
                 <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' />
                 <br />
                 Numero:
                 <asp:TextBox ID="NumeroTextBox" runat="server" Text='<%# Bind("Numero") %>' />
                 <br />
                 Estado:
                 <asp:TextBox ID="EstadoTextBox" runat="server" Text='<%# Bind("Estado") %>' />
                 <br />
                 <asp:LinkButton ID="UpdateButton" class="pure-button button-large" runat="server" CausesValidation="True" CommandName="Update" Text="Actualizar" />
                 &nbsp;<asp:LinkButton ID="UpdateCancelButton" class="pure-button button-large" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
             </EditItemTemplate>
             <InsertItemTemplate>
                 id:
                 <asp:TextBox ID="idTextBox" runat="server" Text='<%# Bind("id") %>' />
                 <br />
                 Numero:
                 <asp:TextBox ID="NumeroTextBox" runat="server" Text='<%# Bind("Numero") %>' />
                 <br />
                 Estado:
                 <asp:TextBox ID="EstadoTextBox" runat="server" Text='<%# Bind("Estado") %>' />
                 <br />
                 <asp:LinkButton ID="InsertButton" class="pure-button button-large" runat="server" CausesValidation="True" CommandName="Insert" Text="Insertar" />
             &nbsp;<asp:LinkButton ID="InsertCancelButton" class="pure-button button-large" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
             </InsertItemTemplate>
             <ItemTemplate>
                 id:
                 <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                 <br />
                 Numero:
                 <asp:Label ID="NumeroLabel" runat="server" Text='<%# Bind("Numero") %>' />
                 <br />
                 Estado:
                 <asp:Label ID="EstadoLabel" runat="server" Text='<%# Bind("Estado") %>' />
                 <br />
                 <asp:LinkButton ID="EditButton" class="pure-button button-large" runat="server" CausesValidation="False" CommandName="Edit" Text="Editar" />
                 &nbsp;<asp:LinkButton ID="DeleteButton" class="pure-button button-large" runat="server" CausesValidation="False" CommandName="Delete" Text="Eliminar" />
             &nbsp;<asp:LinkButton ID="NewButton" class="pure-button button-large" runat="server" CausesValidation="False" CommandName="New" Text="Nuevo" />
             </ItemTemplate>
         </asp:FormView>
    </div>
            </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ProyectoDTConnectionString %>" DeleteCommand="DELETE FROM [Laboratorio] WHERE [id] = @id" InsertCommand="INSERT INTO [Laboratorio] ([id], [Numero], [Estado]) VALUES (@id, @Numero, @Estado)" SelectCommand="SELECT * FROM [Laboratorio]" UpdateCommand="UPDATE [Laboratorio] SET [Numero] = @Numero, [Estado] = @Estado WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="id" Type="String" />
                <asp:Parameter Name="Numero" Type="Int32" />
                <asp:Parameter Name="Estado" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Numero" Type="Int32" />
                <asp:Parameter Name="Estado" Type="Int32" />
                <asp:Parameter Name="id" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>

