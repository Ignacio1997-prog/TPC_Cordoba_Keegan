using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Net.Configuration;

namespace Negocio
{
    public class AccesoDatos
    {
        public SqlConnection conexion { get; }
        public SqlCommand comando { get; set; }
        public SqlDataReader reader { get; set; }

        public AccesoDatos()
        {
            conexion = new SqlConnection("data source =.\\SQLEXPRESS;initial catalog= KEEGAN_CORDOBA_DB; Integrated security= sspi");
            comando = new SqlCommand();
            comando.Connection = conexion;

        }

        public void setearQuery(string consulta)
        {
            comando.CommandType = System.Data.CommandType.Text;
            comando.CommandText = consulta;
        }
        public void setearSP(string sp)
        {
            comando.CommandType = System.Data.CommandType.Text;
            comando.CommandText = sp;
        }
        public void agregarParametro(string columna, object parametro)
        {
            comando.Parameters.AddWithValue(columna, parametro);

        }
        public void ejecutarReader()
        {
            try
            {
                conexion.Open();
                reader = comando.ExecuteReader();

            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                //conexion.Close();
            }
        }

        internal void ejecutarAccion()
        {
            try
            {
                conexion.Open();
                comando.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                //conexion.Close();
            }
        }
        public void cerrarConexion()
        {
            conexion.Close();
        }
    }
}