using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using HornitoCordoobesEntidades;

namespace HornitoCordoobesNegocio
{
    public class GestorCliente : IGestor<Cliente>
    {
        public List<Cliente> getAll()
        {
            return null;
        }

        public bool save(Cliente cliente)
        {
            return true;
        }
    }
}
