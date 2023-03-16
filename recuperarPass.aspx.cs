using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using UMBRELLACORPGESTION11.ClasesCustom;

namespace UMBRELLACORPGESTION11
{
    public partial class recuperarPass : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string sqlValidarUser = @"SELECT COUNT(*) 
                                    FROM Usuarios  
                                    WHERE mail = @mail";

            //sqlUpdate
            string cambiarPassword = @"UPDATE Usuarios 
                                            SET 
                                                   pass = @pass
                                            WHERE
                                                   mail = @mail";

            using (SqlConnection conec = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString()))
            {

                conec.Open();
                SqlCommand cmdValidar = new SqlCommand(sqlValidarUser, conec);
                cmdValidar.Parameters.AddWithValue("@mail", TxtUsuario.Text);


                int count = Convert.ToInt32(cmdValidar.ExecuteScalar());


                if (count == 0)
                {
                    LblRespuesta.Text = "Usuario inexistente";

                }
                else
                {

                    // Si existe el usuario, le cambio la pw a 123456

                    //encripto password 123456 con la clase encripted
                    Random azars = new Random();
                    int Var = azars.Next(100000, 999999);//creo el metodo random
                    string nuevaPassword = Encripted.GenerarHash(Var.ToString());



                    SqlCommand cmdActualizar = new SqlCommand(cambiarPassword, conec);

                    //cambio pw por la  encriptada
                    cmdActualizar.Parameters.AddWithValue("pass", nuevaPassword);
                    cmdActualizar.Parameters.AddWithValue("mail", TxtUsuario.Text);


                    cmdActualizar.ExecuteNonQuery();
                    conec.Close();
                    LblRespuesta.Text = "SE HA MODIFICADO SU CONTRASEÑA, SE LE ENVIARA UN MAIL A SU CORREO ELECTRONICO CON LA NUEVA CONTRASEÑA";
                    //string CorreoElectronico = //NO SE COMO PONER EL MAIL DE LA PERSONA A LA QUE SE LA TENGO QUE ENVIAR//
                    string Cabecera = "RECUPERACION DE PASS - NO RESPONDER A ESTE MENSAJE";
                    string Cuerpo = "DESDE UMBRELLA CORPS SE LO NOTIFICA QUE SU CONTRASEÑA AH SIDO CAMBIADA CON SU AUTORIZACION, LA CONTRASEÑA ACTUAL ES " + Var + " ,SE LE PIDE QUE CAMBIE LA CONTRASEÑA A LA BREVEDAD. GRACIAS.";

                    //EnvioMail(Cabecera, Cuerpo, CorreoElectronico);
                    ClasesCustom.EnvioMail.EnvioDeMail(Cabecera, Cuerpo, TxtUsuario.Text);
                }
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/login.aspx");
        }
    }
}