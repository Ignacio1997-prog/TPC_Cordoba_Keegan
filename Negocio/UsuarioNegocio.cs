using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class UsuarioNegocio
    {
        public Usuario Validacion(Usuario user)
        {
            AccesoDatos datos = new AccesoDatos();
            datos.setearQuery("SELECT IDUsuario,NombreUsuario,Clave,Email,IDRol FROM Usuarios WHERE NombreUsuario = @usuario AND Clave = @clave");
            datos.agregarParametro("@usuario", user.Nombre);
            datos.agregarParametro("@clave", user.Clave);
            try
            {
                datos.ejecutarReader();
                while (datos.reader.Read())
                {
                    if (datos.reader.HasRows)
                    {
                        user.ID = Convert.ToInt32(datos.reader["IDUsuario"]);
                        user.Rol = Convert.ToInt32(datos.reader["IDRol"]);
                    }
                    else
                    {
                        user.ID = -1;
                    }

                }

            }
            catch (Exception ex)
            {

                throw ex;
            }
            datos.cerrarConexion();
            return user;
        }

        public bool RegistrarUsuario(Usuario user)
        {
            AccesoDatos datos = new AccesoDatos();
            int ID = 0;
            datos.setearQuery("SELECT * FROM Get_ID");
            try
            {
                datos.ejecutarReader();
                while (datos.reader.Read())
                {
                    ID = Convert.ToInt32(datos.reader["IDCliente"]);
                }
            }
            catch (Exception)
            {
                throw;
            }
            datos.cerrarConexion();
            AccesoDatos datos2 = new AccesoDatos();
            datos2.setearSP("EXEC SP_AgregarUsuario @id,@nombre,@clave,@email,@rol ");
            datos2.agregarParametro("@id", ID);
            datos2.agregarParametro("@nombre", user.Nombre);
            datos2.agregarParametro("@clave", user.Clave);
            datos2.agregarParametro("@email", user.Email);
            datos2.agregarParametro("@rol", 1);
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
    }
}
