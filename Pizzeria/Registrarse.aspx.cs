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
        public List<Envio> listaLocalidades = new List<Envio>();
        EnvioNegocio envios = new EnvioNegocio();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                listaLocalidades = envios.listarLocalidades();
                DropDownList loc = ((DropDownList)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("localidades"));
                foreach (Envio env in listaLocalidades)
                {
                    ListItem item = new ListItem(env.NombreLocalidad, env.IDLocalidad.ToString());
                    loc.Items.Add(item);
                }
                loc.DataBind();
                loc.Items.Insert(0, new ListItem(string.Empty, string.Empty));
                loc.SelectedIndex = 0;
            }
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

            DropDownList loc = ((DropDownList)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("localidades"));
            cl.IDLocalidad = Convert.ToInt32(loc.SelectedItem.Value);
            cl.Telefono = ((TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("Telefono")).Text;

            // Registro primero el cliente
            try
            {
                int id = negocio.RegistrarCliente(cl);
                user.ID = id;
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