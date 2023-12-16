<%-- 
    Document   : Proyeccion
    Created on : 12/08/2016, 10:21:25 AM
    Author     : mayracadena
--%>

<%@page import="VO.UsuarioVO"%>
<%@page import="DAO.ProyeccionVentasDAO"%>
<%@page import="VO.ProyeccionVentasVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="VO.ProductoVO"%>
<%@page import="DAO.ProductoDAO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="DAO.ProyectoDAO"%>
<%@page import="VO.ProyectoVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Proyeccion</title>
        <link href="../css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="../css/simple-sidebar.css" rel="stylesheet" type="text/css"/>
        <link href="../css/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <link href="../css/sweetalert.css" rel="stylesheet" type="text/css"/>
        <link rel="shortcut icon" type="image/x-icon" href="../img/demostrarLogo3.ico">
        <link href="../css/intento.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%
            HttpSession hs = request.getSession();
            Integer idp = (Integer) hs.getAttribute("idproyectito");
            UsuarioVO idu = (UsuarioVO) hs.getAttribute("usuarioAll");
            ProductoVO pv = (ProductoVO) hs.getAttribute("Productito");
            DecimalFormat formato = new DecimalFormat("###,###,###");

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
                                    <br><img src="../img/Mis_Iconos/proyeccion_ventas.png" alt="" class="dos"/>
                                </div>
                                <div class="col-md-6 col-xs-6" align="left">
                                    <h1 >Proyección Ventas</h1>
                                    <h3 >(<%=pv.getNombre()%>)</h3><br>

                                </div>
                            </div>
                           
                                    <table class="table table-bordered table-hover" id="tablita">
                                        <tr>
                                            <th class="col-md-5">Proyección</th>
                                            <th class="col-md-5">Año</th>
                                            <th class="col-md-2"></th>
                                        </tr>
                                        <tr>
                                            <td><input type="number" step="any" class="form-control" id="proy"
                                                       title="Establezca cantidad de unidades a producir del año 1 al año 5 de su  producto 
                                                       (No cuantifique el tiempo de implementación y montaje del proyecto para el año 1)"></td>
                                            <td>
                                                <select id="year" class="form-control">
                                                    <%
                                                        for (int j = 1; j <= 5; j++) {
                                                    %>
                                                    <option value="<%=j%>"><%=j%></option>
                                                    <%}%>
                                                </select>
                                            </td>
                                            <td><button class="btn btn-info" id="guardar">Guardar</button></td>
                                        </tr>
                                    </table>
                                        

                            
                                    <table class="table table-bordered table-hover">
                                        <tr>
                                            <th class="col-md-5">Proyección</th>
                                            <th class="col-md-5">Año</th>
                                            <th class="col-md-2"></th>
                                        </tr>
                                        <%
                                            ProyeccionVentasVO pvVO;
                                            ProyeccionVentasDAO pvDAO = new ProyeccionVentasDAO();
                                            ArrayList<ProyeccionVentasVO> pvvv = new ArrayList();
                                            pvvv = pvDAO.todo(pv.getIdProducto());
                                            for (int k = 0; k < pvvv.size(); k++) {
                                                pvVO = pvvv.get(k);

                                                String proyeccion = formato.format(pvVO.getProyeccion());
                                        %>

                                        <tr id="tr<%=pvVO.getIdProyeccionVO()%>">
                                            <td><%=proyeccion%></td>
                                            <td><%=pvVO.getYear()%></td>
                                            <td>
                                                <button class="btn btn-success" title="Editar" onclick="actualizar(<%=pvVO.getIdProyeccionVO()%>)"><span class="glyphicon glyphicon-edit"></span></button>
                                                <button class="btn btn-danger" title="Borrar" onclick="borrar(<%=pvVO.getIdProyeccionVO()%>)"><span class="glyphicon glyphicon-remove"></span></button>
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
        <script src="../js/jquery-ui.min.js" type="text/javascript"></script>
        <script src="../js/menu.js" type="text/javascript"></script>
        <script src="../js/sweetalert.min.js" type="text/javascript"></script>
        <script src="../js/ajax/Proyeccion.js" type="text/javascript"></script>

    </body>
</html>
