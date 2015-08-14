using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MonitorEquipos.librerias;

namespace MonitorEquipos
{
    public partial class Inicio : PageBase
    {
        public void Page_Session_Load()
        {
            username.InnerHtml += Session["Nombre"].ToString() + " " + Session["Apellido"].ToString();
            string tipo = Session["Tipo"].ToString();

            if (tipo == "admin")
            {
				mainframe.Attributes.Add("src", "./modulos/prestamos.aspx");
            }else if(tipo == "maestro"){
				mainframe.Attributes.Add("src", "./modulos/registroincidencias.aspx");
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            





            
            
        }
    }
}