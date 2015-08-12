using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using MonitorEquipos.librerias;

namespace MonitorEquipos.modulos
{
    public partial class reporteincidencias : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            string cadena = "Data Source=ProyectoDT.mssql.somee.com;Initial Catalog=ProyectoDT;User ID=dtzb_SQLLogin_1;Password=tddbwyeezd";
            SqlConnection con = new SqlConnection(cadena);

            string add = "insert into Incidencias values(@Laboratorio, @Detalles, @Fecha, @Antecedentes, @Profesor)";

            SqlCommand cmd = new SqlCommand(add, con);

            con.Open();

            cmd.CommandType = CommandType.Text;
            cmd.Parameters.Add("@Laboratorio", SqlDbType.VarChar, 20).Value = Textnumlab.Text;
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.Add("@Detalles", SqlDbType.VarChar, 120).Value = Textobservacion.Text;
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.Add("@Fecha", SqlDbType.Date).Value = Textfecha.Text;
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.Add("@Antecedentes", SqlDbType.VarChar, 80).Value = Textantecedentes.Text;
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.Add("@Profesor", SqlDbType.VarChar, 50).Value = Textprofesor.Text;



            cmd.ExecuteNonQuery();
            con.Close();
        }
    }
}