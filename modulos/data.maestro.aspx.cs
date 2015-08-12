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
    public partial class maestro : PageBase
    {
        

        string cs = ConfigurationManager.ConnectionStrings["nuevo"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
          string clave = String.IsNullOrEmpty(Request.QueryString["clave"]) ? null : Request.QueryString["clave"];

            string respuesta = "{";

            if (clave != null)
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    using (SqlCommand cmd = new SqlCommand("SELECT TOP 1 * FROM Profesores WHERE Clave ='"+ clave +"'"))
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