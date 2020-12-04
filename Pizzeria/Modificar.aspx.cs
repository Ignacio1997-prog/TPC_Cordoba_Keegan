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
    public partial class Modificar : System.Web.UI.Page
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
                    nombre.Text = listaProducto.First().Nombre;
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        public void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect(ResolveUrl("Default.aspx"));
        }
        protected void btnModificar_Click(object sender, EventArgs e)
        {
            int i = 0;
            int id = int.Parse((sender as LinkButton).CommandArgument.ToString());
            Producto p = new Producto();
            foreach (RepeaterItem item in product.Items)
            {
                negocio.ModificarNombre(listaProducto[i].IDProducto,nombre.Text);
                i++;
            }
            p = listaProducto.Find(x => x.IDProducto == id);
            Session.Add("producto", p);
            Session.Add("id", p.IDProducto);
            Response.Redirect(ResolveUrl("ModificarProducto.aspx"));

        }
    }
}