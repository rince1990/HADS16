Imports System.Data.SqlClient

Public Class InsertarTarea
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim libreria As New libreria.accesodatosSQL
        Dim conexion As SqlClient.SqlConnection = libreria.getConexion
        Dim dset As New DataSet
        Dim adapter As SqlDataAdapter = New SqlDataAdapter("SELECT * FROM TareasGenericas", conexion)
        Dim builder As SqlCommandBuilder = New SqlCommandBuilder(adapter)
        adapter.InsertCommand = builder.GetInsertCommand
        adapter.Fill(dset, "tareas")
        Dim table As DataTable
        table = dset.Tables("tareas")
        Dim rowT As DataRow = table.NewRow()
        Try
            rowT("Codigo") = codigo.Text
            rowT("Descripcion") = descript.Text
            rowT("CodAsig") = asigcod.SelectedValue
            rowT("HEstimadas") = hestimadas.Text
            rowT("Explotacion") = False
            rowT("TipoTarea") = tarea.SelectedValue
            table.Rows.Add(rowT)
            adapter.Update(dset, "tareas")
            table.AcceptChanges()

        Catch ex As Exception
            Try
                table.Rows.Remove(rowT)
            Catch ex1 As Exception
            End Try

        End Try
    End Sub
End Class

