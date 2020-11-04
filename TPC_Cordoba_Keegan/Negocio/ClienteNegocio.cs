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
        public List<Cliente> listar()
        {
            List<Cliente> lista = new List<Cliente>();
            AccesoDatos datos = new AccesoDatos();
            datos.setearQuery("Select IDCliente,Nombre,Apellido,FechaAlta,Direccion,IDLocalidad,Email,Telefono From Clientes");
            try
            {
                datos.ejecutarReader();
                while (datos.reader.Read())
                {
                    Cliente aux = new Cliente();
                    aux.id = (int)datos.reader["IDCliente"];
                    aux.Nombre = (string)datos.reader["Nombre"];
                    aux.Apellido = (string)datos.reader["Apellido"];
                    aux.Direccion = (string)datos.reader["Direccion"];
                    aux.Email = (string)datos.reader["Email"];
                    aux.Telefono = (string)datos.reader["Telefono"];

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
