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
            datos.setearSP("EXEC SP_AgregarUsuario @id,@nombre,@clave,@email,@rol ");
            datos.agregarParametro("@id", user.ID);
            datos.agregarParametro("@nombre", user.Nombre);
            datos.agregarParametro("@clave", user.Clave);
            datos.agregarParametro("@email", user.Email);
            datos.agregarParametro("@rol", 1);
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
    }
}
