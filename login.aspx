<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="UMBRELLACORPGESTION11.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 156px;
        }
        .auto-style2 {
            height: 23px;
        }
        .auto-style3 {
            width: 156px;
            height: 23px;
        }
        .auto-style4 {
            height: 20px;
        }
        .auto-style5 {
            width: 156px;
            height: 20px;
        }
        .auto-style6 {
            height: 49px;
        }
        .auto-style8 {
            width: 143px;
        }
        .auto-style10 {
            width: 143px;
            height: 49px;
        }
        .auto-style11 {
            width: 143px;
            height: 23px;
        }
        .auto-style12 {
            width: 124px;
        }
        .auto-style13 {
            height: 20px;
            width: 124px;
        }
        .auto-style14 {
            height: 49px;
            width: 124px;
        }
        .auto-style15 {
            height: 23px;
            width: 124px;
        }
        .auto-style16 {
            width: 143px;
            height: 20px;
        }
        .auto-style17 {
            width: 244px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table style="width:100%;">
                <tr>
                    <td>&nbsp;</td>
                    <td class="auto-style12">&nbsp;</td>
                    <td class="auto-style8">&nbsp;</td>
                    <td class="auto-style1">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td class="auto-style12">&nbsp;</td>
                    <td class="auto-style8">&nbsp;</td>
                    <td class="auto-style1">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4"></td>
                    <td class="auto-style13"></td>
                    <td class="auto-style16"></td>
                    <td class="auto-style5"></td>
                    <td class="auto-style4"></td>
                    <td class="auto-style4"></td>
                    <td class="auto-style4"></td>
                </tr>
                <tr>
                    <td class="auto-style6"></td>
                    <td class="auto-style14"></td>
                    <td class="auto-style10"></td>
                    <td class="auto-style1">&nbsp;&nbsp;&nbsp;&nbsp;
                        <h1 class="auto-style17" aria-atomic="False">Iniciar Sesión</h1>
                    </td>
                    <td class="auto-style6"></td>
                    <td class="auto-style6"></td>
                    <td class="auto-style6"></td>
                </tr>
                <tr>
                    <td class="auto-style2"></td>
                    <td class="auto-style15"></td>
                    <td class="auto-style11">Nombre de Usuario:</td>
                    <td class="auto-style3">
                        <asp:TextBox ID="TxtUsuario" runat="server" Height="27px" Width="165px"></asp:TextBox>
                    </td>
                    <td class="auto-style2">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtUsuario" ErrorMessage="*Campo obligatorio" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                    <td class="auto-style2"></td>
                    <td class="auto-style2"></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td class="auto-style12">&nbsp;</td>
                    <td class="auto-style8">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Contraseña:</td>
                    <td class="auto-style1">
                        <asp:TextBox ID="TxtContraseña" runat="server" Height="27px" Width="164px" TextMode="Password"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TxtContraseña" ErrorMessage="*Campo obligatorio" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2"></td>
                    <td class="auto-style15"></td>
                    <td class="auto-style11"></td>
                    <td class="auto-style3">
                        <asp:Button ID="BtnAceptar" runat="server" BackColor="#66FF33" BorderColor="#66FF33" ForeColor="White" Height="42px" OnClick="BtnAceptar_Click" Text="ACEPTAR" Width="171px" />
                    </td>
                    <td class="auto-style2">
                        <asp:Label ID="LblRespuesta" runat="server"></asp:Label>
                    </td>
                    <td class="auto-style2"></td>
                    <td class="auto-style2"></td>
                </tr>
                <tr>
                    <td class="auto-style2"></td>
                    <td class="auto-style15"></td>
                    <td class="auto-style11"></td>
                    <td class="auto-style3">&nbsp;
                        <asp:LinkButton ID="LinkButton1" runat="server" ForeColor="Silver" OnClick="LinkButton1_Click">¿Olvido la Contraseña?</asp:LinkButton>
                    </td>
                    <td class="auto-style2"></td>
                    <td class="auto-style2"></td>
                    <td class="auto-style2"></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td class="auto-style12">&nbsp;</td>
                    <td class="auto-style8">&nbsp;</td>
                    <td class="auto-style1">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td class="auto-style12">&nbsp;</td>
                    <td class="auto-style8">&nbsp;</td>
                    <td class="auto-style1">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2"></td>
                    <td class="auto-style15"></td>
                    <td class="auto-style11"></td>
                    <td class="auto-style3"></td>
                    <td class="auto-style2"></td>
                    <td class="auto-style2"></td>
                    <td class="auto-style2"></td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
