<%-- 
    Document   : pass
    Created on : 20/09/2016, 01:23:17 PM
    Author     : mayracadena
--%>

<%@page import="VO.UsuarioVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Cambio de contraseña</title>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="css/intento.css" rel="stylesheet" type="text/css"/>
        <link href="css/simple-sidebar.css" rel="stylesheet" type="text/css"/>
        <link href="css/sweetalert.css" rel="stylesheet" type="text/css"/>
        <link rel="shortcut icon" type="image/x-icon" href="img/demostrarLogo3.ico">
    </head>
    <body>
        <%
            HttpSession hs = request.getSession(true);

            UsuarioVO idu = (UsuarioVO) hs.getAttribute("usuarioAll");

            if (idu == null) {
                response.sendRedirect("index.jsp");
                return;
            }

        %>
        <div id="wrapper">

            <!-- Sidebar -->
            <div id="sidebar-wrapper">
                <ul class="sidebar-nav">
                    <li class="sidebar-brand">
                        <a href="ActualizarPerfil.jsp">
                            <%=idu.getNombre1() + " " + idu.getApellido1()%>
                        </a>
                    </li>
                    <li>
                        <a href="pass.jsp">Actualizar Contraseña</a>
                    </li>
                    <li>
                        <a href="principal.jsp">Inicio</a>
                    </li>
                    <li>
                        <a href="index.jsp">Salir</a>
                    </li>
                </ul>
            </div>
            <!-- /#sidebar-wrapper -->

            <!-- Page Content -->
            <div id="page-content-wrapper">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">

                          <%@include file="WEB-INF/masterpage/header.jspf" %>
                            <br><br>
                            <button class="btn btn-default" id="menusito" ><span class="glyphicon glyphicon-align-justify"></span></button> 
                            <br><br>
                            <h1 class="text-center">Cambio de Contraseña</h1>
                            <br>


                            <div class="row">
                                <div class="col-md-2"></div>
                                <div class="col-md-8">
                                    <label class="label label-success">*Contraseña antigua</label>
                                    <input type="password" id="contraA" class="form-control">
                                    
                                    <br>

                                    <label class="label label-success">*Contraseña nueva</label>
                                    <input type="password" id="contraN1" class="form-control">
                                    <br>

                                    <label class="label label-success">*Repita contraseña</label>
                                    <input type="password" id="contraN2" class="form-control">
                                    <div hidden="" id="contraN2m"><label class="label label-danger">Contraseñas no coinciden</label></div>
                                    <br>

                                    <button onclick="cambiarContra(<%=idu.getIdUsuario()%>)" class="btn btn-success">Actualizar</button>
                                </div>
                                <div class="col-md-2"></div>
                            </div>
                        </div>
                    </div>
                </div>
                                <%@include file="WEB-INF/masterpage/footer.jspf"%>
            </div>
        </div>
        <script src="js/jquery.min.js" type="text/javascript"></script>
        <script src="js/sweetalert.min.js" type="text/javascript"></script>
        <script src="js/menu.js" type="text/javascript"></script>
        <script src="js/ajax/Usuario.js" type="text/javascript"></script>
    </body>
</html>
