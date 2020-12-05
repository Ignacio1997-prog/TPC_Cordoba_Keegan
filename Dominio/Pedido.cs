using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Pedido
    {
        public List<DetallePedido> Items { get; set; }

        public Pedido()
        {
            Items = new List<DetallePedido>();
        }
        public int id;
        public string FechaCreacion { get; set; }

        public int idCliente;

        public int idEstadoPedido;
        public EstadoPedido EstadoPedido { get; set; }

        public int idFactura;

        public int IDMetodoPago;

        public void AgregarItem(DetallePedido item)
        {
            if (Items.Any(i => item.IDProducto == i.IDProducto))
            {
                foreach (DetallePedido i in Items)
                {
                    if (i.IDProducto == item.IDProducto)
                    {
                        i.Cantidad++;
                        return;
                    }
                }
            }
            else
            {
                item.Cantidad = 1;
                Items.Add(item);
            }

        }

        public void setCantidad(int id, int cant)
        {
            if (cant == 0)
            {
                RemoverItem(id);
                return;
            }

            DetallePedido item = new DetallePedido(id);

            foreach (DetallePedido i in Items)
            {
                if (i.Equals(item))
                {
                    i.Cantidad = cant;
                    return;
                }
            }
        }

        public void RemoverItem(int id)
        {
            foreach (DetallePedido i in Items)
            {
                if (i.IDProducto == id)
                {
                    Items.Remove(i);
                    return;
                }
            }
        }

        public decimal Total()
        {
            decimal total = 0;
            foreach (DetallePedido i in Items)
                total += i.PrecioTotal;
            return total;
        }
    }
}