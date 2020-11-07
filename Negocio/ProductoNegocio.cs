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
            datos.setearQuery("Select IDProducto,Nombre,Precio,IDCategoria,IDVariedad,IDTamaño,Estado,Descripcion From Productos");
            try
            {
                datos.ejecutarReader();
                while (datos.reader.Read())
                {
                    Producto aux = new Producto();
                    aux.id = Convert.ToInt32(datos.reader["IDProducto"]);
                    aux.Nombre = (string)datos.reader["Nombre"];
                    aux.Descripcion = (string)datos.reader["Descripcion"];
                    aux.Precio = (decimal)datos.reader["Precio"];
                    aux.Estado = (bool)datos.reader["Estado"];

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
