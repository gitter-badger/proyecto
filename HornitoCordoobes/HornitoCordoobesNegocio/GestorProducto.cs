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
    public class GestorProducto : IGestor<Producto>
    {
        private static SqlConnection connection = ConnectionFactory.getConnection();
        public List<Producto> getAll()
        {
            List<Producto> lista = new List<Producto>();
            connection.Open();
            SqlCommand select = new SqlCommand("SELECT * FROM Productos p LEFT JOIN TiposDeProducto t On p.idTipoDeProducto = t.idTipoDeProducto", connection);
            SqlDataReader reader = select.ExecuteReader();
            while (reader.Read())
            {
                lista.Add(this.materialize(reader));
            }
            connection.Close();
            return lista;
        }

        public bool exist(string name)
        {
            connection.Open();
            SqlCommand select = new SqlCommand("SELECT COUNT(*) FROM Productos WHERE nombre LIKE @nombre", connection);
            select.Parameters.Add(new SqlParameter("@nombre", name));
            bool value = (int)select.ExecuteScalar() > 0 ? true : false;
            connection.Close();
            return value;
        }

        public int save(Producto producto)
        {
            int idProducto = 0;
            try
            {
                connection.Open();
                SqlCommand insert = new SqlCommand("INSERT INTO Productos (idTipoDeProducto, nombre, descripcion, precioUnitario, estado) VALUES (@idTipoDeProducto, @nombre, @descripcion, @precioUnitario, @estado);SELECT @@identity;");
                insert.Connection = connection;
                insert.Parameters.Add(new SqlParameter("@idTipoDeProducto",producto.IdTipoProducto));
                insert.Parameters.Add(new SqlParameter("@nombre", producto.Nombre));
                insert.Parameters.Add(new SqlParameter("@descripcion", producto.Descripcion));
                insert.Parameters.Add(new SqlParameter("@precioUnitario", producto.PrecioUnitario));
                insert.Parameters.Add(new SqlParameter("@estado", producto.Estado));
                idProducto = Convert.ToInt32(insert.ExecuteScalar());
                connection.Close();
                producto.Id = idProducto;
            }
            catch (Exception)
            {
                throw;
            }
            return idProducto;
        }

        private Producto materialize(SqlDataReader row)
        {
            if (!row.HasRows)
            {
                return null;
            }
            Producto p = new Producto();
            p.Id = (int)row["idProducto"];
            p.IdTipoProducto = (int)row["idTipoDeProducto"];
            p.Nombre = row["nombre"].ToString();
            p.Descripcion = row["descripcion"].ToString();
            p.PrecioUnitario = (double)row["precioUnitario"];
            p.Estado = (bool)row["estado"];
            return p;
        }

    }
}
