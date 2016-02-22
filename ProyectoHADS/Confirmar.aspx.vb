Imports System.Web.UI.HtmlControls
Public Class WebForm3
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim email As String
        email = Request.QueryString("mbr")
        Dim numConf As String
        numConf = Request.QueryString("numconf")

        'Comprobar numero
        Dim libreriaData As New libreria.accesodatosSQL

        If (libreriaData.habilitar(email, numConf) = "OK") Then
            'Modificar campo a confirmado en BD
            Dim meta As New HtmlMeta()
            meta.HttpEquiv = "Refresh"
            meta.Content = "5;url=Inicio.aspx"
            Me.Page.Controls.Add(meta)

            Label1.Text = "Identificacion correcta , seras redirigido en 5 segundos "


        Else
            'Mensaje de error
            Label1.Text = "Identificacion  incorrecta , seras redirigido en 5 segundos -> "

        End If




    End Sub

End Class