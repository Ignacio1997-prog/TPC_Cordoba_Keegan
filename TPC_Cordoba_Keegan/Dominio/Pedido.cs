using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Pedido
    {
        public int id;
        public string FechaCreacion { get; set; }

        public int idCliente;

        public int idEstadoPedido;

        public int idFactura;
    }
}
