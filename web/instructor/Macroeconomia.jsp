<%-- 
    Document   : Macroeconomia
    Created on : 26/09/2016, 02:23:14 PM
    Author     : mayracadena
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="VO.MacroeconomicoVO"%>
<%@page import="DAO.MacroeconomicoDAO"%>
<%@page import="VO.UsuarioVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Macroeconómia</title>
        <link href="../css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="../css/jquery.dataTables.min.css" rel="stylesheet" type="text/css"/>
        <link href="../css/simple-sidebar.css" rel="stylesheet" type="text/css"/>
        <link href="../css/sweetalert.css" rel="stylesheet" type="text/css"/>
        <link href="../css/intento.css" rel="stylesheet" type="text/css"/>
        <link rel="shortcut icon" type="image/x-icon" href="../img/demostrarLogo3.ico">
        <%
            HttpSession hs = request.getSession(true);

            UsuarioVO idu = null;
            DecimalFormat formato = new DecimalFormat("###,###,###");
            idu = (UsuarioVO) hs.getAttribute("usuarioAll");

            if (idu.getIdRol() == 3) {
                response.sendRedirect("../index.jsp");
                return;
            }
            if (idu == null) {
                response.sendRedirect("../index.jsp");
                return;
            } else {


        %>
    </head>
    <body>

        <div id="wrapper">

            <!-- Sidebar -->
            <div id="sidebar-wrapper">
                <ul class="sidebar-nav">
                    <li class="sidebar-brand">
                        <a href="../ActualizarPerfil.jsp">
                            <%=idu.getNombre1() + " " + idu.getApellido1()%>
                        </a>
                    </li>
                    <li><a href="../principal.jsp">Inicio</a></li>
                    <li><a href="Fichas.jsp">Fichas</a></li>
                    <li><a href="Generalidades.jsp">Generalidades</a></li>
                    <li><a href="Macroeconomia.jsp">Variables Macroecnómicas</a></li>
                        <%
                            if (idu.getIdRol() == 1) {
                        %>
                    <li><a href="Intructores.jsp">Instructores</a></li>
                        <%} %> 
                    <li><a href="Aprendices.jsp">Aprendices</a></li> 
                    <li><a href="AllProyectos.jsp">Proyectos</a></li> 
                    <li><a href="Unidades_Medida.jsp">Unidades de Medida</a></li>
                    <li><a href="Inver_Diferida.jsp">Inversión Intangible</a></li>
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
                            <br><br>
                            <h1 class="text-center">Variables Macroeconómicas</h1>
                            <br>

                            <table class="table table-bordered table-hover">
                                <thead>
                                <th>Variables</th>
                                <th>1</th>
                                <th>2</th>
                                <th>3</th>
                                <th>4</th>
                                <th>5</th>

                                </thead>
                                <tr>
                                    <td>Inflación</td>
                                    <%
                                        MacroeconomicoDAO m = new MacroeconomicoDAO();
                                        MacroeconomicoVO mv, mv2, mv3, mv4, mv5, mv6;
                                        ArrayList<MacroeconomicoVO> ma, me, mi, mo, mu, ma1;
                                        ma = m.todito(1);
                                        for (int i = 0; i < ma.size(); i++) {
                                            mv = ma.get(i);

                                    %>
                                    <td id="td<%=mv.getIdMacroeconomico()%>"><div class="row"><div class="col-md-8 col-xs-5"><%=mv.getValor()%> % </div><div class="col-md-offset-2 col-xs-offset-5"><button  class="btn btn-default btn-xs" title="Editar" onclick="actualizar(<%=mv.getIdMacroeconomico()%>)"><span class="glyphicon glyphicon-edit"></span></button></div></div></td>

                                    <% } %>
                                </tr>
                                <tr>
                                    <td>Devaluación</td>
                                    <%
                                        me = m.todito(2);
                                        for (int o = 0; o < me.size(); o++) {
                                            mv2 = me.get(o);

                                    %>
                                    <td id="td<%=mv2.getIdMacroeconomico()%>"><div class="row"><div class="col-md-8 col-xs-5"><%=mv2.getValor()%> % </div><div class="col-md-offset-2 col-xs-offset-5"><button  class="btn btn-default btn-xs" title="Editar" onclick="actualizar(<%=mv2.getIdMacroeconomico()%>)"><span class="glyphicon glyphicon-edit"></span></button></div></div></td>

                                    <% } %>
                                </tr>
                                <tr>
                                    <td>PAGG</td>
                                    <%
                                        mi = m.todito(3);
                                        for (int o = 0; o < mi.size(); o++) {
                                            mv3 = mi.get(o);

                                    %>
                                    <td id="td<%=mv3.getIdMacroeconomico()%>"><div class="row"><div class="col-md-8 col-xs-5"><%=mv3.getValor()%> % </div><div class="col-md-offset-2 col-xs-offset-5"><button  class="btn btn-default btn-xs" title="Editar" onclick="actualizar(<%=mv3.getIdMacroeconomico()%>)"><span class="glyphicon glyphicon-edit"></span></button></div></div></td>

                                    <% } %>
                                </tr>
                                <tr>
                                    <td>IPP</td>
                                    <%
                                        mo = m.todito(4);
                                        for (int o = 0; o < mo.size(); o++) {
                                            mv4 = mo.get(o);

                                    %>
                                    <td id="td<%=mv4.getIdMacroeconomico()%>"><div class="row"><div class="col-md-8 col-xs-5"><%=mv4.getValor()%> % </div><div class="col-md-offset-2 col-xs-offset-5"><button  class="btn btn-default btn-xs" title="Editar" onclick="actualizar(<%=mv4.getIdMacroeconomico()%>)"><span class="glyphicon glyphicon-edit"></span></button></div></div></td>

                                    <% } %>
                                </tr>
                                <tr>
                                    <td>Crecimiento PIB</td>
                                    <%
                                        mu = m.todito(5);
                                        for (int o = 0; o < mu.size(); o++) {
                                            mv5 = mu.get(o);

                                    %>
                                    <td id="td<%=mv5.getIdMacroeconomico()%>"><div class="row"><div class="col-md-8 col-xs-5"><%=mv5.getValor()%> % </div><div class="col-md-offset-2 col-xs-offset-5"><button  class="btn btn-default btn-xs" title="Editar" onclick="actualizar(<%=mv5.getIdMacroeconomico()%>)"><span class="glyphicon glyphicon-edit"></span></button></div></div></td>

                                    <% } %>
                                </tr>
                                <tr>
                                    <td>DTF T.A.</td>

                                    <%
                                        ma1 = m.todito(6);
                                        for (int o = 0; o < ma1.size(); o++) {
                                            mv6 = ma1.get(o);

                                    %>
                                    <td id="td<%=mv6.getIdMacroeconomico()%>"><div class="row"><div class="col-md-8 col-xs-5"><%=mv6.getValor()%> % </div><div class="col-md-offset-2 col-xs-offset-5"><button  class="btn btn-default btn-xs" title="Editar" onclick="actualizar(<%=mv6.getIdMacroeconomico()%>)"><span class="glyphicon glyphicon-edit"></span></button></div></div></td>

                                    <% } %>
                                </tr>
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
        <script src="../js/ajax/Macroeconomia.js" type="text/javascript"></script>
    </body>
    <% }%>
</html>
