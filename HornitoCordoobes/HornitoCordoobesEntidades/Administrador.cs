using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HornitoCordoobesEntidades
{
    public class Administrador : Usuario
    {
        public int NumeroDocumento { get; set; }
        public int IdTipoDocumento { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public int IdSucursal { get; set; }
        public bool Estado { get; set; }
        public DateTime FechaAlta { get; set; }
    }
}
