<%-- 
    Document   : ePromocion
    Created on : 12/09/2016, 02:08:37 PM
    Author     : mayracadena
--%>

<%@page import="VO.EPromocionVO"%>
<%@page import="DAO.EPromocionDAO"%>
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
        <title>Estrategia Promoción</title>
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
                    if(pv.getIdEtapa() == 1){
                
                if (pv.getIdEspecialidad() == 1) {%>
                <%@include file="../WEB-INF/masterpage/menu_aux.jspf" %>
                    
             <%   }else if (pv.getIdEspecialidad() == 2) {
                    %>
                    <%@include file="../WEB-INF/masterpage/menu_tec.jspf" %>
                    <% }else if (pv.getIdEspecialidad() == 3) {%>
                    <%@include file="../WEB-INF/masterpage/menu.jspf" %>
                    <%} else if (pv.getIdEspecialidad() == 4) {%>
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
                            <br><img src="../img/Mis_Iconos/promocion.png" alt="" class="dos"/>
                            </div>
                                <div class="col-md-5 col-xs-5" align="left">
                            <h1>Estrategia Promoción</h1>
                            <h3>(<%=pv.getNombreP()%>)</h3><br>
                                </div>
                            </div>
                            <%
                                EPromocionDAO ed = new EPromocionDAO();
                            EPromocionVO e = ed.read(idp);
                            if (e == null) {
                                     
                                
                            %>
                            <div class="row">
                                <div class="col-md-2"></div>
                                <div class="col-md-8">
                                    <label class="label label-info">Estrategia</label><br>
                                    <textarea id="estrategia" name="estrategia" class="form-control" title="Explique ó describa la estrategia de Promoción dirigida a clientes y canales (Descuentos por volúmenes o por pronto pago).
                                              por ejemplo: Pague dos y lleve tres, producto gratis adicional, degustaciones, muestras gratis, rifas, viajes, obsequios, bonos, descuento por acumulación de puntos, otros."></textarea>
                                    <br>

                                    <label class="label label-info">Manejo Clientes Especiales</label>
                                    <br>

                                    <textarea id="manejo" name="manejo" class="form-control" title="Indique el trato preferencial que le dará a clientes que adquieren mayores volúmenes y paguen de contado."></textarea>
                                    <br>


                                    <label class="label label-info">Concepto Motivacion</label><br>
                                    <textarea id="concepto" name="concepto" class="form-control" title="Frases que utilizará para hacer ver los atributos de su producto y solución de objeciones y convencer a su comprador. Resalte la ventaja competitiva de su producto."></textarea>
                                    <br>


                                    <!--      <label class="label label-info">Presupuesto</label><br>
                                          <input type="text" id="presupuesto" name="presupuesto" class="form-control" >
                                          <br>
      
                                    -->
                                    <label class="label label-info">Promocion Publicidad</label><br>
                                    <textarea id="promocion" name="promocion" class="form-control" title="Señale los medios que utilizará para dar a conocer el producto en el mercado y posicionarlo. Ejemplo establecer estrategias de difusión utilizando cualquiera de los siguientes medios: radio, prensa, televisión, página Internet, paginas amarillas, portafolio de servicios, comunicación directa. "></textarea>
                                    <br>

                                    <center>
                                        <button id="guardar" class="btn btn-info">Guardar</button>
                                    </center>
                                </div>
                                <div class="col-md-2"></div>
                            </div>
                            <% }else{ %>
                            
                            <!-- hello -->
                            <div class="row">
                                <div class="col-md-2"></div>
                                <div class="col-md-8">
                                   
                                    <label class="label label-success">Estrategia</label><br>
                                    <textarea id="estrategia" name="estrategia" class="form-control" title="Explique ó describa la estrategia de Promoción dirigida a clientes y canales (Descuentos por volúmenes o por pronto pago).
                                              por ejemplo: Pague dos y lleve tres, producto gratis adicional, degustaciones, muestras gratis, rifas, viajes, obsequios, bonos, descuento por acumulación de puntos, otros."><%=e.getEstrategia()%></textarea>
                                    <br>

                                    <label class="label label-success">Manejo Clientes Especiales</label>
                                    <br>

                                    <textarea id="manejo" name="manejo" class="form-control" title="Indique el trato preferencial que le dará a clientes que adquieren mayores volúmenes y paguen de contado."><%=e.getManejoClienteEspecial()%></textarea>
                                    <br>


                                    <label class="label label-success">Concepto Motivacion</label><br>
                                    <textarea id="concepto" name="concepto" class="form-control" title="Frases que utilizará para hacer ver los atributos de su producto y solución de objeciones y convencer a su comprador. Resalte la ventaja competitiva de su producto."><%=e.getConceptoMotivacion()%></textarea>
                                    <br>


                                    <!--      <label class="label label-info">Presupuesto</label><br>
                                          <input type="text" id="presupuesto" name="presupuesto" class="form-control" >
                                          <br>
      
                                    -->
                                    <label class="label label-success">Promocion Publicidad</label><br>
                                    <textarea id="promocion" name="promocion" class="form-control" title="Señale los medios que utilizará para dar a conocer el producto en el mercado y posicionarlo. Ejemplo establecer estrategias de difusión utilizando cualquiera de los siguientes medios: radio, prensa, televisión, página Internet, paginas amarillas, portafolio de servicios, comunicación directa. "><%=e.getPromocionPublicidad()%></textarea>
                                    <br>

                                    <center>
                                        <button onclick="actualizar(<%=e.getIdPromocion()%>)" class="btn btn-success">Actualizar</button>
                                    </center>
                                </div>
                                <div class="col-md-2"></div>
                            </div>
                            <% } %>
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
        <script src="../js/mensajes/mEPromocion.js" type="text/javascript"></script>
        <script src="../js/ajax/EPromocion.js" type="text/javascript"></script>
        <script src="../js/expanding.jquery.js" type="text/javascript"></script>
        <script src="../js/expanding.js" type="text/javascript"></script>
        <script>
            $('textarea').expanding();
        </script>
    </body>
</html>
