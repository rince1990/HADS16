<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="TareasProfesor.aspx.vb" Inherits="ProyectoHADS.TareasProfesor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h1 class="header">Profesor</h1>
        <h2 class="header">Gestión Web de tareas</h2>
        <p class="header">&nbsp;Seleccionar asignatura:<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="codigoasig" DataValueField="codigoasig">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HADS16ConnectionString %>" SelectCommand="asig_prof" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="idProf" SessionField="idSession" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </p>
        <p class="header">
            <asp:Button ID="Button1" runat="server" PostBackUrl="~/InsertarTarea.aspx" Text="Insertar nueva tarea" />
        </p>
        <p class="header">&nbsp;</p>
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" DataSourceID="SqlDataSource2" DataKeyNames="Codigo">
            <Columns>
                <asp:CommandField ShowEditButton="True" />
            </Columns>
        </asp:GridView>
        <p class="header" style="margin-left: 520px">&nbsp;</p>
        <p class="header" style="margin-left: 520px">
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:HADS16ConnectionString %>" SelectCommand="SELECT [Descripcion], [CodAsig], [HEstimadas], [Explotacion], [Codigo] FROM [TareasGenericas] WHERE ([CodAsig] = @CodAsig2)" DeleteCommand="DELETE FROM [TareasGenericas] WHERE [Codigo] = @Codigo" InsertCommand="INSERT INTO [TareasGenericas] ([Descripcion], [CodAsig], [HEstimadas], [Explotacion], [Codigo]) VALUES (@Descripcion, @CodAsig, @HEstimadas, @Explotacion, @Codigo)" UpdateCommand="UPDATE [TareasGenericas] SET [Descripcion] = @Descripcion, [CodAsig] = @CodAsig, [HEstimadas] = @HEstimadas, [Explotacion] = @Explotacion WHERE [Codigo] = @Codigo">
                <DeleteParameters>
                    <asp:Parameter Name="Codigo" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Descripcion" Type="String" />
                    <asp:Parameter Name="CodAsig" Type="String" />
                    <asp:Parameter Name="HEstimadas" Type="Int32" />
                    <asp:Parameter Name="Explotacion" Type="Boolean" />
                    <asp:Parameter Name="Codigo" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="CodAsig2" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Descripcion" Type="String" />
                    <asp:Parameter Name="CodAsig" Type="String" />
                    <asp:Parameter Name="HEstimadas" Type="Int32" />
                    <asp:Parameter Name="Explotacion" Type="Boolean" />
                    <asp:Parameter Name="Codigo" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </p>
        <p class="header">&nbsp;</p>
    </div>
    </form>
</body>
</html>
