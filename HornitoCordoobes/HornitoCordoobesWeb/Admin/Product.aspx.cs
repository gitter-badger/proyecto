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
    public partial class Product : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                this.LoadTipoProducto();
                this.LoadProductos();
            }

        }

        private void LoadTipoProducto()
        {
            this.tipoDeProducto.DataSource = new GestorTipoDeProducto().getAll();
            this.tipoDeProducto.DataValueField = "Id";
            this.tipoDeProducto.DataTextField = "Descripcion";
            this.tipoDeProducto.DataBind();
        }

        protected void guardar_Click(object sender, EventArgs e)
        {
            Producto producto = new Producto();
            producto.IdTipoProducto = Convert.ToInt32(this.tipoDeProducto.SelectedItem.Value);
            producto.Nombre = this.nombreDelProducto.Text;
            producto.Descripcion = this.descripcion.Text;
            producto.PrecioUnitario = Convert.ToDouble(this.precioUnitario.Text);
            producto.Estado = this.estado.Checked;

            if (new GestorProducto().save(producto) > 0)
            {
                Response.Redirect("~/Admin/Product.aspx");
            }
        }

        private void LoadProductos()
        {
            this.GridViewProductos.DataSource = new GestorProducto().getAll();
            this.GridViewProductos.DataKeyNames = new string[] { "Id" };
            this.GridViewProductos.DataBind();
        }
    }
}