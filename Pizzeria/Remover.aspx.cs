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
    public partial class Remover : System.Web.UI.Page
    {
        public List<Producto> listaProducto = new List<Producto>();
        ProductoNegocio negocio = new ProductoNegocio();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["productoSeleccionado"] == null)
                {
                    Response.Redirect("Default.aspx");
                }
                else
                {
                    listaProducto = (List<Producto>)Session["productoSeleccionado"];
                    product.DataSource = listaProducto.FindAll(x => x.Estado == 1);
                    product.DataBind();

                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        public void btnRemover_Click(object sender, EventArgs e)
        {

            string id = (sender as LinkButton).CommandArgument.ToString();
            negocio.RemoverProducto(Convert.ToInt32(id));
            Response.Redirect(ResolveUrl("Default.aspx"));
        }

        public void btnRemoverTodos_Click(object sender, EventArgs e)
        {
            foreach (Producto p in listaProducto)
            {
                negocio.RemoverProducto(p.IDProducto);
            }
            Response.Redirect(ResolveUrl("Default.aspx"));
        }
        public void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect(ResolveUrl("Default.aspx"));
        }
    }
}