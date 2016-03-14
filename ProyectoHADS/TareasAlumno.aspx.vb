Imports System.Data.SqlClient

Public Class TareasAlumno
    Inherits System.Web.UI.Page
    Dim dataset As New DataSet


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If (Page.IsPostBack = False) Then
            rellenarLista()
            rellenarGridView(Lista.SelectedValue)
        End If

        If (Page.IsPostBack) Then
            rellenarGridView(Lista.SelectedValue)
        End If

    End Sub



    Private Sub rellenarLista()
        Dim libreriaData As New libreria.accesodatosSQL
        Dim conexion As SqlConnection = libreriaData.getConexion
        'Esta query obtiene SOLO las asignaturas en las que esta matriculado el estudiante logueado
        Dim Sql As String = "select asignaturas.codigo,asignaturas.nombre from asignaturas,EstudiantesGrupo,gruposClase where asignaturas.codigo=gruposClase.codigoasig and gruposClase.codigo=EstudiantesGrupo.Grupo and EstudiantesGrupo.email=@Email"

        Dim cmd As New SqlCommand(Sql, conexion)
        cmd.Parameters.Add("@email", SqlDbType.VarChar, 100).Value = Session.Contents("idSession")

        Dim dataAdapter As New SqlDataAdapter
        dataAdapter.SelectCommand = cmd

        dataAdapter.Fill(dataset, "asignaturas")

        'El comando fill cierra la conexion
        'libreriaData.closeConexion(conexion)

        Lista.DataSource = dataset.Tables("asignaturas")
        Lista.DataValueField = "codigo"
        Lista.DataTextField = "nombre"
        Lista.DataBind()

    End Sub


    Protected Sub Lista_SelectedIndexChanged(sender As Object, e As EventArgs) Handles Lista.SelectedIndexChanged
        rellenarGridView(Lista.SelectedValue)
    End Sub

    Private Sub rellenarGridView(codAsignatura As String)
        Dim libreriaData As New libreria.accesodatosSQL
        Dim conexion As SqlConnection = libreriaData.getConexion
        'Obtiene solo aquellas tareas no instanciadas por el alumno
        Dim sql As String = "select * from TareasGenericas where Explotacion = 1 and CodAsig =@CodAsig  and codigo NOT IN ( Select codTarea from EstudiantesTareas where email=@email)"
        Dim cmd As New SqlCommand(sql, conexion)
        cmd.Parameters.Add("@CodAsig", SqlDbType.VarChar, 100).Value = codAsignatura
        cmd.Parameters.Add("@email", SqlDbType.VarChar, 100).Value = Session.Contents("idSession")

        Dim dataAdapter As New SqlDataAdapter
        dataAdapter.SelectCommand = cmd

        dataAdapter.Fill(dataset, "tareas")

        'El comando fill cierra la conexion
        'libreriaData.closeConexion(conexion)

        GVTareas.DataSource = dataset.Tables("tareas") 'Se enlaza la DataTable con el DataGrid
        GVTareas.DataBind()




    End Sub



    Protected Sub CheckBox3_CheckedChanged(sender As Object, e As EventArgs) Handles CheckBox3.CheckedChanged
        GVTareas.Columns(3).Visible = CheckBox3.Checked()
        GVTareas.DataSource = dataset
        GVTareas.DataBind()


    End Sub

    Protected Sub CheckBox4_CheckedChanged(sender As Object, e As EventArgs) Handles CheckBox4.CheckedChanged
        GVTareas.Columns(4).Visible = CheckBox4.Checked()
        GVTareas.DataSource = dataset
        GVTareas.DataBind()

    End Sub


    Protected Sub CheckBox2_CheckedChanged(sender As Object, e As EventArgs) Handles CheckBox2.CheckedChanged
        GVTareas.Columns(2).Visible = CheckBox2.Checked()
        GVTareas.DataSource = dataset
        GVTareas.DataBind()
    End Sub

    Private Sub GVTareas_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GVTareas.SelectedIndexChanged

        Response.Redirect(“InstanciarTarea.aspx?codigo=" + GVTareas.SelectedRow.Cells(1).Text)
    End Sub

    Private Sub GVTareas_Sorting(sender As Object, e As GridViewSortEventArgs) Handles GVTareas.Sorting


        Dim custDV As DataView = dataset.Tables("tareas").DefaultView

        custDV.Sort = e.SortExpression + GridViewSortDirection()

        'bind the data
        GVTareas.DataSource = custDV
        GVTareas.DataBind()

    End Sub



    Private Function GridViewSortDirection()
        Dim order As String

        If (ViewState("sortDirection") = Nothing) Then
            ViewState("sortDirection") = " ASC"
        End If


        If (ViewState("sortDirection") = " ASC") Then
            order = ViewState("sortDirection")
            ViewState("sortDirection") = " DESC"
        Else
            order = ViewState("sortDirection")
            ViewState("sortDirection") = " ASC"
        End If


        Return order
    End Function


    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Session.Abandon()
        Response.Redirect("inicio.aspx")
    End Sub
End Class