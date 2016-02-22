Imports System.Web.SessionState

Public Class Global_asax
    Inherits System.Web.HttpApplication

    Sub Application_Start(ByVal sender As Object, ByVal e As EventArgs)
        Application.Contents("NUsuarios") = 0
    End Sub
    Sub Session_Start(ByVal sender As Object, ByVal e As EventArgs)
        Application.Lock()
        Dim ns As Integer = Application.Contents("NUsuarios")
        Application.Contents("NUsuarios") = ns + 1
        Application.UnLock()
    End Sub
    Sub Session_End(ByVal sender As Object, ByVal e As EventArgs)
        Application.Lock()
        Dim ns As Integer = Application.Contents("NUsuarios")
        Application.Contents("NUsuarios") = ns - 1
        Application.UnLock()
    End Sub

    Sub Application_BeginRequest(ByVal sender As Object, ByVal e As EventArgs)
        ' Se desencadena al comienzo de cada solicitud
    End Sub

    Sub Application_AuthenticateRequest(ByVal sender As Object, ByVal e As EventArgs)
        ' Se desencadena al intentar autenticar el uso
    End Sub

    Sub Application_Error(ByVal sender As Object, ByVal e As EventArgs)
        ' Se desencadena cuando se produce un error
    End Sub

    Sub Application_End(ByVal sender As Object, ByVal e As EventArgs)
        ' Se desencadena cuando finaliza la aplicación
    End Sub

End Class