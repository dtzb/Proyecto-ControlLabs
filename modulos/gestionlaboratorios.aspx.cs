using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using MonitorEquipos.librerias;

namespace MonitorEquipos.modulos
{
    public partial class gestionlaboratorios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
			
			GridView1.HeaderRow.TableSection = TableRowSection.TableHeader;
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
			if (e.Row.RowType == DataControlRowType.DataRow)
			{
				
			}
        }
		protected void EstatusColumn_DataBinding(object sender, System.EventArgs e)
		{
			CheckBox chk = (CheckBox)(sender);
			int estado = Eval("Estado");
			chk.Checked = Int32.Parse(Eval("Estado").ToString()) == 1;
		}
    }
}