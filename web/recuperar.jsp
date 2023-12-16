<%-- 
    Document   : recuperar
    Created on : 14/10/2016, 01:04:08 PM
    Author     : mayracadena
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Recuperar contra</title>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="css/intento.css" rel="stylesheet" type="text/css"/>
        <link href="css/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <link href="css/sweetalert.css" rel="stylesheet" type="text/css"/>
        <link rel="shortcut icon" type="image/x-icon" href="img/demostrarLogo3.ico">
    </head>
    <body>
        <br>   <%@include file="WEB-INF/masterpage/header.jspf" %>
        <h1 class="text-center">Recuperación de contraseña</h1><br><br>

    <center>
        <div class="Cajita text-center">
            <div  class="form-inline" id="recuperar">
                <br><br>

                <input type="email"  name="correo" id="correo2" class="login" placeholder="Ingresa Correo" required> 
              <br><br>
           <!--       <input type="password"  name="pass"  id="contra" class="login" placeholder="Ingresa Código" required >

                <br><br>
-->

                <button id="enviar" class="botoncitos" onclick="recuperarcontra()">Cambiar</button><br>  


                <br><br>
            </div>
            
            <p>¿No te has registrado? <a href="registro.jsp">Ingresa aquí</a></p>
            <p>Ya tienes cuenta <a href="index.jsp">click aquí</a></p>
            
        </div>
    </center>
    <script src="js/jquery.min.js" type="text/javascript"></script>
    <script src="js/sweetalert.min.js" type="text/javascript"></script>
    <script src="js/jquery-ui.min.js" type="text/javascript"></script>
    <script src="js/main.js" type="text/javascript"></script>
    <%@include file="WEB-INF/masterpage/footer.jspf"%>
</body>
</html>
