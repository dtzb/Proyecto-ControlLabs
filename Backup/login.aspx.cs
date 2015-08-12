using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MonitorEquipos
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string error = string.IsNullOrEmpty(Request.QueryString["error"]) ? null : Request.QueryString["error"];
            if (error == "1")
            {
                errores.InnerHtml = "<span style=\"color:red\">Nombre de usuario o contraseña incorrecta</span>";
            }
        }
    }
}