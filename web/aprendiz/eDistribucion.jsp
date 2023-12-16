<%-- 
    Document   : eDistribucion
    Created on : 6/09/2016, 01:31:27 PM
    Author     : mayracadena
--%>

<%@page import="VO.EDistribuicionVO"%>
<%@page import="DAO.EDistribucionDAO"%>
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
        <title>Estrategias Distribución</title>
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
                            <br><img src="../img/Mis_Iconos/Distribucion.png" alt="" class="dos"/>
                             </div>
                                <div class="col-md-5 col-xs-5" align="left">
                            <h1>Estrategia de Distribución</h1>
                            <h3>(<%=pv.getNombreP()%>)</h3><br>
                                </div>
                            </div>
                            
                            <%
                            EDistribucionDAO ed = new EDistribucionDAO();
                            EDistribuicionVO e = null;
                            e = ed.read(idp);
                            if (e == null) {
                             
                            %>
                            
                            <div class="row">
                                <div class="col-md-2"></div>
                                <div class="col-md-8">
                            <label class="label label-info">Penetracion</label><br>
                            <textarea id="penetracion" name="penetracion" class="form-control" title="Especifique alternativas de penetración.
                                      Enuncie la forma como introducirá su producto al mercado, a que estratos socioeconómicos va dirigido,
                                      épocas de introducción y a que precios, o cualquier otra estrategia"></textarea>
                            <br>
                           
                            <label class="label label-info">Comercializacion</label><br>
                            <textarea id="comercializacion" name="comercializacion" class="form-control" title="Alternativas de comercialización. 
                                      Describa la forma como llevara su producto al consumidor final se puede hacer en forma directa e indirecta 
                                      o una combinación de las dos, cuantifique."></textarea>
                            <br>
                           
                            <label class="label label-info">Distribución física</label><br>
                            <textarea id="distribucioni" name="distribucioni" class="form-control" title="Distribución física nacional ó internacional. 
                                      Indique la infraestructura a utilizar para la distribución del producto como: almacenamiento, transporte, puntos de venta"></textarea>
                            <br>
                           
                            <label class="label label-info">Tactica</label><br>
                            <textarea id="tactica" name="tactica" class="form-control" title="Tácticas relacionadas con distribución. 
                                      Medios específicos que utilizará para distribuir el producto eficientemente"></textarea>
                            <br>
                          
                            <label class="label label-info">Canal</label><br>
                            <textarea id="canal" name="canal" class="form-control" title="Canal de distribución a utilizar. 
                                      Rutas que sigue el producto desde producción hasta el consumidor final"></textarea>
                            <br>
                            <center>
                                <button id="guardar" class="btn btn-info">Guardar</button>
                            </center>
                                </div>
                          <div class="col-md-2"></div>
                            </div>
                            
                            <% }else{%>
                            
                                  <div class="row">
                                <div class="col-md-2"></div>
                                <div class="col-md-8">
                            <label class="label label-success">Penetracion</label><br>
                            <textarea id="penetracion" name="penetracion" class="form-control" title="Especifique alternativas de penetración.
                                      Enuncie la forma como introducirá su producto al mercado, a que estratos socioeconómicos va dirigido,
                                      épocas de introducción y a que precios, o cualquier otra estrategia"><%=e.getPenetracion()%></textarea>
                            <br>
                           
                            <label class="label label-success">Comercializacion</label><br>
                            <textarea id="comercializacion" name="comercializacion" class="form-control" title="Alternativas de comercialización. 
                                      Describa la forma como llevara su producto al consumidor final se puede hacer en forma directa e indirecta 
                                      o una combinación de las dos, cuantifique."><%=e.getComercializacion()%></textarea>
                            <br>
                           
                            <label class="label label-success">Distribución física</label><br>
                            <textarea id="distribucioni" name="distribucioni" class="form-control" title="Distribución física nacional ó internacional. 
                                      Indique la infraestructura a utilizar para la distribución del producto como: almacenamiento, transporte, puntos de venta"><%=e.getDistribuicionNI()%></textarea>
                            <br>
                           
                            <label class="label label-success">Tactica</label><br>
                            <textarea id="tactica" name="tactica" class="form-control" title="Tácticas relacionadas con distribución. 
                                      Medios específicos que utilizará para distribuir el producto eficientemente"><%=e.getTactica()%></textarea>
                            <br>
                          
                            <label class="label label-success">Canal</label><br>
                            <textarea id="canal" name="canal" class="form-control" title="Canal de distribución a utilizar. 
                                      Rutas que sigue el producto desde producción hasta el consumidor final"><%=e.getCanal()%></textarea>
                            <br>
                            <center>
                                <button onclick="actualizar(<%=e.getIdDistribuicion()%>)" class="btn btn-success">Actualizar</button>
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
        <script src="../js/mensajes/mEDistribucion.js" type="text/javascript"></script>
        <script src="../js/ajax/EDistribucion.js" type="text/javascript"></script>
        <script src="../js/expanding.jquery.js" type="text/javascript"></script>
        <script src="../js/expanding.js" type="text/javascript"></script>
        <script>
            $('textarea').expanding();
        </script>
    </body>
</html>
