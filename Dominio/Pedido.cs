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
        public int IDPedido { get; set; }
        public string FechaCreacion { get; set; }

        public int idCliente { get; set; }

        public string NombreCliente { get; set; }

        public string Direccion { get; set; }

        public int idEstadoPedido { get; set; }
        public EstadoPedido EstadoPedido { get; set; }

        public DetallePedido DetPedido { get; set; }

        public string NombreEstado { get; set; }

        public int idFactura { get; set; }

        public string Factura { get; set; }

        public int IDMetodoPago { get; set; }

        public decimal _total { get; set; }

        public decimal Total
        {
            get
            {
                decimal total = 0;
                foreach (DetallePedido i in Items)
                    total += i.PrecioTotal;
                return total;
            }
            set { _total = value; }
        }

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

        public void RestarItem(int id)
        {
          foreach (DetallePedido i in Items)
          {
              if (i.IDProducto == id)
              {
                 i.Cantidad--;
                 if (i.Cantidad < 0)
                 {
                     i.Cantidad = 0;
                 }
                 return;
              }
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

    }
}