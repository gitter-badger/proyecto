<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="HornitoCordoobesWeb.Admin.Product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
        }

        .auto-style2 {
            width: 205px;
        }
        .auto-style3 {
            width: 26px;
        }
        .auto-style4 {
            width: 203px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width: 100%;">
        <tr>
            <td class="auto-style1" colspan="2">Datos del producto</td>
            <td class="auto-style3">&nbsp;</td>
            <td>Listado de Productos</td>
        </tr>
        <tr>
            <td class="auto-style4">Nombre del Producto:</td>
            <td class="auto-style2">
                <asp:TextBox ID="nombreDelProducto" runat="server" Width="200px" MaxLength="200"></asp:TextBox>
            </td>
            <td class="auto-style3">&nbsp;</td>
            <td rowspan="6">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:CommandField SelectText="Editar" ShowSelectButton="True" />
                        <asp:BoundField DataField="nombre" HeaderText="Nombre" />
                        <asp:BoundField DataField="descripcion" HeaderText="Descripción" />
                        <asp:BoundField DataField="precioUnitario" HeaderText="Precio Unitario" />
                        <asp:BoundField DataField="estado" HeaderText="Estado" />
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">Descripción:</td>
            <td class="auto-style2">
                <asp:TextBox ID="descripcion" runat="server" Height="54px" MaxLength="500" TextMode="MultiLine" Width="200px"></asp:TextBox>
            </td>
            <td class="auto-style3">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style4">Tipo de Producto:</td>
            <td class="auto-style2">
                <asp:DropDownList ID="tipoDeProducto" runat="server" Height="16px" Width="208px">
                </asp:DropDownList>
            </td>
            <td class="auto-style3">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style4">Precio unitatio:</td>
            <td class="auto-style2">
                <asp:TextBox ID="precioUnitario" runat="server" Width="200px" MaxLength="10"></asp:TextBox>
            </td>
            <td class="auto-style3">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style4">Activo</td>
            <td class="auto-style2">
                <asp:CheckBox ID="estado" runat="server" />
            </td>
            <td class="auto-style3">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style4">&nbsp;</td>
            <td class="auto-style2">
                &nbsp;</td>
            <td class="auto-style3">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style4">&nbsp;</td>
            <td class="auto-style2">
                <asp:Button ID="aceptar" runat="server" Text="Guardar" />
            </td>
            <td class="auto-style3">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
