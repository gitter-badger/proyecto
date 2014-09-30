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
                if (Request.QueryString["userId"] != null)
                {
                    requirePassword.Enabled = false;
                    this.FillForm(Convert.ToInt32(Request.QueryString["userId"].ToString()));
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
            args.IsValid = !new GestorCliente().exist(Convert.ToInt32(nroDocumento.Text), Convert.ToInt32(tipoDocumento.SelectedValue), Convert.ToInt32(Request.QueryString["userId"]));
        }

        protected void CustomValidator2_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = !new GestorUsuario().exist(usuario.Text,Convert.ToInt32(Request.QueryString["userId"]));
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                if (Request.QueryString["userId"] != null)
                {
                    this.updateCliente();
                }
                else
                {
                    this.saveCliente();
                }
            }
        }

        

        protected void CustomValidator3_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = !new GestorCliente().exist(email.Text, Convert.ToInt32(Request.QueryString["userId"]));
        }

        private void FillForm(int userId)
        {
            mensaje.Text = "Editar Cliente";
            Cliente c = new GestorCliente().getById(userId);
            if (c == null)
            {
                Response.Redirect("~/Default.aspx");
            }
            else
            {
                nombre.Text = c.Nombre;
                apellido.Text = c.Apellido;
                sexo.Items.FindByValue(c.Sexo).Selected = true;
                tipoDocumento.Items.FindByValue(c.IdTipoDocumento.ToString()).Selected = true;
                nroDocumento.Text = c.NumeroDocumento.ToString();
                email.Text = c.Email;
                direccion.Text = c.Direccion;
                barrio.Items.FindByValue(c.IdBarrio.ToString()).Selected = true;
                usuario.Text = c.NombreUsuario;
            }
        }

        private void saveCliente()
        {
            Cliente cliente = this.materialize();
            if (new GestorCliente().save(cliente) > 0)
            {
                Response.Redirect("~/Admin/Users.aspx");
            }
        }

        private void updateCliente()
        {
            Cliente cliente = this.materialize();
            if (new GestorCliente().update(cliente))
            {
                Response.Redirect("~/Admin/Users.aspx");
            }
        }

        private Cliente materialize()
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

            if (Request.QueryString["userId"] != null)
            {
                cliente.Id = Convert.ToInt32(Request.QueryString["userId"]);
            }

            return cliente;
        }
    }
}