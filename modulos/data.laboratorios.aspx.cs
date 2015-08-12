using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

using MonitorEquipos.librerias;

namespace MonitorEquipos
{
    public partial class laboratorios : PageBase
    {
        string cs = ConfigurationManager.ConnectionStrings["nuevo"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            string accion = String.IsNullOrEmpty(Request.QueryString["accion"]) ? null : Request.QueryString["accion"];
            string idlab = String.IsNullOrEmpty(Request.QueryString["idlab"]) ? null : Request.QueryString["idlab"];
            string idmaestro = String.IsNullOrEmpty(Request.QueryString["idmaestro"]) ? null : Request.QueryString["idmaestro"];

            string html = "";

            if (accion == "asigna")
            {
                this.asigna(idlab, idmaestro);
                //this.ConsultaNombre(idmaestro);
                
            }
            if (accion == "libera")
            {
                this.libera(idlab);
            }

            html = this.listaLaboratorios();
                

            Response.Write(html);

        }
        private string listaLaboratorios()
        {
            string resultado = "";
            DataTable lista = this.consultalab();
            resultado += "<ul>";
            foreach (DataRow laboratorio in lista.Rows)
            {
                resultado += "<li data-key=\"" + laboratorio["id"] + "\">";
                resultado += "<span class=\"caption\">Laboratorio " + laboratorio["Nombre"] + "</span>";
                //resultado += "<span class=\"caption\">Asignado a: "+
                resultado += "<span class=\"icon-status\" data-status=\""+laboratorio["Estado"]+"\"></span>";
                resultado += "<button class=\"asignar pure-button\" onmouseup = \"Proceso.asignaLab('" + laboratorio["Id"] + "');\" disabled=\"true\">Asignar</button>";
                resultado += "<button class=\"liberar pure-button\" onmouseup = \"Proceso.liberaLab('" + laboratorio["Id"] + "');\" disabled=\"false\">Liberar</button>";
                resultado += "</li>";
            }
            resultado += "</ul>";
            return resultado;
        }
        private void asigna(string idlab, string idmaestro)
        {
            SqlConnection conexion = new SqlConnection(cs);
            string query_insert = "INSERT INTO [dbo].[Prestamos] SELECT  Laboratorio = @idlab, Profesor = (SELECT Id FROM Profesores Where Clave = @idmaestro), Administrador = 0, Entrada = GETDATE(), Salida = NULL";
            SqlCommand cmd_insert = new SqlCommand(query_insert, conexion);
            conexion.Open();
            cmd_insert.Parameters.AddWithValue("@idlab", idlab);
            cmd_insert.Parameters.AddWithValue("@idmaestro", idmaestro);
            
            cmd_insert.ExecuteNonQuery();

            string query_update = "UPDATE [dbo].[laboratorios] SET Estado=1 WHERE Id=@idlab";
            SqlCommand cmd_update = new SqlCommand(query_update, conexion);

            cmd_update.Parameters.AddWithValue("@idlab", int.Parse(idlab));
            cmd_update.ExecuteNonQuery();
            conexion.Close();
            
        }

        private void libera(string idlab)
        {
            SqlConnection conexion = new SqlConnection(cs);

            conexion.Open();

            string query_update = "UPDATE [dbo].[laboratorios] SET Estado=0 WHERE id=@idlab";
            SqlCommand cmd_update = new SqlCommand(query_update, conexion);

            cmd_update.Parameters.AddWithValue("@idlab", idlab);
            cmd_update.ExecuteNonQuery();


            query_update = "UPDATE [dbo].[Prestamos] SET Salida=GETDATE() WHERE id= (SELECT TOP 1 id FROM Prestamos WHERE Laboratorio=@idlab ORDER BY Entrada DESC)";
            cmd_update = new SqlCommand(query_update, conexion);

            cmd_update.Parameters.AddWithValue("@idlab", idlab);
            cmd_update.ExecuteNonQuery();
            conexion.Close();

            conexion.Close();

        }

        private String ConsultaNombre(string idmaestro)
        {
            using (SqlConnection conexion = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT CONCAT(Profesores.Nombre,' ',Profesores.Apellido) AS Profesor FROM Profesores WHERE Profesores.Clave='@idmaestro'"))
                {                                     
                    String returnValue;
            
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = conexion;
                    conexion.Open();
                    cmd.Parameters.AddWithValue("@idmaestro",idmaestro);
                    returnValue = (String)cmd.ExecuteScalar();       

                    conexion.Close();
                    return returnValue;
                }
            }        

        }

        private DataTable consultalab()
        {
            
            using (SqlConnection con = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT * FROM Laboratorios"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            return dt;
                        }
                    }
                }
            }
        }

    }
}