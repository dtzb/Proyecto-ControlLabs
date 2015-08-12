<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="reporteincidentes.aspx.cs" Inherits="MonitorEquipos.modulos.reporteincidentes" %>

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
     <asp:GridView ID="GridView1" class="pure-table tabla" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="id">
         <Columns>
             <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
             <asp:BoundField DataField="Laboratorio" HeaderText="Laboratorio" SortExpression="Laboratorio" />
             <asp:BoundField DataField="Detalles" HeaderText="Detalles" SortExpression="Detalles" />
             <asp:BoundField DataField="Fecha" HeaderText="Fecha" SortExpression="Fecha" />
             <asp:BoundField DataField="Antecedentes" HeaderText="Antecedentes" SortExpression="Antecedentes" />
             <asp:BoundField DataField="Profesor" HeaderText="Profesor" SortExpression="Profesor" />
         </Columns>
    </asp:GridView>
         </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ProyectoDTConnectionString %>" DeleteCommand="DELETE FROM [Incidencias] WHERE [id] = @id" InsertCommand="INSERT INTO [Incidencias] ([Laboratorio], [Detalles], [Fecha], [Antecedentes], [Profesor]) VALUES (@Laboratorio, @Detalles, @Fecha, @Antecedentes, @Profesor)" SelectCommand="SELECT * FROM [Incidencias]" UpdateCommand="UPDATE [Incidencias] SET [Laboratorio] = @Laboratorio, [Detalles] = @Detalles, [Fecha] = @Fecha, [Antecedentes] = @Antecedentes, [Profesor] = @Profesor WHERE [id] = @id">
        <DeleteParameters>
            <asp:Parameter Name="id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Laboratorio" Type="Int32" />
            <asp:Parameter Name="Detalles" Type="String" />
            <asp:Parameter Name="Fecha" Type="DateTime" />
            <asp:Parameter Name="Antecedentes" Type="String" />
            <asp:Parameter Name="Profesor" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Laboratorio" Type="Int32" />
            <asp:Parameter Name="Detalles" Type="String" />
            <asp:Parameter Name="Fecha" Type="DateTime" />
            <asp:Parameter Name="Antecedentes" Type="String" />
            <asp:Parameter Name="Profesor" Type="String" />
            <asp:Parameter Name="id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

     <br />
     <div class="ocultar">
     Laboratorio
     <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
     <asp:Button ID="Button1" runat="server" Text="Buscar" />
         </div>
     <br />
     <br />
     <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2">
         <Columns>
             <asp:BoundField DataField="Profesor" HeaderText="Profesor" SortExpression="Profesor" />
             <asp:BoundField DataField="Laboratorio" HeaderText="Laboratorio" SortExpression="Laboratorio" />
             <asp:BoundField DataField="Fecha" HeaderText="Fecha" SortExpression="Fecha" />
             <asp:BoundField DataField="Clave_Prof" HeaderText="Clave_Prof" SortExpression="Clave_Prof" />
             <asp:BoundField DataField="Detalles" HeaderText="Detalles" SortExpression="Detalles" />
             <asp:BoundField DataField="Antecedentes" HeaderText="Antecedentes" SortExpression="Antecedentes" />
         </Columns>
     </asp:GridView>
    <br />
     <div class="ocultar">
     <input Class="btn btn-danger" id="imprimir" type="button" value="imprimir" onclick="window.print();" />
         </div>
     <br />
     <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ProyectoDTConnectionString %>" SelectCommand="SELECT * FROM [Vista2] WHERE ([Profesor] LIKE '%' + @Profesor + '%')">
         <SelectParameters>
             <asp:ControlParameter ControlID="TextBox1" Name="Profesor" PropertyName="Text" Type="String" />
         </SelectParameters>
     </asp:SqlDataSource>
     <br />

     <br />
     <br />
     <br />
    </div>
    </form>
</body>
</html>
