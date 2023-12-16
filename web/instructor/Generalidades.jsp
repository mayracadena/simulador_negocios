<%-- 
    Document   : Gestion
    Created on : 30/08/2016, 03:15:09 PM
    Author     : mayracadena
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="DAO.GeneralDAO"%>
<%@page import="VO.GeneralVO"%>
<%@page import="VO.UsuarioVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Gestión</title>
        <link href="../css/sweetalert.css" rel="stylesheet" type="text/css"/>
        <link href="../css/intento.css" rel="stylesheet" type="text/css"/>
        <link rel="shortcut icon" type="image/x-icon" href="../img/demostrarLogo3.ico">
        <link href="../css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="../css/jquery.dataTables.min.css" rel="stylesheet" type="text/css"/>
        <link href="../css/simple-sidebar.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>

        <%
            HttpSession hs = request.getSession();

            UsuarioVO idu = null;

            try {

                idu = (UsuarioVO) hs.getAttribute("usuarioAll");

                if (idu.getIdRol() == 3) {
                    response.sendRedirect("../index.jsp");
                }
                if (idu == null ) {
                        response.sendRedirect("../index.jsp");
                    }
            
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
                            <h1 class="text-center">Generalidades</h1>
                            <br>
                          
                                    <table class="table table-bordered table-hover" id="tablita">


                                        <%
                                            GeneralVO gv;
                                            GeneralDAO gd = new GeneralDAO();
                                            gv = gd.read(1);


                                        %>
                                        <tr>
                                            <th>Salario Mínimo</th>
                                            <td>$ <%=formato.format(gv.getSalarioM())%></td>
                                        </tr>
                                        <tr>
                                            <th>Subsidio de Transporte</th>
                                            <td>$ <%=formato.format(gv.getSubsidioT())%></td>
                                        </tr>
                                        <tr>
                                            <th>Tasa de Impuestos</th>
                                            <td><%=gv.getTazaImpuestos()%> %</td>
                                        </tr>
                                 <%--       <tr>
                                            <th>Tasa de Oportunidad</th>
                                            <td><%=gv.getTazaOportunidad()%> %</td>
                                        </tr>
                                 --%>
                                        <tr>
                                            <th>Censatías</th>
                                            <td><%=gv.getCesantias()%> %</td>
                                        </tr>
                                        <tr>
                                            <th>Intereses Cesantias</th>
                                            <td><%=gv.getInteresesCesantias()%> %</td>
                                        </tr>
                                        <tr>
                                            <th>Prima de Servicios</th>
                                            <td><%=gv.getPrimaServicios()%> %</td>
                                        </tr>
                                        <tr>
                                            <th>Vacaciones</th>
                                            <td><%=gv.getVacaciones()%> %</td>
                                        </tr>
                                        <tr>
                                            <th>Caja de compensación</th>
                                            <td><%=gv.getCajaCompensacion()%> %</td>
                                        </tr>
                                        <tr>
                                            <th>EPS - Salud</th>
                                            <td><%=gv.getEPSalud()%> %</td>
                                        </tr>
                                        <tr>
                                            <th>Pensión</th>
                                            <td><%=gv.getPension()%> %</td>
                                        </tr>
                                        <tr>
                                            <th>Riesgos</th>
                                            <td><%=gv.getRiesgos()%> %</td>
                                        </tr>
                                        <tr>

                                            <td>
                                                <button class="btn btn-success" onclick="actualizar(1)">Actualizar</button>

                                            </td>
                                        </tr>


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
        <script src="../js/ajax/Generalidades.js" type="text/javascript"></script>
    </body>
    <%
    } catch (NullPointerException e) {
                response.sendRedirect("../index.jsp");

            }
    %>
</html>
