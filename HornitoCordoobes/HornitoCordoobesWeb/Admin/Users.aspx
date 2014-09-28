<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="HornitoCordoobesWeb.Admin.Users" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        Listado de usuarios
        <asp:GridView AutoGenerateColumns="False" onpageindexchanging="usuarios_PageIndexChanging" ID="usuarios" runat="server" AllowPaging="True" OnSelectedIndexChanged="usuarios_SelectedIndexChanged" PageSize="10">
            <Columns>
                <asp:CommandField SelectText="Editar" ShowSelectButton="True" />
                <asp:BoundField DataField="nombre" HeaderText="Nombre" />
                <asp:BoundField DataField="apellido" HeaderText="Apellido" SortExpression="apellido" />
                <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                <asp:BoundField DataField="direccion" HeaderText="Direccion" SortExpression="direccion" />
                <asp:BoundField DataField="nombreUsuario" HeaderText="Usuario" SortExpression="nombreUsuario" />
            </Columns>
        </asp:GridView>
    </p>
</asp:Content>
