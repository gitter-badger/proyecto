using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HornitoCordoobesEntidades
{
    public class Producto
    {
        public int Id { get; set; }
        public int IdTipoProducto { get; set; }
        public string Nombre { get; set; }
        public string Descripcion { get; set; }
        public double PrecioUnitario { get; set; }
        public bool Estado { get; set; }
    }
}
