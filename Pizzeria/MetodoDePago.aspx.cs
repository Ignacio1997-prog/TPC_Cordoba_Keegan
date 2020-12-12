using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Negocio;

namespace Pizzeria
{
    public partial class MetodoDePago : System.Web.UI.Page
    {
        protected Pedido carrito = new Pedido();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("DetalleEnvio.aspx");
        }
    }
}