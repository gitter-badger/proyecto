﻿using System;
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
            return null;
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
    }
}
