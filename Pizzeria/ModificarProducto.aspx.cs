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
    public partial class ModificarProducto : System.Web.UI.Page
    {
        Producto p = new Producto();
        ProductoNegocio negocio = new ProductoNegocio();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                    if (Session["producto"] == null)
                    {
                        Response.Redirect("Default.aspx");
                    }
                    else
                    {
                        if (!IsPostBack)
                        {
                            p = (Producto)Session["producto"];
                            precio.Text = p.Precio.ToString();
                        }
                    }
            }
            catch (Exception)
            {
                throw;
            }
        }
        public void btnCancelar_Click(object sender, EventArgs e)
        {
            Session["producto"] = null;
            Response.Redirect(ResolveUrl("Modificar.aspx"));
        }

        public void btnAceptar_Click(object sender, EventArgs e)
        {
           decimal value;
           if (decimal.TryParse(precio.Text, out value))
           {
              p.Precio = value;
           }
           negocio.ModificarPrecio((int)Session["id"], p.Precio);
           Session["producto"] = null;
           Response.Redirect(ResolveUrl("Default.aspx"));
        }

    }
}