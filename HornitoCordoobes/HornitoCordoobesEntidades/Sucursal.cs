using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HornitoCordoobesEntidades
{
    public class Sucursal
    {
        public int Id { get; set; }
        public int IdBarrio { get; set; }
        public string Nombre { get; set; }
        public string Direccion { get; set; }
        public DateTime FechaAlta { get; set; }
        public bool Estado { get; set; }
    }
}
