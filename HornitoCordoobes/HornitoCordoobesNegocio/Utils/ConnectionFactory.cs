using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace HornitoCordoobesNegocio.Utils
{
    public class ConnectionFactory
    {
        private static SqlConnection connection = null;

        private ConnectionFactory(){}

        public static SqlConnection getConnection()
        {
            if (connection == null)
            {
                connection = new SqlConnection("Data Source=(localdb)\Projects;Initial Catalog=master;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False");
            }
            connection.Open();
            return connection;
        }
    }
}
