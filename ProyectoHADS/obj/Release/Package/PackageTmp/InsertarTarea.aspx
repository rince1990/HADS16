<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="InsertarTarea.aspx.vb" Inherits="ProyectoHADS.InsertarTarea" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        Código:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="codigo" runat="server"></asp:TextBox>
        <br />
        <br />
        Descripción: 
        <asp:TextBox ID="descript" runat="server" Height="95px" Width="652px"></asp:TextBox>
        <br />
        <br />
        <br />
        Asignatura:&nbsp;&nbsp;&nbsp; <asp:DropDownList ID="asigcod" runat="server" DataSourceID="SqlDataSource1" DataTextField="codigoasig" DataValueField="codigoasig">
        </asp:DropDownList>
        <br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HADS16ConnectionString %>" SelectCommand="asig_prof" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="idProf" SessionField="idSession" Type="String" />
                </SelectParameters>
        </asp:SqlDataSource>
    
        <br />
        horas estimadas:
        <asp:TextBox ID="hestimadas" runat="server"></asp:TextBox>
        <br />
        <br />
        tipo Tarea&nbsp;
        <asp:DropDownList ID="tarea" runat="server" DataSourceID="SqlDataSource2" DataTextField="TipoTarea" DataValueField="TipoTarea">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:HADS16ConnectionString %>" SelectCommand="SELECT DISTINCT [TipoTarea] FROM [TareasGenericas]"></asp:SqlDataSource>
        <br />
        <asp:Button ID="Button1" runat="server" Text="insertar Tarea" />
        <br />
        <br />
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/TareasProfesor.aspx">Ver Tareas</asp:HyperLink>
    
    </div>
    </form>
</body>
</html>
