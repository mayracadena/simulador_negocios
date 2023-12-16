<%-- 
    Document   : Organizacion
    Created on : 12/10/2017, 06:17:36 PM
    Author     : mayrayesenia
--%>

<%@page import="VO.OrganizacionVO"%>
<%@page import="DAO.OrganizacionDAO"%>
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
        <title>Organización</title>
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

            OrganizacionDAO orDAO = new OrganizacionDAO();
            OrganizacionVO or = orDAO.read(idp);


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
                            <br>
                            <button class="btn btn-default" id="menusito" ><span class="glyphicon glyphicon-align-justify"></span></button> 

                            <div class="row">
                                <div class="col-md-5 col-xs-4" align="right">

                                    <br><img src="../img/Mis_Iconos/Normativa.png" alt="" class="dos"/>
                                </div>
                                <div class="col-md-5 col-xs-5" align="left">
                                    <h1 >Organización</h1>
                                    <h3>(<%=pv.getNombreP()%>)</h3><br>
                                </div>
                            </div>

                            <div class="panel panel-success">

                                <div class="panel-body">
                                    <div class="alert alert-info">
                                        Describa la normatividad que debe cumplirse para el portafolio definido
                                        anteriormente: Identificación de la norma, procesos, costos y tiempos
                                        asociados al cumplimiento de la normativa
                                    </div>
                                    <%  if (or == null) { %>
                                    <br>
                                    <label class="label label-success">Normativa empresarial</label>
                                    <textarea id="Nor_empresarial" class="form-control" title="Constitución empresa"></textarea>
                                    <br>
                                    <label class="label label-success">Normativa tributaria</label>
                                    <textarea id="Nor_tributaria" class="form-control" title=""></textarea>
                                    <br>
                                    <label class="label label-success">Normativa técnica</label>
                                    <textarea id="Nor_tecnica" class="form-control" title="Permisos, licencias de funcionamiento,
                                              registros, reglamentos"></textarea>
                                    <br>
                                    <label class="label label-success">Normativa laboral</label>
                                    <textarea id="Nor_laboral" class="form-control" title=""></textarea>
                                    <br>
                                    <label class="label label-success">Normativa ambiental</label>
                                    <textarea id="Nor_ambiental" class="form-control" title=""></textarea>
                                    <br>
                                    <label class="label label-success">Registro marca - Propiedad intelectual</label>
                                    <textarea id="Registro_marca" class="form-control" title=""></textarea>
                                    <br>
                                    <button class="btn btn-success" onclick="guardarOrganizacion()">Guardar</button>
                                    <%      } else {
                                    %>
                                    <br>
                                    <label class="label label-success">Normativa empresarial</label>
                                    <textarea id="Nor_empresarial" class="form-control" title="Constitución empresa"><%=or.getNor_empresarial()%></textarea>
                                    <br>
                                    <label class="label label-success">Normativa tributaria</label>
                                    <textarea id="Nor_tributaria" class="form-control" title=""><%=or.getNor_tributaria()%></textarea>
                                    <br>
                                    <label class="label label-success">Normativa técnica</label>
                                    <textarea id="Nor_tecnica" class="form-control" title="Permisos, licencias de funcionamiento,
                                              registros, reglamentos"><%=or.getNor_tecnica()%></textarea>
                                    <br>
                                    <label class="label label-success">Normativa laboral</label>
                                    <textarea id="Nor_laboral" class="form-control" title=""><%=or.getNor_laboral()%></textarea>
                                    <br>
                                    <label class="label label-success">Normativa ambiental</label>
                                    <textarea id="Nor_ambiental" class="form-control" title=""><%=or.getNor_ambiental()%></textarea>
                                    <br>
                                    <label class="label label-success">Registro marca - Propiedad intelectual</label>
                                    <textarea id="Registro_marca" class="form-control" title=""><%=or.getRegistro_marca()%></textarea>
                                    <br>
                                    <button class="btn btn-success" onclick="ActualizarOrganizacion()">Actualizar</button>
                                    <%}%>
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
            <script src="../js/ajax/Organizacion.js" type="text/javascript"></script>
            <script src="../js/menu.js" type="text/javascript"></script>
            <script src="../js/expanding.jquery.js" type="text/javascript"></script>
            <script src="../js/expanding.js" type="text/javascript"></script>
            <script>
                                        $('textarea').expanding();
                                        $(document).tooltip();
            </script>
    </body>
</html>
