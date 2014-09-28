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
    public class GestorCliente : IGestor<Cliente>
    {
        private static SqlConnection connection = ConnectionFactory.getConnection();

        public List<Cliente> getAll()
        {
            List<Cliente> lista = new List<Cliente>();
            connection.Open();
            SqlCommand select = new SqlCommand("SELECT * FROM Clientes c LEFT JOIN Usuarios u On c.idUsuario = u.idUsuario WHERE rol LIKE 'Cliente'", connection);
            SqlDataReader reader = select.ExecuteReader();
            while (reader.Read())
            {
                lista.Add(this.materialize(reader));
            }
            connection.Close();
            return lista;
        }

        public int save(Cliente cliente)
        {
            int idUsuario = new GestorUsuario().save(cliente);
            connection.Open();
            SqlCommand insert = new SqlCommand();
            insert.Connection = connection;
            insert.CommandText = "INSERT INTO Clientes (idUsuario,nroDoc,idTiposDeDocumento,email,nombre,apellido,direccion,idBarrio,estado,sexo)"
                                 + " VALUES "
                                 + " (@idUsuario,@nroDoc,@idTiposDeDocumento,@email,@nombre,@apellido,@direccion,@idBarrio,@estado,@sexo) ";
            insert.Parameters.Add(new SqlParameter("@idUsuario", idUsuario));
            insert.Parameters.Add(new SqlParameter("@nroDoc",cliente.NumeroDocumento));
            insert.Parameters.Add(new SqlParameter("@idTiposDeDocumento",cliente.IdTipoDocumento));
            insert.Parameters.Add(new SqlParameter("@email",cliente.Email));
            insert.Parameters.Add(new SqlParameter("@nombre",cliente.Nombre));
            insert.Parameters.Add(new SqlParameter("@apellido",cliente.Apellido));
            insert.Parameters.Add(new SqlParameter("@direccion",cliente.Direccion));
            insert.Parameters.Add(new SqlParameter("@idBarrio",cliente.IdBarrio));
            insert.Parameters.Add(new SqlParameter("@estado", 1));
            insert.Parameters.Add(new SqlParameter("@sexo", cliente.Sexo));

            insert.ExecuteNonQuery();
            connection.Close();
            return idUsuario;
        }

        public bool exist(int nroDoc, int idTipoDoc)
        {
            connection.Open();
            SqlCommand select = new SqlCommand("SELECT COUNT(*) FROM Clientes WHERE idTiposDeDocumento = @tipoDoc AND nroDoc = @nroDoc", connection);
            select.Parameters.Add(new SqlParameter("@tipoDoc",idTipoDoc));
            select.Parameters.Add(new SqlParameter("@nroDoc", nroDoc));
            bool value = (int)select.ExecuteScalar() > 0 ? true : false;
            connection.Close();
            return value;
        }

        public bool exist(string email)
        {
            connection.Open();
            SqlCommand select = new SqlCommand("SELECT COUNT(*) FROM Clientes WHERE email LIKE @email",connection);
            select.Parameters.Add(new SqlParameter("@email", email));
            bool value =  (int)select.ExecuteScalar() > 0 ? true : false;
            connection.Close();
            return value;
        }

        public Cliente getById(int id)
        {
            connection.Open();
            SqlCommand select = new SqlCommand("SELECT * FROM Clientes c LEFT JOIN Usuarios u On c.idUsuario = u.idUsuario WHERE rol LIKE 'Cliente' AND c.idUsuario=@id", connection);
            select.Parameters.Add(new SqlParameter("@id",id));
            SqlDataReader reader = select.ExecuteReader();
            reader.Read();
            Cliente c = this.materialize(reader);
            connection.Close();
            return c;
        }

        private Cliente materialize(SqlDataReader row)
        {
            if (!row.HasRows)
            {
                return null;
            }
            Cliente c = new Cliente();
            c.Id = (int)row["idUsuario"];
            c.IdBarrio = (int)row["idBarrio"];
            c.IdTipoDocumento = (int)row["idTiposDeDocumento"];
            c.Nombre = row["nombre"].ToString();
            c.NombreUsuario = row["nombreUsuario"].ToString();
            c.NumeroDocumento = (int)row["nroDoc"];
            c.Password = row["password"].ToString();
            c.Rol = row["rol"].ToString();
            c.Sexo = row["sexo"].ToString();
            c.Apellido = row["apellido"].ToString();
            c.Direccion = row["direccion"].ToString();
            c.Email = row["email"].ToString();
            c.Estado = (bool)row["estado"];
            c.FechaAlta = (DateTime)row["fechaAlta"];
            return c;
        }
    }
}
