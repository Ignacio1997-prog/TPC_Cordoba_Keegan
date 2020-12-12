using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class EnvioNegocio
    {
        public List<Envio> listarLocalidades()
        {
            List<Envio> lista = new List<Envio>();
            AccesoDatos datos = new AccesoDatos();
            datos.setearQuery("SELECT IDLocalidad,Nombre FROM Localidades");
            try
            {
                datos.ejecutarReader();
                while (datos.reader.Read())
                {
                    Envio aux = new Envio();
                    aux.IDLocalidad = Convert.ToInt32(datos.reader["IDLocalidad"]);
                    aux.NombreLocalidad = (string)datos.reader["Nombre"];

                    lista.Add(aux);
                }
                datos.cerrarConexion();
                return lista;
            }
            catch (Exception)
            {
                throw;
            }
        }
        public void cargarEnvio(Envio e)
        {
            AccesoDatos datos = new AccesoDatos();
            datos.setearSP("EXEC SP_RegistrarEnvio @IDPedido,@Calle,@Numero,@EntreCalle1,@EntreCalle2,@Piso,@Departamento,@IDLocalidad,@Telefono,@Observaciones");
            datos.agregarParametro("@IDPedido", e.IDPedido);
            datos.agregarParametro("@Calle", e.Calle);
            datos.agregarParametro("@Numero", e.Numero);
            datos.agregarParametro("@EntreCalle1", e.EntreCalle1);
            datos.agregarParametro("@EntreCalle2", e.EntreCalle2);
            datos.agregarParametro("@Piso", e.Piso);
            datos.agregarParametro("@Departamento", e.Departamento);
            datos.agregarParametro("@IDLocalidad", e.IDLocalidad);
            datos.agregarParametro("@Telefono", e.Telefono);
            datos.agregarParametro("@Observaciones", e.Observaciones);
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
