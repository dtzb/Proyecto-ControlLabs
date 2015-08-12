<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="registroincidencias.aspx.cs" Inherits="MonitorEquipos.modulos.reporteincidencias" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../css/Estilo.css" rel="stylesheet" />
    <link href="../css/pure-min.css" rel="stylesheet" />
    <link href="../css/main.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
     <table class="pure-table tabla">
      <%--  <tr background="imagenes/descarga%20(1).jpeg" style="width:auto"  height="130"/>--%>
        
            <td colspan="2" > <p align="center" class="auto-style1"> <strong>Reporte de incidencias </strong> </p> </font> </td>         
      <tr>

           <td>
                <p align="center" > Laboratorio # <asp:TextBox ID="Textnumlab" runat="server"></asp:TextBox>
                 &nbsp;&nbsp;&nbsp;&nbsp;<p align="center" > &nbsp;Profesor:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="Textprofesor" runat="server"></asp:TextBox>
                   <p align="center" ></p> 
                   <br />
                
              <table  class="pure-table tabla" align="center">
               
                  <tr bgcolor="gray">
                      <td >
                          Antecedentes
                      </td>
                      <td>
                          Fecha
                      </td>
                  </tr>
                   <tr>
                      <td>                        
                          <asp:TextBox ID="Textantecedentes" runat="server"></asp:TextBox>
                      </td>
                      <td>                     
                          <asp:TextBox ID="Textfecha" runat="server"></asp:TextBox>
                      </td>
                  </tr>                           
              </table>
        
              <br />
                    <br /><p align="center"> Observaciones <br /> 
                        <asp:TextBox Class="text-uppercase" ID="Textobservacion" runat="server" Height="53px" Width="220px"></asp:TextBox>
                         
                        </p>  
            <p align="center">
                 <asp:Button Class="btn btn-success" ID="Button1" runat="server" Text="Guardar" OnClick="Button1_Click" /> 
                </p>
      </td>
         
              </tr> 
    </table>

    <br />
    <br />

    <br />

    <br />
    <br />
    </div>
    </form>
</body>
</html>
