Imports System.Data.SqlClient

Public Class InstanciarTarea
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        rellenarGridView()

        If Not IsPostBack Then
            TextBoxUsuario.Text = Session.Contents("idSession")
            TextBoxTarea.Text = Request.QueryString("codigo")

            Dim libreriaData As New libreria.accesodatosSQL
            Dim conexion As SqlClient.SqlConnection = libreriaData.getConexion

            Dim sql As String = "select HEstimadas,HReales from EstudiantesTareas where email=@email and codtarea = @codtarea"
            Dim cmd As New SqlCommand(sql, conexion)
            cmd.Parameters.Add("@email", SqlDbType.VarChar, 100).Value = TextBoxUsuario.Text
            cmd.Parameters.Add("@codtarea", SqlDbType.VarChar, 50).Value = TextBoxTarea.Text

            Dim reader As SqlDataReader = cmd.ExecuteReader()
            reader.Read()
            If reader.HasRows Then
                TextBoxHestimadas.Text = reader.GetValue(0).ToString
                TextBoxHestimadas.Enabled = False
                TextBoxHreales.Text = reader.GetValue(1).ToString
                TextBoxHreales.Enabled = False
                Button1.Enabled = False
                Button1.Text = "Tarea ya instanciada"
            End If

            libreriaData.closeConexion(conexion)
        End If

    End Sub

    Private Sub rellenarGridView()
        Dim libreriaData As New libreria.accesodatosSQL
        Dim conexion As SqlClient.SqlConnection = libreriaData.getConexion
        'Esta query obtiene SOLO las asignaturas en las que esta matriculado el estudiante logueado
        Dim Sql As String = "select * from EstudiantesTareas where  Email = @email"
        Dim cmd As New SqlCommand(Sql, conexion)
        cmd.Parameters.Add("@email", SqlDbType.VarChar, 100).Value = Session.Contents("idSession")

        Dim dataAdapter As New SqlClient.SqlDataAdapter
        dataAdapter.SelectCommand = cmd

        Dim datasetInstancias As New DataSet
        dataAdapter.Fill(datasetInstancias, "instancias")

        'El comando fill cierra la conexion
        'libreriaData.closeConexion(conexion)

        GridViewInstancias.DataSource = datasetInstancias.Tables("instancias")
        GridViewInstancias.DataBind()

    End Sub
    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim libreriaData As New libreria.accesodatosSQL
        Dim conexion As SqlClient.SqlConnection = libreriaData.getConexion
        Dim sql As String = "insert into EstudiantesTareas(email,codtarea,HEstimadas,HReales) values(@email,@codtarea,@HEstimadas,@HReales)"
        Dim cmd As New SqlCommand(Sql, conexion)

        cmd.Parameters.Add("@HEstimadas", SqlDbType.VarChar, 50).Value = TextBoxHestimadas.Text
        cmd.Parameters.Add("@HReales", SqlDbType.VarChar, 50).Value = TextBoxHreales.Text
        cmd.Parameters.Add("@email", SqlDbType.VarChar, 100).Value = Session.Contents("idSession")
        cmd.Parameters.Add("@codtarea", SqlDbType.VarChar, 50).Value = TextBoxTarea.Text

        ' dataAdapter.UpdateCommand = cmd
        Dim res As Integer = cmd.ExecuteNonQuery()
        If res Then
            Label1.Text = "Tarea instanciada correctamente"
            Button1.Enabled = False
            Button1.Text = "Tarea ya instanciada"
        Else
            Label1.Text = "La tarea no se pudo instanciar"
        End If

        libreriaData.closeConexion(conexion)

    End Sub
End Class