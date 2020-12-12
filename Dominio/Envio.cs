using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Envio
    {
        public int IDPedido { get; set; }

        public string Calle { get; set; }

        public int Numero { get; set; }

        public string EntreCalle1 { get; set; }

        public string EntreCalle2 { get; set; }

        public int? Piso { get; set; }

        public string Departamento { get; set; }

        public int IDLocalidad { get; set; }

        public string NombreLocalidad { get; set; }

        public string Telefono { get; set; }
        public string Observaciones { get; set; }
    }
}
