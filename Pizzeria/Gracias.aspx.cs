﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Pizzeria
{
    public partial class Gracias : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void btnAceptar_Click(object sender, EventArgs e)
        {
            Response.Redirect(ResolveUrl("Default.aspx"));
        }
    }
}