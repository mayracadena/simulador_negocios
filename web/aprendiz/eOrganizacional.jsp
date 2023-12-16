<%-- 
    Document   : eOrganizacional
    Created on : 8/09/2016, 10:18:16 AM
    Author     : mayracadena
--%>

<%@page import="VO.ConceptoOrganizacionalVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.ConceptoOrganizacionalDAO"%>
<%@page import="VO.EOrganizacionalVO"%>
<%@page import="DAO.EOrganizacionalDAO"%>
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
        <title>Estrategia Organizacional</title>
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
                                    <br><img src="../img/Mis_Iconos/Dofa.png" alt="" class="dos"/>
                                </div>
                                <div class="col-md-5 col-xs-5" align="left">
                                    <h1 >Estrategia Organizacional</h1>
                                    <h3 >(<%=pv.getNombreP()%>)</h3><br>
                                </div>
                            </div>

                            <%

                                ConceptoOrganizacionalDAO cod = new ConceptoOrganizacionalDAO();
                                ArrayList<ConceptoOrganizacionalVO> acov = new ArrayList();
                                acov = cod.readAll();
                                ConceptoOrganizacionalVO c;
                            %>

                            <table class="table table-bordered table-hover">
                                <thead>
                                <th>Concepto</th>
                                <th>Impacto</th>
                                <th>Estrategia</th>
                                <th class="col-md-1"></th>
                                </thead>
                                <tbody>
                                <td>
                                    <select id="concepto" class="form-control">
                                        <%
                                            for (int i = 0; i < acov.size(); i++) {
                                                c = acov.get(i);
                                        %>
                                        <option value="<%=c.getIdConcepto()%>"><%=c.getConceptoO()%></option>
                                        <%}%>
                                    </select>
                                </td>
                                <td><textarea id="impacto" class="form-control"></textarea></td>
                                <td><textarea id="estrategia" class="form-control" title="frente al impacto identificado, se debe describir la estrategia a seguir para mitigar o controlar los impactos negativos y conservar o sostener los impactos positivos, de la organización."></textarea></td>
                                <td><button id="guardar" class="btn btn-info">Guardar</button></td>
                                </tbody>
                            </table>

                            <%
                                EOrganizacionalDAO ed = new EOrganizacionalDAO();
                                ArrayList<EOrganizacionalVO> e = new ArrayList();
                                EOrganizacionalVO eo;
                                e = ed.todos(idp);
                            %>

                            <table class="table table-bordered table-hover">
                                <thead>
                                <th>Concepto</th>
                                <th>Impacto</th>
                                <th>Estrategia</th>
                                <th class="col-md-1 col-xs-2"></th>
                                </thead>
                                <tbody>
                                    <%
                                        for (int i = 0; i < e.size(); i++) {
                                            eo = e.get(i);
                                    %>
                                    <tr id="tr<%=eo.getIdOrganizacional()%>">
                                        <td><%=eo.getConceptoO()%></td>
                                        <td><%=eo.getImpacto()%></td>
                                        <td><%=eo.getEstrategia()%></td>
                                        <td>
                                            <button class="btn btn-success"  title="Editar" onclick="actualizar(<%=eo.getIdOrganizacional()%>)"><span class="glyphicon glyphicon-edit"></span></button>
                                            <button class="btn btn-danger"  title="Borrar" onclick="borrar(<%=eo.getIdOrganizacional()%>)"><span class="glyphicon glyphicon-remove"></span></button>
                                        </td>
                                    </tr>
                                    <% }%>
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
        <script src="../js/ajax/EOrganizacional.js" type="text/javascript"></script>
        <script src="../js/jquery-ui.min.js" type="text/javascript"></script>
    </body>
</html>
