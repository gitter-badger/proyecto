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

        public bool exist(string username)
        {
            if (username == "test")
            {
                return true;
            }
            return false;
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
    }
}
