<%-- 
    Document   : Fichas
    Created on : 18/08/2016, 12:45:20 PM
    Author     : mayracadena
--%>

<%@page import="VO.UsuarioVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="VO.FichaVO"%>
<%@page import="DAO.FichaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Fichas</title>
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
                   
               }

                if (idu.getIdRol() == 3) {
                    response.sendRedirect("../index.jsp");
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
                            <h1 class="text-center">Fichas</h1>
                            <br>
                            <div class="row">
                                <div class="col-md-2"></div>
                                <div class="col-md-4">
                                    <h3>Ingresar nueva ficha</h3>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-2"></div>
                                <div class="col-md-4">
                                    <input type="number" id="nficha" class="form-control">
                                </div>
                                <div>
                                    <button id="guardar" class="btn btn-info">Guardar</button>
                                </div>
                            </div>


                            <br><br>


                            
                                    <table class="table table-bordered table-hover" id="tableFicha">
                                        <thead>
                                            <tr>
                                                <th>Ficha</th>
                                                <th class="col-md-1"></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                FichaDAO fd = new FichaDAO();
                                                FichaVO fv;
                                                ArrayList<FichaVO> af = new ArrayList();
                                                af = fd.readAll();

                                                for (int i = 0; i < af.size(); i++) {

                                                    fv = af.get(i);

                                            %>
                                            <tr id="tr<%=fv.getIdFicha()%>">
                                                <td><%=fv.getFicha()%></td>
                                                <td>
                                                    <button class="btn btn-danger" title="Borrar" onclick="borrar(<%=fv.getIdFicha()%>)"><span class="glyphicon glyphicon-remove"></span></button>
                                                </td>
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
        <script src="../js/jquery.dataTables.min.js" type="text/javascript"></script>
        <script src="../js/datatablesLogistica.js" type="text/javascript"></script>
        <script src="../js/menu.js" type="text/javascript"></script>
        <script src="../js/sweetalert.min.js" type="text/javascript"></script>
        <script src="../js/ajax/fichas.js" type="text/javascript"></script>
    </body>
</html>
