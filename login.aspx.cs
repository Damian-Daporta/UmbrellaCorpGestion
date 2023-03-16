using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using UMBRELLACORPGESTION11.ClasesCustom;

namespace UMBRELLACORPGESTION11
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnAceptar_Click(object sender, EventArgs e)
        {
            string sqlValidarUser = @"SELECT COUNT(*)
                      FROM Usuarios
                      WHERE username = @username 
                      AND pass = @pass
                      AND activo = 'true'";


            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString()))
            {
                conn.Open();

                SqlCommand command = new SqlCommand(sqlValidarUser, conn);
                string passEncriptada = Encripted.GenerarHash(TxtContraseña.Text);

                command.Parameters.AddWithValue("@username", TxtUsuario.Text);
                command.Parameters.AddWithValue("@pass", TxtContraseña.Text);


                int count = Convert.ToInt32(command.ExecuteScalar()); 

                if (count == 0)

                {
                    LblRespuesta.Text = "Usuario o contraseña incorrecta";
                }
                else
                {
                    FormsAuthentication.RedirectFromLoginPage(TxtUsuario.Text, true); 
                    Response.Redirect("~/Bienvenido.aspx");
                    
                }
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/recuperarPass.aspx");
        }
    }
}