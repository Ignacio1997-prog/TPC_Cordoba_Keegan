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
            datos.setearQuery("Select IDProducto, Nombre,Descripcion,Precio,IDCategoria,IDVariedad,Estado From Productos");
            try
            {
                datos.ejecutarReader();
                while (datos.reader.Read())
                {
                    Producto aux = new Producto();
                    aux.id = (int)datos.reader["IDProducto"];
                    aux.Nombre = (string)datos.reader["Nombre"];
                    aux.Descripcion = (string)datos.reader["Descripcion"];

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
