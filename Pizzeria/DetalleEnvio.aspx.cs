﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;

namespace Pizzeria
{
   
    public partial class Envios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["carrito"] == null)
            {
                Response.Redirect("Default.aspx");
            }
        }
        public void btnAceptar_Click(object sender, EventArgs e)
        {
            Response.Redirect(ResolveUrl("MetodoDePago.aspx"));
        }

        
    }
}