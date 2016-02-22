Public Class HomePage
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Label2.Text = "Numero de usuarios onLine" & Application.Contents("NUsuarios")
        Label1.Text = "Se ha identificado como:  " & Session.Contents("idSession")

    End Sub

End Class