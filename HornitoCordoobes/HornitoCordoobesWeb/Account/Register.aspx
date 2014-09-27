<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="HornitoCordoobesWeb.Account.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {}
        .auto-style2 {
            height: 23px;
            width: 136px;
        }
        .auto-style3 {
            width: 136px;
        }
        .auto-style4 {
            height: 23px;
            width: 331px;
        }
        .auto-style5 {
        width: 331px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        Registrar Usuario</p>
    <p>
        <table style="width: 93%;">
            <tr>
                <td class="auto-style2">Tipo Documento</td>
                <td class="auto-style4">
                    <asp:DropDownList ID="tipoDocumento" runat="server" Width="300px">
                    </asp:DropDownList>
                </td>
                <td class="auto-style1" rowspan="7">
                    <asp:ValidationSummary ID="ValidationSummary2" runat="server" CssClass="errorStar" />
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Número Documento</td>
                <td class="auto-style5">
                    <asp:TextBox ID="nroDocumento" runat="server" Width="300px"></asp:TextBox>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="nroDocumento" ErrorMessage="El numero de documento no es valido" Operator="DataTypeCheck" Type="Double" CssClass="errorStar">*</asp:CompareValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="nroDocumento" ErrorMessage="El numero de documento es requerido" CssClass="errorStar">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Email</td>
                <td class="auto-style5">
                    <asp:TextBox ID="email" runat="server" Width="300px"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="email" ErrorMessage="Email no valido" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" CssClass="errorStar">*</asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="email" ErrorMessage="El email es requerido" CssClass="errorStar">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Dirección</td>
                <td class="auto-style5">
                    <asp:TextBox ID="direccion" runat="server" Width="300px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="direccion" ErrorMessage="Direccion no valida" CssClass="errorStar">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Barrio</td>
                <td class="auto-style5">
                    <asp:DropDownList ID="barrio" runat="server" Height="16px" Width="300px">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Activo</td>
                <td class="auto-style5">
                    <asp:CheckBox ID="estado" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style5">
                    <asp:Button ID="Button1" runat="server" Text="Aceptar" />
                </td>
            </tr>
        </table>
    </p>
    <div>
</asp:Content>
