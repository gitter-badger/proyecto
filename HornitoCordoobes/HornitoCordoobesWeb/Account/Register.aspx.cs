﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HornitoCordoobesNegocio;

namespace HornitoCordoobesWeb.Account
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.LoadTipoDocumento();
            this.LoadBarrios();
        }

        private void LoadTipoDocumento()
        {
            tipoDocumento.DataSource = GestorTipoDocumento.getAll();
            tipoDocumento.DataValueField = "Id";
            tipoDocumento.DataTextField = "Descripcion";
            tipoDocumento.DataBind();
        }

        private void LoadBarrios()
        {
            barrio.DataSource = GestorBarrio.getAll();
            barrio.DataValueField = "Id";
            barrio.DataTextField = "Descripcion";
            barrio.DataBind();
        }
    }
}