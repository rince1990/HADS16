<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="datos.aspx.vb" Inherits="ProyectoHADS.WebForm6" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource2">
            <Series>
                <asp:Series Name="Series1" XValueMember="CodTarea" YValueMembers="HEstimadas">
                </asp:Series>
            </Series>
            <ChartAreas>
                <asp:ChartArea Name="ChartArea1">
                </asp:ChartArea>
            </ChartAreas>
        </asp:Chart>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:HADS16ConnectionString %>" SelectCommand="SELECT [CodTarea], [HEstimadas] FROM [EstudiantesTareas] WHERE ([Email] = @Email)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" DefaultValue="jon@ikasle.ehu.es" Name="Email" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <br />
        <br />
        alumnos:
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="email" DataValueField="email">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HADS16ConnectionString %>" SelectCommand="SELECT [email] FROM [Usuarios] WHERE ([tipo] = @tipo)">
            <SelectParameters>
                <asp:Parameter DefaultValue="A" Name="tipo" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <br />
    
    </div>
    </form>
</body>
</html>
