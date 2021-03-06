﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HornitoCordoobesEntidades
{
    public class Cliente : Usuario
    {
        public int NumeroDocumento { get; set; }
        public int IdTipoDocumento { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public string Direccion { get; set; }
        public DateTime FechaAlta { get; set; }
        public int IdBarrio { get; set; }
        public bool Estado { get; set; }
        public string Email { get; set; }
        public string Sexo { get; set; }
    }
}
