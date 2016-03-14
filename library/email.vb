Imports System.Net.Mail

Public Class email
    Dim emailSender As String = "hads1616@gmail.com"


    Public Function sendEmail(ByVal mensage, ByVal toEmail)

        Try
            Dim smtp As New SmtpClient()

            Dim from_address = New MailAddress(emailSender, "HADS16")
            Dim to_address As New MailAddress(toEmail)

            smtp.Host = "smtp.gmail.com"
            smtp.Port = 587
            smtp.EnableSsl = True
            smtp.UseDefaultCredentials = False
            smtp.Credentials = New System.Net.NetworkCredential(from_address.Address, "Dromedario16")

            Dim message As New MailMessage(from_address, to_address)

            message.Subject = "Confirmacion de registro en aplicacionWeb"
            message.Body = mensage
            smtp.Send(message)

            Return "correo enviado correctamente"

        Catch ex As Exception
            Return "no se ha podido enviar " & ex.ToString


        End Try


    End Function

End Class
