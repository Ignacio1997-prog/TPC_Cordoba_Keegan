using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Negocio;

namespace Pizzeria
{
   
    public partial class Envios : System.Web.UI.Page
    {
        protected Pedido carrito = new Pedido();
        public List<Envio> listaLocalidades = new List<Envio>();
        Envio envio = new Envio();
        EnvioNegocio envios = new EnvioNegocio();
        PedidoNegocio negocio = new PedidoNegocio();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["carrito"] == null)
            {
                Response.Redirect("Default.aspx");
            }
            if (!Page.IsPostBack)
            {
                listaLocalidades = envios.listarLocalidades();
                foreach (Envio env in listaLocalidades)
                {
                    ListItem item = new ListItem(env.NombreLocalidad, env.IDLocalidad.ToString());
                    localidades.Items.Add(item);
                }
                localidades.DataBind();
                localidades.Items.Insert(0, new ListItem(string.Empty, string.Empty));
                localidades.SelectedIndex = 0;
            }
        }
        public void btnAceptar_Click(object sender, EventArgs e)
        {
            carrito = (Pedido)Session["carrito"];
            int factura = 224;
            int id = negocio.RegistrarVenta((int)Session["ID"], factura);
            foreach (DetallePedido item in carrito.Items)
            {
                negocio.RegistrarDetalle(item,id);
            }

            envio.IDPedido = id;
            envio.Calle = calle.Text;
            envio.Numero = Convert.ToInt32(numero.Text);
            envio.EntreCalle1 = entre1.Text;
            envio.EntreCalle2 = entre2.Text;
            if (piso.Text != "")
            {
                envio.Piso = Convert.ToInt32(piso.Text);
            }
            else
            {
                envio.Piso = 0;
            }
            envio.Departamento = departamento.Text;
            envio.Telefono = telefono.Text;
            envio.IDLocalidad = Convert.ToInt32(localidades.SelectedItem.Value);
            envio.Observaciones = observaciones.Text;

            envios.cargarEnvio(envio);

            Session["carrito"] = null;
            Response.Redirect(ResolveUrl("Gracias.aspx"));
        }

        
    }
}