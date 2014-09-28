using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HornitoCordoobesNegocio;
using HornitoCordoobesEntidades;

namespace HornitoCordoobesWeb.Admin
{
    public partial class Users : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                this.LoadUsuarios();
            }
            
        }

        private void LoadUsuarios()
        {
            usuarios.DataSource = new GestorCliente().getAll();
            usuarios.DataKeyNames = new string[] { "Id" };
            usuarios.DataBind();
        }

        protected void usuarios_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void usuarios_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            usuarios.PageIndex = e.NewPageIndex;
            this.LoadUsuarios();
        }
    }
}