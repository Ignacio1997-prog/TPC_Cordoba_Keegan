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
            datos.setearQuery("SELECT * FROM Mostrar_Productos WHERE Estado = 1");
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
                    aux.Estado = Convert.ToInt32(datos.reader["Estado"]);

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

        public List<Producto> listarTamaños(int id)
        {
            List<Producto> lista = new List<Producto>();
            AccesoDatos datos = new AccesoDatos();
            datos.setearQuery("SELECT * FROM Mostrar_Tamaños(@categoria)");
            datos.agregarParametro("@categoria", id);
            try
            {
                datos.ejecutarReader();
                while (datos.reader.Read())
                {
                    Producto aux = new Producto();
                    aux.IDCategoria = Convert.ToInt32(datos.reader["IDCategoria"]);
                    aux.IDTamanio = Convert.ToInt32(datos.reader["IDTamaño"]);
                    aux.NombreTamanio = (string)datos.reader["Nombre"];
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

        public List<Producto> listarCategorias()
        {
            List<Producto> lista = new List<Producto>();
            AccesoDatos datos = new AccesoDatos();
            datos.setearQuery("SELECT * FROM Mostrar_Categorias");
            try
            {
                datos.ejecutarReader();
                while (datos.reader.Read())
                {
                    Producto aux = new Producto();
                    aux.IDCategoria = Convert.ToInt32(datos.reader["IDCategoria"]);
                    aux.NombreCategoria = (string)datos.reader["Nombre"];
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
                    aux.Estado = Convert.ToInt32(datos.reader["Estado"]);

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

        public int RegistrarVariedad(string nombre,int categoria)
        {
            AccesoDatos datos = new AccesoDatos();
            int id;
            datos.setearQuery("INSERT INTO Variedades VALUES(@nombre) SELECT CAST(scope_identity() AS int);");
            datos.agregarParametro("@nombre", nombre);
            try
            {
                id = datos.ejecutarScalar();
                datos.cerrarConexion();
            }
            catch (Exception)
            {
                throw;
            }
            datos.setearQuery("INSERT INTO CategoriasVariedades VALUES (1,@id);");
            datos.agregarParametro("@id", id);
            try
            {
                datos.ejecutarAccion();
                datos.cerrarConexion();
            }
            catch (Exception)
            {
                throw;
            }
            return id;
        }
        public void RegistrarProducto(Producto p)
        {
            AccesoDatos datos = new AccesoDatos();
            datos.setearSP("EXEC SP_AgregarProducto @Nombre,@Precio,@IDCategoria,@IDVariedad,@IDTamaño,@Estado,@Descripcion");
            datos.agregarParametro("@Nombre", p.Nombre);
            datos.agregarParametro("@Precio", p.Precio);
            datos.agregarParametro("@IDCategoria", p.IDCategoria);
            datos.agregarParametro("@IDVariedad", p.IDVariedad);
            datos.agregarParametro("@IDTamaño", p.IDTamanio);
            datos.agregarParametro("@Estado", 1);
            datos.agregarParametro("@Descripcion", p.Descripcion);
            try
            {
                datos.ejecutarAccion();
                datos.cerrarConexion();
            }
            catch (Exception)
            {
                    throw;
            }
        }

        public void RemoverProducto(int id)
        {
            AccesoDatos datos = new AccesoDatos();
            datos.setearSP("DELETE FROM Productos WHERE IDProducto = @id");
            datos.agregarParametro("@id", id);
            try
            {
                datos.ejecutarAccion();
                datos.cerrarConexion();
            }
            catch (Exception)
            {
                throw;
            }
        }

        public void ModificarNombre(int id,string nombre)
        {
            AccesoDatos datos = new AccesoDatos();
            datos.setearSP("EXEC SP_ModificarNombre @Producto,@Nombre");
            datos.agregarParametro("@Producto", id);
            datos.agregarParametro("@Nombre", nombre);
            try
            {
                datos.ejecutarAccion();
                datos.cerrarConexion();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public void ModificarPrecio(int id,decimal precio)
        {
            AccesoDatos datos = new AccesoDatos();
            datos.setearSP("EXEC SP_ModificarPrecio @Producto,@Precio");
            datos.agregarParametro("@Producto", id);
            datos.agregarParametro("@Precio", precio);
            try
            {
                datos.ejecutarAccion();
                datos.cerrarConexion();
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}
