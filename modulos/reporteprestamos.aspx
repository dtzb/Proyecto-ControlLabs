<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="reporteprestamos.aspx.cs" Inherits="MonitorEquipos.modulos.reporteprestamos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../css/Estilo.css" rel="stylesheet" />
    <link href="../css/main.css" rel="stylesheet" />
    <link href="../css/pure-min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
     <style>

            @media print
            {
                .ocultar
                {
                    display: none;
                }
            }

            .auto-style1
            {
                text-align: center;
            }

            #Button1
            {
                height: 41px;
                width: 97px;
                font-size: medium;
                font-weight: 700;
            }

        </style>

     <div class="ocultar">
    <asp:GridView ID="GridView1" class="pure-table tabla" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
            <asp:BoundField DataField="Laboratorio" HeaderText="Laboratorio" SortExpression="Laboratorio" />
            <asp:BoundField DataField="Profesor" HeaderText="Profesor" SortExpression="Profesor" />
            <asp:BoundField DataField="Administrador" HeaderText="Administrador" SortExpression="Administrador" />
            <asp:BoundField DataField="Fecha" HeaderText="Fecha" SortExpression="Fecha" />
        </Columns>
    </asp:GridView>
         </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ProyectoDTConnectionString %>" SelectCommand="SELECT * FROM [Prestamos]" OnSelecting="SqlDataSource1_Selecting"></asp:SqlDataSource>
    <br />
     <div class="ocultar">
    Laboratorio
    <asp:TextBox ID="numero" runat="server"></asp:TextBox>
    <asp:Button ID="Button1" class="pure-button button-large" runat="server" Text="Buscar" />
    </div>
         <br />
    <br />
    <asp:GridView ID="GridView2" class="pure-table tabla" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" DataKeyNames="id">
        <Columns>
            <asp:BoundField DataField="Fecha" HeaderText="Fecha" SortExpression="Fecha" />
            <asp:BoundField DataField="Numero" HeaderText="Numero" SortExpression="Numero" />
            <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" ReadOnly="True" />
            <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
        </Columns>
    </asp:GridView>
     <div class="ocultar">
     <input class="pure-button button-large" id="Button2" type="button" value="Imprimir" onclick="window.print();" />
         </div>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ProyectoDTConnectionString %>" SelectCommand="SELECT * FROM [Vista] WHERE ([Numero] = @Numero)">
        <SelectParameters>
            <asp:ControlParameter ControlID="numero" Name="Numero" PropertyName="Text" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <br />
    </div>
    </form>
</body>
</html>
