<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Inicio.aspx.vb" Inherits="ProyectoHADS.WebForm1" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
			<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
			 <!--Import Google Icon Font-->
			  <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet"/>
			  <!--Import materialize.css-->
			  <link type="text/css" rel="stylesheet" href="sources\materialize\css\materialize.min.css"  media="screen,projection"/>
			  <link type="text/css" rel="stylesheet" href="sources\materialize\css\modificacion.css"  media="screen,projection"/>

			  <!--Let browser know website is optimized for mobile-->
			  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

               <script src="sources\jquery-1.11.3.min.js" type="text/javascript"></script> 
		     <script type="text/javascript" src="sources\materialize\js\materialize.min.js"></script>
    <script>
        
    </script>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>HADS</title>
</head>
<body>
    <nav id="cabecera" class="top-nav #212121 grey darken-4">
		<div class="container">
		  <div class="nav-wrapper valign-wrapper">
			<a id="textHeader" class="page-title valign">HADS Adrián Y Borja</a>
		  </div>
		</div>
	</nav>
    <div id="contenido" >
     <div class="row">
                
    <form id="form1" runat="server" class="col s12">
         <div class="col s12 m2 l4"><p></p></div>
    <div class="col s12 m6 l8">
     <div class="row">
        <div class="input-field col s6">
            <asp:TextBox ID="CCorreo" runat="server" Width="250px">bdiez018@ikasle.ehu.eus</asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="CCorreo" ErrorMessage="(*)" ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="CCorreo" ErrorMessage="Tienes que introducir un correo electronico" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
          <label for="first_name">Correo</label>
        </div>
      </div>

       <div class="row">
        <div class="input-field col s6">
           <asp:TextBox ID="CPass" runat="server" Width="250px" TextMode="Password" >borja</asp:TextBox>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="CPass" ErrorMessage="(*)" ForeColor="Red"></asp:RequiredFieldValidator>
          <label for="first_name">contraseña</label>
        </div>
      </div>
        <asp:Button ID="Button1" runat="server" Text="Entrar" Class="waves-effect waves-light btn"/>
        <br />
        <br />
        <asp:Label ID="logIncorrecto" runat="server" ForeColor="Red"></asp:Label>
        <p>
            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/registro.aspx">¿Eres nuevo? Registrate y entra en el mundo .NET</asp:HyperLink>
            <asp:Label ID="con" runat="server"></asp:Label>
        </p>
        <p>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/CambiarPassword.aspx">¿Has olvidado la contraseña?</asp:HyperLink>
        </p>
    </div> 
    </form>
    </div>
     </div>
    	    <footer class="page-footer #212121 grey darken-4" style="position: relative;   bottom: 0px;">
				<div class="footer-copyright">
					<div class="container">
						© 2016 Borja Diez, All right reserved. 
					</div>
				</div>
			</footer>


     <script src="sources\jquery-1.11.3.min.js" type="text/javascript"></script> 
		  <script type="text/javascript" src="sources\materialize\js\materialize.min.js"></script>
		  <script>

			</script>
</body>
</html>
