<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Profesor.aspx.vb" Inherits="ProyectoHADS.WebForm5" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/TareasProfesor.aspx">Tareas</asp:HyperLink>
        <br />
        <asp:HyperLink ID="HyperLink2" runat="server">Grupos</asp:HyperLink>
        <br />
        <asp:HyperLink ID="HyperLink3" runat="server">Asignaturas</asp:HyperLink>
        <br />
        <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/datos.aspx">Graficos</asp:HyperLink>
        <br />
        <br />

        <h1 class="header">Gestión Web de tareas y dedicacion </h1>
            <h3 class="header"> Profesor</h3>
        <p class="header"> 
            <asp:Button ID="Button1" runat="server" Text="Cerrar sesion" />
        </p>
    </div>
    </form>
</body>
</html>
