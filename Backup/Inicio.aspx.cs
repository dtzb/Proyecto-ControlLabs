using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.SessionState;

namespace MonitorEquipos
{
    public partial class Inicio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            /* Verifica que exista una sesion iniciada. Si no es asi redirecciona a la pagina de logout para cerrar toda las sesiones basura y logon redirecciona a la pantalla de login */
            if (Session["id"] == null || String.IsNullOrEmpty(Session["id"].ToString()))
            {
                Response.Redirect("logon.aspx?action=logout");
            }
            else {
              username.InnerHtml = Session["Nombre"].ToString() + " " + Session["Apellido"].ToString() ;
            }





            string tipo = Session["Tipo"].ToString() ;

            if (tipo == "admin")
            {
                mainframe.Attributes.Add("src", "./modulos/gestionlaboratorios.aspx");

            }else if(tipo == "maestro"){
                mainframe.Attributes.Add("src", "./modulos/formulariomaestros.aspx");
            }
            
        }
    }
}