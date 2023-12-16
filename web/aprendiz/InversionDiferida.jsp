<%-- 
    Document   : InversionDiferida
    Created on : 5/08/2016, 03:44:51 PM
    Author     : mayracadena
--%>

<%@page import="VO.UsuarioVO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="DAO.InversionDiferidaDAO"%>
<%@page import="VO.InversionDiferidaVO"%>
<%@page import="DAO.TipoInversionDiferidaDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="VO.TipoInversionDiferidaVO"%>
<%@page import="DAO.ProyectoDAO"%>
<%@page import="VO.ProyectoVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Inversion Diferida</title>
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

                                    <br><img src="../img/Mis_Iconos/Inversion_diferida.png" alt="" class="dos"/>
                             </div>
                                <div class="col-md-5 col-xs-5" align="left">
                            <h1 >Inversión Intangible</h1>
                            <h3>(<%=pv.getNombreP()%>)</h3><br>
                                </div>
                            </div>
                            
                                
                                    <table class="table table-bordered table-hover">
                                        <tr>
                                            <th class="col-md-5">Detalle</th>
                                            <th class="col-md-5">Total</th>
                                            <th class="col-md-2">Acción</th>
                                        </tr>
                                        <tr>
                                            <td>
                                                <select class="form-control" id="detalle">
                                                    <%
                                                        ArrayList<TipoInversionDiferidaVO> tid = new ArrayList();
                                                        TipoInversionDiferidaDAO tiddao = new TipoInversionDiferidaDAO();
                                                        TipoInversionDiferidaVO tv;

                                                        tid = tiddao.readAll();
                                                        
                                                        for (int i = 0; i < tid.size(); i++) {
                                                           tv = tid.get(i);
                                                          
                                                    %>
                                                    <option value="<%=tv.getIdTipoInversionDiferida()%>"><%=tv.getTinversionD()%></option>
                                                    <%}%>
                                                </select>
                                            </td>
                                            <td><input type="number" step="any" class="form-control" id="total" title="De acuerdo a su proyecto seleccione:
Bienes inmateriales,derechos,privilegios o ventajas de competencia."></td>
                                            <td><button class="btn btn-info" id="btnGuardar">Guardar</button></td>
                                        </tr>

                                    </table>
                                
                               


                            <%
                                ArrayList<InversionDiferidaVO> indiferida = new ArrayList();
                                InversionDiferidaDAO indao = new InversionDiferidaDAO();
                                InversionDiferidaVO idvo;
                                indiferida = indao.todo(idp);
                                double totals = 0;
                            %>


                            
                                    <table class="table table-bordered table-hover" >
                                        <% for (int j = 0; j < indiferida.size(); j++) {
                                                idvo = indiferida.get(j);
                                                String total = formato.format(idvo.getTotal());
                                                totals = idvo.getTotal() + totals;
                                        %>
                                        <tr id="tr<%=idvo.getIdInversionDiferida()%>">
                                            <td class="col-md-5"><%=idvo.getTipoInversionDiferida()%></td>
                                            <td class="col-md-5">$ <%=total%></td>
                                            <td class="col-md-2">
                                                <button class="btn btn-success" id="btnActualizar<%=idvo.getIdInversionDiferida()%>" title="Editar" onclick="actualizar(<%=idvo.getIdInversionDiferida()%>)"><span class="glyphicon glyphicon-edit"></span></button>
                                                <button class="btn btn-danger" id="btnBorrar<%=idvo.getIdInversionDiferida()%>" title="Borrar" onclick="borrar(<%=idvo.getIdInversionDiferida()%>)"><span class="glyphicon glyphicon-remove"></span></button>
                                            </td>
                                        </tr>
                                        <%}%>
                                        <tr>
                                            <th>Total</th>
                                            <th>$ <%=formato.format(totals)%></th>
                                            <td></td>
                                        </tr>
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
        <script src="../js/ajax/InversionDiferida.js" type="text/javascript"></script>
    </body>
</html>
