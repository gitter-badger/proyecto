﻿using System;
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
            //TODO implementar magia
            return true;
        }

        public bool exist(int nroDoc, int idTipoDoc)
        {
            //TODO implementar magia
            if (nroDoc == 123 && idTipoDoc == 1)
            {
                return true;
            }
            return false;
        }
    }
}