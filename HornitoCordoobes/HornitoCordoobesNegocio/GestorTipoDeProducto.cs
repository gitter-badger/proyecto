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
    public class GestorTipoDeProducto : IGestor<TipoProducto>
    {
        private static SqlConnection connection = ConnectionFactory.getConnection();
        public List<TipoProducto> getAll()
        {
            List<TipoProducto> lista = new List<TipoProducto>();
            connection.Open();
            SqlCommand select = new SqlCommand("SELECT * FROM TiposDeProducto", connection);
            SqlDataReader reader = select.ExecuteReader();
            while (reader.Read())
            {
                TipoProducto tp = new TipoProducto();
                tp.Id = (int)reader["idTipoDeProducto"];
                tp.Descripcion = (string)reader["descripcion"];
                lista.Add(tp);
            }
            connection.Close();
            return lista;
        }
    }
}
