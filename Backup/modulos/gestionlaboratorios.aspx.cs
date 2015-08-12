using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//Importante para validacion de sesion
using System.Web.SessionState;

namespace MonitorEquipos
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            /* Verifica que exista una sesion iniciada. Si no es asi redirecciona a la pagina de logout para cerrar toda las sesiones basura y logon redirecciona a la pantalla de login */
            if (Session["Id"] == null || String.IsNullOrEmpty(Session["Id"].ToString()))
            {
                Response.Redirect("logon.aspx?action=logout");
            }
        }
    }
}