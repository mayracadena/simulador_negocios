<%-- 
    Document   : Nomina
    Created on : 9/08/2016, 12:08:30 PM
    Author     : mayracadena
--%>

<%@page import="VO.TemporalVO"%>
<%@page import="DAO.TemporalDAO"%>
<%@page import="VO.UsuarioVO"%>
<%@page import="DAO.GeneralDAO"%>
<%@page import="VO.GeneralVO"%>
<%@page import="VO.NominaVO"%>
<%@page import="DAO.NominaDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="VO.TipoNominaVO"%>
<%@page import="DAO.TipoNominaDAO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="DAO.ProyectoDAO"%>
<%@page import="VO.ProyectoVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            HttpSession hs = request.getSession(true);
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
            } else {

        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Nomina</title>
        <link href="../css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="../css/simple-sidebar.css" rel="stylesheet" type="text/css"/>
        <link href="../css/sweetalert.css" rel="stylesheet" type="text/css"/>
        <link rel="shortcut icon" type="image/x-icon" href="../img/demostrarLogo3.ico">
        <link href="../css/intento.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>

        <%                ProyectoVO pv;
            ProyectoDAO pd = new ProyectoDAO();
            pv = pd.read(idp);
            DecimalFormat formato = new DecimalFormat("###,###,###");
            Integer opcionNomina = (Integer) hs.getAttribute("opcionNomina");
            if (opcionNomina == null) {
                opcionNomina = 0;
            }
        %>
        <div hidden="" id="opcionNomina"><%=opcionNomina%></div>
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
                                    <br><img src="../img/Mis_Iconos/nomina.png" alt="" class="dos"/>
                                </div>
                                <div class="col-md-6 col-xs-6" align="left">
                                    <h1 >Nómina</h1>
                                    <h3 >(<%=pv.getNombreP()%>)</h3><br>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4 col-xs-6">
                                    <label class="label label-info">Tipo Nómina</label>
                                    <select class="form-control" id="TipoNomina">

                                        <%  TipoNominaDAO tnd = new TipoNominaDAO();
                                            TipoNominaVO tnv;
                                            ArrayList<TipoNominaVO> tn = new ArrayList();
                                            tn = tnd.readAll();

                                            if (opcionNomina == 2) {
                                        %>
                                        <option value="2">Producción</option>
                                        <option value="1">Administración</option> 
                                        <%}
                                            if (opcionNomina == 1) {%>  
                                        <option value="1">Administración</option>
                                        <option value="2">Producción</option>
                                        <%}
                                            if (opcionNomina == 0) {
                                                for (int i = 0; i < tn.size(); i++) {
                                                    tnv = tn.get(i);
                                        %>

                                        <option value="<%=tnv.getIdTipoNomina()%>"><%=tnv.getTnomina()%></option>
                                        <% }
                                              }%>
                                    </select>
                                </div>
                                    <div class="col-md-4 col-xs-2">
                                        <br>    <button class="btn btn-info" data-toggle="modal" data-target="#tabla_nomina" onclick="Detalles_nomina()"><span class="glyphicon glyphicon-question-sign"></span></button>
                                    </div>
                                <div><br>

                                </div>
                            </div>
                                   
                                    
                                    
                                        <div id="tabla_nomina" class="modal fade" role="dialog">
                                    <div class="modal-dialog">

                                        <!-- Modal content-->
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                <h4 class="modal-title">Detalles de Nómina</h4>
                                            </div>
                                            <div class="modal-body">
                                                <table class="table table-bordered table-responsive" id="t_nomina">
                                                   
                                                   
                                                </table>
                                                <%
                                                TemporalDAO td = new TemporalDAO();
                                                    TemporalVO tv = null;
                                                            
                                                        tv = td.read(idp);
                                                    if (tv == null) {%>
                                                       <div id="riegos">
                                                    <h4>Ajustes</h4>
                                                    Escriba el porcentaje de ajuste cuando cambia la legislación y afecta a alguno
                                                    de los items de la descripción
                                                    <br><br>
                                                    <div class="row">
                                                        <div class="col-md-7">
                                                            <input type="number" id="ajustes" value="" class="form-control" placeholder="Porcentaje de ajustes">
                                                        </div>
                                                        <div class="col-md-2">
                                                            <button class="btn btn-success" onclick="Ajustes_n()" ><span class="glyphicon glyphicon-edit"></span></button>
                                                        </div>
                                                        </div>
                                                </div>
                                                   <%     }else{
                                                %>
                                                <div id="riegos">
                                                    <h4>Ajustes</h4>
                                                    Escriba el porcentaje de ajuste cuando cambia la legislación y afecta a alguno
                                                    de los items de la descripción (Nómina de Producción)
                                                    <br><br>
                                                    <div class="row">
                                                        <div class="col-md-7">
                                                            <input type="number" id="ajustes" value="<%=tv.getAjustes()%>" class="form-control" placeholder="Porcentaje de ajustes">
                                                        </div>
                                                        <div class="col-md-2">
                                                            <button class="btn btn-success" onclick="Ajustes_n()" ><span class="glyphicon glyphicon-edit"></span></button>
                                                        </div>
                                                        </div>
                                                </div>
                                                        <%}%>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                    
                                    
                            <br><br>
                            <div id="tblAdministracion" class="panelsito">
                                <table class="table table-bordered table-hover">
                                    <thead>
                                    <th>Cargo</th>
                                    <th>Meses</th>
                                    <th>Cantidad</th>
                                    <th>Salario</th>
                                    <th></th>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td><input type="text"  id="cargoA" class="form-control" required></td>
                                            <td><input type="number"  id="mesesA" class="form-control" required></td>
                                            <td><input type="number"  id="cantidadA" class="form-control"></td>
                                            <td><input type="number" step="any" id="salarioA" class="form-control" required></td>

                                            <td>

                                                <button class="btn btn-info" id="btnGuardarA" >Guardar</button>
                                            </td>

                                        </tr>

                                    </tbody>
                                </table>    
                                <br><br>
                                <table class="table table-bordered table-hover" >
                                    <tr>
                                        <th class="col-md-2">Cargo</th>
                                        <th class="col-md-1">Meses</th>
                                        <th class="col-md-2">Cantidad</th>
                                        <th class="col-md-2">Salario</th>
                                        <th class="col-md-2">Valor a pagar</th>
                                        <th class="col-md-2">Subsidio transporte a pagar</th>
                                        <th class="col-md-1"></th>
                                    </tr>
                                    <%
                                        NominaDAO nd = new NominaDAO();
                                        NominaVO nv;
                                        ArrayList<NominaVO> ns = new ArrayList();
                                        ns = nd.consulta(idp, 1);

                                        GeneralVO gv;
                                        GeneralDAO gd = new GeneralDAO();
                                        gv = gd.read(1);

                                        double salarioM = gv.getSalarioM();

                                        double total = 0;
                                        double total2 = 0;
                                        for (int j = 0; j < ns.size(); j++) {
                                            nv = ns.get(j);
                                            if ((salarioM * 2) >= nv.getSalario() && (salarioM / 2) <= nv.getSalario()) {
                                                total = nv.getMeses() * gv.getSubsidioT() * nv.getCantidad();
                                            } else {
                                                total = 0;
                                            }
                                            String Total = formato.format(total);
                                            String salario = formato.format(nv.getSalario());
                                            total2 = (nv.getMeses() * nv.getCantidad() * nv.getSalario()) / 12;
                                            String Total2 = formato.format(total2);
                                    %>
                                    <tr id="tr<%=nv.getIdNomina()%>">
                                        <td><%=nv.getCargo()%></td>
                                        <td><%=nv.getMeses()%></td>
                                        <td><%=nv.getCantidad()%></td>
                                        <td>$ <%=salario%></td>
                                        <td>$ <%=Total2%></td>
                                        <td>$ <%=Total%></td>
                                        <td>
                                            <button class="btn btn-success"  title="Editar" onclick="actualizar(<%=nv.getIdNomina()%>)"><span class="glyphicon glyphicon-edit"></span></button>
                                            <button class="btn btn-danger" id="btnBorrar<%=nv.getIdNomina()%>" title="Borrar" onclick="borrar(<%=nv.getIdNomina()%>)"><span class="glyphicon glyphicon-remove"></span></button>
                                        </td>

                                    </tr>    
                                    <%}%>

                                </table>
                            </div>
                            <div id="tblProduccion" class="panelsito">
                                <table class="table table-bordered table-hover">
                                    <thead>
                                    <th>Cargo</th>
                                    <th>Meses</th>
                                    <th>Cantidad</th>
                                    <th>Salario</th>
                                    <th></th>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td><input type="text"  id="cargoP" class="form-control" required></td>
                                            <td><input type="number"  id="mesesP" class="form-control" required></td>
                                            <td><input type="number"  id="cantidadP" class="form-control"></td>
                                            <td><input type="number" step="any" id="salarioP" class="form-control" required></td>
                                            <td><button class="btn btn-info" id="btnGuardarP" >Guardar </button></td>

                                        </tr>

                                    </tbody>
                                </table>
                                <br><br>

                                <table class="table table-bordered table-hover" >
                                    <tr>
                                        <th class="col-md-2">Cargo</th>
                                        <th class="col-md-1">Meses</th>
                                        <th class="col-md-2">Cantidad</th>
                                        <th class="col-md-2">Salario</th>
                                        <th class="col-md-2">Valor a pagar</th>
                                        <th class="col-md-2">Subsidio transporte a pagar</th>
                                        <th class="col-md-1"></th>
                                    </tr>
                                    <%
                                       
                                        NominaVO nvs;
                                        ArrayList<NominaVO> n = new ArrayList();
                                        n = nd.consulta(idp, 2);

                                        GeneralVO gvs;
                                        GeneralDAO gds = new GeneralDAO();
                                        gvs = gds.read(1);

                                        double totals = 0;
                                        double total2s = 0;
                                        for (int j = 0; j < n.size(); j++) {
                                            nvs = n.get(j);
                                            if ((salarioM * 2) >= nvs.getSalario() && (salarioM / 2) <= nvs.getSalario()) {
                                                totals = nvs.getMeses() * gvs.getSubsidioT() * nvs.getCantidad();
                                            } else {
                                                totals = 0;
                                            }
                                            String Totals = formato.format(totals);
                                            String salarios = formato.format(nvs.getSalario());
                                            total2s = (nvs.getMeses() * nvs.getCantidad() * nvs.getSalario()) / 12;
                                            String Total2s = formato.format(total2s);
                                    %>
                                    <tr id="tr<%=nvs.getIdNomina()%>">
                                        <td><%=nvs.getCargo()%></td>
                                        <td><%=nvs.getMeses()%></td>
                                        <td><%=nvs.getCantidad()%></td>
                                        <td>$ <%=salarios%></td>
                                        <td>$ <%=Total2s%></td>
                                        <td>$ <%=Totals%></td>
                                        <td>
                                            <button class="btn btn-success" id="btnActualizar<%=nvs.getIdNomina()%>" title="Editar" onclick="actualizar(<%=nvs.getIdNomina()%>)"><span class="glyphicon glyphicon-edit"></span></button>
                                            <button class="btn btn-danger" id="btnBorrar<%=nvs.getIdNomina()%>" title="Borrar" onclick="borrar(<%=nvs.getIdNomina()%>)"><span class="glyphicon glyphicon-remove"></span></button>
                                        </td>

                                    </tr>    
                                    <%}%>

                                </table>
                            </div>


                        </div>
                    </div>
                </div>
                                    <%@include file="../WEB-INF/masterpage/footer.jspf"%>
            </div>
        </div>


        <script src="../js/jquery.min.js" type="text/javascript"></script>
        <script src="../js/jquery.slides.js" type="text/javascript"></script>
        <script src="../js/menu.js" type="text/javascript"></script>
        <script src="../js/sweetalert.min.js" type="text/javascript"></script>
        <script src="../js/ajax/Nomina.js" type="text/javascript"></script>
        <script src="../js/ajax/Temporal.js" type="text/javascript"></script>
        <script src="../js/bootstrap.min.js" type="text/javascript"></script>
        <%}%>
    </body>
</html>
