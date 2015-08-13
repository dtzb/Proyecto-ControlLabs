using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;

namespace MonitorEquipos.librerias
{
    public class PageBase : System.Web.UI.Page
    {
        protected override void OnLoad(EventArgs e)
        {
            // Verifica que exista una sesion iniciada. Si no es asi redirecciona a la pagina de logout para cerrar toda las sesiones basura y logon redirecciona a la pantalla de login */
            
            if (Session["Id"] == null || String.IsNullOrEmpty(Session["Id"].ToString()))
            {
                string baseUrl = Request.Url.Scheme + "://" + Request.Url.Authority + Request.ApplicationPath.TrimEnd('/') + "/";
                Response.Redirect(baseUrl + "./logon.aspx?action=logout");
            }
            else
            {
                var type = this.GetType();
                if (type.GetMethod("Page_Session_Load") != null)
                {
                    type.GetMethod("Page_Session_Load").Invoke(this, null);
                }
            }
            base.OnLoad(e);
        }
    }
}