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
            if (!Page.IsPostBack)
            {
                this.LoadTipoDocumento();
                this.LoadBarrios();
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

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Cliente cliente = new Cliente();
                cliente.Apellido = apellido.Text;
                cliente.Direccion = direccion.Text;
                cliente.IdBarrio = Convert.ToInt32(barrio.SelectedValue.ToString());
                cliente.IdTipoDocumento = Convert.ToInt32(tipoDocumento.SelectedValue.ToString());
                cliente.Nombre = nombre.Text;
                cliente.NombreUsuario = usuario.Text;
                cliente.Rol = "Cliente";
                cliente.Password = password.Text.GetHashCode().ToString();
                cliente.Email = email.Text;
                cliente.NumeroDocumento = Convert.ToInt32(nroDocumento.Text);
                cliente.Sexo = sexo.SelectedValue.ToString();
                if (new GestorCliente().save(cliente) > 0)
                {
                    Response.Redirect("~/Admin/Users.aspx");
                }

            }
        }

        protected void CustomValidator3_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = !new GestorCliente().exist(email.Text);
        }
    }
}