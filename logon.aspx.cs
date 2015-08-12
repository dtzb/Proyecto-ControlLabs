using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Configuration;
using System.Data.SqlClient;

using System.Web.SessionState;

namespace MonitorEquipos
{
    public partial class logon : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string modo = String.IsNullOrEmpty(Request.Form["modo"]) ? null : Request.Form["modo"];
            string usuario = String.IsNullOrEmpty(Request.Form["user"]) ? null : Request.Form["user"];
            string pass = String.IsNullOrEmpty(Request.Form["pass"]) ? null : Request.Form["pass"];

            string accion = String.IsNullOrEmpty(Request.QueryString["accion"]) ? null : Request.QueryString["accion"];

            if (modo != null && accion == "login")
            {
                this.login(modo, usuario, pass);
            }
            else if (accion == "logout")
            {
                this.logout();
            }
            else
            {
                this.logout();
            }
        }
        
        private void login(string modo, string usuario, string pass)
        {
            
            string cs = ConfigurationManager.ConnectionStrings["nuevo"].ConnectionString;
            string cadenaConsulta = "";
            if (modo == "admin")
            {
                cadenaConsulta = "SELECT TOP 1 * FROM Administradores WHERE Usuario = '" + usuario + "' and Password = '" + pass + "'";
            }
            else if (modo == "maestro")
            {
                cadenaConsulta = "SELECT TOP 1 * FROM Profesores WHERE Clave = '" + usuario + "' and Password = '" + pass + "'";
            }

            using (SqlConnection con = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand(cadenaConsulta))
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

                                Session["Id"] = dt.Rows[0]["Id"];
                                Session["Nombre"] = dt.Rows[0]["Nombre"];
                                Session["Apellido"] = dt.Rows[0]["Apellido"];
                                Session["Tipo"] = modo;
                                Response.Redirect("Inicio.aspx");
                            }
                            else
                            {
                                Response.Redirect("login.aspx?error=1");
                            }
                        }
                    }
                }
            }
        }
        private void logout()
        {
            Session.RemoveAll();
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }

    }
}