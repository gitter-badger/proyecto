using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HornitoCordoobesNegocio;
using HornitoCordoobesEntidades;

namespace HornitoCordoobesWeb.Account
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.LoadTipoDocumento();
            this.LoadBarrios();
            if (Page.IsPostBack)
            {
                Page.Validate();
                if (Page.IsValid)
                {
                    Response.Redirect("~/Admin/Users.aspx");
                }
            }
        }

        private void LoadTipoDocumento()
        {
            tipoDocumento.DataSource = new GestorTipoDocumento().getAll();
            tipoDocumento.DataValueField = "Id";
            tipoDocumento.DataTextField = "Descripcion";
            tipoDocumento.DataBind();
        }

        private void LoadBarrios()
        {
            barrio.DataSource = new GestorBarrio().getAll();
            barrio.DataValueField = "Id";
            barrio.DataTextField = "Descripcion";
            barrio.DataBind();
        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = !new GestorCliente().exist(Convert.ToInt32(nroDocumento.Text),Convert.ToInt32(tipoDocumento.SelectedValue));
        }

        protected void CustomValidator2_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = !new GestorUsuario().exist(usuario.Text);
        }
    }
}