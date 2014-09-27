<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="HornitoCordoobesWeb.Admin.Product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 152px;
        }

        .auto-style2 {
            width: 205px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width: 100%;">
        <tr>
            <td class="auto-style1">Nombre del Producto:</td>
            <td class="auto-style2">
                <asp:TextBox ID="nombreDelProducto" runat="server" Width="200px"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style1">Descripción:</td>
            <td class="auto-style2">
                <asp:TextBox ID="descripcion" runat="server" Height="54px" MaxLength="500" TextMode="MultiLine" Width="200px"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style1">Tipo de Producto:</td>
            <td class="auto-style2">
                <asp:DropDownList ID="tipoDeProducto" runat="server" Height="16px" Width="208px">
                </asp:DropDownList>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style1">Precio unitatio:</td>
            <td class="auto-style2">
                <asp:TextBox ID="precioUnitario" runat="server" Width="200px"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style1">Activo</td>
            <td class="auto-style2">
                <asp:CheckBox ID="estado" runat="server" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style1">&nbsp;</td>
            <td class="auto-style2">
                <asp:Button ID="aceptar" runat="server" Text="Aceptar" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style1">&nbsp;</td>
            <td class="auto-style2">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
