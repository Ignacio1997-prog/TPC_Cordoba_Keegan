using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Producto
    {
        public int id;
        public string Nombre { get; set; }
        public string Descripcion { get; set; }

        public int IDCategoria { get; set; }

        public int IDVariedad { get; set; }

        public int IDTamanio { get; set; }
        public decimal Precio { get; set; }
        public bool Estado { get; set; }

    }
}
