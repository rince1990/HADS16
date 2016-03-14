Public Class WebForm1

    Inherits System.Web.UI.Page
    Dim libreriaData As New libreria.accesodatosSQL


    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim res = libreriaData.login(CCorreo.Text(), CPass.Text())

        If res = "P" Then
            Session.Contents("idSession") = CCorreo.Text
            Response.Redirect("Profesor.aspx")
        ElseIf res = "A" Then
            Session.Contents("idSession") = CCorreo.Text
            Response.Redirect("Alumno.aspx")
        Else

            logIncorrecto.Text = "El usuario no esta registrado o aun no se ha activado"
        End If
    End Sub
End Class