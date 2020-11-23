using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Pizzeria
{
    public partial class Registrarse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void CreateUserWizard1_CreatingUser(object sender, EventArgs e)
        {
            Usuario user = new Usuario();
            UsuarioNegocio auth = new UsuarioNegocio();
            Cliente cl = new Cliente();
            ClienteNegocio negocio = new ClienteNegocio();
            cl.Nombre = ((TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("Nombre")).Text;
            cl.Apellido = ((TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("Apellido")).Text;
            cl.Calle = ((TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("Calle")).Text;
            TextBox n = (TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("numeroCalle");
            cl.Numero = Convert.ToInt32(n.Text);
            cl.EntreCalle1 = ((TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("EntreCalle1")).Text;
            cl.EntreCalle2 = ((TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("EntreCalle2")).Text;
            TextBox p = (TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("Piso");
            cl.Piso = int.Parse(p.Text);
            cl.Departamento = ((TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("Departamento")).Text;
            cl.IDLocalidad = 1;
            cl.Telefono = ((TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("Telefono")).Text;

            // Registro primero el cliente
            try
            {
                negocio.RegistrarCliente(cl);
            }
            catch (Exception)
            {
                throw;
            }

            user.Nombre = ((TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("Username")).Text;
            user.Clave = ((TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("Password")).Text;
            user.Email = ((TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("Email")).Text;
            user.Rol = 1;

            //Luego registro el usuario
            try
            {
                auth.RegistrarUsuario(user);
            }
            catch (Exception)
            {

                throw;
            }

            Response.Redirect(ResolveUrl("Default.aspx"));
        }
    }
}