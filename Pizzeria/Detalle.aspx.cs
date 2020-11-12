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
    public partial class Detalle : System.Web.UI.Page
    {
        public Producto detalle = new Producto();
        List<Producto> listaProducto = new List<Producto>();
        protected void Page_Load(object sender, EventArgs e)
        {
            ProductoNegocio negocio = new ProductoNegocio();
            List<Producto> listaAux;
            try
            {
                listaAux = negocio.listar();
                int id = Convert.ToInt32(Request.QueryString["id"]);
                detalle = listaAux.Find(x => x.id == id);
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}