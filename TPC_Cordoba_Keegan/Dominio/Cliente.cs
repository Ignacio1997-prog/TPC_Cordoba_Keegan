using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Cliente
    {
        public int id;
        public string Nombre{ get; set; }
        public string Apellido { get; set; }
        public decimal Precio { get; set; }
        public string FechaAlta{ get; set; }
        public string Direccion { get; set; }
        public string Email { get; set; }
        public string Telefono { get; set; }
    }
}
