using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Negocio;

namespace Pizzeria
{
    public partial class About : Page
    {

        public List<Pedido> listaPedido { get; set; }
        public List<Pedido> listaAdmin { get; set; }

        public List<EstadoPedido> listaEstados{ get; set; }

        PedidoNegocio negocio = new PedidoNegocio();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["ID"] != null & (bool)Session["Admin"] == false)
                {
                    PedidoNegocio negocio = new PedidoNegocio();
                    listaPedido = negocio.listarxIDCliente((int)Session["ID"]);

                }
                if ((bool)Session["Admin"] == true)
                {
                    listaEstados = negocio.listarEstados();
                    listaAdmin = negocio.listarPedidos();
                    PedidosGridView.DataSource = listaAdmin;
                    PedidosGridView.DataBind();

                }
            }

        }
        protected void Estado_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList ddl = (DropDownList)sender;
            int pedido = Convert.ToInt32(PedidosGridView.DataKeys[PedidosGridView.SelectedRow.RowIndex].Values["IDPedido"]);
            int nuevoID = Convert.ToInt32(ddl.SelectedValue);
            negocio.modificarEstado(pedido,nuevoID);
            listaAdmin = negocio.listarPedidos();
            PedidosGridView.DataSource = listaAdmin;
            PedidosGridView.DataBind();
            Response.Redirect("Envios.aspx");

        }

        protected void Estados_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DropDownList lista = e.Row.FindControl("Estados") as DropDownList;
                lista.DataTextField = "Nombre";
                lista.DataValueField = "ID";
                lista.DataSource = listaEstados;
                lista.DataBind();
                lista.Items.Insert(0, new ListItem(string.Empty, string.Empty));
                lista.SelectedIndex = 0;


            }
        }


    }
}