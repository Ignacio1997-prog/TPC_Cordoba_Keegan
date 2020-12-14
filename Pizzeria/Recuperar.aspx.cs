using System;
using Negocio;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;

namespace Pizzeria
{
    public partial class Recuperar : System.Web.UI.Page
    {
        public List<Producto> listaProducto = new List<Producto>();
        ProductoNegocio negocio = new ProductoNegocio();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["productoSeleccionado"] == null)
            {
                Response.Redirect("Default.aspx");
            }
            else
            {
                listaProducto = (List<Producto>)Session["productoSeleccionado"];
                product.DataSource = listaProducto.FindAll(x => x.Estado == 0);
                product.DataBind();

            }
        }
        public void btnRecuperar_Click(object sender, EventArgs e)
        {

            string id = (sender as LinkButton).CommandArgument.ToString();
            negocio.RecuperarProducto(Convert.ToInt32(id));
            Response.Redirect(ResolveUrl("Default.aspx"));
        }

        public void btnRecuperarTodos_Click(object sender, EventArgs e)
        {
            foreach (Producto p in listaProducto)
            {
                negocio.RecuperarProducto(p.IDProducto);
            }
            Response.Redirect(ResolveUrl("Default.aspx"));
        }
        public void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect(ResolveUrl("Default.aspx"));
        }
    }
}