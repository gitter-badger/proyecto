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
    public class GestorUsuario : IGestor<Usuario>
    {
        private static SqlConnection connection = ConnectionFactory.getConnection();
        public List<Usuario> getAll()
        {
            return null;
        }

        public bool exist(string username, int? userId)
        {
            connection.Open();
            string extraFilter = "";
            if (userId != null)
            {
                extraFilter = " AND idUsuario != @idUsuario ";
            }
            SqlCommand select = new SqlCommand("SELECT COUNT(*) FROM Usuarios WHERE nombreUsuario LIKE @usuario" + extraFilter, connection);
            select.Parameters.Add(new SqlParameter("@usuario", username));
            select.Parameters.Add(new SqlParameter("@idUsuario", userId));
            bool value = (int)select.ExecuteScalar() > 0 ? true : false;
            connection.Close();
            return value;
        }

        public int save(Usuario usuario)
        {
            connection.Open();
            SqlCommand insert = new SqlCommand("INSERT INTO Usuarios (nombreUsuario, password, rol) VALUES (@nombreUsuario, @password, @rol);SELECT @@identity;");
            insert.Connection = connection;
            insert.Parameters.Add(new SqlParameter("@nombreUsuario", usuario.NombreUsuario));
            insert.Parameters.Add(new SqlParameter("@password", usuario.Password));
            insert.Parameters.Add(new SqlParameter("@rol", usuario.Rol));

            int idUsuario = Convert.ToInt32(insert.ExecuteScalar());
            connection.Close();

            usuario.Id = idUsuario;

            return idUsuario;
        }

        public bool update(Usuario usuario)
        {
            connection.Open();
            try
            {
                SqlCommand update = new SqlCommand("UPDATE Usuarios SET nombreUsuario=@nombreUsuario, password=@password, rol=@rol WHERE idUsuario=@idUsuario");
                update.Connection = connection;
                update.Parameters.Add(new SqlParameter("@nombreUsuario", usuario.NombreUsuario));
                update.Parameters.Add(new SqlParameter("@password", usuario.Password));
                update.Parameters.Add(new SqlParameter("@rol", usuario.Rol));
                update.Parameters.Add(new SqlParameter("@idUsuario", usuario.Id));
                update.ExecuteNonQuery();
                connection.Close();
            }
            catch (SqlException e)
            {
                return false;
            }
            finally
            {
                connection.Close();
            }

            return true;
        }
    }
}
