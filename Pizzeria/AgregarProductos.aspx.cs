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
    public partial class AgregarProductos : System.Web.UI.Page
    {
        public List<Producto> listaCategorias = new List<Producto>();
        public List<Producto> listaTamaños = new List<Producto>();
        public List<Producto> listaCargar = new List<Producto>();
        ProductoNegocio negocio = new ProductoNegocio();
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((bool)Session["Admin"] == false)
            {
                Response.Redirect(ResolveUrl("Default.aspx"));
            }
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
            foreach (RepeaterItem item in tamaños.Items)
            {
                Producto p = new Producto();
                p.Nombre = Nombre.Text;
                p.Descripcion = Descripcion.Text;
                p.IDCategoria = Convert.ToInt32(categorias.SelectedItem.Value);
                Label l = item.FindControl("IDTamanio") as Label;
                p.IDTamanio = Convert.ToInt32(l.Text);
                TextBox txt = (TextBox)item.FindControl("Precio");
                string precio = txt.Text;
                Decimal value = -1;
                if (decimal.TryParse(precio, out value))
                {
                    p.Precio = value;
                }
                listaCargar.Add(p);
            }
            int id = negocio.RegistrarVariedad(Variedad.Text, listaCargar.First().IDCategoria);
            foreach (Producto p in listaCargar)
            {
                p.IDVariedad = id;
                negocio.RegistrarProducto(p);
            }
            Response.Redirect(ResolveUrl("Default.aspx"));
        }
        protected void itemSelected(object sender, EventArgs e)
        {
            if (categorias.SelectedItem.Value != "")
            {
                string id = categorias.SelectedItem.Value;
                listaTamaños = negocio.listarTamaños(Convert.ToInt32(id));
                tamaños.DataSource = listaTamaños;
                tamaños.DataBind();
            }
        }
    }
}