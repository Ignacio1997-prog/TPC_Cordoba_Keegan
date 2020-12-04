using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Producto
    {
        public int IDProducto { get; set; }
        public string Nombre { get; set; }
        public string Descripcion { get; set; }

        public int IDCategoria { get; set; }

        public int IDVariedad { get; set; }

        public int IDTamanio { get; set; }

        public string NombreTamanio { get; set; }

        public string NombreCategoria { get; set; }

        public string NombreVariedad { get; set; }
        public decimal Precio { get; set; }
        public int Estado { get; set; }


    }
}
