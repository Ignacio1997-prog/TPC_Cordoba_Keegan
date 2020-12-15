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
                    aux.IDPedido = (int)datos.reader["IDPedido"];
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
        public int RegistrarVenta(int ID, int factura)
        {
            AccesoDatos datos = new AccesoDatos();
            int pedido;
            datos.setearSP("INSERT INTO Pedidos VALUES(GETDATE(),@IDCliente,1,@IDFactura) SELECT CAST(scope_identity() AS int); ");
            datos.agregarParametro("@IDCliente", ID);
            datos.agregarParametro("@IDFactura", 2);
            try
            {
               pedido = datos.ejecutarScalar();
               datos.cerrarConexion();
            }
            catch (Exception)
            {
                throw;
            }
            return pedido;
        }
        public bool RegistrarDetalle(DetallePedido detalle,int id)
        {
            AccesoDatos datos2 = new AccesoDatos();
            datos2.setearSP("EXEC SP_AgregarDetallePedido @cantidad,@subtotal,@producto,@pedido ");
            datos2.agregarParametro("@cantidad", detalle.Cantidad);
            datos2.agregarParametro("@subtotal", detalle.PrecioTotal);
            datos2.agregarParametro("@producto", detalle.IDProducto);
            datos2.agregarParametro("@pedido", id);
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
            datos.setearQuery("exec SP_EstadoPedidoxID @ID");
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

        public List<Pedido> listarxIDCliente(int Id)
        {
            List<Pedido> lista = new List<Pedido>();
            AccesoDatos datos = new AccesoDatos();
            datos.setearQuery("Select * From PedidosXIDUsuario(@ID)");
            datos.agregarParametro("@ID", Id);
            try
            {
                datos.ejecutarReader();
                while (datos.reader.Read())
                {
                    Pedido aux = new Pedido();
                    aux.IDPedido = Convert.ToInt32(datos.reader["IDPedido"]);
                    aux.FechaCreacion = String.Format("{0:dd-MM-yyyy}", datos.reader["FechaCreacion"]);
                    //aux.idEstadoPedido = Convert.ToInt32(datos.reader["IDEstadoPedido"]);
                    //aux.Factura = (string)datos.reader["Factura"];

                    aux.EstadoPedido = new EstadoPedido();
                    aux.EstadoPedido.Nombre = (string)datos.reader["Nombre"];

                    lista.Add(aux);
                }
                datos.cerrarConexion();
                return lista;
            }
            catch (Exception)
            {

                throw;
            }
        }

        public List<DetallePedido> listarDetallePedido()
        {
            List<DetallePedido> lista = new List<DetallePedido>();
            AccesoDatos datos = new AccesoDatos();
            datos.setearQuery("Select * From DPXIDPedido");
            try
            {
                datos.ejecutarReader();
                while (datos.reader.Read())
                {
                    DetallePedido aux = new DetallePedido();
                    aux.IDPedido = Convert.ToInt32(datos.reader["IDPedido"]);
                    aux.Cantidad = Convert.ToInt32(datos.reader["Cantidad"]);
                    aux.Precio = Convert.ToDecimal(datos.reader["Subtotal"]);
                    aux.Nombre = (string)datos.reader["Nombre"];

                    lista.Add(aux);
                }
                datos.cerrarConexion();
                return lista;
            }
            catch (Exception)
            {

                throw;
            }
        }

        public List<Pedido> listarPedidos()
        {
            List<Pedido> lista = new List<Pedido>();
            AccesoDatos datos = new AccesoDatos();
            datos.setearQuery("exec SP_listarPedidos");
            try
            {
                datos.ejecutarReader();
                while (datos.reader.Read())
                {
                    Pedido aux = new Pedido();
                    aux.IDPedido = Convert.ToInt32(datos.reader["IDPedido"]);
                    aux.FechaCreacion = String.Format("{0:dd-MM-yyyy}", datos.reader["FechaCreacion"]);
                    aux.NombreCliente = (string)datos.reader["Nombre"] + " " + (string)datos.reader["Apellido"];
                    aux.Direccion = (string)datos.reader["Direccion"];
                    aux.EstadoPedido = new EstadoPedido();
                    aux.idEstadoPedido = Convert.ToInt32(datos.reader["IDEstadoPedido"]);
                    aux.EstadoPedido.Nombre = (string)datos.reader["Estado"];
                    aux.NombreEstado = (string)datos.reader["Estado"];
                    aux._total = (decimal)datos.reader["Total"];

                    lista.Add(aux);
                }
                datos.cerrarConexion();
                return lista;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public List<EstadoPedido> listarEstados()
        {
            List<EstadoPedido> lista = new List<EstadoPedido>();
            AccesoDatos datos = new AccesoDatos();
            datos.setearQuery("SELECT IDEstadoPedido,Nombre FROM EstadoPedidos");
            try
            {
                datos.ejecutarReader();
                while (datos.reader.Read())
                {
                    EstadoPedido aux = new EstadoPedido();
                    aux.ID = Convert.ToInt32(datos.reader["IDEstadoPedido"]);
                    aux.Nombre = (string)datos.reader["Nombre"];

                    lista.Add(aux);
                }
                datos.cerrarConexion();
                return lista;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public void modificarEstado(int pedido,int id)
        {
            AccesoDatos datos = new AccesoDatos();
            datos.setearQuery("EXEC SP_ModificarEstado @pedido,@estado");
            datos.agregarParametro("@pedido", pedido);
            datos.agregarParametro("@estado", id);
            try
            {
                datos.ejecutarAccion();
                datos.cerrarConexion();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


    }
}
