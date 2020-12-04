using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using Dominio;

namespace Negocio
{
    public class DetallePedidoNegocio
    {
        public List<DetallePedido> listarDPP(int id)
        {
            List<DetallePedido> lista = new List<DetallePedido>();
            AccesoDatos datos = new AccesoDatos();
            datos.setearQuery("EXEC DetallePedidoxIDPedido @ID");
            datos.agregarParametro("@ID",id );
            try
            {
                datos.ejecutarReader();
                while (datos.reader.Read())
                {
                    DetallePedido aux = new DetallePedido();
                    aux.ID = Convert.ToInt32(datos.reader["IDDetallePedido"]);
                    aux.Cantidad = Convert.ToInt32(datos.reader["Cantidad"]);
                    aux.Precio = Convert.ToInt32(datos.reader["Subtotal"]);

                    aux.Producto = new Producto();
                    aux.Producto.Nombre = (string)datos.reader["Nombre"];

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
