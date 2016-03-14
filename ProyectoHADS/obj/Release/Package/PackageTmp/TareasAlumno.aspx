<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="TareasAlumno.aspx.vb" Inherits="ProyectoHADS.TareasAlumno" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Tareas alumno</title>
</head>
<body>

    <form id="form1" runat="server">
    <center>Alumnos</center>
    <center>Gestión de tareas genéricas<br />
        </center>

    Seleccionar asignatura (solo se muestran aquellas en las que se esta matriculado):

    <div>

        <asp:DropDownList ID="Lista" runat="server" AutoPostBack="True"></asp:DropDownList>
    </div>
        <p>
            <asp:CheckBox ID="CheckBox1" runat="server" Enabled="False" Text="Código" Checked="True" AutoPostBack="True" />
            <asp:CheckBox ID="CheckBox2" runat="server" AutoPostBack="True" Text="Descripción" Checked="True" />
            <asp:CheckBox ID="CheckBox3" runat="server" AutoPostBack="True" Text="Horas" Checked="True" />
            <asp:CheckBox ID="CheckBox4" runat="server" AutoPostBack="True" Text="Tipo de tarea" Checked="True" />
        </p>
        <p>
            <asp:GridView ID="GVTareas" runat="server" AutoGenerateColumns="False" AllowSorting="True" >
                <HeaderStyle ForeColor="#E7E7FF" Font-Bold="True"  BackColor="#4A3C8C"></HeaderStyle>
                <Columns>
                    <asp:ButtonField ButtonType="Button" CommandName="Select" Text="Instanciar" />
                    <asp:BoundField DataField="Codigo" HeaderText="Código"  SortExpression="Codigo"/>
                    <asp:BoundField DataField="Descripcion" HeaderText="Descripción" SortExpression="Descripcion"/>
                    <asp:BoundField DataField="HEstimadas" HeaderText="Horas" SortExpression="HEstimadas"/>
                    <asp:BoundField DataField="TipoTarea" HeaderText="Tipo de tarea" SortExpression="TipoTarea"/>
                </Columns>
            </asp:GridView>
        </p>

        <p>
            *Solo muestra las tareas no instanciadas</p>
        <p>
            <asp:Button ID="Button1" runat="server" Text="cerrar Sesión" />
        </p>
    </form>
    <p>
        &nbsp;</p>
</body>
</html>
