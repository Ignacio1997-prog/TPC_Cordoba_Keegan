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

        public bool RegistrarVenta(int ID,int factura)
        {
            AccesoDatos datos = new AccesoDatos();
            datos.setearSP("EXEC SP_AgregarPedidos @IDCliente,@@IDFactura ");
            datos.agregarParametro("@IDCliente", ID);
            datos.agregarParametro("@@IDFactura", 1);
            try
            {
                datos.ejecutarAccion();
                datos.cerrarConexion();
            }
            catch (Exception)
            {
                throw;
            }
            return true;
        }
        public bool RegistrarDetalle(DetallePedido detalle)
        {
            AccesoDatos datos = new AccesoDatos();
            int ID = 0;
            datos.setearQuery("SELECT * FROM Get_IDPedido");
            try
            {
                datos.ejecutarReader();
                while (datos.reader.Read())
                {
                    ID = Convert.ToInt32(datos.reader["IDPedido"]);
                }
            }
            catch (Exception)
            {
                throw;
            }
            datos.cerrarConexion();

            AccesoDatos datos2 = new AccesoDatos();
            datos2.setearSP("EXEC SP_AgregarDetallePedido @cantidad,@subtotal,@producto,@pedido ");
            datos2.agregarParametro("@cantidad", detalle.Cantidad);
            datos2.agregarParametro("@subtotal", detalle.PrecioTotal);
            datos2.agregarParametro("@producto", detalle.IDProducto);
            datos2.agregarParametro("@pedido", ID);
            try
            {
                datos2.ejecutarAccion();
                datos2.cerrarConexion();
            }
            catch (Exception)
            {
                throw;
            }
            return true;
        }

        public bool EstadoPedido(int id)
        {
            AccesoDatos datos = new AccesoDatos();
            datos.setearQuery("exec EstadoPedidoxID @ID");
            datos.agregarParametro("@ID", id);
            try
            {
                datos.ejecutarAccion();
                datos.cerrarConexion();
            }
            catch (Exception ex)
            {

                throw ex;
            }
            return true;

        }
    }
}
