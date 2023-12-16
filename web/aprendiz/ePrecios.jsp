<%-- 
    Document   : ePrecios
    Created on : 22/08/2016, 11:08:23 AM
    Author     : mayracadena
--%>

<%@page import="DAO.ProyectoDAO"%>
<%@page import="VO.ProyectoVO"%>
<%@page import="DAO.EPreciosDAO"%>
<%@page import="VO.EPreciosVO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="VO.ProductoVO"%>
<%@page import="VO.UsuarioVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            HttpSession hs = request.getSession(true);
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
            } else {


        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Estrategia Precios</title>
        <link href="../css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="../css/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <link href="../css/simple-sidebar.css" rel="stylesheet" type="text/css"/>
        <link href="../css/sweetalert.css" rel="stylesheet" type="text/css"/>
        <link rel="shortcut icon" type="image/x-icon" href="../img/demostrarLogo3.ico">
        <link href="../css/intento.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>

        <%                 EPreciosVO e = null;
            EPreciosDAO ed = new EPreciosDAO();
            e = ed.consulta(pv.getIdProducto());

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
                                    <br><img src="../img/Mis_Iconos/e_precios.png" alt="" class="dos"/>
                                </div>
                                <div class="col-md-6 col-xs-6" align="left">
                                    <h1>Estrategia de precios</h1>
                                    <h3 >(<%=pv.getNombre()%>)</h3><br>

                                </div>
                            </div>

                            <div class="row">
                                <%
                                    if (e == null) {
                                %>
                                <div class="col-md-6">
                                    <div class="panel panel-info">
                                        <div class="panel-body">

                                            <label class="label label-info">Lanzamiento</label>
                                            <textarea class="form-control" id="lanzamiento" title="Precio de lanzamiento. Indique el precio que tendrá su producto en el momento de la introducción en el mercado, si habrá algún descuento, de cuánto y por cuánto tiempo."></textarea><br>

                                            <label class="label label-info">Imprevistos</label>
                                            <input class="form-control" id="puntoE" title="Establesca un porcentaje general de imprevistos" type="number" step="any"><br>

                                            <label class="label label-info">Condición pago</label>
                                            <textarea class="form-control" id="condicion" title="Condiciones de pago. Determine la forma de pago del precio del los productos, esta información la da el mercado; Ejemplo, contado, crédito. "></textarea><br>

                                            <label class="label label-info">Seguro Credito</label>
                                            <textarea class="form-control" id="seguro" title="Seguros necesarios. Si se trabaja a crédito establecer los seguros o respaldos de la deuda y los requisitos que debe cumplir el cliente para otorgar crédito."></textarea><br>

                                            <label class="label label-info">Impuestos</label>
                                            <textarea class="form-control" id="impuestos" title="Impuestos a las ventas. Consultar si el producto tiene IVA y determine el porcentaje.  www.dian.gov.co"></textarea><br>

                                            <label class="label label-info">Riesgo Cambiario</label>
                                            <textarea class="form-control" id="riesgo" title="Riesgo cambiario. Que incidencia tiene en el precio de sus productos o materia primas, la tasa de cambio."></textarea><br>
                                        </div>

                                    </div> 
                                </div>

                                <div class="col-md-6">
                                    <div class="panel panel-info">
                                        <div class="panel-body">

                                            <label class="label label-info">Preferencia Arancelaria</label>
                                            <textarea class="form-control " id="preferencia" title="Preferencias arancelarias. Indique si su producto tiene descuentos en el impuesto de exportación y/o  importación o se encuentra incluido en un tratado comercial y como se afecta el precio de su producto. "></textarea><br>

                                            <label class="label label-info">Tactica</label>
                                            <textarea class="form-control" id="tactica" title="Tácticas relacionadas con precios. Acciones específicos que utilizará para manejar precios del producto.  "></textarea><br>

                                            <label class="label label-info">Guerra Variación</label>
                                            <textarea class="form-control" id="guerra" title="Posible variación de precios para resistir guerra de precios. Si su estrategia de precios es a la ofensiva, es decir precios más bajos que la competencia como hará y hasta que punto aguantará la guerra de precios, realizar análisis de sensibilidad" ></textarea><br>

                                            <label class="label label-info">Análisis de Precios</label>
                                            <textarea class="form-control" id="analisis" title="Explique la manera mediante la cual definió el precio. De acuerdo al análisis de los precios de su competencia y apoyado en esta herramienta explique las variables que tuvo en cuenta para definir el  precio de su producto."></textarea><br>

                                            <label class="label label-info">Comportamiento Esperado</label>
                                            <textarea class="form-control" id="comportamiento" maxlength="200" title=""></textarea><br>

                                            <button id="guardar" class="btn btn-info">Guardar</button>
                                        </div>
                                    </div>
                                </div>
                                <% } else {%>
                                <div class="col-md-6">
                                    <div class="panel panel-success">
                                        <div class="panel-body">
                                            <label class="label label-success">Lanzamiento</label>
                                            <textarea class="form-control" id="lanzamientoU" title="Precio de lanzamiento. Indique el precio que tendrá su producto en el momento de la introducción en el mercado, si habrá algún descuento, de cuánto y por cuánto tiempo."><%=e.getLanzamiento()%></textarea><br>

                                            <label class="label label-success">Imprevistos</label>
                                            <input class="form-control" id="puntoEU" title="Establesca un porcentaje general de imprevistos" type="number" step="any" value="<%=e.getPuntoEquilibrio()%>"><br>

                                            <label class="label label-success">Condición pago</label>
                                            <textarea class="form-control" id="condicionU" title="Condiciones de pago. Determine la forma de pago del precio del los productos, esta información la da el mercado; Ejemplo, contado, crédito. "><%=e.getCondicionPago()%></textarea><br>

                                            <label class="label label-success">Seguro Credito</label>
                                            <textarea class="form-control" id="seguroU" title="Seguros necesarios. Si se trabaja a crédito establecer los seguros o respaldos de la deuda y los requisitos que debe cumplir el cliente para otorgar crédito."><%=e.getSeguroCredito()%></textarea><br>

                                            <label class="label label-success">Impuestos</label>
                                            <textarea class="form-control" id="impuestosU" title="Impuestos a las ventas. Consultar si el producto tiene IVA y determine el porcentaje.  www.dian.gov.co"><%=e.getImpuestos()%></textarea><br>

                                            <label class="label label-success">Riesgo Cambiario</label>
                                            <textarea class="form-control" id="riesgoU" title="Riesgo cambiario. Que incidencia tiene en el precio de sus productos o materia primas, la tasa de cambio."><%=e.getRiesgoCambiario()%></textarea><br>
                                        </div>

                                    </div> 
                                </div>

                                <div class="col-md-6">
                                    <div class="panel panel-success">
                                        <div class="panel-body">

                                            <label class="label label-success">Preferencia Arancelaria</label>
                                            <textarea class="form-control" id="preferenciaU" title="Preferencias arancelarias. Indique si su producto tiene descuentos en el impuesto de exportación y/o  importación o se encuentra incluido en un tratado comercial y como se afecta el precio de su producto. "><%=e.getPreferenciaArancelaria()%></textarea><br>

                                            <label class="label label-success">Tactica</label>
                                            <textarea class="form-control" id="tacticaU" title="Tácticas relacionadas con precios. Acciones específicos que utilizará para manejar precios del producto.  "><%=e.getTactica()%></textarea><br>

                                            <label class="label label-success">Guerra Variación</label>
                                            <textarea class="form-control" id="guerraU" title="Posible variación de precios para resistir guerra de precios. Si su estrategia de precios es a la ofensiva, es decir precios más bajos que la competencia como hará y hasta que punto aguantará la guerra de precios, realizar análisis de sensibilidad"><%=e.getGuerraVariacionP()%></textarea><br>

                                            <label class="label label-success">Análisis de Precios</label>
                                            <textarea class="form-control" id="analisisU" title="Explique la manera mediante la cual definió el precio. De acuerdo al análisis de los precios de su competencia y apoyado en esta herramienta explique las variables que tuvo en cuenta para definir el  precio de su producto."><%=e.getAnaDefinicionP()%></textarea><br>

                                            <label class="label label-success">Comportamiento Esperado</label>
                                            <textarea class="form-control" id="comportamientoU" maxlength="200"><%=e.getComportamientoEsperado()%></textarea><br>

                                            <button id="actualizar" class="btn btn-success" onclick="actualizar(<%=e.getIdPrecios()%>)">Actualizar</button>
                                        </div>
                                    </div>
                                </div>
                                <% } %>
                            </div>
                        </div>
                    </div>
                </div>
                <%@include file="../WEB-INF/masterpage/footer.jspf"%>
            </div>
        </div>
        <script src="../js/jquery.min.js" type="text/javascript"></script>
        <script src="../js/jquery-ui.min.js" type="text/javascript"></script>
        <script src="../js/sweetalert.min.js" type="text/javascript"></script>
        <script src="../js/menu.js" type="text/javascript"></script>
        <script src="../js/ajax/EPrecios.js" type="text/javascript"></script>

        <script src="../js/mensajes/mEPrecios.js" type="text/javascript"></script>
        <script src="../js/expanding.jquery.js" type="text/javascript"></script>
        <script src="../js/expanding.js" type="text/javascript"></script>
        <script>
            $('textarea').expanding();
        </script>
        <%}%>
    </body>
</html>
