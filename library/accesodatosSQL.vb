Public Class accesodatosSQL
    Private conexion As New SqlClient.SqlConnection

    Private comando As New SqlClient.SqlCommand

    Public Function conectar() As String
        Try
            conexion.ConnectionString = "Server=tcp:hads16.database.windows.net,1433;Database=HADS16;User ID=HADS16@hads16;Password=Dromedario16;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"
            conexion.Open()

        Catch ex As Exception
            Return "ERROR DE CONEXION: " + ex.Message
        End Try
        Return "CONEXION OK"
    End Function

    Public Sub cerrarConexion()
        conexion.Close()
    End Sub

    Public Function login(ByVal email As String, ByVal password As String)
        conectar()
        Try
            Dim query = "SELECT count(*) from Users WHERE Id='" + email + "' AND Enabled = 1 AND Password= '" + password + "';"
            comando = New SqlClient.SqlCommand(query, conexion)
        Catch ex As Exception
            Return ex.Message
        End Try

        If comando.ExecuteScalar() = 1 Then
            cerrarConexion()
            Return "OK"
        Else
            cerrarConexion()
            Return "DENIED"
        End If
    End Function

    Public Function habilitar(ByVal email As String, ByVal number As Integer)
        conectar()
        Try
            Dim query = "Select count(*) from Enable where Id='" & email & "' and Codigo=" & number
            comando = New SqlClient.SqlCommand(query, conexion)
        Catch ex As Exception
            Return ex.Message
        End Try

        If comando.ExecuteScalar() = 1 Then
            'borrar de la tabla
            Dim query = "Delete from Enable where Id='" & email & "'"
            comando = New SqlClient.SqlCommand(query, conexion)
            comando.ExecuteScalar()
            'actualizar a enabled
            query = "Update Users set Enabled=1 where Id='" & email & "'"
            comando = New SqlClient.SqlCommand(query, conexion)
            comando.ExecuteNonQuery()

            cerrarConexion()
            Return "OK"
        Else
            cerrarConexion()
            Return "DENIED"
        End If


    End Function

    Public Function consulta(ByVal query As String)
        conectar()
        comando = New SqlClient.SqlCommand(query, conexion)
        Dim res = comando.ExecuteScalar
        cerrarConexion()
        Return res
    End Function

    Public Function consultaInsert(ByVal query As String)
        conectar()
        Try
            comando = New SqlClient.SqlCommand(query, conexion)
            comando.ExecuteNonQuery()
            cerrarConexion()
            Return "OK"
        Catch ex As Exception
            cerrarConexion()
            Return "ERR"
        End Try
    End Function


End Class
