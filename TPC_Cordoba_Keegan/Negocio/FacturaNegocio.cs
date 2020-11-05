using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;
using System.Data.SqlClient;

namespace Negocio
{
    public class FacturaNegocio
    {
        public List<Factura> listar()
        {
            List<Factura> lista = new List<Factura>();
            AccesoDatos datos = new AccesoDatos();
            datos.setearQuery("Select IDFactura,Nombre,FechaEmision,IDEstadoFactura From Facturas");
            try
            {
                datos.ejecutarReader();
                while (datos.reader.Read())
                {
                    Factura aux = new Factura();
                    aux.id = (int)datos.reader["IDFactura"];
                    aux.Nombre = (string)datos.reader["Nombre"];
                    aux.FechaEmision = (string)datos.reader["FechaEmision"];
                    aux.IdEstadoFactura = (int)datos.reader["IDEstadoFactura"];
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
