using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;

namespace Pizzeria
{
    public partial class _Default : Page
    {
        public List<Producto> listaProducto { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            ProductoNegocio negocio = new ProductoNegocio();
            listaProducto = negocio.listar();

        }
    }
}