using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;
using System.Data.SqlClient;

namespace Negocio
{
    public class PedidoNegocio
    {
        public List<Pedido> listar()
        {
            List<Pedido> lista = new List<Pedido>();
            AccesoDatos datos = new AccesoDatos();
            datos.setearQuery("Select IDPedido,FechaCreacion,IDCliente,IDEstadoPedido,IDFactura From Pedidos");
            try
            {
                datos.ejecutarReader();
                while (datos.reader.Read())
                {
                    Pedido aux = new Pedido();
                    aux.id = (int)datos.reader["IDPedido"];
                    aux.FechaCreacion = (string)datos.reader["FechaCreacion"];
                    aux.idCliente = (int)datos.reader["IDCliente"];
                    aux.idEstadoPedido = (int)datos.reader["IDEstadoPedido"];
                    aux.idFactura = (int)datos.reader["IDFactura"];
                    lista.Add(aux);
                }
                datos.cerrarConexion();
                return lista;
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
    }
}
