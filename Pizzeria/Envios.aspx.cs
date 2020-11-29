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
    public partial class About : Page
    {
        
        PedidoNegocio aux = new PedidoNegocio();
        protected void Page_Load(object sender, EventArgs e)
        {
            //aux.EstadoPedido();
        }
    }
}