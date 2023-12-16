<%-- 
    Document   : Index
    Created on : 18/06/2016, 07:24:58 PM
    Author     : mayrayesenia
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            HttpSession hs = request.getSession(true);

            hs.invalidate();
        %>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, user-scalable=no">
        <title>SimProyect</title>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery.min.js" type="text/javascript"></script>
        <link rel="shortcut icon" href="img/demostrarLogo3.ico">
        <link href="css/intento.css" rel="stylesheet" type="text/css"/>
        <link href="css/slide.css" rel="stylesheet" type="text/css"/>
        <link href="css/sweetalert.css" rel="stylesheet" type="text/css"/>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
    </head>
    <body onload="nobackbutton();">
        <br>    <%@include file="WEB-INF/masterpage/header.jspf" %>

        <div class="container">

            <br>

            <div class="row">
                <div class="col-lg-4 col-md-5 col-xs-12">
                    <br><br><br>
                    <div class="Cajita text-center">
                        <center>
                            <form id="Logueo" method="post" action="javascript:loguearse()">
                                <table  class="form-inline" >
                                    <br><br>

                                    <input type="email"  name="txtcorreo" id="correo" class="login" placeholder="Ingresa Correo" required> 
                                    <br><br>
                                    <input type="password"  name="txtpass"  id="contra" class="login" placeholder="Ingresa Contraseña" required>

                                    <br><br>
                                    <div class="text-right"> <a href="recuperar.jsp" >¿Olvidaste tu contraseña?</a>&emsp;&emsp;&emsp;</div>

                                    <input type="submit" class="botoncitos" value="Ingresar" onclick="loguearse()">
                                    <br>  
                                    <!--        <a href="registro.jsp"  class="botoncitos" role="button">Regístrate</a> -->
                                    <button class="botoncitos2" onclick="window.location = 'registro.jsp';">Registrate</button>

                                </table>
                            </form>
                        </center>
                        <br><br></div>
                </div>
                <div class="col-lg-7 col-xs-12">

                    <br><br>
                    <section>
                        <div class="main">
                            <div class="slides">
                                <img src="img/54260090.jpg" alt="No se puede visualizar la imagen"/>
                                <img src="img/sena-estudiantes-uniforme.jpg" alt="Error al visualizar la imagen"/>
                                <img src="img/Sena52.jpg" alt="error al visualizar la imagen"/>
                            </div>
                        </div>
                    </section>

                    <!-- Importar El Plugin Del Slider, Adecuar Ruta -->
                    <script src="js/jquery.min.js" type="text/javascript"></script>
                    <script src="js/jquery.slides.js" type="text/javascript"></script>
                    <script src="js/jquery.validate.js" type="text/javascript"></script>
                    <script src="js/main.js" type="text/javascript"></script>
                    <script src="js/sweetalert.min.js" type="text/javascript"></script>
                    <script type="text/javascript">
                        $(function () {
                            $(".slides").slidesjs({
                                play: {
                                    active: true,
                                    // [boolean] Generate the play and stop buttons.
                                    // You cannot use your own buttons. Sorry.
                                    effect: "slide",
                                    // [string] Can be either "slide" or "fade".
                                    interval: 4000,
                                    // [number] Time spent on each slide in milliseconds.
                                    auto: true,
                                    // [boolean] Start playing the slideshow on load.
                                    swap: true,
                                    // [boolean] show/hide stop and play buttons
                                    pauseOnHover: false,
                                    // [boolean] pause a playing slideshow on hover
                                    restartDelay: 2500
                                            // [number] restart delay on inactive slideshow
                                }
                            });
                        });
                    </script>

                </div> 
            </div>


        </div>
        <br><br>
        <div class="text-center container text-primary">
            <label>        SimProyect - Simulador de proyectos , es una herramienta formativa diseñada por instructores y aprendices del SENA, con el fin de
            facilitar a los usuarios de la misma, la elaboración de proyectos formativos, proyectos productivos y planes de
            negocio.</label>
            <br><br>
            
        </div>

        <script>
            function nobackbutton() {

                window.location.hash = "";

                window.location.hash = "Again-No-back-button"; //chrome

                window.onhashchange = function () {
                    window.location.hash = "";
                }

            }

        </script>
        <%@include file="WEB-INF/masterpage/footer.jspf"%>
    </body>
</html>
