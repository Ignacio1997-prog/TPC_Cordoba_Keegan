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
            datos.setearSP("EXEC SP_AgregarPedidos @IDCliente,@IDFactura ");
            datos.agregarParametro("@IDCliente", ID);
            datos.agregarParametro("@IDFactura", 2);
            try
            {
                datos.ejecutarAccion();
                datos.cerrarConexion();
            }
            catch (Exception)
            {
                throw;
            }
            AccesoDatos datos2 = new AccesoDatos();
            int idpedido = 0;
            datos.setearQuery("SELECT TOP 1 IDPedido FROM Pedidos ORDER BY IDPedido DESC");
            try
            {
                datos.ejecutarReader();
                while (datos.reader.Read())
                {
                    idpedido = Convert.ToInt32(datos.reader["IDPedido"]);
                }
            }
            catch (Exception)
            {
                throw;
            }
            datos.cerrarConexion();
            return idpedido;
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
                    aux.Factura = (string)datos.reader["Factura"];

                    aux.DetPedido = new DetallePedido();
                    aux.DetPedido.Cantidad = Convert.ToInt32(datos.reader["Cantidad"]);
                    aux.DetPedido.Precio = Convert.ToDecimal(datos.reader["Subtotal"]);
                    aux.DetPedido.Nombre = (string)datos.reader["Nombre"];


                    aux.EstadoPedido = new EstadoPedido();
                    aux.EstadoPedido.Nombre = (string)datos.reader["Estado"];

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
