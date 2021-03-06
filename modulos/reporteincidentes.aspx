﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="reporteincidentes.aspx.cs" Inherits="MonitorEquipos.modulos.reporteincidentes" %>

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
             <asp:BoundField DataField="Detalles" HeaderText="Detalles" SortExpression="Detalles" />
             <asp:BoundField DataField="Antecedentes" HeaderText="Antecedentes" SortExpression="Antecedentes" />
             <asp:BoundField DataField="Fecha" HeaderText="Fecha" SortExpression="Fecha" />
             <asp:BoundField DataField="Prestamo" HeaderText="Prestamo" SortExpression="Prestamo" />
         </Columns>
    </asp:GridView>
         </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ProyectoDTConnectionString %>" SelectCommand="SELECT * FROM [Incidencias]">
    </asp:SqlDataSource>

     <br />
     <div class="ocultar">
     Laboratorio
     <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
     <asp:Button ID="Button1" runat="server" Text="Buscar" />
         </div>
     <br />
     <br />
     <asp:GridView ID="GridView2" class="pure-table tabla" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" DataKeyNames="id">
         <Columns>
             <asp:BoundField DataField="Entrada" HeaderText="Entrada" SortExpression="Entrada" />
             <asp:BoundField DataField="Salida" HeaderText="Salida" SortExpression="Salida" />
             <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" ReadOnly="True" />
             <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
             <asp:BoundField DataField="Expr1" HeaderText="Expr1" SortExpression="Expr1" ReadOnly="True" />
         </Columns>
     </asp:GridView>
    <br />
     <div class="ocultar">
     <input Class="btn btn-danger" id="imprimir" type="button" value="imprimir" onclick="window.print();" />
         </div>
     <br />
     <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ProyectoDTConnectionString %>" SelectCommand="SELECT * FROM [Vista1] WHERE ([id] = @id)">
         <SelectParameters>
             <asp:ControlParameter ControlID="TextBox1" Name="id" PropertyName="Text" Type="Int32" />
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
