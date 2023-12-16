<%-- 
    Document   : AllProyectos
    Created on : 2/09/2016, 12:34:24 PM
    Author     : mayracadena
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="DAO.ProyectoDAO"%>
<%@page import="VO.UsuarioVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Todos los proyectos</title>
        <link href="../css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="../css/jquery.dataTables.min.css" rel="stylesheet" type="text/css"/>
        <link href="../css/simple-sidebar.css" rel="stylesheet" type="text/css"/>
        <link href="../css/sweetalert.css" rel="stylesheet" type="text/css"/>
        <link href="../css/intento.css" rel="stylesheet" type="text/css"/>
        <link rel="shortcut icon" type="image/x-icon" href="../img/demostrarLogo3.ico">
        <%
            HttpSession hs = request.getSession(true);

            UsuarioVO idu = null;

            idu = (UsuarioVO) hs.getAttribute("usuarioAll");
            if (idu == null) {
                response.sendRedirect("../index.jsp");
                return;
            }

            if (idu.getIdRol() == 3) {
                response.sendRedirect("../index.jsp");
                return;
            }


        %>
    </head>
    <body>

        <div id="wrapper">

            <!-- Sidebar -->
            <div id="sidebar-wrapper">
                <ul class="sidebar-nav">
                    <li class="sidebar-brand">
                        <a href="../ActualizarPerfil.jsp">
                            <%=idu.getNombre1() + " " + idu.getApellido1()%>
                        </a>
                    </li>
                    <li><a href="../principal.jsp">Inicio</a></li>
                    <li><a href="Fichas.jsp">Fichas</a></li>
                    <li><a href="Generalidades.jsp">Generalidades</a></li>
                    <li><a href="Macroeconomia.jsp">Variables Macroecnómicas</a></li>
                        <%
                            if (idu.getIdRol() == 1) {
                        %>
                    <li><a href="Intructores.jsp">Instructores</a></li>
                        <%} %> 
                    <li><a href="Aprendices.jsp">Aprendices</a></li> 
                    <li><a href="AllProyectos.jsp">Proyectos</a></li> 
                    <li><a href="Unidades_Medida.jsp">Unidades de Medida</a></li>
                    <li><a href="Inver_Diferida.jsp">Inversión Intangible</a></li>
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
                            <br><br>
                            <h1 class="text-center">Todos Los Proyectos </h1>
                            <br>




                            <table class="table table-bordered table-hover" id="tableFicha">
                                <thead>
                                <th>Nombre Proyecto</th>
                                <th>Fecha de creacion</th>
                                <th>Lider</th>
                                <th>Detalles</th>


                                </thead>
                                <tbody>
                                    <%
                                        ProyectoDAO pd = new ProyectoDAO();
                                        ResultSet r;
                                        r = pd.detallesProyecto();
                                        while (r.next()) {

                                    %>
                                    <tr>
                                        <td><%=r.getString("nombreP")%></td>
                                        <td><%=r.getDate("FechaCreacion")%></td>

                                        <td><%=r.getString("nombre1")%> <%=r.getString("nombre2")%> <%=r.getString("apellido1")%> <%=r.getString("apellido2")%></td>
                                        <td>  <button  class="btn btn-default" onclick="detallesProyecto(<%=r.getInt("IdProyecto")%>)" data-toggle="modal" data-target="#ventana"><span class="glyphicon glyphicon-search"></span></button></td>
                                    </tr>
                                    <% }%>
                                </tbody>
                            </table>





                            <div id="ventana" class="modal fade" role="dialog">
                                <div class="modal-dialog">

                                    <!-- Modal content-->
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            <h4 class="modal-title">Información proyecto</h4>
                                        </div>
                                        <div class="modal-body">
                                            
                                            
                                            <h3 id="nombreP"></h3>
                                            <label>Descripción</label><br>
                                            <div id="desc"></div><br>
                                            <label>Objetivo General</label><br>
                                            <div id="og"></div><br>
                                            <label>Objetivo Especifico</label><br>
                                            <div id="oe"></div><br>
                                            <label>Justififcación</label><br>
                                            <div id="just"></div><br>
                                            <label>Problema</label><br>
                                            <div id="prob"></div><br>
                                            
                                            
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                                        </div>
                                    </div>

                                </div>
                            </div>






                        </div>
                    </div>
                    <%@include file="../WEB-INF/masterpage/footer.jspf"%>
                </div>
            </div>
        </div>
        <script src="../js/jquery.min.js" type="text/javascript"></script>
        <script src="../js/menu.js" type="text/javascript"></script>
        <script src="../js/sweetalert.min.js" type="text/javascript"></script>
        <script src="../js/jquery.dataTables.min.js" type="text/javascript"></script>
        <script src="../js/datatablesLogistica.js" type="text/javascript"></script>
        <script src="../js/bootstrap.min.js" type="text/javascript"></script>
    </body>
</html>
