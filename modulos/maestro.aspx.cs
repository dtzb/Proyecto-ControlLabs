using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
//Importante para validacion de sesion
using System.Web.SessionState;


namespace MonitorEquipos
{
    public partial class maestro : System.Web.UI.Page
    {
        

        string cs = ConfigurationManager.ConnectionStrings["nuevo"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            /* Verifica que exista una sesion iniciada. Si no es asi redirecciona a la pagina de logout para cerrar toda las sesiones basura y logon redirecciona a la pantalla de login */
            if (Session["Id"] == null || String.IsNullOrEmpty(Session["Id"].ToString()))
            {
                Response.Redirect("logon.aspx?action=logout");
            }



            string clave = String.IsNullOrEmpty(Request.QueryString["clave"]) ? null : Request.QueryString["clave"];

            string respuesta = "{";

            if (clave != null)
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    using (SqlCommand cmd = new SqlCommand("SELECT TOP 1 * FROM Profesor WHERE Clave ='"+ clave +"'"))
                    {
                        using (SqlDataAdapter sda = new SqlDataAdapter())
                        {
                            cmd.Connection = con;
                            sda.SelectCommand = cmd;
                            using (DataTable dt = new DataTable())
                            {
                                sda.Fill(dt);
                                if (dt.Rows.Count > 0)
                                {
                                    respuesta += "\"Clave\":\"" + dt.Rows[0]["Clave"] + "\",";
                                    respuesta += "\"Nombre\":\"" + dt.Rows[0]["Nombre"] + "\",";
                                    respuesta += "\"Apellido\":\"" + dt.Rows[0]["Apellido"] + "\"";
                                }
                            }
                        }
                    }
                }
            }

            respuesta += "}";
            Response.Write(respuesta);
        }
        
    }
}