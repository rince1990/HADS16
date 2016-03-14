<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="InstanciarTarea.aspx.vb" Inherits="ProyectoHADS.InstanciarTarea" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
     <center>Alumnos</center>
    <center>Gestión de tareas genéricas</center>
    <form id="form1" runat="server">
    <div>
    
        Usuario&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBoxUsuario" runat="server" Enabled="False"></asp:TextBox>
        <asp:Panel ID="Panel1" runat="server" style="margin-left: 320px">
        </asp:Panel>
        <br />
        Tarea&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBoxTarea" runat="server" Enabled="False"></asp:TextBox>
        <br />
        Horas est.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBoxHestimadas" runat="server"></asp:TextBox>
        <br />
        Horas reales&nbsp;&nbsp;
        <asp:TextBox ID="TextBoxHreales" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label1" runat="server" ForeColor="#CC0000"></asp:Label>
        <br />
        <asp:Button ID="Button1" runat="server" Height="55px" Text="Crear tarea" Width="142px" />
        <br />
        <br />
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/TareasAlumno.aspx">Página anterior</asp:HyperLink>
    
        <br />
        <br />
        <br />
        Tareas ya instanciadas:<br />
        <asp:GridView ID="GridViewInstancias" runat="server">
        </asp:GridView>
        <br />
    
    </div>
    </form>
</body>
</html>
