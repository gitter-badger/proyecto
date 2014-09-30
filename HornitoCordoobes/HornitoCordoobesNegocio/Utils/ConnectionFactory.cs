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
                connection = new SqlConnection(ConnetionString.connetionString);
            }
            return connection;
        }
    }
}
