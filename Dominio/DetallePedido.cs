using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class DetallePedido : Producto
    {
        public int Cantidad { get; set; }
        public decimal PrecioTotal { get => (Precio * Cantidad); }

        public DetallePedido(int id)
        {
            IDProducto = id;
            Cantidad = 0;
        }

        public DetallePedido(Producto p)
        {
            IDProducto = p.IDProducto;
            Descripcion = p.Descripcion;
            NombreTamanio = p.NombreTamanio;
            Nombre = p.Nombre;
            Precio = p.Precio;
            Cantidad = 0;
        }

    }
}

