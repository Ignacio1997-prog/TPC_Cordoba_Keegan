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
    public partial class AgregarTamaños : System.Web.UI.Page
    {
        public List<Producto> listaCategorias = new List<Producto>();
        ProductoNegocio negocio = new ProductoNegocio();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                listaCategorias = negocio.listarCategorias();
                foreach (Producto p in listaCategorias)
                {
                    ListItem item = new ListItem(p.NombreCategoria, p.IDCategoria.ToString());
                    categorias.Items.Add(item);
                }
                categorias.DataBind();
                categorias.Items.Insert(0, new ListItem(string.Empty, string.Empty));
                categorias.SelectedIndex = 0;
            }
        }
        public void btnAceptar_Click(object sender, EventArgs e)
        {
            negocio.agregarTamaño(Convert.ToInt32(categorias.SelectedItem.Value),nombre.Text);
            Response.Redirect(ResolveUrl("Default.aspx"));
        }
    }
}