using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Pizzeria
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Admin"] == null)
            {
                Session["Admin"] = false;
            }
        }
        public void btnLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect(ResolveUrl("Login.aspx"));
        }
        public void btnRegistrarse_Click(object sender, EventArgs e)
        {
            Response.Redirect(ResolveUrl("Registrarse.aspx"));
        }
    }
}