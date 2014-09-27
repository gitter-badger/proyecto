using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using HornitoCordoobesEntidades;

namespace HornitoCordoobesNegocio
{
    public class GestorUsuario : IGestor<Usuario>
    {
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
    }
}
