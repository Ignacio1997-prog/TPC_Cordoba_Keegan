using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Pizzeria
{
	public partial class Login : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!this.IsPostBack)
				ViewState["LoginErrors"] = 0;
		}
        protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
        {
            Usuario user = new Usuario();
            UsuarioNegocio auth = new UsuarioNegocio();
            user.Nombre = Login1.UserName;
            user.Clave = Login1.Password;
            user = auth.Validacion(user);
            if (user.ID != -1)
            {
                Login1.Visible = false;
                Session.Add("Autenticado", true);
                Session.Add("ID", user.ID);
                Session.Add("Usuario", user.Nombre);
                if (user.Rol == 1)
                {
                    Session.Add("Admin", false);
                }
                else if (user.Rol == 2)
                {
                    Session.Add("Admin", true);
                }
                e.Authenticated = true;
                Response.Redirect(ResolveUrl("Default.aspx"));
            }
            else
            {
                Session.Add("Autenticado", false);
                e.Authenticated = false;
            }
        }
        protected void Login1_LoginError(object sender, EventArgs e)
        {
            if (ViewState["LoginErrors"] == null)
                ViewState["LoginErrors"] = 0;
            int ErrorCount = (int)ViewState["LoginErrors"] + 1;
            ViewState["LoginErrors"] = ErrorCount;
            if ((ErrorCount > 3) && (Login1.PasswordRecoveryUrl != string.Empty))
                Response.Redirect(Login1.PasswordRecoveryUrl);
        }
    }
}