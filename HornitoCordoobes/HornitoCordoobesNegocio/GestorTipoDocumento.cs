using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using HornitoCordoobesEntidades;
using System.Data.SqlClient;
using HornitoCordoobesNegocio.Utils;

namespace HornitoCordoobesNegocio
{
    public class GestorTipoDocumento : IGestor<TipoDocumento>
    {
        private static SqlConnection connection = ConnectionFactory.getConnection();
        public List<TipoDocumento> getAll()
        {
            List<TipoDocumento> lista = new List<TipoDocumento>();
            connection.Open();
            SqlCommand select = new SqlCommand("SELECT * FROM TiposDeDocumento", connection);
            SqlDataReader reader = select.ExecuteReader();
            while (reader.Read())
            {
                TipoDocumento td = new TipoDocumento();
                td.Id = (int)reader["idTiposDeDocumento"];
                td.Descripcion = (string)reader["descripcion"];
                lista.Add(td);
            }
            connection.Close();
            return lista;
        }
    }
}
