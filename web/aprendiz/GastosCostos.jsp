<%-- 
    Document   : GastosCostos
    Created on : 17/08/2016, 03:00:43 PM
    Author     : mayracadena
--%>

<%@page import="VO.TemporalVO"%>
<%@page import="DAO.TemporalDAO"%>
<%@page import="VO.UsuarioVO"%>
<%@page import="VO.GastoCostoVO"%>
<%@page import="DAO.GastoCostoDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="VO.TipoGastoCostoVO"%>
<%@page import="DAO.TipoGastoCostoDAO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="DAO.ProyectoDAO"%>
<%@page import="VO.ProyectoVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Gastos y Costos</title>
        <link href="../css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="../css/simple-sidebar.css" rel="stylesheet" type="text/css"/>
        <link href="../css/sweetalert.css" rel="stylesheet" type="text/css"/>
        <link href="../css/jquery-ui.css" rel="stylesheet" type="text/css"/>
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

            GastoCostoDAO gcDAO = new GastoCostoDAO();

            Integer opcionGastoCosto = (Integer) hs.getAttribute("opcionGastoCosto");
            if (opcionGastoCosto == null) {
                opcionGastoCosto = 0;
            }

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
                            <br><img src="../img/Mis_Iconos/Gasto_Costo.png" alt="" class="dos"/>
                            </div>
                                <div class="col-md-5 col-xs-6" align="left">
                            <h1 >Gastos y Costos</h1>
                            <h3 >(<%=pv.getNombreP()%>)</h3><br>
                                </div>
                            </div>
                            
                            
                            <div class="row">
                                <div class="col-md-4">
                                    <label class="label label-info">Tipo Gasto y Costo</label>
                                    <select class="form-control" id="TipoGastoCosto">

                                        <%  TipoGastoCostoDAO tnd = new TipoGastoCostoDAO();
                                            TipoGastoCostoVO tnv;
                                            ArrayList<TipoGastoCostoVO> tn = new ArrayList();
                                            tn = tnd.readAll();
                                            if (opcionGastoCosto == 1) { %>
                                        <option value="1">Mano No Permanente</option>
                                        <option value="2">Servicios Publicos</option>
                                        <option value="3">Otros Costos</option>
                                        <option value="4">Ventas</option>
                                        <option value="5">Otros Gastos</option>
                                        <%  }
                                            if (opcionGastoCosto == 2) {%>
                                        <option value="2">Servicios Publicos</option>
                                        <option value="3">Otros Costos</option>
                                        <option value="4">Ventas</option>
                                        <option value="5">Otros Gastos</option>
                                        <option value="1">Mano No Permanente</option>
                                        <%  }
                                            if (opcionGastoCosto == 3) {%>
                                        <option value="3">Otros Costos</option>
                                        <option value="4">Ventas</option>
                                        <option value="5">Otros Gastos</option>
                                        <option value="1">Mano No Permanente</option>
                                        <option value="2">Servicios Publicos</option>
                                        <%  }
                                            if (opcionGastoCosto == 4) {%>
                                        <option value="4">Ventas</option>
                                        <option value="5">Otros Gastos</option>
                                        <option value="1">Mano No Permanente</option>
                                        <option value="2">Servicios Publicos</option>
                                        <option value="3">Otros Costos</option>
                                        <%  }
                                            if (opcionGastoCosto == 5) {%>
                                        <option value="5">Otros Gastos</option>
                                        <option value="1">Mano No Permanente</option>
                                        <option value="2">Servicios Publicos</option>
                                        <option value="3">Otros Costos</option>
                                        <option value="4">Ventas</option>
                                        <% }
                                            if (opcionGastoCosto == 0) {
                                                for (int i = 0; i < tn.size(); i++) {
                                                    tnv = tn.get(i);

                                        %>
                                        <option value="<%=tnv.getIdTipoGastoCosto()%>"><%=tnv.getTGastoCosto()%></option>
                                        <%}
                                            }%>
                                    </select>
                                </div>
                                
                            </div>
                            <br><br>
                            <div id="mano" class="panelsito">
                                <table class="table table-bordered table-hover">
                                    <thead>
                                    <th>Cargo o servicio</th>
                                    <th>Meses</th>
                                    <th>Cantidad Mensual</th>
                                    <th>Costo Mensual</th>
                                    <th class="col-md-1"></th>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td><input type="text" class="form-control"  id="detalleM" title="Relacione el personal que ocacionalmente desempeñara labores en producción
                                                       y/o prestación del Servicio. Por ejemplo: Asistencia Técnica, jornales, etc"></td>
                                            <td><input type="number" class="form-control" id="mesesM" ></td>
                                            <td><input type="number" class="form-control" id="cantidadM"></td>
                                            <td><input type="number" class="form-control"  id="valorM"></td>
                                            <td><button id="GuardarM" class="btn btn-info">Guardar</button></td>
                                        </tr>
                                    </tbody>
                                </table> 
                                <br>
                                <table class="table table-bordered table-hover">
                                    <thead>
                                    <th>Cargo o servicio</th>
                                    <th class="col-md-1">Meses</th>
                                    <th class="col-md-2">Cantidad Mensual</th>
                                    <th>Costo Mensual</th>
                                    <th>Costo Anual</th>
                                    <th class="col-md-1"></th>
                                    </thead>
                                    <tbody>
                                        <%
                                            ArrayList<GastoCostoVO> agc = new ArrayList();
                                            GastoCostoVO gcVO;
                                            agc = gcDAO.todo(idp, 1);
                                            double costoMensual = 0, costoAnual = 0;
                                            for (int i = 0; i < agc.size(); i++) {
                                                gcVO = agc.get(i);
                                                String valorM = formato.format(gcVO.getValorMoA());
                                                String valorA = formato.format(gcVO.getValorMoA() * 12);
                                                costoAnual = costoAnual + (gcVO.getValorMoA() * 12);
                                                costoMensual = costoMensual + gcVO.getValorMoA();
                                        %>
                                        <tr id="tr<%=gcVO.getIdGastoCosto()%>">
                                            <td><%=gcVO.getDetalle()%></td>
                                            <td><%=gcVO.getMeses()%></td>
                                            <td><%=gcVO.getCantidadM()%></td>
                                            <td><div class="text-right">$ <%=valorM%></div></td>
                                            <td><div class="text-right">$ <%=valorA%></div></td>
                                            <td>
                                                <button class="btn btn-success"  title="Editar" onclick="actualizar(<%=gcVO.getIdGastoCosto()%>)"><span class="glyphicon glyphicon-edit"></span></button>
                                                <button class="btn btn-danger"  title="Borrar" onclick="borrar(<%=gcVO.getIdGastoCosto()%>)"><span class="glyphicon glyphicon-remove"></span></button>
                                            </td>
                                        </tr>
                                        <%}%>
                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <th>Total</th>
                                            <td></td>
                                            <td></td>
                                            <td><div class="text-right">$ <%=formato.format(costoMensual)%></div></td>
                                            <td><div class="text-right">$ <%=formato.format(costoAnual)%></div></td>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>

                            <div id="servicios" class="panelsito">
                                <table class="table table-bordered table-hover">
                                    <thead>
                                    <th>Detalle</th>
                                    <th>Valor Mensual</th>
                                    <th class="col-md-1"></th>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td><input type="text"  id="detalleS" class="form-control" title="De a cuerdo a los productos a obtener relacione
                                                       servicios. Por ejemplo: Energia, Agua, Gas, Combustible, seguros, entre otros."></td>
                                            <td><input type="number" step="any" id="valorS" class="form-control"></td>
                                            <td><button id="GuardarS" class="btn btn-info">Guardar</button></td>
                                        </tr>
                                    </tbody>
                                </table>
                                <br>
                                <table class="table table-bordered table-hover">
                                    <thead>
                                    <th>Detalle</th>
                                    <th>Valor Mensual</th>
                                    <th>Valor Anual</th>
                                    <th class="col-md-1"></th>
                                    </thead>
                                    <tbody>
                                        <%
                                            ArrayList<GastoCostoVO> agcs = new ArrayList();
                                            GastoCostoVO g2;
                                            agcs = gcDAO.todo(idp, 2);
                                            double totalm = 0, totala = 0;
                                            for (int o = 0; o < agcs.size(); o++) {

                                                g2 = agcs.get(o);

                                                String valorM = formato.format(g2.getValorMoA());
                                                String valorA = formato.format(g2.getValorMoA() * 12);
                                                totalm = totalm + g2.getValorMoA();
                                                totala = totala + (g2.getValorMoA() * 12);
                                        %>
                                        <tr id="tr<%=g2.getIdGastoCosto()%>">
                                            <td><%=g2.getDetalle()%></td>
                                            <td><div class="text-right">$ <%=valorM%></div></td>
                                            <td><div class="text-right">$ <%=valorA%></div></td>
                                            <td>
                                                <button class="btn btn-success"  title="Editar" onclick="actualizar2(<%=g2.getIdGastoCosto()%>)"><span class="glyphicon glyphicon-edit"></span></button>
                                                <button class="btn btn-danger"  title="Borrar" onclick="borrar(<%=g2.getIdGastoCosto()%>)"><span class="glyphicon glyphicon-remove"></span></button> 
                                            </td>
                                        </tr>
                                        <%}%>
                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <th>Total</th>
                                            <td><div class="text-right">$ <%=formato.format(totalm)%></div></td>
                                            <td><div class="text-right">$ <%=formato.format(totala)%></div></td>
                                            <td hidden="" id="totalsitoOP"><%=totala%></td>
                                        </tr>
                                    </tfoot>
                                </table><br><hr>
                                <div class="row">
                                    <div class="col-md-2"></div>
                                    <div class="col-md-8">
                                        <table class="table table-bordered table-hover" id="kit">
                                            <thead>
                                            <th class="col-md-4 col-xs-4">Detalle</th>
                                            <th>%</th>
                                            <th class="col-md-4 col-xs-4">Total</th>
                                            </thead>
                                            <tbody>
                                                <%
                                                    TemporalDAO td = new TemporalDAO();
                                                    TemporalVO tv = td.read(idp);

                                                    if (tv == null) {
                                                %>
                                                <tr>
                                                    <td>Kit Servicios Producción</td>
                                                    <td><input type="number" step="any" class="form-control" id="porcentaje"></td>
                                                    <td id="valor1"></td>
                                                </tr>
                                                <tr>
                                                    <td>Kit Administración Ventas</td>
                                                    <td id=""></td>
                                                    <td id=""></td>
                                                </tr>
                                                <tr>
                                                    <td><button id="kitG" class="btn btn-info" onclick="calcular()">Guardar</button></td>
                                                </tr>
                                                <%} else { %>
                                                <% double Tporcentaje = 100 - tv.getKit();%>
                                                <tr>
                                                    <td>Kit Servicios Producción</td>
                                                    <td><input type="number" step="any" class="form-control" id="porcentajeU" value="<%=tv.getKit()%>"></td>
                                                    <td id="valor1"><div class="text-right">$ <%=formato.format((totala * tv.getKit()) / 100)%></div></td>
                                                </tr>
                                                <tr>
                                                    <td>Kit Administración Ventas</td>
                                                    <td id="porcentaje1"><%=Tporcentaje%></td>
                                                    <td id="valor2"><div class="text-right">$ <%=formato.format((totala * Tporcentaje) / 100)%></div></td>
                                                </tr>
                                                <tr>
                                                    <td><button class="btn btn-info" onclick="actualizarCalculo(<%=tv.getIdTemporal()%>)">Actualizar</button></td>
                                                </tr>
                                                <% } %>

                                                <!--                                                 var totalsitoOP = $('#totalsitoOP').text();
                                                    var tabla = $('#kit');
                                                    var porcentaje = $('#porcentaje').val();
                                                    var valor1 = $('#valor1').empty();
                                                    var valor2 = $('#valor2').empty();
                                                    var porcentaje1 = $('#porcentaje1').empty();
                                                    var total = 0;
                                                    var total2 = 0;
                                                    var Tporcentaje = 100 - porcentaje;
                                                    total = (totalsitoOP * porcentaje)/100;
                                                    total2 = (totalsitoOP * Tporcentaje)/100;
                                                
                                                total = total.toString().split('').reverse().join('').replace(/(?=\d*\.?)(\d{3})/g,'$1.');
                                                total = total.split('').reverse().join('').replace(/^[\.]/,'');
                                                
                                                total2 = total2.toString().split('').reverse().join('').replace(/(?=\d*\.?)(\d{3})/g,'$1.');
                                                total2 = total2.split('').reverse().join('').replace(/^[\.]/,'');
                                                  
                                                    porcentaje1.append(Tporcentaje);
                                                    valor1.append('$ '+total);
                                                    valor2.append('$ '+total2);-->


                                            </tbody>
                                        </table>
                                    </div>
                                </div>  


                            </div>
                            <div id="Ocostos" class="panelsito">
                                <table class="table table-bordered table-hover">
                                    <thead>
                                    <th>Detalle</th>
                                    <th>Cantidad mensual</th>
                                    <th>Valor unitario mensual</th>
                                    <th class="col-md-1"></th>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td><input type="text" class="form-control" id="detalleOc" title="Incorpore conceptos tales como: Arriendo de Instalaciones, Aseo planta, Dotación, entre otros"></td>
                                            <td><input type="number" class="form-control" id="cantidadOc"></td>
                                            <td><input type="number" step="any" class="form-control" id="valorOc"></td>
                                            <td><button id="GuardarOc" class="btn btn-info">Guardar</button></td>
                                        </tr>
                                    </tbody>
                                </table>
                                <br>
                                <table class="table table-bordered table-hover">
                                    <thead>
                                    <th>Detalle</th>
                                    <th>Cantidad mensual</th>
                                    <th>Valor unitario mensual</th>
                                    <th>Valor Anual</th>
                                    <th class="col-md-1"></th>
                                    </thead>
                                    <tbody>
                                        <%
                                            ArrayList<GastoCostoVO> g = new ArrayList();
                                            GastoCostoVO g3;
                                            g = gcDAO.todo(idp, 3);
                                            double totalmOc = 0, totalaOc = 0, cantidadOc = 0;
                                            for (int p = 0; p < g.size(); p++) {
                                                g3 = g.get(p);
                                                String valorM = formato.format(g3.getValorMoA());
                                                String valorA = formato.format(g3.getValorMoA() * 12);
                                                totalmOc = totalmOc + g3.getValorMoA();
                                                totalaOc = totalaOc + (g3.getValorMoA() * 12);
                                                cantidadOc = cantidadOc + g3.getCantidadM();
                                        %>
                                        <tr id="tr<%=g3.getIdGastoCosto()%>">
                                            <td><%=g3.getDetalle()%></td>
                                            <td><%=g3.getCantidadM()%></td>
                                            <td><div class="text-right">$ <%=valorM%></div></td>
                                            <td><div class="text-right">$ <%=valorA%></div></td>
                                            <td>
                                                <button class="btn btn-success"  title="Editar" onclick="actualizar3(<%=g3.getIdGastoCosto()%>)"><span class="glyphicon glyphicon-edit"></span></button>
                                                <button class="btn btn-danger"  title="Borrar" onclick="borrar(<%=g3.getIdGastoCosto()%>)"><span class="glyphicon glyphicon-remove"></span></button> 
                                            </td>
                                        </tr>
                                        <%}%>
                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <th>Total</th>
                                            <td><%=formato.format(cantidadOc)%></td>
                                            <td><div class="text-right">$ <%=formato.format(totalmOc)%></div></td>
                                            <td><div class="text-right">$ <%=formato.format(totalaOc)%></div></td>
                                        </tr>
                                    </tfoot>
                                </table>

                            </div>
                            <div id="Ventas" class="panelsito">
                                <table class="table table-bordered table-hover">
                                    <tr>
                                        <th>Detalle</th>
                                        <th>Gasto Anual</th>
                                        <th class="col-md-1"></th>
                                    </tr>
                                    <tr>
                                        <td><input type="text" id="detalleV" class="form-control" 
                                                   title="Comprende los ocasionados directamente sobre la gestión de ventas por ejemplo:
                                                   distribucción, mercadeo, comercialización,promoción, publicidad, politicas de precios,
                                                   entre otros"></td>
                                        <td><input type="number" id="valorV" class="form-control"></td>
                                        <td><button id="GuardarV" class="btn btn-info">Guardar</button></td>
                                    </tr>
                                </table>
                                <br>
                                <table class="table table-bordered table-hover">
                                    <tr>
                                        <th>Detalle</th>
                                        <th>Gasto Anual</th>
                                        <th class="col-md-1"></th>
                                    </tr>
                                    <%
                                        ArrayList<GastoCostoVO> gg = new ArrayList();
                                        GastoCostoVO g4;
                                        gg = gcDAO.todo(idp, 4);
                                        double totalanual = 0;
                                        for (int p = 0; p < gg.size(); p++) {
                                            g4 = gg.get(p);
                                            String valorM = formato.format(g4.getValorMoA());
                                            totalanual = totalanual + g4.getValorMoA();

                                    %>
                                    <tr id="tr<%=g4.getIdGastoCosto()%>">
                                        <td><%=g4.getDetalle()%></td>
                                        <td><div class="text-right">$ <%=valorM%></div></td>
                                        <td>
                                            <button class="btn btn-success"  title="Editar" onclick="actualizar4(<%=g4.getIdGastoCosto()%>)"><span class="glyphicon glyphicon-edit"></span></button>
                                            <button class="btn btn-danger"  title="Borrar" onclick="borrar(<%=g4.getIdGastoCosto()%>)"><span class="glyphicon glyphicon-remove"></span></button> 
                                        </td>
                                    </tr>
                                    <%}%>
                                    <tr>
                                        <th>total</th>
                                        <td><div class="text-right">$ <%=formato.format(totalanual)%></div></td>
                                    </tr>
                                </table>

                            </div> 


                            <div id="Ogastos" class="panelsito">
                                <table class="table table-bordered table-hover">
                                    <tr>
                                        <th>Detalle</th>
                                        <th>meses</th>
                                        <th>Gasto Anual</th>
                                        <th class="col-md-1"></th>
                                    </tr>
                                    <tr>
                                        <td><input type="text"  id="detalle" class="form-control"
                                                   title="Incorpore conceptos tales como: Arriendo de oficina, Gastos financieros, Impuestos, dotación
                                                   personal administrativo, papelería, entre otros."></td>
                                        <td><input type="number" id="meses" class="form-control"></td>   
                                        <td><input type="number" step="any" id="valor" class="form-control"></td>
                                        <td><button id="GuardarOg" class="btn btn-info">Guardar</button></td>
                                    </tr>
                                </table>
                                <br>
                                <table class="table table-bordered table-hover">
                                    <tr>
                                        <th>Detalle</th>
                                        <th>meses</th>
                                        <th>Gasto Anual</th>
                                        <th class="col-md-1"></th>
                                    </tr>
                                    <%
                                        ArrayList<GastoCostoVO> ggg = new ArrayList();
                                        GastoCostoVO g5;
                                        ggg = gcDAO.todo(idp, 5);
                                        double totalGastos = 0;
                                        for (int p = 0; p < ggg.size(); p++) {
                                            g5 = ggg.get(p);
                                            String valorM = formato.format(g5.getValorMoA());
                                            totalGastos = totalGastos + g5.getValorMoA();
                                    %>
                                    <tr id="tr<%=g5.getIdGastoCosto()%>">
                                        <td><%=g5.getDetalle()%></td>
                                        <td><%=g5.getMeses()%></td>   
                                        <td><div class="text-right">$ <%=valorM%></div></td>
                                        <td>
                                            <button class="btn btn-success"  title="Editar" onclick="actualizar5(<%=g5.getIdGastoCosto()%>)"><span class="glyphicon glyphicon-edit"></span></button>
                                            <button class="btn btn-danger"  title="Borrar" onclick="borrar(<%=g5.getIdGastoCosto()%>)"><span class="glyphicon glyphicon-remove"></span></button> 
                                        </td>
                                    </tr>
                                    <%}%>
                                    <tr>
                                        <th>Total</th>
                                        <td></td>
                                        <td><div class="text-right">$ <%=formato.format(totalGastos)%></div></td>
                                    </tr>
                                </table>

                            </div>
                        </div>
                    </div>
                </div>
                                    <%@include file="../WEB-INF/masterpage/footer.jspf"%>
            </div>
        </div>
        <script src="../js/jquery.min.js" type="text/javascript"></script>
        <script src="../js/jquery-ui.min.js" type="text/javascript"></script>
        <script src="../js/jquery.slides.js" type="text/javascript"></script>
        <script src="../js/menu.js" type="text/javascript"></script>
        <script src="../js/sweetalert.min.js" type="text/javascript"></script>
        <script src="../js/mensajes/mGastosCostos.js" type="text/javascript"></script>
        <script src="../js/ajax/GastosCostos.js" type="text/javascript"></script>
        <script src="../js/ajax/Temporal.js" type="text/javascript"></script>
    </body>
</html>