<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Alumno.aspx.vb" Inherits="ProyectoHADS.Alumno" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <br />

        <center><h1 class="header">Gestión Web de tareas y dedicacion </h1>
            <h3 class="header"> Alumno</h3></center>

    <div>
    
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/TareasAlumno.aspx">Tareas Alumno</asp:HyperLink>
        <br />
        <asp:HyperLink ID="HyperLink2" runat="server">Grupos</asp:HyperLink>
        <br />
        <asp:HyperLink ID="HyperLink3" runat="server">Asignaturas</asp:HyperLink>
        <br />
    
    </div>
    </form>
</body>
</html>
