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
        public List<Producto> listaDetalle { get; set; }

        protected Pedido carrito = new Pedido();
        public decimal total;

        ProductoNegocio aux = new ProductoNegocio();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["carrito"] != null)
            {
                carrito = (Pedido)Session["carrito"];
                cart.DataSource = carrito.Items;
                cart.DataBind();
                total = carrito.Total();
            }
            if (!Page.IsPostBack)
            {
                listaProducto = aux.listar();
                pizzas.DataSource = listaProducto.FindAll(x => x.IDCategoria == 1);
                empanadas.DataSource = listaProducto.FindAll(x => x.IDCategoria == 2);
                pizzas.DataBind();
                empanadas.DataBind();
            }

        }
        public void btnDetalle_Click(object sender, EventArgs e)
        {
            string text = (sender as LinkButton).CommandArgument.ToString();
            int idCat = int.Parse(text.Split(',')[0]);
            int idVar = int.Parse(text.Split(',')[1]);
            List<Producto> listaDetalle = aux.listarDetalle(idCat,idVar);
            Session.Add("productoSeleccionado", listaDetalle);
            Response.Redirect(ResolveUrl("Detalle.aspx"));
        }


    }
}