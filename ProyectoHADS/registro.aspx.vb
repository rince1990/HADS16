Public Class WebForm4
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim libreriaEmail As New libreria.email
        Dim libreriaData As New libreria.accesodatosSQL

        Dim numConf As New Integer
        Randomize()
        numConf = CLng(Rnd() * 9000000) + 1000000


        'Insertar en BBDD

        If libreriaData.consultaInsert("INSERT INTO Users(Id, Nombre, Apellidos, Password, Dni , Enabled) VALUES ('" & Email.Text & "', '" & nombre.Text & "','" & apellidos.Text & "','" & pass1.Text & "','" & dni.Text & "', 0)") = "OK" Then
            If libreriaData.consultaInsert("INSERT INTO Enable(Id, Codigo) VALUES('" & Email.Text & "', " & numConf & ")") = "OK" Then

                Dim url As String
                url = Context.Request.Url.Scheme & "://" & Context.Request.Url.Host & ":" & Request.Url.Port & "/Confirmar.aspx?mbr=" & Email.Text & "&numconf=" & numConf
                Dim res As String = libreriaEmail.sendEmail(" Visita este link para terminar tu registro : " & url, Email.Text)
                Response.Write(res)


            Else

                Response.Write("No se pudo generar un codigo de usuario")
            End If

        Else
            Response.Write("No se pudo registrar al usuario")
        End If





    End Sub

End Class