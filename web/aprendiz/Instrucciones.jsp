<%-- 
    Document   : Instrucciones
    Created on : 31/10/2017, 04:38:11 PM
    Author     : mayrayesenia
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="DAO.ProyectoDAO"%>
<%@page import="VO.ProyectoVO"%>
<%@page import="VO.UsuarioVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Instrucciones</title>
<link href="../css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="../css/simple-sidebar.css" rel="stylesheet" type="text/css"/>
        <link href="../css/sweetalert.css" rel="stylesheet" type="text/css"/>
        <link href="../css/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <link rel="shortcut icon" type="image/x-icon" href="../img/demostrarLogo3.ico">
        <link href="../css/intento.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%
            HttpSession hs = request.getSession();
            Integer idp = (Integer) hs.getAttribute("idproyectito");
            UsuarioVO idu = (UsuarioVO) hs.getAttribute("usuarioAll");

            if (idu == null && idp == null) {
                response.sendRedirect("../index.jsp");
                return;
            }
            if (idu != null && idp == null) {
                response.sendRedirect("../principal.jsp");
                return;
            }
            if (idu == null) {
                response.sendRedirect("../index.jsp");
                return;
            }

            ProyectoVO pv;
            ProyectoDAO pd = new ProyectoDAO();
            pv = pd.read(idp);
            DecimalFormat formato = new DecimalFormat("###,###,###");

        %>

        <div id="wrapper">

            <!-- Sidebar -->
            <div id="sidebar-wrapper">
                <ul class="sidebar-nav">
                    <li class="sidebar-brand">
                        <a href="../ActualizarPerfil.jsp">
                            <%=idu.getNombre1() + " " + idu.getApellido1()%>
                        </a>
                    </li>
                    <%
                        if (pv.getIdEtapa() == 1) {

                            if (pv.getIdEspecialidad() == 1) {%>
                    <%@include file="../WEB-INF/masterpage/menu_aux.jspf" %>

                    <%   } else if (pv.getIdEspecialidad() == 2) {
                    %>
                    <%@include file="../WEB-INF/masterpage/menu_tec.jspf" %>
                    <% } else if (pv.getIdEspecialidad() == 3) {%>
                    <%@include file="../WEB-INF/masterpage/menu.jspf" %>
                    <%} else if (pv.getIdEspecialidad() == 4) {%>
                    <%@include file="../WEB-INF/masterpage/menu_fondoe.jspf" %>
                    <% } else {%>
                    <%@include file="../WEB-INF/masterpage/menu_fondoe.jspf" %>
                    <%}
                    } else { %>
                    <%@include file="../WEB-INF/masterpage/menu_fondoe.jspf" %>
                    <%}%>
                </ul>
            </div>
            <!-- /#sidebar-wrapper -->

            <!-- Page Content -->
            <div id="page-content-wrapper">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <%@include file="../WEB-INF/masterpage/Header2.jspf" %>
                            <br><br>
                            <button class="btn btn-default" id="menusito" ><span class="glyphicon glyphicon-align-justify"></span></button> 


                            <div class="row">
                                <div class="col-md-5 col-xs-4" align="right">
                                    <br><img src="../img/Mis_Iconos/Instrucciones.png" alt="" class="dos"/>
                                </div>
                                <div class="col-md-6 col-xs-6" align="left">
                                    <h1 >Instrucciones</h1>
                                    <h3 >(<%=pv.getNombreP()%>)</h3><br>
                                </div>
                            </div>

                            <h3>Bienvenid@ a SIMPROYECT-SENA</h3><br>
                            Este es un aplicativo diseñado por aprendices e instructores del SENA, con el fin de
                            facilitar a nuestros usuarios, la elaboración de proyectos formativos, proyectos productivos y planes de
                            negocio.<br><br>
                            <ul class="list-group">
                                <li href="#colores" class="list-group-item list-group-item-success btn btn-default" data-toggle="collapse"><h4>¿Qué son aquellos iconos?</h4></li>
                                <div id="colores" class="collapse">
                                    <br><br> Probablemente te hayas preguntado porque los iconos de inicio tienen unos números y porque son de diferentes colores, la respuesta es sencilla:
                                    <br><br>
                                    <label> Los de fondo azul son todos aquellos que hacen parte de lo cualitativo de tu plan de negocios </label>
                                    <br><img src="../img/Mis_Iconos/Mi_Proyecto.png" alt="" class="pequena"/><br>
                                    <label>Los de fondo verde son aquellos que hacen parte de lo cuantitativo de tu negocio</label>
                                    <br><img src="../img/Mis_Iconos/productos.png" alt="" class="pequena"/><br>
                                    <label> Los de fondo naranja son los reportes  que generara el sistema y en los cuales podrás determinar si tu plan de negocio es viable</label>
                                    <br><img src="../img/Mis_Iconos/resultados.png" alt="" class="pequena"/><br>
                                    <label>Por ultimo encontraremos uno de fondo negro, este es para agregar a tus compañeros y así poder trabajar todos en equipo en un mismo proyecto
                                    tambien podras descargar tu proyecto en formato en pdf</label>
                                    <br><img src="../img/Mis_Iconos/admin.png" alt="" class="pequena"/><br>
                                </div>
                                
                                <li href="#guardar_cosas" class="list-group-item list-group-item-success btn btn-default" data-toggle="collapse"><h4>¿Cómo guardar?</h4></li>
                                <div id="guardar_cosas" class="collapse">
                                    <br> Para guardar los cambios que hallas realizado tienes que darle <label>clic en el botón que dice Guardar</label>,
                                    ya que si no haces este proceso probablemente lo que hallas realizado no quede registrado
                                    <br><br>
                                    <button  class="btn btn-success btn-lg">Guardar</button>
                                    <br>
                                    Luego de esto la página de actualizará mostrando los cambios que hallas realizado
                                    
                                </div>
                                <li href="#actualizar_cosas" class="list-group-item list-group-item-success btn btn-default" data-toggle="collapse"><h4>¿Cómo actualizar?</h4></li>
                                <div id="actualizar_cosas" class="collapse">
                                    <br>
                                    Para actualizar los nuevos cambios te aparecerá un botón que dice actualizar,<br>
                                    <label>en los formularios que son para la parte cualitativa</label>
                                    <br>
                                    <button  class="btn btn-success btn-lg">Actualizar</button>
                                    <br>
                                    <label>Para los cuantitativos aparecerá el siguiente botón:</label> <br>
                                    <button class="btn btn-success btn-lg" title="Editar"><span class="glyphicon glyphicon-edit"></span></button>
                                       
                                </div>
                                <li href="#eliminar_cosas" class="list-group-item list-group-item-success btn btn-default" data-toggle="collapse"><h4>¿Cómo eliminar?</h4></li>
                                <div id="eliminar_cosas" class="collapse">
                                    <br>
                                    Para eliminar te aparecerá el siguiente botón,<br>
                                    
                                    <button  class="btn btn-danger btn-lg"><span class="glyphicon glyphicon-remove"></span></button>
                                    <br>
                                    despues de eso te aparecerá un mensaje en el cual debes confirmar si deseas que se elimine
                                      
                                </div>
                                <li href="#llenar_cosas" class="list-group-item list-group-item-success btn btn-default" data-toggle="collapse"><h4>¿Cómo llenar el SIMPROYECT?</h4></li>
                                <div id="llenar_cosas" class="collapse">
                                    En el menú principal aparece unos iconos y sus nombres debajo con un numero, este indica
                                    en el orden en el cual deberás llenarlos, para no tener error alguno a la hora de visualizar
                                    si tu plan de negocio es viable o no<br>
                                    
                                    Cuando llegues a "Productos" e ingreses un producto abajo de su ficha tecnica aparecerá el siguiente botón
                                    <br>
                                    <button class="btn btn-lg btn-warning" title="Detalles" ><span class="glyphicon glyphicon-th-large"></span></button>
                                    <br>
                                    debes ingresar allí e ingresar los detalles del producto, como la proyección de ventas que tendra ese producto entre otros
                                    <br>
                                    recuerda que si pones en los campos de número "," o "." el sistema lo tomara como decimal
                                </div>
                            </ul>



                        </div>
                    </div>
                </div>
                <%@include file="../WEB-INF/masterpage/footer.jspf"%>
            </div>
        </div>

        <script src="../js/jquery.min.js" type="text/javascript"></script>
        <script src="../js/bootstrap.min.js" type="text/javascript"></script>
        <script src="../js/menu.js" type="text/javascript"></script>
        <script src="../js/sweetalert.min.js" type="text/javascript"></script>
    </body>
</html>
