﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Factura
    {
        public int id;
        public string Nombre { get; set; }
        public string FechaEmision { get; set; }

        public int IdEstadoFactura;
    }
}