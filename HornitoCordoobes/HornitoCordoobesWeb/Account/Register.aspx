﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="HornitoCordoobesWeb.Account.Register" %>
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
            width: 345px;
        }
        .auto-style5 {
            width: 345px;
        }
        .auto-style6 {
            width: 136px;
            height: 30px;
        }
        .auto-style7 {
            width: 345px;
            height: 30px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        <asp:Label ID="mensaje" runat="server" Text="Registrar Cliente" Font-Bold="True"></asp:Label>
    </p>
    <p>
        <table style="width: 93%;">
            <tr>
                <td class="auto-style2">Nombre</td>
                <td class="auto-style4">
                    <asp:TextBox ID="nombre" runat="server" Width="300px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="nombre" CssClass="errorStar" ErrorMessage="El nombre es requerido">*</asp:RequiredFieldValidator>
                </td>
                <td class="auto-style1" rowspan="12">
                    <asp:ValidationSummary ID="ValidationSummary2" runat="server" CssClass="errorStar" />
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Apellido</td>
                <td class="auto-style4">
                    <asp:TextBox ID="apellido" runat="server" Width="300px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="apellido" CssClass="errorStar" ErrorMessage="El apellido es requerido">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Sexo</td>
                <td class="auto-style4">
                    <asp:RadioButtonList ID="sexo" runat="server">
                        <asp:ListItem Selected="True" Value="F">Femenino</asp:ListItem>
                        <asp:ListItem Value="M">Masculino</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Tipo Documento</td>
                <td class="auto-style4">
                    <asp:DropDownList ID="tipoDocumento" runat="server" Width="300px" Height="27px">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Número Documento</td>
                <td class="auto-style5">
                    <asp:TextBox ID="nroDocumento" runat="server" Width="300px"></asp:TextBox>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="nroDocumento" ErrorMessage="El numero de documento no es valido" Operator="DataTypeCheck" Type="Double" CssClass="errorStar">*</asp:CompareValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="nroDocumento" ErrorMessage="El numero de documento es requerido" CssClass="errorStar">*</asp:RequiredFieldValidator>
                    <asp:CustomValidator ID="CustomValidator1" runat="server" ControlToValidate="nroDocumento" CssClass="errorStar" ErrorMessage="Ya existe un usuario con el numero y tipo de documento" OnServerValidate="CustomValidator1_ServerValidate">*</asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Email</td>
                <td class="auto-style5">
                    <asp:TextBox ID="email" runat="server" Width="300px"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="email" ErrorMessage="Email no valido" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" CssClass="errorStar">*</asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="email" ErrorMessage="El email es requerido" CssClass="errorStar">*</asp:RequiredFieldValidator>
                    <asp:CustomValidator ID="CustomValidator3" runat="server" ControlToValidate="email" CssClass="errorStar" ErrorMessage="El email ya esta registrado" OnServerValidate="CustomValidator3_ServerValidate">*</asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Dirección</td>
                <td class="auto-style5">
                    <asp:TextBox ID="direccion" runat="server" Width="300px" MaxLength="500" TextMode="MultiLine"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="direccion" ErrorMessage="Direccion no valida" CssClass="errorStar">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style6">Barrio</td>
                <td class="auto-style7">
                    <asp:DropDownList ID="barrio" runat="server" Height="27px" Width="300px">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Usuario</td>
                <td class="auto-style5">
                    <asp:TextBox ID="usuario" runat="server" Width="300px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="usuario" CssClass="errorStar" ErrorMessage="El usuario es requerido">*</asp:RequiredFieldValidator>
                    <asp:CustomValidator ID="CustomValidator2" runat="server" ControlToValidate="usuario" CssClass="errorStar" ErrorMessage="El usuario ya existe" OnServerValidate="CustomValidator2_ServerValidate">*</asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Password</td>
                <td class="auto-style5">
                    <asp:TextBox ID="password" runat="server" TextMode="Password" Width="300px"></asp:TextBox>
                    <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToCompare="repassword" ControlToValidate="password" CssClass="errorStar" ErrorMessage="Los passwords no coinciden">*</asp:CompareValidator>
                    <asp:RequiredFieldValidator ID="requirePassword" runat="server" ControlToValidate="password" CssClass="errorStar" ErrorMessage="El password es requerido">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Repetir Password</td>
                <td class="auto-style5">
                    <asp:TextBox ID="repassword" runat="server" TextMode="Password" Width="300px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style5">
                    <asp:Button ID="Button1" runat="server" Text="Aceptar" OnClick="Button1_Click" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:LinkButton ID="eliminar" runat="server" Enabled="False" OnClick="eliminar_Click" Visible="False">Eliminar</asp:LinkButton>
                </td>
            </tr>
        </table>
    </p>
    <div>
</asp:Content>
