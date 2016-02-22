
Public Class WebForm2
    Inherits System.Web.UI.Page
    Dim libreriaData As New libreria.accesodatosSQL

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Request.Params("cod") Is Nothing And Request.Params("email") Is Nothing Then

            Panel1.Visible = False
            Label2.Visible = False
        Else
            Dim res = libreriaData.consulta("SELECT count(*) from Enable WHERE ID='" + Request.Params("email") + "'AND Codigo= '" + Request.Params("cod") + "';")
            If res = 1 Then
                Panel1.Visible = True
                Label2.Visible = False

            Else
                Label2.Visible = True
                Label2.Text = "error, ya se ha cambiado la contraseña meidante este correo o bien no se ha solicitado aun"
            End If
        End If

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim res = libreriaData.consulta("SELECT count(*) from Users WHERE id='" + cCorreo.Text + "';")
        If res = 1 Then
            res = libreriaData.consulta("SELECT count(*) from Enable WHERE id='" + cCorreo.Text + "';")
            If res = 0 Then
                Randomize()
                Dim ran = CInt(Rnd() * 1000000) + 1
                Dim respuesta = libreriaData.consultaInsert("INSERT INTO Enable (id,Codigo) VALUES ('" & cCorreo.Text & "'," & ran & ");")
                If respuesta = "OK" Then
                    Label2.Visible = True
                    Dim url As String = Context.Request.Url.Host & "/CambiarPassword.aspx"
                    Dim mensaje = url & "?cod=" & ran & "&email=" & cCorreo.Text
                    Dim email As New libreria.email
                    Dim texto As String = email.sendEmail(mensaje, cCorreo.Text)
                    Label2.Text = "Se ha enviado un correo para cambiar la contraseña"
                    Response.Write(mensaje)
                    Response.Write(cCorreo.Text)
                    Response.Write(texto)
                Else
                    Label2.Visible = True
                    Label2.Text = "Error al insertar la fila"
                End If
            Else
                Label2.Visible = True
                Label2.Text = "Este correo tiene un cambio de contraseña pendiente o todabia no se ha habilitado la cuenta"
            End If
        Else
            Label2.Visible = True
            Label2.Text = "Este correo no esta registrado en nuestro sistema"
        End If
    End Sub

    Protected Sub TextBox3_TextChanged(sender As Object, e As EventArgs) Handles TextBox3.TextChanged

    End Sub

    Protected Sub TextBox2_TextChanged(sender As Object, e As EventArgs) Handles TextBox2.TextChanged

    End Sub

    Protected Sub BcambioPass_Click(sender As Object, e As EventArgs) Handles BcambioPass.Click
        If TextBox2.Text = TextBox3.Text Then
            Dim res As String = libreriaData.consultaInsert("UPDATE Users SET Password = '" & TextBox2.Text & "' WHERE id='" & Request.Params("email") & "';")
            If res = "OK" Then
                Response.Redirect("Inicio.aspx")
            Else
                Response.Write("no se ha podido cambiar la contraseña")
            End If
        Else
            Response.Write("las contraseñas no son iguales")
        End If
    End Sub
End Class