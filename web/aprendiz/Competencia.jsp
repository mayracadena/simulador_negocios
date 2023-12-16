
<%@page import="DAO.ProyectoDAO"%>
<%@page import="VO.ProyectoVO"%>
<%@page import="VO.CompetenciaVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.CompetenciaDAO"%>
<%@page import="DAO.GastoCostoDAO"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : Competencia
    Created on : 22/08/2016, 03:08:59 PM
    Author     : mayracadena
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="VO.ProductoVO"%>
<%@page import="VO.UsuarioVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Competencia</title>
        <link href="../css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="../css/simple-sidebar.css" rel="stylesheet" type="text/css"/>
        <link href="../css/sweetalert.css" rel="stylesheet" type="text/css"/>
        <link rel="shortcut icon" type="image/x-icon" href="../img/demostrarLogo3.ico">
        <link href="../css/intento.css" rel="stylesheet" type="text/css"/>
        <link href="../css/jquery-ui.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%
            HttpSession hs = request.getSession();
            Integer idp = null;
            UsuarioVO idu = null;
            ProductoVO pv = null;
            DecimalFormat formato = new DecimalFormat("###,###,###");

            idu = (UsuarioVO) hs.getAttribute("usuarioAll");
            idp = (Integer) hs.getAttribute("idproyectito");
            pv = (ProductoVO) hs.getAttribute("Productito");

            if (idu == null && idp == null) {
                response.sendRedirect("../index.jsp");
                return;
            }
            if (idu != null && idp == null) {
                response.sendRedirect("../principal.jsp");
                return;
            }
            if (pv == null) {
                response.sendRedirect("Producto.jsp");
                return;
            }
            if (idu == null) {
                response.sendRedirect("../index.jsp");
                return;
            }


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
                     <li>
                        <a href="Detalle.jsp"><label>Menú Productos</label></a>
                        </li>
                        <%
                            ProyectoVO pvs;
           ProyectoDAO pds = new ProyectoDAO();
           pvs = pds.read(idp);
                   if(pvs.getIdEtapa() == 1){
                
               if (pvs.getIdEspecialidad() == 1) {%>
                        <%@include file="../WEB-INF/masterpage/menu_aux.jspf" %>

                        <%   }else if (pvs.getIdEspecialidad() == 2) {
                        %>
                        <%@include file="../WEB-INF/masterpage/menu_tec.jspf" %>
                        <% }else if (pvs.getIdEspecialidad() == 3) {%>
                        <%@include file="../WEB-INF/masterpage/menu.jspf" %>
                        <%} else if (pvs.getIdEspecialidad() == 4) {%>
                        <%@include file="../WEB-INF/masterpage/menu_fondoe.jspf" %>
                        <% } else {%>
                        <%@include file="../WEB-INF/masterpage/menu_fondoe.jspf" %>
                        <%}}else{ %>
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
                                    <br><img src="../img/Mis_Iconos/competencia.png" alt="" class="dos"/>
                                </div>
                                <div class="col-md-6 col-xs-6" align="left">
                                    <h1 >Competencia</h1>
                                    <h3 >(<%=pv.getNombre()%>)</h3><br>

                                </div>
                            </div>

                            <table class="table table-bordered table-hover">
                                <thead>
                                <th>Nombre</th>
                                <th>Análisis</th>
                                <th>Imagen competencia</th>
                                <th>Posición</th>
                                <th class="col-md-1"></th>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><input type="text" class="form-control" id="nombre" title="Nombre de la empresa"></td>
                                        <td><textarea class="form-control" id="analisis" title="Haga un análisis de la competencia relacionada anteriormente indicando la ubicación, los tipos de productos, presentación, antigüedad en el mercado, precios, imagen y las demás que considere relevante para su proyecto">
                                            </textarea>
                                        </td>
                                        <td><textarea class="form-control" id="imagen" title="Imagen de la competencia ante los clientes. Que opinan los clientes de la competencia, que debilidades y fortalezas tiene">
                                            </textarea></td>
                                        <td><textarea class="form-control" id="posicion" title="Que imagen tiene los clientes de su producto frente a la competencia.">
                                            </textarea></td>
                                        <td><center><button id="guardar" class="btn btn-info">Guardar</button></center></td>
                                </tr>
                                </tbody>
                            </table>
                            <br>
                            <table class="table table-bordered table-hover">
                                <thead>
                                <th>Nombre</th>
                                <th>Análisis</th>
                                <th>Imagen competencia</th>
                                <th>Posición</th>
                                <th class="col-md-1"></th>
                                </thead>
                                <%
                                    CompetenciaDAO c = new CompetenciaDAO();
                                    ArrayList<CompetenciaVO> ca = new ArrayList();
                                    CompetenciaVO cv;
                                    ca = c.Todo(pv.getIdProducto());
                                    for (int t = 0; t < ca.size(); t++) {
                                        cv = ca.get(t);

                                %>
                                <tr id="tr<%=cv.getIdCompetencia()%>">
                                    <td><%=cv.getNombre()%></td>
                                    <td><%=cv.getAnalisis()%></td>
                                    <td><%=cv.getImagenEmpresa()%></td>
                                    <td><%=cv.getFrenteCompetencia()%></td>
                                    <td>
                                        <button onclick="actualizar(<%=cv.getIdCompetencia()%>)" class="btn btn-success" title="Editar"><span class="glyphicon glyphicon-edit"></span></button>
                                        <button onclick="borrar(<%=cv.getIdCompetencia()%>)" class="btn btn-danger" title="Borrar"><span class="glyphicon glyphicon-remove"></span></button>
                                    </td>
                                </tr>
                                <%}%>
                            </table>

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
        <script src="../js/jquery-ui.min.js" type="text/javascript"></script>
        <script src="../js/ajax/Competencia.js" type="text/javascript"></script>
        <script src="../js/mensajes/mCompetencia.js" type="text/javascript"></script>
    </body>
</html>
