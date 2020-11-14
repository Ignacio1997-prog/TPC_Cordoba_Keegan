using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Pizzeria
{
    public partial class CarritoCompras : System.Web.UI.Page
    {
        Producto producto = new Producto();
        protected Pedido carrito = new Pedido();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["carrito"] == null)
                {
                    Response.Write("<h2 style=margin-top:60px;text-align: center;>No hay articulos seleccionados</h2>");
                }
                else
                {
                    carrito = (Pedido)Session["carrito"];
                    cart.DataSource = carrito.Items;
                    cart.DataBind();
                }
            }
            catch (Exception)
            {

                throw;
            }
        }
        public void btnAgregar_Click(object sender, EventArgs e)
        {
            var id = int.Parse((sender as LinkButton).CommandArgument);
            DetallePedido item = carrito.Items.Find(x => x.IDProducto == id);
            carrito.AgregarItem(item);
            Session.Add("carrito", carrito);
            Response.Redirect(Request.RawUrl);
        }
        public void btnRemover_Click(object sender, EventArgs e)
        {
            var id = int.Parse((sender as LinkButton).CommandArgument);
            carrito.RemoverItem(id);
            Session.Add("carrito", carrito);
            Response.Redirect(Request.RawUrl);
        }
    }
}