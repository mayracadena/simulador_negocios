<%-- 
    Document   : Admin
    Created on : 23/08/2016, 03:50:04 PM
    Author     : mayracadena

    
--%>



<%@page import="java.util.ArrayList"%>
<%@page import="DAO.ProyectoDAO"%>
<%@page import="VO.ProyectoVO"%>
<%@page import="VO.UsuarioVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns:h="http://xmlns.jcp.org/jsf/html" xmlns:f="http://xmlns.jcp.org/jsf/core">
    <head>
        <%
            //abriendo sesión 
            HttpSession hs = request.getSession(true);
            // sesión de proyecto - id proyecto
            Integer idp = (Integer) hs.getAttribute("idproyectito");
            //sesión de usuario
            UsuarioVO idu = (UsuarioVO) hs.getAttribute("usuarioAll");
            //validación de sesiones
            if (hs.isNew()) {
                response.sendRedirect("../index.jsp");
                return;
            }
            if (idp == null) {
                response.sendRedirect("../principal.jsp");
                return;
            }
            if (idu == null) {
                response.sendRedirect("../index.jsp");
                return;
            } else {

        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Administración Proyecto</title>
        <link href="../css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="../css/simple-sidebar.css" rel="stylesheet" type="text/css"/>
        <link href="../css/sweetalert.css" rel="stylesheet" type="text/css"/>
        <link rel="shortcut icon" type="image/x-icon" href="../img/demostrarLogo3.ico">
        <link href="../css/intento.css" rel="stylesheet" type="text/css"/>
        <link href="../css/jquery.dataTables.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>

        <% 
            
            ProyectoVO pv;
            ProyectoDAO pd = new ProyectoDAO();
            pv = pd.read(idp);

            // consulta del usuario lider
            ProyectoDAO Pdao = new ProyectoDAO();
            UsuarioVO usu = Pdao.lider(idp);


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
                                    <br><img src="../img/Mis_Iconos/admin.png" alt="" class="dos"/>
                                </div>
                                <div class="col-md-6 col-xs-6" align="left">
                                    <h1 >Administración</h1>
                                    <h3 >(<%=pv.getNombreP()%>)</h3><br>
                                </div>
                            </div>
                            <br>
                            <h3>Lider del Proyecto: <%=usu.getNombre1()%> <%=usu.getNombre2()%> <%=usu.getApellido1()%> <%=usu.getApellido2()%></h3>
                            <br>
                            
                            <a class="btn btn-info" href="Imprimir.jsp" title="Imprimir"><span class="glyphicon glyphicon-print"></span> Visualización Mi Plan De Negocios</a>
                            <br><br><table class="table table-bordered table-hover">
                                <tr>
                                    <th>Nuevo Integrante</th>
                                    
                                    <th class="col-md-1"></th>
                                </tr>
                                <tr>
                                    <td><input type="text" id="integrante" class="form-control" placeholder="Ingresa coreo de nuevo integrante..."></td>
                              
                                    <td><button class="btn btn-info" title="Buscar" id="buscar"><span class="glyphicon glyphicon-search"></span></button></td>
                                </tr>

                            </table>
                            <div id="consulta" class="panelsito">
                                <table class="table table-hover table-bordered" id="tablita" >

                                </table>
                            </div>

                            <hr>
                            <br>
                            <table class="table table-bordered table-hover" id="tableFicha">
                                <thead>
                                <th>Integrantes</th>
                                <th>Correo</th>
                                    <%
                                        // consulta de los usuarios pertenecientes a proyecto, y si el usuario 
                                        // que se encuentra en sesion es lider
                                        if (usu.getIdUsuario() == idu.getIdUsuario()) {
                                    %>
                                <th class="col-md-1">Eliminar</th>
                                    <% } %>
                                </thead>
                                <tbody>
                                    <%
                                        ArrayList<UsuarioVO> integrantes = new ArrayList();
                                        integrantes = Pdao.integrante(idp);
                                        UsuarioVO ui;
                                        for (int t = 0; t < integrantes.size(); t++) {
                                            ui = integrantes.get(t);
                                            if(ui.getIdRol() == 2 || ui.getIdRol() == 1){
                                    %>
                                    <tr id="tr<%=ui.getIdUsuario()%>" class="info">
                                        <td><%=ui.getNombre1()%> <%=ui.getApellido1()%> <label>(Instructor)</label></td>
                                        <%}else{%>
                                        <tr id="tr<%=ui.getIdUsuario()%>" >
                                            <td><%=ui.getNombre1()%> <%=ui.getApellido1()%></td>
                                        <%}%>
                                        
                                        <td><%=ui.getEmail()%></td>
                                        <%
                                            // validar que el lider no se pued eliminar
                                            if (usu.getIdUsuario() == idu.getIdUsuario() && usu.getIdUsuario() != ui.getIdUsuario()) {
                                        %>
                                        <td>
                                            <button class="btn btn-danger"  title="Borrar" onclick="borrar(<%=ui.getIdUsuario()%>)"><span class="glyphicon glyphicon-remove"></span></button>
                                        </td>
                                        <%} else if(usu.getIdUsuario() == idu.getIdUsuario()){%>
                                        <td></td>
                                        <%}%>
                                    </tr>
                                    <% } %>
                                </tbody>

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
        <script src="../js/ajax/proyecto.js" type="text/javascript"></script>
        <script src="../js/jquery.dataTables.min.js" type="text/javascript"></script>
        <script src="../js/datatablesLogistica.js" type="text/javascript"></script>
        <%}%>
    </body>
</html>
