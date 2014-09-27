using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using HornitoCordoobesEntidades;

namespace HornitoCordoobesNegocio
{
    public class GestorTipoDocumento : IGestor<TipoDocumento>
    {
        public List<TipoDocumento> getAll()
        {
            //TODO Traer datos desde la base de datos
            List<TipoDocumento> lista = new List<TipoDocumento>();
            TipoDocumento td1 = new TipoDocumento();
            td1.Descripcion = "DNI";
            td1.Id = 1;
            lista.Add(td1);
            TipoDocumento td2 = new TipoDocumento();
            td2.Descripcion = "LC";
            td2.Id = 2;
            lista.Add(td2);
            TipoDocumento td3 = new TipoDocumento();
            td3.Descripcion = "LCA";
            td3.Id = 3;
            lista.Add(td3);

            return lista;
        }
    }
}
