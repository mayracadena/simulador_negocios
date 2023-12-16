<%-- 
    Document   : detalle
    Created on : 12/08/2016, 12:14:59 PM
    Author     : mayracadena
--%>

<%@page import="DAO.ProyectoDAO"%>
<%@page import="VO.ProyectoVO"%>
<%@page import="VO.UsuarioVO"%>
<%@page import="servlet.Usuario"%>
<%@page import="DAO.ProductoDAO"%>
<%@page import="VO.ProductoVO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.lang.NullPointerException" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Detalles</title>

        <link href="../css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="../css/intento.css" rel="stylesheet" type="text/css"/>
        <link href="../css/simple-sidebar.css" rel="stylesheet" type="text/css"/>
        <link href="../css/sweetalert.css" rel="stylesheet" type="text/css"/>
        <link rel="shortcut icon" type="image/x-icon" href="../img/demostrarLogo3.ico">
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

            ProyectoVO pvs = null;
            ProyectoDAO pd = new ProyectoDAO();
            pvs = pd.read(idp);

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

                            <h1 class="text-center">Detalles</h1>
                            <h3 class="text-center">(<%=pv.getNombre()%>)</h3><br>
                            <% if (pvs.getIdEspecialidad() == 1) {  %>
                            <center>

                                <a href="Competencia.jsp" class="btn btn-default "><img src="../img/Mis_Iconos/competencia.png" alt="" class="pequena"/><br><label>Competencia</label></a>
                                <a href="ePrecios.jsp" class="btn btn-default"> <img src="../img/Mis_Iconos/e_precios.png" alt="" class="pequena"/><br><label>Estrategia Precios</label></a>
                                <a href="Proyeccion.jsp" class="btn btn-default"> <img src="../img/Mis_Iconos/proyeccion_ventas.png" alt="" class="pequena"/><br><label>Proyección Ventas</label></a>
                                <a href="Costos.jsp" class="btn btn btn-default"><img src="../img/Mis_Iconos/costos.png" alt="" class="pequena"/><br><label>Costos</label></a>
                                <a href="PreciosProducto.jsp" class="btn btn-default"><img src="../img/Mis_Iconos/precio_producto.png" alt="" class="pequena"/><br><label>Precios Producto</label></a>


                            </center> 

                            <% } else if (pvs.getIdEspecialidad() == 3) {%>
                            <center>

                                <a href="Competencia.jsp" class="btn btn-default "><img src="../img/Mis_Iconos/competencia.png" alt="" class="pequena"/><br><label>Competencia</label></a>
                                <a href="ePrecios.jsp" class="btn btn-default"> <img src="../img/Mis_Iconos/e_precios.png" alt="" class="pequena"/><br><label>Estrategia Precios</label></a>
                               
                                <a href="Proyeccion.jsp" class="btn btn-default"> <img src="../img/Mis_Iconos/proyeccion_ventas.png" alt="" class="pequena"/><br><label>Proyección Ventas</label></a>
                                <a href="Costos.jsp" class="btn btn btn-default"><img src="../img/Mis_Iconos/costos.png" alt="" class="pequena"/><br><label>Costos</label></a>

                                <a href="SIMULADOR_DE_COSTOS_2012.xls" class="btn btn-default"><img src="../img/Mis_Iconos/exportacion.png" alt="" class="pequena"/><br><label>Exportación</label></a>
                                <a href="PreciosProducto.jsp" class="btn btn-default"><img src="../img/Mis_Iconos/precio_producto.png" alt="" class="pequena"/><br><label>Precios Producto</label></a>


                            </center> 

                            <%}else if(pvs.getIdEspecialidad() == 5){%>
                            <center>

                                <a href="Competencia.jsp" class="btn btn-default "><img src="../img/Mis_Iconos/competencia.png" alt="" class="pequena"/><br><label>Competencia</label></a>
                                <a href="ePrecios.jsp" class="btn btn-default"> <img src="../img/Mis_Iconos/e_precios.png" alt="" class="pequena"/><br><label>Estrategia Precios</label></a>
                                <a href="Cliente_Consumidor.jsp" class="btn btn-default"><img src="../img/Mis_Iconos/cliente.png" alt="" class="pequena"/><br><label>Cliente</label></a>
                                <a href="Actividades.jsp" class="btn btn-default"><img src="../img/Mis_Iconos/actividades.png" alt="" class="pequena"/><br><label>Actividades</label></a>
                                <a href="Proyeccion.jsp" class="btn btn-default"> <img src="../img/Mis_Iconos/proyeccion_ventas.png" alt="" class="pequena"/><br><label>Proyección Ventas</label></a>
                                <a href="Costos.jsp" class="btn btn btn-default"><img src="../img/Mis_Iconos/costos.png" alt="" class="pequena"/><br><label>Costos</label></a>

                                <a href="SIMULADOR_DE_COSTOS_2012.xls" class="btn btn-default"><img src="../img/Mis_Iconos/exportacion.png" alt="" class="pequena"/><br><label>Exportación</label></a>
                                <a href="PreciosProducto.jsp" class="btn btn-default"><img src="../img/Mis_Iconos/precio_producto.png" alt="" class="pequena"/><br><label>Precios Producto</label></a>


                            </center> 
                            <%}else{%>
                             <center>

                                <a href="Competencia.jsp" class="btn btn-default "><img src="../img/Mis_Iconos/competencia.png" alt="" class="pequena"/><br><label>Competencia</label></a>
                                <a href="ePrecios.jsp" class="btn btn-default"> <img src="../img/Mis_Iconos/e_precios.png" alt="" class="pequena"/><br><label>Estrategia Precios</label></a>
                               
                                <a href="Proyeccion.jsp" class="btn btn-default"> <img src="../img/Mis_Iconos/proyeccion_ventas.png" alt="" class="pequena"/><br><label>Proyección Ventas</label></a>
                                <a href="Costos.jsp" class="btn btn btn-default"><img src="../img/Mis_Iconos/costos.png" alt="" class="pequena"/><br><label>Costos</label></a>

                                <a href="SIMULADOR_DE_COSTOS_2012.xls" class="btn btn-default"><img src="../img/Mis_Iconos/exportacion.png" alt="" class="pequena"/><br><label>Exportación</label></a>
                                <a href="PreciosProducto.jsp" class="btn btn-default"><img src="../img/Mis_Iconos/precio_producto.png" alt="" class="pequena"/><br><label>Precios Producto</label></a>


                            </center>
                            
                            <%}%>
                        </div>
                    </div>
                </div>
                <%@include file="../WEB-INF/masterpage/footer.jspf"%>
            </div>
        </div>

        <script src="../js/jquery.min.js" type="text/javascript"></script>
        <script src="../js/menu.js" type="text/javascript"></script>
        <script src="../js/sweetalert.min.js" type="text/javascript"></script>
        <script src="../js/bootstrap.min.js" type="text/javascript"></script>
    </body>
</html>
