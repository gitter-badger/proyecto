using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using HornitoCordoobesEntidades;

namespace HornitoCordoobesNegocio
{
    public class GestorBarrio
    {
        public static List<Barrio> getAll()
        {
            //TODO Traer datos de la DB
            List<Barrio> lista = new List<Barrio>();
            Barrio br1 = new Barrio();
            br1.Descripcion = "Alta Cordoba";
            br1.Id = 1;
            lista.Add(br1);
            Barrio br2 = new Barrio();
            br2.Descripcion = "Gral Bustos";
            br2.Id = 2;
            lista.Add(br2);
            Barrio br3 = new Barrio();
            br3.Descripcion = "Pueyrredon";
            br3.Id = 3;
            lista.Add(br3);

            return lista;
        }
    }
}
