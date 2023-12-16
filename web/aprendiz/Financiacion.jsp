<%-- 
    Document   : Financiacion
    Created on : 14/09/2016, 01:25:46 PM
    Author     : mayracadena
--%>


<%@page import="VO.TemporalVO"%>
<%@page import="DAO.TemporalDAO"%>
<%@page import="VO.ConceptoFinanciacionVO"%>
<%@page import="DAO.ConceptoFinanciacionDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="VO.FinanciacionVO"%>
<%@page import="DAO.FinanciacionDAO"%>
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
        <title>Financiación</title>
        <link href="../css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="../css/simple-sidebar.css" rel="stylesheet" type="text/css"/>
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
                            <br><br>
                            <button class="btn btn-default" id="menusito" ><span class="glyphicon glyphicon-align-justify"></span></button> 


                            <div class="row">
                                <div class="col-md-5 col-xs-4" align="right">
                                    <br><img src="../img/Mis_Iconos/financiacion.png" alt="" class="dos"/>
                                </div>
                                <div class="col-md-6 col-xs-6" align="left">
                                    <h1 >Financiación</h1>
                                    <h3 >(<%=pv.getNombreP()%>)</h3><br>
                                </div>
                            </div>


                            <table class="table table-bordered table-hover">
                                <tr>
                                    <th class="col-md-4">Concepto</th>
                                    <th>Monto</th>
                                    <th class="col-md-3"></th>
                                </tr>
                                <tr>
                                    <td>
                                        <select class="form-control" id="concepto">
                                            <%
                                                ConceptoFinanciacionDAO c = new ConceptoFinanciacionDAO();
                                                ConceptoFinanciacionVO cd = null;
                                                ArrayList<ConceptoFinanciacionVO> ac = new ArrayList();
                                                ac = c.readAll();
                                                for (int t = 0; t < ac.size(); t++) {
                                                    cd = ac.get(t);

                                            %>
                                            <option value="<%=cd.getIdConceptoFinanciacion()%>"><%=cd.getConceptos()%></option>
                                            <%}%>
                                        </select>
                                    </td>
                                    <td><input type="number" step="any" id="monto" class="form-control"></td>
                                    <td><center><button class="btn btn-info" id="guardar">Guardar</button></center></td>
                                </tr>
                            </table>
                            <%
                                TemporalDAO td = new TemporalDAO();
                                TemporalVO t = td.read(idp);

                            %>
                            <div id="credito_dias" class="modal fade" role="dialog">
                                <div class="modal-dialog">

                                    <!-- Modal content-->
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            <h4 class="modal-title">Tasa de Interés</h4>
                                        </div>
                                        <div class="modal-body">

                                            Indique la tasa de interés efectiva anual,
                                            de acuerdo a la línea de crédito Ej: Finagro, Findeter,Microcrédito FONEDE (Comfaboy),
                                            Fomipyme, Bancamia, Bancolombia, Cooperativas,Bancario, entre otras<br>
                                            <label class="label label-success">Tasa de interés</label>
                                            <input type="number" id="Capital" value="<%=t.getCapitalTrabajo()%>" class="form-control" placeholder="Ingrese tasa de interés"><br>
                                        <%--    <label class="label label-success">Plazo a pagarlo en meses</label>
                                            <input type="number" id="Year_credito"  value="<%=t.getYear_credito()%>" class="form-control" placeholder="Ingrese plazo a pagarlo en años"><br>
                                         --%>>   <button class="btn btn-success" onclick="envio()">Guardar</button>

                                        </div>
                                        <div class="modal-footer">
                                            <div id="b_limpiar"></div>
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                                        </div>
                                    </div>

                                </div>
                            </div>

                            <br>
                            <table class="table table-bordered table-hover">
                                <tr>
                                    <th class="col-md-4">Concepto</th>
                                    <th>Monto</th>
                                    <th class="col-md-3"></th>
                                </tr>
                                <%
                                    FinanciacionDAO f = new FinanciacionDAO();
                                    FinanciacionVO fv = null;
                                    ArrayList<FinanciacionVO> af = new ArrayList();
                                    af = f.todo(idp);
                                    double totals = 0;

                                  

                                    for (int i = 0; i < af.size(); i++) {
                                        fv = af.get(i);
                                        totals = fv.getMonto() + totals;
                                %>
                                <tr id="tr<%=fv.getIdFinanciacion()%>">
                                    <td><%=fv.getConcepto()%></td>
                                    <td>$ <%=formato.format(fv.getMonto())%></td>
                                    <%
                                                if (fv.getIdConceptoFinanciacion() == 7) {%>
                                    <td >
                                <center>
                                    <button class="btn btn-default" title="Tasa de interes" data-toggle="modal" data-target="#credito_dias">%</button>
                                    <button class="btn btn-success"  title="Editar" onclick="actualizar(<%=fv.getIdFinanciacion()%>)"><span class="glyphicon glyphicon-edit"></span></button>
                                    <button class="btn btn-danger"  title="Borrar" onclick="borrar(<%=fv.getIdFinanciacion()%>)"><span class="glyphicon glyphicon-remove"></span></button>
                                </center>    
                                </td>     



                                <%} else {%>
                                <td >
                                <center>
                                    <button class="btn btn-success"  title="Editar" onclick="actualizar(<%=fv.getIdFinanciacion()%>)"><span class="glyphicon glyphicon-edit"></span></button>
                                    <button class="btn btn-danger"  title="Borrar" onclick="borrar(<%=fv.getIdFinanciacion()%>)"><span class="glyphicon glyphicon-remove"></span></button>
                                </center>    
                                </td>
                                <% } %>
                                </tr>
                                <% }%>
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
        <script src="../js/bootstrap.min.js" type="text/javascript"></script>
        <script src="../js/menu.js" type="text/javascript"></script>
        <script src="../js/sweetalert.min.js" type="text/javascript"></script>
        <script src="../js/ajax/Financiacion.js" type="text/javascript"></script>
        <script src="../js/ajax/Temporal.js" type="text/javascript"></script>
    </body>
</html>
