using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using HornitoCordoobesEntidades;
using HornitoCordoobesNegocio.Utils;
using System.Data.SqlClient;

namespace HornitoCordoobesNegocio
{
    public class GestorBarrio : IGestor<Barrio>
    {
        private static SqlConnection connection = ConnectionFactory.getConnection();

        public List<Barrio> getAll()
        {
            //TODO Traer datos de la DB
            List<Barrio> lista = new List<Barrio>();
            connection.Open();
            SqlCommand select = new SqlCommand("SELECT * FROM Barrios", connection);
            SqlDataReader reader = select.ExecuteReader();
            while (reader.Read())
            {
                Barrio barrio = new Barrio();
                barrio.Id = (int)reader["idBarrio"];
                barrio.Descripcion = (string)reader["descripcion"];
                lista.Add(barrio);
            }
            connection.Close();

            return lista;
        }
    }
}
