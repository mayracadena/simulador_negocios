<%-- 
    Document   : Resultados
    Created on : 16/08/2016, 07:13:16 PM
    Author     : mayrayesenia
--%>

<%@page import="DAO.PrecioProductosDAO"%>
<%@page import="VO.PrecioProductosVO"%>
<%@page import="VO.InversionVO"%>
<%@page import="VO.TemporalVO"%>
<%@page import="DAO.TemporalDAO"%>
<%@page import="VO.GeneralVO"%>
<%@page import="DAO.GeneralDAO"%>
<%@page import="DAO.KCDAO"%>
<%@page import="DAO.FinanciacionDAO"%>
<%@page import="VO.TipoGastoCostoVO"%>
<%@page import="DAO.TipoGastoCostoDAO"%>
<%@page import="DAO.ProyeccionVentasDAO"%>
<%@page import="DAO.GastoCostoDAO"%>
<%@page import="VO.UsuarioVO"%>
<%@page import="VO.NominaVO"%>
<%@page import="DAO.NominaDAO"%>
<%@page import="DAO.CostosProductosDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="VO.ProductoVO"%>
<%@page import="DAO.ProductoDAO"%>
<%@page import="DAO.InversionDiferidaDAO"%>
<%@page import="DAO.InversionDAO"%>
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

            if (idu == null) {
                response.sendRedirect("../index.jsp");
                return;
            }
            if (idp == null) {
                response.sendRedirect("../principal.jsp");
                return;
            }
            if (idu == null && idp == null) {
                response.sendRedirect("../index.jsp");
                return;
            } else {

        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Resultados</title>
        <link href="../css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="../css/intento.css" rel="stylesheet" type="text/css"/>
        <link href="../css/simple-sidebar.css" rel="stylesheet" type="text/css"/>
        <link href="../css/sweetalert.css" rel="stylesheet" type="text/css"/>
        <link rel="shortcut icon" type="image/x-icon" href="../img/demostrarLogo3.ico">
    </head>
    <body>



        <%    ProyectoVO pv;
            ProyectoDAO pd = new ProyectoDAO();
            pv = pd.read(idp);
            DecimalFormat formato = new DecimalFormat("###,###,###");

            //Inversion
            InversionDAO in = new InversionDAO();
            double total20 = in.resultado20(idp, 1);
            double total10 = in.resultado10(idp, 1);
            double total5 = in.resultado5(idp, 1);
            //     double otroTotal = in.otrainversion(idp, 1);

            double total202 = in.resultado20(idp, 2);
            double total102 = in.resultado10(idp, 5);
            double total52 = in.resultado5(idp, 5);
            //       double otroTotal2 = in.otrainversion(idp, 2);

            double semovientes = in.resultado20(idp, 3) + in.resultado10(idp, 3) + in.resultado5(idp, 3) + in.otrainversion(idp, 3);
            double cultivos = in.resultado20(idp, 4) + in.resultado10(idp, 4) + in.resultado5(idp, 4) + in.otrainversion(idp, 4);

            //Inversion Diferida
            InversionDiferidaDAO ivdao = new InversionDiferidaDAO();

            //Proyecto
            ProductoDAO prd = new ProductoDAO();
            ProductoVO prv;
            ArrayList<ProductoVO> prA = new ArrayList();
            prA = prd.todosP(idp);

            //Costos
            CostosProductosDAO costosDAO = new CostosProductosDAO();

            //Nomina
            NominaDAO nomiDAO = new NominaDAO();
            ArrayList<NominaVO> anomina = new ArrayList();
            ArrayList<NominaVO> anomina2 = new ArrayList();
            anomina = nomiDAO.consulta(idp, 2);
            anomina2 = nomiDAO.consulta(idp, 1);
            NominaVO nomi, nomi2;

            //proyeccion
            ProyeccionVentasDAO proyDAO = new ProyeccionVentasDAO();
            //temporal
            TemporalVO tmv = null;
            TemporalDAO tDAO = new TemporalDAO();
            tmv = tDAO.read(idp);

            //general
            GeneralDAO genDAO = new GeneralDAO();
            GeneralVO g = genDAO.read(1);
            double totalNomSum = g.getCesantias() + g.getInteresesCesantias() + g.getPrimaServicios() + g.getVacaciones() + g.getCajaCompensacion() + g.getEPSalud() + g.getPension() + g.getRiesgos() + tmv.getAjustes();
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


                            <center>
                                <a type="button" id="btnImp" class="btn btn-info " >Exportar</a>
                            </center>
                            <div  id="areaImp">
                                <div class="row">
                                    <div class="col-md-5 col-xs-5" align="right">
                                        <br><img src="../img/Mis_Iconos/resultados.png" alt="" class="dos"/>
                                    </div>
                                    <div class="col-md-5 col-xs-5" align="left">
                                        <h1>Resultados</h1>
                                        <h3>(<%=pv.getNombreP()%>)</h3><br>
                                    </div>
                                </div>
                                <h2>Inversión</h2>
                                <table class="table table-bordered table-hover">
                                    <tr>
                                        <th class="col-md-6">Detalle</th>
                                        <th class="col-md-6">Total</th>
                                    </tr>

                                    <tr>
                                        <td>Terrenos</td>
                                        <td><div class="text-right">$ <%=formato.format(total202)%></div></td>
                                    </tr>
                                    <tr>
                                        <td>Construcciones y Edificios</td>
                                        <td><div class="text-right">$ <%=formato.format(total20)%></div></td>
                                    </tr>
                                    <tr>
                                        <td>Maquinaria y Equipo</td>
                                        <td><div class="text-right">$ <%=formato.format(total10)%></div></td>
                                    </tr>
                                    <tr>
                                        <td>Muebles y Enseres</td>
                                        <td><div class="text-right">$ <%=formato.format(total102)%></div></td>
                                    </tr>
                                    <tr>
                                        <td>Equipo de Transporte</td>
                                        <td><div class="text-right">$ <%=formato.format(total5)%></div></td>
                                    </tr>
                                    <tr>
                                        <td>Equipos de Oficina</td>
                                        <td><div class="text-right">$ <%=formato.format(total52)%></div></td>
                                    </tr>
                                    <tr>
                                        <td>Activos Biológicos Pecuarios</td>
                                        <td><div class="text-right">$ <%=formato.format(semovientes)%></div></td>
                                    </tr>
                                    <tr>
                                        <td>Activos Biológicos Agrícolas</td>
                                        <td><div class="text-right">$ <%=formato.format(cultivos)%></div></td>
                                    </tr>
                                    <tr>
                                        <td><label>Total</label></td>
                                        <td><div class="text-right"><label>$ <%=formato.format(total202 + total20 + total10 + total102 + total5 + total52 + semovientes + cultivos)%></label></div></td>
                                    </tr>
                                </table>


                                <br><hr>
                                <%
                                    if (anomina.isEmpty()) {

                                    }
                                %>
                                <h2>Costos Operacionales</h2>
                                <h3>Costo mano de obra Permanente</h3>

                                <table class="table table-bordered table-hover">
                                    <tr>
                                        <th>Cargo</th>
                                        <th>Remuneración mensual</th>
                                        <th>Remuneración anual</th>
                                        <th>Aporte Social</th>
                                        <th>Costo Anual</th>
                                    </tr>
                                    <%
                                        double totalremensual = 0, totalreanual = 0, totalaporte = 0, totalcta = 0;
                                        String Totalremensual = "", Totalreanual = "", Totalaporte = "", Totalcta = "";

                                        for (int z = 0; z < anomina.size(); z++) {
                                            nomi = anomina.get(z);

                                            double rmensual = (nomi.getCantidad() * nomi.getMeses() * nomi.getSalario()) / 12;
                                            double ranual = rmensual * 12;
                                            double aporte = (ranual * totalNomSum) / 100;

                                            totalremensual = rmensual + totalremensual;
                                            totalreanual = ranual + totalreanual;
                                            totalaporte = aporte + totalaporte;
                                            totalcta = (ranual + aporte) + totalcta;

                                            String Rmesual = formato.format(rmensual);
                                            String Ranual = formato.format(ranual);
                                            String Aporte = formato.format(aporte);
                                            String ct = formato.format(ranual + aporte);

                                            Totalremensual = formato.format(totalremensual);
                                            Totalreanual = formato.format(totalreanual);
                                            Totalaporte = formato.format(totalaporte);
                                            Totalcta = formato.format(totalcta);

                                    %>
                                    <tr>
                                        <td><%=nomi.getCargo()%></td>
                                        <td><div class="text-right">$ <%=Rmesual%></div></td>
                                        <td><div class="text-right">$ <%=Ranual%></div></td>
                                        <td><div class="text-right">$ <%=Aporte%></div></td>
                                        <td><div class="text-right">$ <%=ct%></div></td>
                                    </tr>
                                    <% }%>
                                    <tr>
                                        <th>Total</th>
                                        <th><div class="text-right">$ <%=Totalremensual%></div></th>
                                        <th><div class="text-right">$ <%=Totalreanual%></div></th>
                                        <th><div class="text-right">$ <%=Totalaporte%></div></th>
                                        <th><div class="text-right">$ <%=Totalcta%></div></th>
                                    </tr>
                                </table>


                                <br>  <hr>
                                <h2>Gasto de Administración</h2>
                                <h3>Personal administrativo permanente</h3>
                                <table class="table table-bordered table-hover">
                                    <tr>
                                        <th>Cargo</th>
                                        <th>Remuneración mensual</th>
                                        <th>Remuneración anual</th>
                                        <th>Aporte Social</th>
                                        <th>Costo Anual</th>
                                    </tr>
                                    <%

                                        String Totalremensuals = "";
                                        String Totalreanuals = "";
                                        String Totalaportes = "";
                                        String Totalctas = "";
                                        double totalremensuals = 0;
                                        double totalreanuals = 0;
                                        double totalaportes = 0;
                                        double totalctas = 0;
                                        for (int z = 0; z < anomina2.size(); z++) {
                                            nomi2 = anomina2.get(z);

                                            double rmensuals = (nomi2.getCantidad() * nomi2.getMeses() * nomi2.getSalario()) / 12;
                                            double ranuals = rmensuals * 12;
                                            double aportes = (ranuals * (totalNomSum - tmv.getAjustes())) / 100;

                                            totalremensuals = rmensuals + totalremensuals;
                                            totalreanuals = ranuals + totalreanuals;
                                            totalaportes = aportes + totalaportes;
                                            totalctas = (ranuals + aportes) + totalctas;

                                            String Rmesual = formato.format(rmensuals);
                                            String Ranual = formato.format(ranuals);
                                            String Aporte = formato.format(aportes);
                                            String ct = formato.format(ranuals + aportes);

                                            Totalremensuals = formato.format(totalremensuals);
                                            Totalreanuals = formato.format(totalreanuals);
                                            Totalaportes = formato.format(totalaportes);
                                            Totalctas = formato.format(totalctas);

                                    %>
                                    <tr>
                                        <td><%=nomi2.getCargo()%></td>
                                        <td><div class="text-right">$ <%=Rmesual%></div></td>
                                        <td><div class="text-right">$ <%=Ranual%></div></td>
                                        <td><div class="text-right">$ <%=Aporte%></div></td>
                                        <td><div class="text-right">$ <%=ct%></div></td>
                                    </tr>
                                    <% }%>
                                    <tr>
                                        <th>Total</th>
                                        <th><div class="text-right">$ <%=Totalremensuals%></div></th>
                                        <th><div class="text-right">$ <%=Totalreanuals%></div></th>
                                        <th><div class="text-right">$ <%=Totalaportes%></div></th>
                                        <th><div class="text-right">$ <%=Totalctas%></div></th>
                                    </tr>
                                </table>

                                <br><hr>
                                <h2>Gastos y Costos</h2>
                                <table class="table table-bordered table-hover">
                                    <tr>
                                        <th>Concepto</th>
                                        <th>Valor mensual</th>
                                        <th>Valor Anual</th>
                                    </tr>
                                    <%  TipoGastoCostoDAO tnd = new TipoGastoCostoDAO();
                                        TipoGastoCostoVO tnv;
                                        ArrayList<TipoGastoCostoVO> tn = new ArrayList();
                                        tn = tnd.readAll();
                                        double manodeobra = 0, otroscostosp = 0, otrosgastos = 0, gastosventas = 0, servicios = 0;
                                        GastoCostoDAO gastoc = new GastoCostoDAO();
                                        double totalgastosycostos = 0;
                                        for (int i = 0; i < tn.size(); i++) {
                                            tnv = tn.get(i);
                                            double totalsitogasto = gastoc.Reporte(idp, tnv.getIdTipoGastoCosto());
                                            if (tnv.getIdTipoGastoCosto() == 1) {
                                                manodeobra = (manodeobra + gastoc.Reporte(idp, 1)) * 12;
                                            }
                                            if (tnv.getIdTipoGastoCosto() == 2) {
                                                servicios = (servicios + gastoc.Reporte(idp, 2)) * 12;
                                            }
                                            if (tnv.getIdTipoGastoCosto() == 3) {
                                                otroscostosp = (otroscostosp + gastoc.Reporte(idp, 3)) * 12;
                                            }
                                            if (tnv.getIdTipoGastoCosto() == 5) {
                                                otrosgastos = (otrosgastos + gastoc.Reporte(idp, 5));
                                            }
                                            if (tnv.getIdTipoGastoCosto() == 4) {
                                                gastosventas = (gastosventas + gastoc.Reporte(idp, 4));
                                            }

                                    %>
                                    <tr>
                                        <td><%=tnv.getTGastoCosto()%></td>
                                        <% if (tnv.getIdTipoGastoCosto() == 4 || tnv.getIdTipoGastoCosto() == 5) {
                                                totalgastosycostos = totalsitogasto + totalgastosycostos;

                                        %>
                                        <td><div class="text-right">$ <%=formato.format(totalsitogasto / 12)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(totalsitogasto)%></div></td>
                                        <%} else {
                                            totalgastosycostos = (totalsitogasto * 12) + totalgastosycostos;
                                        %>
                                        <td><div class="text-right">$ <%=formato.format(totalsitogasto)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(totalsitogasto * 12)%></div></td>
                                    </tr>
                                    <%}
                                        }
                                    %>
                                    <%
                                        FinanciacionDAO fin = new FinanciacionDAO();
                                        double capital = fin.Reporte(idp);
                                        double obligacion = fin.Reporte2(idp, 1);
                                        double obligacionfinanciera = fin.Reporte2(idp, 7);

                                    %>
                                </table>
                                <%--         <br> <hr> 
                                         <h2>Estructura Capital</h2>
                                         <table class="table table-bordered table-hover">
                                             <thead>
                                             <th>Concepto</th>
                                             <th>Total</th>    
                                             </thead>
                                             <tbody>
                                               
                                                 <tr>
                                                     <td>Capital Socios y Otros</td>
                                                     <td><div class="text-right">$ <%=formato.format(capital)%></div></td>
                                                 </tr>
                                                 <tr>
                                                     <td>Obligaciones Fondo Emprender</td>
                                                     <td><div class="text-right">$ <%=formato.format(obligacion)%></div></td>
                                                 </tr>
                                                 <tr>
                                                     <td>Obligaciones Financieras</td>
                                                     <td><div class="text-right">$ <%=formato.format(obligacionfinanciera)%></div></td>
                                                 </tr>
                                             </tbody>
                                             <tfoot>
                                                 <tr>
                                                     <th>Total</th>
                                                     <th><div class="text-right">$ <%=formato.format(capital + obligacion + obligacionfinanciera)%></div></th>
                                                 </tr>
                                             </tfoot>
                                         </table>
                                --%>

                                <%        if (obligacionfinanciera == 0) {

                                    } else {
                                    
                                    
                                 
                                        double tasainteres = tmv.getCapitalTrabajo() / 100;
                                        
                                       double interes = 0, interes2 = 0, interes3 = 0, interes4 = 0, interes5 = 0;
                                        double amortizacion = 0, amortizacion2 = 0, amortizacion3 = 0, amortizacion4 = 0, amortizacion5 = 0;
                                        double insobresal = 0, insobresal2 = 0, insobresal3 = 0, insobresal4 = 0, insobresal5 = 0;
                                        double rCuotaAnual = Math.pow((1 + tasainteres), 5) * obligacionfinanciera * tasainteres / (Math.pow((1 + tasainteres), 5) - 1);
                                         interes = obligacionfinanciera * tasainteres;
                                       
                                        insobresal = rCuotaAnual - interes;
                                        amortizacion = obligacionfinanciera - insobresal;
                                         
                                        interes2 = amortizacion * tasainteres;
                                        insobresal2 = rCuotaAnual - interes2;
                                        amortizacion2 = amortizacion - insobresal2;
                                         
                                          
                                        interes3 = amortizacion2 * tasainteres;
                                        insobresal3 = rCuotaAnual - interes3;
                                        amortizacion3 = amortizacion2 - insobresal3;
                                         
                                        interes4 = amortizacion3 * tasainteres;
                                        insobresal4 = rCuotaAnual - interes4;
                                        amortizacion4 = amortizacion3 - insobresal4;
                                         
                                        interes5 = amortizacion4 * tasainteres;
                                        insobresal5 = rCuotaAnual - interes5;
                                        amortizacion5 = amortizacion4 - insobresal5;
                                            
                                    
                                %>
                                <br> <hr> 
                                <h2>Tabla de amortización de crédito</h2>
                                
                                <br>
                                <table class="table table-bordered table-hover">
                                    <tr>
                                        <th>Credito</th>
                                        <td>$ <%=formato.format(obligacionfinanciera)%></td>
                                    </tr>
                                    
                                   <tr>
                                        <th>Tasa interés</th>
                                        <td><%=tmv.getCapitalTrabajo()%> %</td>
                                    </tr>
                                </table>
                                <table class="table table-bordered table-hover">
                                    <tr>
                                        <th>Años</th>
                                        <th>Cuotas anuales</th>
                                        
                                        <th>Interéses sobre saldo</th>
                                        <th>Valor por amortización</th>
                                        <th>Saldo</th>
                                    </tr>
                                   <tr>
                                       <td>1</td>
                                        <td><div class="text-right">$ <%=formato.format(rCuotaAnual)%></div></td>
                                        
                                        <td><div class="text-right">$ <%=formato.format(interes)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(insobresal)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(amortizacion)%></div></td>
                                    </tr>
                                   
                                    <tr>
                                        <td>2</td>
                                        <td><div class="text-right">$ <%=formato.format(rCuotaAnual)%></div></td>
                                      
                                        <td><div class="text-right">$ <%=formato.format(interes2)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(insobresal2)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(amortizacion2)%></div></td>
                                    </tr>
                                 
                                    <tr>
                                        <td>3</td>
                                        <td><div class="text-right">$ <%=formato.format(rCuotaAnual)%></div></td>
                                    
                                        <td><div class="text-right">$ <%=formato.format(interes3)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(insobresal3)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(amortizacion3)%></div></td>
                                    </tr>
                                
                                    <tr>
                                        <td>4</td>
                                        <td><div class="text-right">$ <%=formato.format(rCuotaAnual)%></div></td>
                                     
                                        <td><div class="text-right">$ <%=formato.format(interes4)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(insobresal4)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(amortizacion4)%></div></td>
                                    </tr>
                                 
                                    <tr>
                                        <td>5</td>
                                        <td><div class="text-right">$ <%=formato.format(rCuotaAnual)%></div></td>
                                     
                                        <td><div class="text-right">$ <%=formato.format(interes5)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(insobresal5)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(amortizacion5)%></div></td>
                                    </tr>
                       <%--             <% 
                                      interes5 = amortizacion4 * tasainteres;
                                        insobresal5 = rCuotaAnual - interes5;
                                        amortizacion5 = amortizacion4 - insobresal5;
                                        double amor5 = amortizacion5;
                                        double inte = 0, sobre = 0,amor = 0;
                                    for(int h = 6; h <= tmv.getYear_credito(); h++){
                                         inte = amor5 * tasainteres;
                                         sobre = rCuotaAnual - inte;
                                         amor = amor5 - sobre;
                                    
                                    %>
                                    <tr>
                                        <td><%=h%></td> 
                                        <td><div class="text-right">$ <%=formato.format(rCuotaAnual)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(inte)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(sobre)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(amor)%></div></td>
                                    </tr>
                                   
                                        
                                        
                                <%
                               amor5 = amor;
}}
                                %>
                       --%>
                       <%}%>
                                </table>
                                <!--me toco los scripts por aqui sorry :D -->
                                <script src="../js/jquery.min.js" type="text/javascript"></script>
                                <script src="../js/menu.js" type="text/javascript"></script>
                                <script src="../js/sweetalert.min.js" type="text/javascript"></script>
                                <script src="../js/jquery.PrintArea.js" type="text/javascript"></script>
                                <script src="../js/Chart.js" type="text/javascript"></script>





                                <br><hr>
                                <%
                                    ArrayList<InversionVO> Depresiacionn = new ArrayList();
                                    ArrayList<InversionVO> Depresiacionn2 = new ArrayList();
                                    InversionVO depre, depre2;
                                    Depresiacionn = in.Depresiacion(idp, 3);
                                    Depresiacionn2 = in.Depresiacion(idp, 4);
                                    double totalsemovientesdepre = 0, totalcultivosdepre = 0;

                                    for (int i = 0; i < Depresiacionn.size(); i++) {
                                        depre = Depresiacionn.get(i);
                                        depre2 = Depresiacionn2.get(i);
                                        totalsemovientesdepre = totalsemovientesdepre + ((depre.getValorUnitario() * depre.getCantidad()) / depre.getVidaUtil());
                                        totalcultivosdepre = totalcultivosdepre + ((depre2.getValorUnitario() * depre2.getCantidad()) / depre2.getVidaUtil());
                                    }
                                %>
                                <h2>Productos</h2>
                                <table class="table table-bordered ">
                                    <tr>
                                        <th >Producto</th>
                                        <th class="col-md-2">Costo de referencia</th>
                                        <th>Punto Equilibrio en Cantidades</th>
                                  <%--      <th>Producción</th>
                                        <th>Administración</th>
                                  --%>
                                    </tr>
                                    <%
                                        double ivdiferida = (ivdao.total(idp) / 5) / 2;

                                        if (tmv == null) {
                                            response.sendRedirect("GastosCostos.jsp");
                                            return;
                                        }
                                        tmv.getKit();
                                        double intentodetotal = (tmv.getKit() * (gastoc.Reporte(idp, 2) * 12)) / 100;
                                        double totalkit = (gastoc.Reporte(idp, 2) * 12) - intentodetotal;
                                        double manoU = 0, otrocta = 0, totalproduccion = 0, depresiacion = 0, depresiacion2 = 0, agotamiento = 0, totaladministracion = 0;
                                        depresiacion = (total20 / 20) + (total10 / 10) + (total5 / 5);
                                        depresiacion2 = (total102 / 10) + (total52 / 5);
                                        PrecioProductosVO ppvo;
                                        PrecioProductosDAO ppdao = new PrecioProductosDAO();
                                        ArrayList<PrecioProductosVO> ppal = new ArrayList();
                                        double total = 0, proyeccion = 0, Tproy = 0, precio1 = 0, puntoequilibrio = 0;

                                        double otroctas = 0, totalgastosycostoss = 0, gastosventass = 0, otroscostosps = 0, intentodetotals = 0, depresiacion2s = 0, depresiacions = 0, totalkits = 0, ivdiferidass = 0, otrosgastoss = 0;

                                        for (int i = 0; i < prA.size(); i++) {
                                            prv = prA.get(i);
                                            ppal = ppdao.todo(prv.getIdProducto());

                                            total = costosDAO.total(prv.getIdProducto());
                                            proyeccion = proyDAO.Porcentaje(prv.getIdProducto());
                                            Tproy = proyDAO.reporte(idp);

                                            manoU = (proyeccion * 100) / Tproy;
                                            //     manoU = (double) Math.round(manoU * 100) / 100;

                                            otroctas = (totalctas * manoU) / 100;
                                            otrocta = (totalcta + manodeobra) * (manoU / 100);
                                            totalgastosycostoss = (totalgastosycostos * manoU) / 100;
                                            //  manodeobra = (manodeobra * manoU)/100;
                                            otroscostosps = (otroscostosp * manoU) / 100;
                                            intentodetotals = (intentodetotal * manoU) / 100;
                                            depresiacions = (depresiacion * manoU) / 100;
                                            agotamiento = ((totalsemovientesdepre + totalcultivosdepre) * manoU) / 100;
                                            ivdiferidass = (ivdiferida * manoU) / 100;
                                            otrosgastoss = (otrosgastos * manoU) / 100;
                                            totalkits = (totalkit * manoU) / 100;
                                            depresiacion2s = (depresiacion2 * manoU) / 100;
                                            gastosventass = (gastosventas * manoU) / 100;
                                            //   totalproductos = (totalctas + total + totalcta + totalgastosycostos);
                                            totalproduccion = (otrocta + total + otroscostosps + intentodetotals + depresiacions + agotamiento + ivdiferidass);
                                            totaladministracion = (otroctas + otrosgastoss + gastosventass + totalkits + depresiacion2s + ivdiferidass);

                                            for (int h = 0; h < ppal.size(); h++) {
                                                ppvo = ppal.get(h);
                                                if (ppvo.getYear() == 1) {
                                                    puntoequilibrio = (totaladministracion) / (ppvo.getPrecio() - (totalproduccion / proyeccion));
                                                }
                                            }
                                            double r_E = puntoequilibrio / 10;
                                            PrecioProductosDAO ppDAO = new PrecioProductosDAO();
                                            double precio_pr = ppDAO.precio_p(prv.getIdProducto());
                                            double precio_ventas = precio_pr * puntoequilibrio;
                                            double r_e2 = +(precio_ventas - totaladministracion) / 10;
                                            double R_e3 = precio_ventas / 10;

                                    %>
                                    <tr>
                                        <td><%=prv.getNombre()%></td>
                                        <td><div class="text-right">$ <%=formato.format((totalproduccion + totaladministracion) / proyeccion)%></div></td>
                                        <td><div class="text-right"> <%=formato.format(puntoequilibrio)%></div></td>
                                   <%--     <td><div class="text-right">$ <%=formato.format(totalproduccion)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(totaladministracion)%></div></td>
                                   --%>
                                    </tr>
                                    <tr>
                                        <td colspan="5">
                                            <canvas id="midiagrama<%=prv.getIdProducto()%>" class="img-responsive"></canvas>
                                        </td>
                                    </tr>
                                    <script>
                                        var diagrama = document.getElementById('midiagrama' +<%=prv.getIdProducto()%>).getContext('2d');
                                        var datos1 = {
                                            label: 'Punto equilibrio en pesos',
                                            borderColor: 'black',
                                            backgroundColor: 'transparent',
                                            data: [<%=Math.round(totaladministracion)%>,
                                        <%=Math.round(totaladministracion + (r_e2 * 2))%>,
                                        <%=Math.round(totaladministracion + (r_e2 * 4))%>,
                                        <%=Math.round(totaladministracion + (r_e2 * 6))%>,
                                        <%=Math.round(totaladministracion + (r_e2 * 8))%>,
                                        <%=Math.round(totaladministracion + (r_e2 * 10))%>,
                                        <%=Math.round(totaladministracion + (r_e2 * 12))%>,
                                        <%=Math.round(totaladministracion + (r_e2 * 14))%>,
                                        <%=Math.round(totaladministracion + (r_e2 * 16))%>,
                                        <%=Math.round(totaladministracion + (r_e2 * 18))%>,
                                        <%=Math.round(totaladministracion + (r_e2 * 20))%>]

                                        };

                                        var datos2 = {
                                            label: 'Ventas',
                                            borderColor: 'rgba(255,99,132,1)',
                                            backgroundColor: 'transparent',
                                            data: [0, <%=Math.round(R_e3 * 2)%>,
                                        <%=Math.round(R_e3 * 4)%>,
                                        <%=Math.round(R_e3 * 6)%>,
                                        <%=Math.round(R_e3 * 8)%>,
                                        <%=Math.round(R_e3 * 10)%>,
                                        <%=Math.round(R_e3 * 12)%>,
                                        <%=Math.round(R_e3 * 14)%>,
                                        <%=Math.round(R_e3 * 16)%>,
                                        <%=Math.round(R_e3 * 18)%>,
                                        <%=Math.round(R_e3 * 20)%>
                                            ]

                                        };

                                        var datos3 = {
                                            label: 'Costo Fijo',
                                            borderColor: 'blue',
                                            backgroundColor: 'transparent',
                                            data: [
                                        <%=Math.round(totaladministracion)%>,
                                        <%=Math.round(totaladministracion)%>,
                                        <%=Math.round(totaladministracion)%>,
                                        <%=Math.round(totaladministracion)%>,
                                        <%=Math.round(totaladministracion)%>,
                                        <%=Math.round(totaladministracion)%>,
                                        <%=Math.round(totaladministracion)%>,
                                        <%=Math.round(totaladministracion)%>,
                                        <%=Math.round(totaladministracion)%>,
                                        <%=Math.round(totaladministracion)%>,
                                        <%=Math.round(totaladministracion)%>
                                            ]
                                        };



                                        var todosDatos = {
                                            labels: [0, <%=formato.format(r_E * 2)%>,
                                        <%=formato.format(r_E * 4)%>,
                                        <%=formato.format(r_E * 6)%>,
                                        <%=formato.format(r_E * 8)%>,
                                        <%=formato.format(r_E * 10)%>,
                                        <%=formato.format(r_E * 12)%>,
                                        <%=formato.format(r_E * 14)%>,
                                        <%=formato.format(r_E * 16)%>,
                                        <%=formato.format(r_E * 18)%>,
                                        <%=formato.format(r_E * 20)%>],
                                            datasets: [datos1, datos2, datos3]
                                        };

                                        var chart = new Chart(diagrama, {
                                            type: 'line',
                                            data: todosDatos,
                                            options: {
                                                /*         scales: {
                                                 xAxes: [{
                                                 display: false
                                                 }]
                                                 }*/
                                            }
                                        });
                                    </script>

                                    <%} %>
                                </table>
                                <br><br>



                                <script type="text/javascript">
                                    $("#btnImp").click(function () {
                                        $("div#areaImp").printArea();
                                    });
                                </script>

                            </div>
                        </div>
                    </div>
                </div>
                                <%@include file="../WEB-INF/masterpage/footer.jspf"%>
            </div>
        </div>

    </body>
    <% }%>
</html>
