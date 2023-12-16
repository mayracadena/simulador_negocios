<%-- 
    Document   : KC
    Created on : 23/08/2016, 12:48:22 PM
    Author     : mayracadena
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="VO.KCVO"%>
<%@page import="DAO.KCDAO"%>
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
        <title>Capitál Credito</title>
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

            KCDAO kd = new KCDAO();
            KCVO k;
            ArrayList<KCVO> ka = new ArrayList();

            ka = kd.todo(idp);
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
                    <%@include file="../WEB-INF/masterpage/menu.jspf" %>
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
                                    <br><img src="../img/iconos/bank.png" alt="" class="dos"/>
                                </div>
                                <div class="col-md-5 col-xs-5" align="left">
                                    <h1>Capitál de Credito</h1>
                                    <h3 >(<%=pv.getNombreP()%>)</h3><br>
                                </div>
                            </div>
                            <table class="table table-bordered table-hover">
                                <thead>
                                <th>Conceptos</th>
                                <th>Monto</th>
                                <th>Tasa</th>
                                <th class="col-md-1"></th>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><input type="text" id="concepto" class="form-control" title="Escriba el nombre de la entidad que le otorga el emprésito. Ejemplo: Bancolombia, Banco de Bogotá"></td>
                                        <td><input type="number" step="any" id="monto" class="form-control"></td>
                                        <td><input type="number" step="any" id="tasa" class="form-control"></td>
                                        <td><button id="guardar" class="btn btn-info">Guardar</button></td>
                                    </tr>
                                </tbody>
                            </table>
                            <br>
                            <table class="table table-bordered table-hover">
                                <thead>
                                <th>Conceptos</th>
                                <th>Monto</th>
                                <th>Tasa</th>

                                <th class="col-md-1"></th>
                                </thead>
                                <tbody>
                                    <%
                                        double totals = 0;
                                        for (int i = 0; i < ka.size(); i++) {
                                            k = ka.get(i);
                                            totals = k.getMonto() + totals;
                                    %>
                                    <tr id="tr<%=k.getIdKc()%>">
                                        <td><%=k.getConceptos()%></td>
                                        <td>$ <%=formato.format(k.getMonto())%></td>
                                        <td><%=k.getTasa()%> %</td>

                                        <td>
                                            <button class="btn btn-success"  title="Editar" onclick="actualizar(<%=k.getIdKc()%>)"><span class="glyphicon glyphicon-edit"></span></button>
                                            <button class="btn btn-danger"  title="Borrar" onclick="borrar(<%=k.getIdKc()%>)"><span class="glyphicon glyphicon-remove"></span></button>
                                        </td>
                                    </tr>
                                    <%}%>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <th>Total</th>
                                        <th>$ <%=formato.format(totals)%></th>
                                        <th></th>
                                        <th></th>
                                    </tr>
                                </tfoot>
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
        <script src="../js/ajax/KC.js" type="text/javascript"></script>
    </body>
</html>
