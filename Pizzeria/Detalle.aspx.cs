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
        public List<Producto> listaProducto = new List<Producto>();
        public List<DetallePedido> items = new List<DetallePedido>();
        protected Pedido carrito = new Pedido();
        public string Nombre;
        public string Descripcion;
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
                    Nombre = listaProducto.First().Nombre;
                    Descripcion = listaProducto.First().Descripcion;
                    items = listaProducto.ConvertAll(x => new DetallePedido(x));
                    product.DataSource = items;
                    product.DataBind();

                }
            }
            catch (Exception)
            {
                throw;
            }
        }
        public void btnCancelar_Click(object sender, EventArgs e)
        {
            Session["carrito"] = null;
            Response.Redirect(ResolveUrl("Default.aspx"));
        }
        public void btnComprar_Click(object sender, EventArgs e)
        {
            var id = int.Parse((sender as LinkButton).CommandArgument);
            Producto a = listaProducto.Find(x => x.IDProducto == id);
            DetallePedido i = new DetallePedido(a);
            if ((Pedido)Session["carrito"] == null)
            {
                carrito.AgregarItem(i);
            }
            else
            {
                carrito = (Pedido)Session["carrito"];
                carrito.AgregarItem(i);
            }
            Session.Add("carrito", carrito);
            Response.Redirect(ResolveUrl("Default.aspx"));
        }
    }
}