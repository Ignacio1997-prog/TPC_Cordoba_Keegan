using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;
using System.Data.SqlClient;

namespace Negocio
{
    public class ClienteNegocio
    {
        public int RegistrarCliente(Cliente cl)
        {
            int id;
            AccesoDatos datos = new AccesoDatos();
            datos.setearSP("INSERT INTO Clientes VALUES (@Nombre,@Apellido,@Calle,@numero,@EntreCalle1,@EntreCalle2,@Piso,@Departamento,@IDLocalidad,@Telefono) SELECT CAST(scope_identity() AS int)");
            datos.agregarParametro("@Nombre", cl.Nombre);
            datos.agregarParametro("@Apellido", cl.Apellido);
            datos.agregarParametro("@Calle", cl.Calle);
            datos.agregarParametro("@numero", cl.Numero);
            datos.agregarParametro("@EntreCalle1", cl.EntreCalle1);
            datos.agregarParametro("@EntreCalle2", cl.EntreCalle2);
            datos.agregarParametro("@Piso", cl.Piso);
            datos.agregarParametro("@Departamento", cl.Departamento);
            datos.agregarParametro("@IDLocalidad", cl.IDLocalidad);
            datos.agregarParametro("@Telefono", cl.Telefono);
            try
            {
                id = datos.ejecutarScalar();
                datos.cerrarConexion();
            }
            catch (Exception)
            {
                throw;
            }
            return id;
        }
    }
}
