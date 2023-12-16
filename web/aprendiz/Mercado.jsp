<%-- 
    Document   : Mercado
    Created on : 6/09/2016, 10:21:40 AM
    Author     : mayracadena
--%>

<%-- 
    Document   : Mercado
    Created on : 6/09/2016, 10:21:40 AM
    Author     : mayracadena
--%>

<%@page import="DAO.MercadoDAO"%>
<%@page import="VO.MercadoVO"%>
<%@page import="VO.UsuarioVO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="DAO.ProyectoDAO"%>
<%@page import="VO.ProyectoVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Estrategia Mercado</title>
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
                                    <br><img src="../img/Mis_Iconos/mercado.png" alt="" class="dos"/>
                                </div>
                                <div class="col-md-5 col-xs-5" align="left">
                                    <h1 >Estrategia de Mercado</h1>
                                    <h3 >(<%=pv.getNombreP()%>)</h3><br>
                                </div>
                            </div>
                            <%
                                MercadoVO m = null;
                                MercadoDAO md = new MercadoDAO();
                                m = md.read(idp);
                                if (m == null) {

                            %>

                            
                                            <LABEL  class="label label-info">Sector</LABEL><br>
                                            <textarea id="sector" name="sector" class="form-control" title="¿En qué sector se encuentra clasificado el proyecto a desarrollar? (Lista desplegable: Sectore según código CIIU - 4 dígitos)"></textarea>
                                            <br>
                                            <br>

                                            <LABEL class="label label-info">Tendencia</LABEL><br>
                                            <textarea id="comportamiento" name="comportamiento" class="form-control" title="Describa la tendencia de crecimiento del mercado en el que se encuentra su negocio"></textarea><br>
                                            <br>

                                            <label class="label label-info">Componente innovador</label><br>
                                            <textarea id="evolucion" name="evolucion" class="form-control" title="Describa alternativa o solución dando respuesta a los siguientes Interrogantes 
                                                ¿Qué se ofrece (concepto del negocio) y qué lo hace diferente (Componente innovador)"
                                                >Concepto del negocio:
Producto o servicio: 
Proceso:</textarea><br>
                                            
                                            <br>
                                            <label class="label label-info">Validación</label><br>
                                            <textarea id="diagnostico" name="diagnostico" class="form-control" title="¿Cómo validó a aceptación en el mercado de su proyecto
                                                       (metodología y resultados), dentro de los resultados, destaque la identificación de als motivaciones que tienenlos clientes para adquirir su producto"></textarea><br>
                                            <br>

                                            <label class="label label-info">Ingresos</label><br>
                                            <textarea id="objetivo" name="objetivo" class="form-control" title="¿Cómo obtendrá ingresos? Describa la estrategia de generación de ingresos para su proyecto"></textarea><br>
                                            <br>

                                            <label class="label label-info">Período de arranque del proyecto </label><br>
                                            <textarea id="justificacion" name="justificacion" class="form-control" title="¿Cuál es el periodo de arranque del proyecto (meses)? 
                                                      este tiempo corresponde al período estimado entre la fecha de firma del acta de inicio del contrato y la aprobación del lugar de operaciones"></textarea><br>
                                            <br>

                                            

                                            <button class="btn btn-info btn-lg" id="guardar">Guardar</button>

                            <%} else {%>

                            
                                            <LABEL  class="label label-success">Sector:</LABEL><br>
                                             <textarea id="sector" name="sector" class="form-control" title="¿En qué sector se encuentra clasificado el proyecto a desarrollar? (Lista desplegable: Sectore según código CIIU - 4 dígitos)"><%=m.getSector()%></textarea>
                                            <br>
                                            <br>
                                             <LABEL class="label label-success">Tendencia</LABEL><br>
                                            <textarea id="comportamiento" name="comportamiento" class="form-control" title="Describa la tendencia de crecimiento del mercado en el que se encuentra su negocio"><%=m.getComportamiento()%></textarea><br>
                                            <br>

                                            <label class="label label-success">Componente innovador</label><br>
                                            <textarea id="evolucion" name="evolucion" class="form-control" title="Describa alternativa o solución dando respuesta a los siguientes Interrogantes 
                                                ¿Qué se ofrece (concepto del negocio) y qué lo hace diferente (Componente innovador)"
                                                ><%=m.getEvolucion()%></textarea><br>
                                            <br>

                                            <label class="label label-success">Validación</label><br>
                                            <textarea id="diagnostico" name="diagnostico" class="form-control" title="¿Cómo validó a aceptación en el mercado de su proyecto
                                                       (metodología y resultados), dentro de los resultados, destaque la identificación de als motivaciones que tienenlos clientes para adquirir su producto"><%=m.getDiagnostico()%></textarea><br>
                                            <br>

                                            <label class="label label-success">Ingresos</label><br>
                                            <textarea id="objetivo" name="objetivo" class="form-control" title="¿Cómo obtendrá ingresos? Describa la estrategia de generación de ingresos para su proyecto"><%=m.getObjetivos()%></textarea><br>
                                            <br>

                                            <label class="label label-success">Período de arranque del proyecto </label><br>
                                            <textarea id="justificacion" name="justificacion" class="form-control" title="¿Cuál es el periodo de arranque del proyecto (meses)? 
                                                      este tiempo corresponde al período estimado entre la fecha de firma del acta de inicio del contrato y la aprobación del lugar de operaciones"><%=m.getJustificación()%></textarea><br>
                                            <br>

                                            

                                            <button class="btn btn-success  btn-lg" onclick="actualizar(<%=m.getIdMercado()%>)">Actualizar</button>

                                 


                            <% }%>
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
        <script src="../js/mensajes/mMercado.js" type="text/javascript"></script>
        <script src="../js/ajax/Mercado.js" type="text/javascript"></script>
        <script>
                                $(function () {
                                    $("#accordion").accordion({
                                        collapsible: true
                                    });
                                });
        </script>
        <script src="../js/expanding.jquery.js" type="text/javascript"></script>
        <script src="../js/expanding.js" type="text/javascript"></script>
        <script>
            $('textarea').expanding();
        </script>
    </body>
</html>
