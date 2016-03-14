<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="registro.aspx.vb"  Inherits="ProyectoHADS.WebForm4" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:Label runat="server" Text="Label">(*)Email:</asp:Label><br />
    <asp:TextBox runat="server" ID="Email">asd@asd.com</asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="Email" ForeColor="#CC0000"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Introduce un email válido" ControlToValidate="Email" ForeColor="#CC0000" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
        <br />
    <asp:Label runat="server" Text="Label">(*)Nombre:</asp:Label><br />
    <asp:TextBox runat="server" ID="nombre" MaxLength="30">123</asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="nombre" ForeColor="#CC0000"></asp:RequiredFieldValidator>
        <br />
    <asp:Label runat="server" Text="Label">(*)Apellidos:</asp:Label><br />
    <asp:TextBox runat="server" ID="apellidos" MaxLength="30">123</asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="apellidos" ForeColor="#CC0000"></asp:RequiredFieldValidator>
        <br />
    <asp:Label runat="server" Text="Label">(*)DNI:</asp:Label><br />
    <asp:TextBox runat="server" ID="dni" MaxLength="9">72525400y</asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ControlToValidate="dni" ForeColor="#CC0000"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="dni" ErrorMessage="Ejemplo: 72525400Y" ForeColor="#CC0000" ValidationExpression="(\d{8})([-]?)([A-Za-z]{1})"></asp:RegularExpressionValidator>
        <br />
    <asp:Label runat="server" Text="Label">(*)Password:</asp:Label><br />
    <asp:TextBox runat="server" ID="pass1" MaxLength="40" TextMode="Password">1234</asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ControlToValidate="pass1" ForeColor="#CC0000"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Solo se admiten letras y números (hasta 10 caracteres)" ControlToValidate="pass1" EnableClientScript="False" ForeColor="#CC0000" ValidationExpression="[a-zA-Z0-9]*"></asp:RegularExpressionValidator>
        <br />
    <asp:Label runat="server" Text="Label">(*)Repite password:</asp:Label><br />
    <asp:TextBox runat="server" ID="pass2" Width="128px" TextMode="Password" MaxLength="40">1234</asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" ControlToValidate="pass2" ForeColor="#CC0000"></asp:RequiredFieldValidator>
        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Las contraseñas no coinciden" ControlToCompare="pass1" ControlToValidate="pass2" ForeColor="#CC0000"></asp:CompareValidator>
        <br />
        <br />
        <asp:Label ID="Label1" runat="server" Text="(*) Estos campos son obligatorios"></asp:Label>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Registrar" />
    </div>
    </form>
</body>
</html>
