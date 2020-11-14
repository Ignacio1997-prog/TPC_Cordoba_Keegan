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
        public List<Producto> listarDetalle(int cat,int var)
        {
            List<Producto> lista = new List<Producto>();
            AccesoDatos datos = new AccesoDatos();

            datos.setearQuery("SELECT * FROM Detalle_Producto(@categoria,@variedad)");
            datos.agregarParametro("@categoria", cat);
            datos.agregarParametro("@variedad", var);
            try
            {
                datos.ejecutarReader();
                while (datos.reader.Read())
                {
                    Producto aux = new Producto();
                    aux.IDProducto = Convert.ToInt32(datos.reader["IDProducto"]);
                    aux.Nombre = (string)datos.reader["Nombre"];
                    aux.Descripcion = (string)datos.reader["Descripcion"];
                    aux.NombreTamanio = (string)datos.reader["NombreTamaño"];
                    aux.IDTamanio = Convert.ToInt32(datos.reader["IDTamaño"]);
                    aux.Precio = Convert.ToInt32(datos.reader["Precio"]);

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
