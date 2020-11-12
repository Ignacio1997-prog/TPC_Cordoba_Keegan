using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;
using System.Data.SqlClient;

namespace Negocio
{
    public class ProductoNegocio
    {
        public List<Producto> listar()
        {
            List<Producto> lista = new List<Producto>();
            AccesoDatos datos = new AccesoDatos();
            datos.setearQuery("SELECT * FROM Mostrar_Productos");
            try
            {
                datos.ejecutarReader();
                while (datos.reader.Read())
                {
                    Producto aux = new Producto();
                    aux.id = Convert.ToInt32(datos.reader["IDProducto"]);
                    aux.Nombre = (string)datos.reader["Nombre"];
                    aux.IDCategoria = Convert.ToInt32(datos.reader["IDCategoria"]);
                    aux.IDVariedad = Convert.ToInt32(datos.reader["IDVariedad"]);
                    aux.Descripcion = (string)datos.reader["Descripcion"];

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
