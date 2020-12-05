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

        public List<Pedido> listaPedido { get; set; }
        public int aux { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ID"] != null)
            {
                PedidoNegocio negocio = new PedidoNegocio();
                listaPedido = negocio.listarxIDCliente((int)Session["ID"]);

            }

        }
    }
}