<%-- 
    Document   : Unidades_Medida
    Created on : 17/10/2017, 07:09:32 PM
    Author     : mayrayesenia
--%>

<%@page import="DAO.UnidadMedidaDAO"%>
<%@page import="VO.UnidadMedidaVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="VO.UsuarioVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Unidades Medida</title>
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
                            <h1 class="text-center">Unidades de Medida</h1>
                            <br>
                            
                             <div class="row">
                                <div class="col-md-2"></div>
                                <div class="col-md-4">
                                    <h3>Ingresar nueva unidad medida</h3>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-2"></div>
                                <div class="col-md-4">
                                    <input type="text" id="unidadM" class="form-control">
                                </div>
                                <div>
                                    <button onclick="guardar_uni()" class="btn btn-info">Guardar</button>
                                </div>
                            </div>
                            
                            <br><br>
                            
                                <table class="table table-bordered table-hover" id="tableFicha">
                                    <thead>
                                    <th >Unidad Medida</th>
                                    <th >Eliminar</th>
                                   </thead>
                                   <tbody>
                                       <%
                                       ArrayList<UnidadMedidaVO> u = new ArrayList();
                                       UnidadMedidaVO uVO;
                                       UnidadMedidaDAO uDAO = new UnidadMedidaDAO();
                                       u = uDAO.readAll();
                                       for(int g = 0; g < u.size(); g++){
                                           uVO = u.get(g);
                                       %>
                                    <tr>
                                        <td><%=uVO.getUMedida()%></td>
                                        <td><button class="btn btn-danger" onclick="borrar_unidad(<%=uVO.getIdUnidadMedida()%>)"><span class="glyphicon glyphicon-remove"></span></button></td>
                                    </tr>
                                    <%}%>
                                   </tbody>
                                </table>
                            
                        </div>
                    </div>
                </div>
                            <%@include file="../WEB-INF/masterpage/footer.jspf"%>
            </div>
        </div>
             <script src="../js/jquery.min.js" type="text/javascript"></script>
            <script src="../js/menu.js" type="text/javascript"></script>
            <script src="../js/sweetalert.min.js" type="text/javascript"></script>
            <script src="../js/jquery.dataTables.min.js" type="text/javascript"></script>
            <script src="../js/datatablesLogistica.js" type="text/javascript"></script>
             <script src="../js/bootstrap.min.js" type="text/javascript"></script>   
             <script src="../js/ajax/Unidad_Medida.js" type="text/javascript"></script>
    </body>
</html>
