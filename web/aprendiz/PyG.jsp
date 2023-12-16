<%-- 
    Document   : PyG
    Created on : 26/09/2016, 09:07:52 AM
    Author     : mayracadena
--%>

<%@page import="VO.GeneralVO"%>
<%@page import="DAO.GeneralDAO"%>
<%@page import="DAO.InversionDAO"%>
<%@page import="VO.InfInsumoVO"%>
<%@page import="DAO.InfInsumoDAO"%>
<%@page import="DAO.FinanciacionDAO"%>
<%@page import="DAO.InversionDiferidaDAO"%>
<%@page import="DAO.GastoCostoDAO"%>
<%@page import="DAO.TemporalDAO"%>
<%@page import="VO.TemporalVO"%>
<%@page import="DAO.CostosProductosDAO"%>
<%@page import="VO.MacroeconomicoVO"%>
<%@page import="DAO.MacroeconomicoDAO"%>
<%@page import="DAO.NominaDAO"%>
<%@page import="VO.NominaVO"%>
<%@page import="DAO.PrecioProductosDAO"%>
<%@page import="VO.PrecioProductosVO"%>
<%@page import="DAO.ProyeccionVentasDAO"%>
<%@page import="VO.ProyeccionVentasVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="VO.ProductoVO"%>
<%@page import="DAO.ProductoDAO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="DAO.ProyectoDAO"%>
<%@page import="VO.ProyectoVO"%>
<%@page import="VO.UsuarioVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>P&G</title>
        <%
            try {
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
        <link href="../css/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <link rel="shortcut icon" type="image/x-icon" href="../img/demostrarLogo3.ico">
    </head>
    <body>
        <%            ProyectoVO pv;
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
                            
                            <center>
                                <button class="btn btn-default" title="Porcentaje de impuestos" id="Impuestos" onclick="ImpuestosInsertar()"><label>Tasa de <br>Impuestos</label></button>
                            </center>
                            <br>
                            <center>
                                <a type="button" id="btnImp" class="btn btn-info " >Exportar</a>
                            </center>
                            <div  id="areaImp">
                                <div class="row">
                                    <div class="col-md-6 col-xs-5" align="right">
                                        <br><img src="../img/Mis_Iconos/pyg.png" alt="" class="dos"/>
                                    </div>
                                    <div class="col-md-6 col-xs-6" align="left">
                                        <h1 >P&G</h1>
                                        <h3 >(<%=pv.getNombreP()%>)</h3><br>
                                    </div>
                                </div>
                                <table class="table table-bordered table-hover">
                                    <thead>
                                    <th>Estado de Resultados</th>
                                    <th><div class="text-center">Año 1</div></th>
                                    <th><div class="text-center">Año 2</div></th>
                                    <th><div class="text-center">Año 3</div></th>
                                    <th><div class="text-center">Año 4</div></th>
                                    <th><div class="text-center">Año 5</div></th>
                                    </thead>
                                    <%

                                        double venta1 = 0, venta2 = 0, venta3 = 0, venta4 = 0, venta5 = 0, suma1 = 0;
                                        //insumos
                                        InfInsumoDAO iDao = new InfInsumoDAO();
                                        //gastos
                                        GastoCostoDAO gcDao = new GastoCostoDAO();
                                        //precio
                                        PrecioProductosVO ppvo;
                                        PrecioProductosDAO ppdao = new PrecioProductosDAO();
                                        ArrayList<PrecioProductosVO> ppal = new ArrayList();
                                        //financiacion
                                        FinanciacionDAO fin = new FinanciacionDAO();
                                        //proyeccion
                                        ProyeccionVentasVO pvVO;
                                        ProyeccionVentasDAO pvDAO = new ProyeccionVentasDAO();
                                        ArrayList<ProyeccionVentasVO> pvvv = new ArrayList();
                                        //PRODUCTO
                                        ProductoDAO prd = new ProductoDAO();
                                        ProductoVO prv;
                                        ArrayList<ProductoVO> prA = new ArrayList();
                                        prA = prd.todos(idp);
                                        if (prA.isEmpty()) {
                                            response.sendRedirect("Producto.jsp");
                                            return;
                                        }
                                        //temporal
                                    TemporalVO tmv = null;
                                    TemporalDAO tDAO = new TemporalDAO();
                                    tmv = tDAO.read(idp);
                                    if (prA.isEmpty()) {
                                        response.sendRedirect("Producto.jsp");
                                        return;
                                    } 
                                        //nomina de produccion
                                        NominaDAO nomiDAO = new NominaDAO();
                                        NominaVO nomi, nomi2;
                                        ArrayList<NominaVO> anomina = new ArrayList();
                                        ArrayList<NominaVO> anomina2 = new ArrayList();
                                        anomina = nomiDAO.consulta(idp, 2);
                                        anomina2 = nomiDAO.consulta(idp, 1);
                                        // costos productos
                                        CostosProductosDAO costosDAO = new CostosProductosDAO();
                                        //general
                                        GeneralDAO genDAO = new GeneralDAO();
                                        GeneralVO gs = genDAO.read(1);
                                         double totalNomSum = tmv.getAjustes()+ gs.getCesantias() + gs.getInteresesCesantias() + gs.getPrimaServicios() + gs.getVacaciones() + gs.getCajaCompensacion() + gs.getEPSalud() + gs.getPension() + gs.getRiesgos();
 

                                        double totalremensual = 0, totalreanual = 0, totalaporte = 0, totalcta = 0, totalproducto = 0;

                                        for (int z = 0; z < anomina.size(); z++) {
                                            nomi = anomina.get(z);

                                            double rmensual = (nomi.getCantidad() * nomi.getMeses() * nomi.getSalario()) / 12;
                                            double ranual = rmensual * 12;
                                            double aporte = (ranual * totalNomSum) / 100;

                                            totalremensual = rmensual + totalremensual;
                                            totalreanual = ranual + totalreanual;
                                            totalaporte = aporte + totalaporte;
                                            totalcta = (ranual + aporte) + totalcta;
                                        }
                                         double manodeobraprom = 0, manodeobraprom2 = 0, manodeobraprom3 = 0, manodeobraprom4 = 0, manodeobraprom5 = 0; 
                                        double ventasdetodo = 0, ventasdetodo2 = 0, ventasdetodo3 = 0, ventasdetodo4 = 0, ventasdetodo5 = 0;
                                        double mateprimeacos = 0, mateprimeacos2 = 0, mateprimeacos3 = 0, mateprimeacos4 = 0, mateprimeacos5 = 0;
                                       double manodeobra2 = 0, manodeobra3 = 0, manodeobra4 = 0, manodeobra5 = 0;
                                        double manodeobra02 = 0, manodeobra03 = 0, manodeobra04 = 0, manodeobra05 = 0;
                                        
                                         double materiaprima = 0, materiaprima2 = 0, materiaprima3 = 0, materiaprima4 = 0, materiaprima5 = 0;
                                        //macroeconomia 
                                        MacroeconomicoDAO m = new MacroeconomicoDAO();
                                        MacroeconomicoVO mv, mv2, MV;
                                        ArrayList<MacroeconomicoVO> ma, me, mi, mo;
                                        ma = m.todito(1);
                                        for (int i = 0; i < prA.size(); i++) {
                                            prv = prA.get(i);
                                            pvvv = pvDAO.todo(prv.getIdProducto());

                                            //costos de mano de obra :c
                                            double totalproductos = costosDAO.total(prv.getIdProducto());
                                            totalproducto = totalproducto + totalproductos;

                                            for (int t = 0; t < pvvv.size(); t++) {
                                                pvVO = pvvv.get(t);
                                                ppal = ppdao.todo(prv.getIdProducto());
                                                if (ppal.isEmpty()) {
                                                    response.sendRedirect("Producto.jsp");
                                                    return;
                                                }
                                                for (int j = 0; j < ppal.size(); j++) {
                                                    ppvo = ppal.get(j);

                                                    if (pvVO.getYear() == 1 && ppvo.getYear() == 1) {
                                                        suma1 = suma1 + pvVO.getProyeccion();
                                                        venta1 = (pvVO.getProyeccion() * ppvo.getPrecio()) + venta1;
                                                        ventasdetodo = ventasdetodo + pvVO.getProyeccion();
                                                    mateprimeacos = totalproducto / ventasdetodo;
                                                    }
                                                    if (pvVO.getYear() == 2 && ppvo.getYear() == 2) {
                                                         mv = ma.get(1);
                                                    ventasdetodo2 = ventasdetodo2 + pvVO.getProyeccion();
                                                  
                                                    mateprimeacos2 = ((mateprimeacos * mv.getValor())/100) + mateprimeacos;
                                                    manodeobra2 = mateprimeacos2 * ventasdetodo2;
                                                    manodeobra02 = mv.getValor();
                                                        venta2 = (pvVO.getProyeccion() * ppvo.getPrecio()) + venta2;
                                                    }
                                                    if (pvVO.getYear() == 3 && ppvo.getYear() == 3) {
                                                        mv = ma.get(2);
                                                    ventasdetodo3 = ventasdetodo3 + pvVO.getProyeccion();
                                                    mateprimeacos3 = ((mateprimeacos2 * mv.getValor())/100) + mateprimeacos2;
                                                    manodeobra3 = mateprimeacos3 * ventasdetodo3;
                                                    manodeobra03 = mv.getValor();
                                                        venta3 = (pvVO.getProyeccion() * ppvo.getPrecio()) + venta3;
                                                    }
                                                    if (pvVO.getYear() == 4 && ppvo.getYear() == 4) {
                                                         mv = ma.get(3);
                                                    ventasdetodo4 = ventasdetodo4 + pvVO.getProyeccion();
                                                   mateprimeacos4 = ((mateprimeacos3 * mv.getValor())/100) + mateprimeacos3;
                                                    manodeobra4 =  mateprimeacos4 * ventasdetodo4;
                                                    manodeobra04 = mv.getValor();
                                                        venta4 = (pvVO.getProyeccion() * ppvo.getPrecio()) + venta4;
                                                    }
                                                    if (pvVO.getYear() == 5 && ppvo.getYear() == 5) {
                                                        mv = ma.get(4);
                                                     manodeobra05 = mv.getValor();
                                                    ventasdetodo5 = ventasdetodo5 + pvVO.getProyeccion();
                                                    mateprimeacos5 = ((mateprimeacos4 * mv.getValor())/100) + mateprimeacos4;
                                                    manodeobra5 = mateprimeacos5 * ventasdetodo5;
                                                        venta5 = (pvVO.getProyeccion() * ppvo.getPrecio()) + venta5;
                                                    }
                                                }

                                            }
                                        }
                                    %>
                                    <tr>
                                        <td title="Precio promedio * ventas">Ventas</td>
                                        <td><div class="text-right">$<%=formato.format(venta1)%></div></td>
                                        <td><div class="text-right">$<%=formato.format(venta2)%></div></td>
                                        <td><div class="text-right">$<%=formato.format(venta3)%></div></td>
                                        <td><div class="text-right">$<%=formato.format(venta4)%></div></td>
                                        <td><div class="text-right">$<%=formato.format(venta5)%></div></td>
                                    </tr>
                                    <tr>
                                        <%
                                            ArrayList<InfInsumoVO> infinsumito = new ArrayList();
                                            infinsumito = iDao.Todo(idp, 1);
                                            if (infinsumito.isEmpty()) {
                                                infinsumito = null;
                                            }
                                            InfInsumoVO insumoVO;
                                            double rebaja1 = 0, rebaja2 = 0, rebaja3 = 0, rebaja4 = 0, rebaja5 = 0;
                                            for (int i = 0; i < infinsumito.size(); i++) {
                                                insumoVO = infinsumito.get(i);
                                                if (insumoVO.getYear() == 1) {
                                                    rebaja1 = (venta1 * insumoVO.getValor()) / 100;
                                                }
                                                if (insumoVO.getYear() == 2) {
                                                    rebaja2 = (venta2 * insumoVO.getValor()) / 100;
                                                }
                                                if (insumoVO.getYear() == 3) {
                                                    rebaja3 = (venta3 * insumoVO.getValor()) / 100;
                                                }
                                                if (insumoVO.getYear() == 4) {
                                                    rebaja4 = (venta4 * insumoVO.getValor()) / 100;
                                                }
                                                if (insumoVO.getYear() == 5) {
                                                    rebaja5 = (venta5 * insumoVO.getValor()) / 100;
                                                }

                                            }
                                        %>
                                        <td title="Contabilización de la rebaja (Total Ventas * Rebaja)">Devoluciones y rebajas en ventas</td>
                                        <td><div class="text-right">$ <%=formato.format(rebaja1)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(rebaja2)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(rebaja3)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(rebaja4)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(rebaja5)%></div></td>
                                    </tr>

                                    <%
                                       
                                        
                                        
                                         
                                        manodeobraprom = (totalcta + (gcDao.Reporte(idp, 1) * 12)) / ventasdetodo;
                                        manodeobraprom2 = ((totalcta + (gcDao.Reporte(idp, 1) * 12)) / ventasdetodo) * (1 + (manodeobra02 / 100));
                                        manodeobraprom3 = (((totalcta + (gcDao.Reporte(idp, 1) * 12)) / ventasdetodo) * (1 + (manodeobra02 / 100))) * (1 + (manodeobra03 / 100));
                                        manodeobraprom4 = ((((totalcta + (gcDao.Reporte(idp, 1) * 12)) / ventasdetodo) * (1 + (manodeobra02 / 100))) * (1 + (manodeobra03 / 100))) * (1 + (manodeobra04 / 100));
                                        manodeobraprom5 = (((((totalcta + (gcDao.Reporte(idp, 1) * 12)) / ventasdetodo) * (1 + (manodeobra02 / 100))) * (1 + (manodeobra03 / 100))) * (1 + (manodeobra04 / 100))) * (1 + (manodeobra05 / 100));
 
                                        materiaprima = totalcta + totalproducto + (gcDao.Reporte(idp, 1) * 12);
                                      
                                       materiaprima2 = (manodeobraprom2 * ventasdetodo2) + manodeobra2;
                                    materiaprima3 = (manodeobraprom3  * ventasdetodo3)+ manodeobra3;
                                    materiaprima4 =(manodeobraprom4 * ventasdetodo4 )+ manodeobra4;
                                    materiaprima5 = (manodeobraprom5 * ventasdetodo5) + manodeobra5; 
                                    %>

                                    <tr>
                                        <td title="Suma de Materia Prima(M.P) + Mano de Obra(M.O)">Materia Prima, Mano de Obra</td>
                                        <td><div class="text-right">$ <%=formato.format(materiaprima)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(materiaprima2)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(materiaprima3)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(materiaprima4)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(materiaprima5)%></div></td>
                                    </tr>
                                    <tr>
                                        <%
                                            InversionDAO in = new InversionDAO();
                                            double totalTerrenos = in.resultado20(idp, 2);
                                            double totalConstrucion = in.resultado20(idp, 1);
                                            double totalMaquinaria = in.resultado10(idp, 1);
                                            double totalMuebles = in.resultado10(idp, 5);
                                            double totalTransporte = in.resultado5(idp, 1);
                                            double totalOficina = in.resultado5(idp, 5);
                                            double semovientes = in.resultado20(idp, 3) + in.resultado10(idp, 3) + in.resultado5(idp, 3) + in.otrainversion(idp, 3);
                                            double cultivos = in.resultado20(idp, 4) + in.resultado10(idp, 4) + in.resultado5(idp, 4) + in.otrainversion(idp, 4);

                                            double total20 = 0, total202 = 0, total203 = 0, total204 = 0, total205 = 0;
                                            double TOTAL20 = 0, TOTAL201 = 0, TOTAL203 = 0, TOTAL204 = 0, TOTAL205 = 0;
                                            double depresiacion10 = 0, depresiacion102 = 0, depresiacion103 = 0, depresiacion104 = 0, depresiacion105 = 0;
                                            double total10 = 0, total102 = 0, total103 = 0, total104 = 0, total105 = 0;
                                            double depresiacion20 = 0, depresiacion202 = 0, depresiacion203 = 0, depresiacion204 = 0, depresiacion205 = 0;
                                            double TOTAL10 = 0, TOTAL102 = 0, TOTAL103 = 0, TOTAL104 = 0, TOTAL105 = 0;
                                            double DEPRESIACION10 = 0, DEPRESIACION102 = 0, DEPRESIACION103 = 0, DEPRESIACION104 = 0, DEPRESIACION105 = 0;
                                            double total5 = 0, total52 = 0, total53 = 0, total54 = 0, total55 = 0;
                                            double depresiacion5 = 0, depresiacion52 = 0, depresiacion53 = 0, depresiacion54 = 0, depresiacion55 = 0;
                                            double TOTAL5 = 0, TOTAL52 = 0, TOTAL53 = 0, TOTAL54 = 0, TOTAL55 = 0;
                                            double DEPRESIACION5 = 0, DEPRESIACION52 = 0, DEPRESIACION53 = 0, DEPRESIACION54 = 0, DEPRESIACION55 = 0;
                                            double totalsemo = 0, totalsemo2 = 0, totalsemo3 = 0, totalsemo4 = 0, totalsemo5 = 0;
                                            double depresiacionsemo = 0, depresiacionsemo2 = 0, depresiacionsemo3 = 0, depresiacionsemo4 = 0, depresiacionsemo5 = 0;
                                            double totalculti = 0, totalculti2 = 0, totalculti3 = 0, totalculti4 = 0, totalculti5 = 0;
                                            double depresiacionculti = 0, depresiacionculti2 = 0, depresiacionculti3 = 0, depresiacionculti4 = 0, depresiacionculti5 = 0;

                                            MacroeconomicoVO meVO2;
                                            ma = m.todito(1);
                                            mi = m.todito(3);
                                            for (int i = 0; i < ma.size(); i++) {
                                                mv2 = ma.get(i);
                                                meVO2 = mi.get(i);
                                                if (mv2.getYear() == 1 && meVO2.getYear() == 1) {
                                                    total20 = (totalTerrenos * mv2.getValor()) / 100;
                                                    TOTAL20 = (totalConstrucion * meVO2.getValor()) / 100;
                                                    depresiacion20 = (totalConstrucion + TOTAL20) / 20;
                                                    TOTAL10 = (totalMaquinaria * meVO2.getValor()) / 100;
                                                    DEPRESIACION10 = (totalMaquinaria + TOTAL10) / 10;
                                                    total10 = (totalMuebles * meVO2.getValor()) / 100;
                                                    depresiacion10 = (totalMuebles + total10) / 5;
                                                    TOTAL5 = (totalTransporte * meVO2.getValor()) / 100;
                                                    DEPRESIACION5 = (totalTransporte + TOTAL5) / 10;
                                                    total5 = (totalOficina * meVO2.getValor()) / 100;
                                                    depresiacion5 = (totalOficina + total5) / 5;
                                                    totalsemo = (semovientes * meVO2.getValor()) / 100;
                                                    depresiacionsemo = (semovientes + totalsemo) / 10;
                                                    totalculti = (cultivos * meVO2.getValor()) / 100;
                                                    depresiacionculti = (cultivos + totalculti) / 10;

                                                }
                                                if (mv2.getYear() == 2 && meVO2.getYear() == 2) {
                                                    total202 = ((totalTerrenos + total20) * mv2.getValor()) / 100;
                                                    TOTAL201 = ((totalConstrucion + TOTAL20) * meVO2.getValor()) / 100;
                                                    depresiacion202 = (totalConstrucion + TOTAL20 + TOTAL201) / 20;
                                                    TOTAL102 = ((totalMaquinaria + TOTAL10) * meVO2.getValor()) / 100;
                                                    DEPRESIACION102 = (totalMaquinaria + TOTAL10 + TOTAL102) / 10;
                                                    total102 = ((totalMuebles + total10) * meVO2.getValor()) / 100;
                                                    depresiacion102 = (totalMuebles + total10 + total102) / 5;
                                                    TOTAL52 = ((totalTransporte + TOTAL5) * meVO2.getValor()) / 100;
                                                    DEPRESIACION52 = (totalTransporte + TOTAL5 + TOTAL52) / 10;
                                                    total52 = ((totalOficina + total5) * meVO2.getValor()) / 100;
                                                    depresiacion52 = (totalOficina + total5 + total52) / 5;
                                                    totalsemo2 = ((semovientes + totalsemo) * meVO2.getValor()) / 100;
                                                    depresiacionsemo2 = (semovientes + totalsemo + totalsemo2) / 10;
                                                    totalculti2 = ((cultivos + totalculti) * meVO2.getValor()) / 100;
                                                    depresiacionculti2 = (cultivos + totalculti + totalculti2) / 10;
                                                }
                                                if (mv2.getYear() == 3 && meVO2.getYear() == 3) {
                                                    total203 = ((totalTerrenos + total20 + total202) * mv2.getValor()) / 100;
                                                    TOTAL203 = ((totalConstrucion + TOTAL20 + TOTAL201) * meVO2.getValor()) / 100;
                                                    depresiacion203 = (totalConstrucion + TOTAL20 + TOTAL201 + TOTAL203) / 20;
                                                    TOTAL103 = ((totalMaquinaria + TOTAL10 + TOTAL102) * meVO2.getValor()) / 100;
                                                    DEPRESIACION103 = (totalMaquinaria + TOTAL10 + TOTAL102 + TOTAL103) / 10;
                                                    total103 = ((totalMuebles + total10 + total102) * meVO2.getValor()) / 100;
                                                    depresiacion103 = (totalMuebles + total10 + total102 + total103) / 5;
                                                    TOTAL53 = ((totalTransporte + TOTAL5 + TOTAL52) * meVO2.getValor()) / 100;
                                                    DEPRESIACION53 = (totalTransporte + TOTAL5 + TOTAL52 + TOTAL53) / 10;
                                                    total53 = ((totalOficina + total5 + total52) * meVO2.getValor()) / 100;
                                                    depresiacion53 = (totalOficina + total5 + total52 + total53) / 5;
                                                    totalsemo3 = ((semovientes + totalsemo + totalsemo2) * meVO2.getValor()) / 100;
                                                    depresiacionsemo3 = (semovientes + totalsemo + totalsemo2 + totalsemo3) / 10;
                                                    totalculti3 = ((cultivos + totalculti + totalculti2) * meVO2.getValor()) / 100;
                                                    depresiacionculti3 = (cultivos + totalculti + totalculti2 + totalculti3) / 10;
                                                }
                                                if (mv2.getYear() == 4 && meVO2.getYear() == 4) {
                                                    total204 = ((totalTerrenos + total20 + total202 + total203) * mv2.getValor()) / 100;
                                                    TOTAL204 = ((totalConstrucion + TOTAL20 + TOTAL201 + TOTAL203) * meVO2.getValor()) / 100;
                                                    depresiacion204 = (totalConstrucion + TOTAL20 + TOTAL201 + TOTAL203 + TOTAL204) / 20;
                                                    TOTAL104 = ((totalMaquinaria + TOTAL10 + TOTAL102 + TOTAL103) * meVO2.getValor()) / 100;
                                                    DEPRESIACION104 = (totalMaquinaria + TOTAL10 + TOTAL102 + TOTAL103 + TOTAL104) / 10;
                                                    total104 = ((totalMuebles + total10 + total102 + total103) * meVO2.getValor()) / 100;
                                                    depresiacion104 = (totalMuebles + total10 + total102 + total103 + total104) / 5;
                                                    TOTAL54 = ((totalTransporte + TOTAL5 + TOTAL52 + TOTAL53) * meVO2.getValor()) / 100;
                                                    DEPRESIACION54 = (totalTransporte + TOTAL5 + TOTAL52 + TOTAL53 + TOTAL54) / 10;
                                                    total54 = ((totalOficina + total5 + total52 + total53) * meVO2.getValor()) / 100;
                                                    depresiacion54 = (totalOficina + total5 + total52 + total53 + total54) / 5;
                                                    totalsemo4 = ((semovientes + totalsemo + totalsemo2 + totalsemo3) * meVO2.getValor()) / 100;
                                                    depresiacionsemo4 = (semovientes + totalsemo + totalsemo2 + totalsemo3 + totalsemo4) / 10;
                                                    totalculti4 = ((cultivos + totalculti + totalculti2 + totalculti3) * meVO2.getValor()) / 100;
                                                    depresiacionculti4 = (cultivos + totalculti + totalculti2 + totalculti3 + totalculti4) / 10;
                                                }
                                                if (mv2.getYear() == 5 && meVO2.getYear() == 5) {
                                                    total205 = ((totalTerrenos + total20 + total202 + total203 + total204) * mv2.getValor()) / 100;
                                                    TOTAL205 = ((totalConstrucion + TOTAL20 + TOTAL201 + TOTAL203 + TOTAL204) * meVO2.getValor()) / 100;
                                                    depresiacion205 = (totalConstrucion + TOTAL20 + TOTAL201 + TOTAL203 + TOTAL204 + TOTAL205) / 20;
                                                    TOTAL105 = ((totalMaquinaria + TOTAL10 + TOTAL102 + TOTAL103 + TOTAL104) * meVO2.getValor()) / 100;
                                                    DEPRESIACION105 = (totalMaquinaria + TOTAL10 + TOTAL102 + TOTAL103 + TOTAL104 + TOTAL105) / 10;
                                                    total105 = ((totalMuebles + total10 + total102 + total103 + total104) * meVO2.getValor()) / 100;
                                                    depresiacion105 = (totalMuebles + total10 + total102 + total103 + total104 + total105) / 5;
                                                    TOTAL55 = ((totalTransporte + TOTAL5 + TOTAL52 + TOTAL53 + TOTAL54) * meVO2.getValor()) / 100;
                                                    DEPRESIACION55 = (totalTransporte + TOTAL5 + TOTAL52 + TOTAL53 + TOTAL54 + TOTAL55) / 10;
                                                    total55 = ((totalOficina + total5 + total52 + total53 + total54) * meVO2.getValor()) / 100;
                                                    depresiacion55 = (totalOficina + total5 + total52 + total53 + total54 + total55) / 5;
                                                    totalsemo5 = ((semovientes + totalsemo + totalsemo2 + totalsemo3 + totalsemo4) * meVO2.getValor()) / 100;
                                                    depresiacionsemo5 = (semovientes + totalsemo + totalsemo2 + totalsemo3 + totalsemo4 + totalsemo5) / 10;
                                                    totalculti5 = ((cultivos + totalculti + totalculti2 + totalculti3 + totalculti4) * meVO2.getValor()) / 100;
                                                    depresiacionculti5 = (cultivos + totalculti + totalculti2 + totalculti3 + totalculti4 + totalculti5) / 10;
                                                }
                                            }

                                        
                                                                              
                                        tmv.getKit();
                                        //      GastoCostoDAO gcDao = new GastoCostoDAO();
                                        InversionDiferidaDAO idDAO = new InversionDiferidaDAO();
                                        double ivdiferida = (idDAO.total(idp) / 5) / 2;
                                        double intentodetotal = (tmv.getKit() * (gcDao.Reporte(idp, 2) * 12)) / 100;
                                        double totalkit = (gcDao.Reporte(idp, 2) * 12) - intentodetotal;

                                        double totalcosotos = intentodetotal + ivdiferida + (gcDao.Reporte(idp, 3) * 12);
                                        double totalcostos2 = 0, totalcostos3 = 0, totalcostos4 = 0, totalcostos5 = 0;

                                    


                                                for (int i = 0; i < ma.size(); i++) {
                                            mv = ma.get(i);
                                            mv.getValor();
                                            if (mv.getYear() == 2) {
                                                totalcostos2 = ((totalcosotos * mv.getValor()) / 100) + totalcosotos;
                                            }
                                            if (mv.getYear() == 3) {
                                                totalcostos3 = ((totalcostos2 * mv.getValor()) / 100) + totalcostos2;
                                            }
                                            if (mv.getYear() == 4) {
                                                totalcostos4 = ((totalcostos3 * mv.getValor()) / 100) + totalcostos3;
                                            }
                                            if (mv.getYear() == 5) {
                                                totalcostos5 = ((totalcostos4 * mv.getValor()) / 100) + totalcostos4;
                                            }
                                        }
                                    
                                        double utilidadbruta = venta1 - rebaja1 - materiaprima - (depresiacion20 + DEPRESIACION10 + depresiacion10 + DEPRESIACION5 + depresiacion5) - (depresiacionsemo + depresiacionculti) - totalcosotos;
                                        double utilidadbruta2 = venta2 - rebaja2 - materiaprima2 - (depresiacion202 + DEPRESIACION102 + depresiacion102 + DEPRESIACION52 + depresiacion52) - (depresiacionsemo2 + depresiacionculti2) - totalcostos2;
                                        double utilidadbruta3 = venta3 - rebaja3 - materiaprima3 - (depresiacion203 + DEPRESIACION103 + depresiacion103 + DEPRESIACION53 + depresiacion53) - (depresiacionsemo3 + depresiacionculti3) - totalcostos3;
                                        double utilidadbruta4 = venta4 - rebaja4 - materiaprima4 - (depresiacion204 + DEPRESIACION104 + depresiacion104 + DEPRESIACION54 + depresiacion54) - (depresiacionsemo4 + depresiacionculti4) - totalcostos4;
                                        double utilidadbruta5 = venta5 - rebaja5 - materiaprima5 - (depresiacion205 + DEPRESIACION105 + depresiacion105 + DEPRESIACION55 + depresiacion55) - (depresiacionsemo5 + depresiacionculti5) - totalcostos5;

                                    
                                    
                                        double gastoventas = gcDao.Reporte(idp, 4);
                                        double gastoventas2 = 0, gastoventas3 = 0, gastoventas4 = 0, gastoventas5 = 0;
                                    

                                    
                                        for (int y = 0; y < ma.size(); y++) {
                                            mv = ma.get(y);
                                            mv.getValor();
                                            if (mv.getYear() == 2) {
                                                gastoventas2 = ((gastoventas * mv.getValor()) / 100) + gastoventas;
                                            }
                                            if (mv.getYear() == 3) {
                                                gastoventas3 = ((gastoventas2 * mv.getValor()) / 100) + gastoventas2;
                                            }
                                            if (mv.getYear() == 4) {
                                                gastoventas4 = ((gastoventas3 * mv.getValor()) / 100) + gastoventas3;
                                            }
                                            if (mv.getYear() == 5) {
                                                gastoventas5 = ((gastoventas4 * mv.getValor()) / 100) + gastoventas4;
                                            }
                                        }
                                   
                                        //   float elotrovalor = 100 - tmv.getKit();
                                        //   double intentodetotals = (tmv.getKit() * (gcDao.Reporte(idp, 2) * 12)) / 100;

                                        double totalremensuals = 0, totalreanuals = 0, totalaportes = 0, totalctas = 0, totalgastosVentas = 0;

                                        for (int z = 0; z < anomina2.size(); z++) {
                                            nomi2 = anomina2.get(z);

                                            double rmensuals = (nomi2.getCantidad() * nomi2.getMeses() * nomi2.getSalario()) / 12;
                                            double ranuals = rmensuals * 12;
                                            double aportes = (ranuals * (totalNomSum - tmv.getAjustes())) / 100;

                                            totalremensuals = rmensuals + totalremensuals;
                                            totalreanuals = ranuals + totalreanuals;
                                            totalaportes = aportes + totalaportes;
                                            totalctas = (ranuals + aportes) + totalctas;
                                        }

                                        double totaladministracion = ivdiferida + (gcDao.Reporte(idp, 5)) + totalkit + totalctas;
                                        double totaladministracion2 = 0, totaladministracion3 = 0, totaladministracion4 = 0, totaladministracion5 = 0;
                                    
                                    
                                        for (int y = 0; y < ma.size(); y++) {
                                            mv = ma.get(y);

                                            if (mv.getYear() == 2) {
                                                totaladministracion2 = ((totaladministracion * mv.getValor()) / 100) + totaladministracion;
                                            }
                                            if (mv.getYear() == 3) {
                                                totaladministracion3 = ((totaladministracion2 * mv.getValor()) / 100) + totaladministracion2;
                                            }
                                            if (mv.getYear() == 4) {
                                                totaladministracion4 = ((totaladministracion3 * mv.getValor()) / 100) + totaladministracion3;
                                            }
                                            if (mv.getYear() == 5) {
                                                totaladministracion5 = ((totaladministracion4 * mv.getValor()) / 100) + totaladministracion4;
                                            }

                                        }
                                    
                                        
                                            ArrayList<InfInsumoVO> idaoa1, idaoa2, insumo12;
                                            idaoa1 = iDao.Todo(idp, 2);
                                            idaoa2 = iDao.Todo(idp, 3);
                                             insumo12 = iDao.Todo(idp, 12);
                                            InfInsumoVO insu01, insu02, insu12; 
                                            double provi1 = 0, provi2 = 0, provi3 = 0, provi4 = 0, provi5 = 0;
                                            double p01 = 0, p02 = 0, p03 = 0, p04 = 0;
                                            for (int h = 0; h < idaoa1.size(); h++) {
                                                insu01 = idaoa1.get(h);
                                                insu02 = idaoa2.get(h);
                                                if (insu01.getYear() == 1) {
                                                    provi1 = (((venta1 * insu01.getValor()) / 360) * insu02.getValor()) / 100;
                                                }
                                                if (insu01.getYear() == 2) {
                                                    p01 = ((((venta2 * insu01.getValor()) / 360) * insu02.getValor()) / 100);
                                                    provi2 = p01 - provi1;
                                                }
                                                if (insu01.getYear() == 3) {
                                                    p02 = ((((venta3 * insu01.getValor()) / 360) * insu02.getValor()) / 100);
                                                    provi3 = p02 - p01;
                                                }
                                                if (insu01.getYear() == 4) {
                                                    p03 = ((((venta4 * insu01.getValor()) / 360) * insu02.getValor()) / 100);
                                                    provi4 = p03 - p02;
                                                }
                                                if (insu01.getYear() == 5) {
                                                    p04 = ((((venta5 * insu01.getValor()) / 360) * insu02.getValor()) / 100);
                                                    provi5 = p04 - p03;
                                                }
                                            }
                                        %>
                                        <td title="Disminución del valor de un bien material (suma de Depreciación Período de 
                                            (Construcciones y Edificios + Maquinaria y Equipo + Muebles y Enseres + Equipo de Transporte + Equipo de Oficina) )">Depreciación</td>
                                        <td><div class="text-right">$ <%=formato.format(depresiacion20 + DEPRESIACION10 + depresiacion10 + DEPRESIACION5 + depresiacion5)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(depresiacion202 + DEPRESIACION102 + depresiacion102 + DEPRESIACION52 + depresiacion52)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(depresiacion203 + DEPRESIACION103 + depresiacion103 + DEPRESIACION53 + depresiacion53)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(depresiacion204 + DEPRESIACION104 + depresiacion104 + DEPRESIACION54 + depresiacion54)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(depresiacion205 + DEPRESIACION105 + depresiacion105 + DEPRESIACION55 + depresiacion55)%></div></td>
                                    </tr>
                                    <tr>
                                        <td title="Disminución del valor de la tierra (Recuersos naturales) (suma de Amortización Período de (Activos biológicos (Agrícolas + Pecuarios)))">Agotamiento</td>
                                        <td><div class="text-right">$ <%=formato.format(depresiacionsemo + depresiacionculti)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(depresiacionsemo2 + depresiacionculti2)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(depresiacionsemo3 + depresiacionculti3)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(depresiacionsemo4 + depresiacionculti4)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(depresiacionsemo5 + depresiacionculti5)%></div></td>
                                    </tr>



                                    <tr>
                                        <td  title="Suma de Otros Costos de producción + servicios públicos (Producción) + (inversión diferida/2)">Otros Costos</td>
                                        <td><div class="text-right">$ <%=formato.format(totalcosotos)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(totalcostos2)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(totalcostos3)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(totalcostos4)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(totalcostos5)%></div></td>
                                    </tr>
                                    <tr class="info">
                                        <td title="La utilidad bruta es la diferencia entre los ingresos de una empresa por la venta de bienes y servicios en un periodo de tiempo determinado y lo que cuesta producir esos bienes y servicios. Se divide entre el total de ingresos sobre ventas para dar un porcentaje, o el margen de utilidad bruta
                                            (Ventas-Devoluciones y rebajas en ventas-Materia Prima y Mano de Obra-Depreciación-Agotamiento-Otros Costos)">Utilidad Bruta</td>
                                        <td><div class="text-right">$ <%=formato.format(utilidadbruta)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(utilidadbruta2)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(utilidadbruta3)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(utilidadbruta4)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(utilidadbruta5)%></div></td>
                                    </tr>

  
                                    <tr>  
                                        <td title="Valor total anual de Gastos de Ventas">Gasto de Ventas</td>
                                        <td><div class="text-right">$ <%=formato.format(gastoventas)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(gastoventas2)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(gastoventas3)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(gastoventas4)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(gastoventas5)%></div></td>
                                    </tr>

                                    <tr>
                                        <td title="suma de Nómina Admin + Otros Gastos + 
                                            servicios públicos (Administración) + (Inversión Diferida/2)">Gastos de Administración</td>
                                        <td><div class="text-right">$ <%=formato.format(totaladministracion)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(totaladministracion2)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(totaladministracion3)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(totaladministracion4)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(totaladministracion5)%></div></td>
                                    </tr>
                                    <tr>
                                        <td title="Una provisión es una cuenta de pasivo y consiste en establecer y 'guardar' una cantidad de recursos como un gasto para estar preparados por si realmente se produjese el pago de una obligación que la empresa ya ha contraído con anterioridad">Provisiones</td>
                                        <td><div class="text-right">$ <%=formato.format(provi1)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(provi2)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(provi3)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(provi4)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(provi5)%></div></td>
                                    </tr>
                                    <tr>
                                        <td title="Inversión Intangible / 5">Amortización Gastos</td>
                                        <td title="Inversión Intangible / 5"><div class="text-right">$ <%=formato.format(idDAO.total(idp) / 5)%></div></td>
                                        <td title="Inversión Intangible / 5"><div class="text-right">$ <%=formato.format(idDAO.total(idp) / 5)%></div></td>
                                        <td title="Inversión Intangible / 5"><div class="text-right">$ <%=formato.format(idDAO.total(idp) / 5)%></div></td>
                                        <td title="Inversión Intangible / 5"><div class="text-right">$ <%=formato.format(idDAO.total(idp) / 5)%></div></td>
                                        <td title="Inversión Intangible / 5"><div class="text-right">$ <%=formato.format(idDAO.total(idp) / 5)%></div></td>
                                    </tr>
                                    <%
                                        double utilidadoperativo = utilidadbruta - (gastoventas + totaladministracion + provi1 + (idDAO.total(idp) / 5));
                                        double utilidadoperativo2 = utilidadbruta2 - (gastoventas2 + totaladministracion2 + provi2 + (idDAO.total(idp) / 5));
                                        double utilidadoperativo3 = utilidadbruta3 - (gastoventas3 + totaladministracion3 + provi3 + (idDAO.total(idp) / 5));
                                        double utilidadoperativo4 = utilidadbruta4 - (gastoventas4 + totaladministracion4 + provi4 + (idDAO.total(idp) / 5));
                                        double utilidadoperativo5 = utilidadbruta5 - (gastoventas5 + totaladministracion5 + provi5 + (idDAO.total(idp) / 5));

                                    %>
                                    <tr class="info">
                                        <td title="La utilidad operacional se refiere única y exclusivamente a los ingresos y gastos operacionales, dejando de lado los gastos e ingresos no operacionales 
                                            (Utilidad Bruta-(Gasto de Ventas + Gastos de Administracion + Provisiones + Amortización Gastos))">Utilidad Operativa</td>
                                        <td><div class="text-right">$ <%=formato.format(utilidadoperativo)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(utilidadoperativo2)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(utilidadoperativo3)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(utilidadoperativo4)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(utilidadoperativo5)%></div></td>
                                    </tr>

                                    <%
                                        //  tmv.getCapitalTrabajo();
                                        float dias_year =5; 
                                       double tasainteres = tmv.getCapitalTrabajo() / 100;
                                        double obligacionfinanciera = fin.Reporte2(idp, 7);
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

                                    <tr>
                                        <td>Intereses</td>
                                        <td><div class="text-right">$ <%=formato.format(interes)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(interes2)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(interes3)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(interes4)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(interes5)%></div></td>
                                    </tr>
                             
                                    <tr>
                                        <td title="Intereses sobre saldo (crédito)">Otros ingresos y egresos</td>
                                        <td><div class="text-right">$ <%=formato.format(0-interes)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(0-interes2)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(0-interes3)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(0-interes4)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(0-interes5)%></div></td>
                                    </tr>


                                    <%                                                    double ajusdepre = 0, ajusdepre2 = 0, ajusdepre3 = 0, ajusdepre4 = 0, ajusdepre5 = 0;
                                        double Ajusdepre = 0, Ajusdepre2 = 0, Ajusdepre3 = 0, Ajusdepre4 = 0, Ajusdepre5 = 0;
                                        double Ajusdepre0 = 0, Ajusdepre02 = 0, Ajusdepre03 = 0, Ajusdepre04 = 0, Ajusdepre05 = 0;
                                        double ajusdepre0 = 0, ajusdepre02 = 0, ajusdepre03 = 0, ajusdepre04 = 0, ajusdepre05 = 0;
                                        double suAjusteDepre = 0, suAjusteDepre2 = 0, suAjusteDepre3 = 0, suAjusteDepre4 = 0, suAjusteDepre5 = 0;
                                        double ajussemo2 = 0, ajussemo3 = 0, ajussemo4 = 0, ajussemo5 = 0;
                                        double ajussemo02 = 0, ajussemo03 = 0, ajussemo04 = 0, ajussemo05 = 0;

                                        mo = m.todito(3);

                                      /*  for (int h = 0; h < mo.size(); h++) {
                                            MV = mo.get(h);

                                            if (MV.getYear() == 2) {
                                                suAjusteDepre2 = (depresiacion20 * MV.getValor()) / 100;
                                                ajusdepre2 = ((depresiacion10 * MV.getValor()) / 100);
                                                ajusdepre02 = ((DEPRESIACION10 * MV.getValor()) / 100);
                                                Ajusdepre2 = (depresiacion5 * MV.getValor()) / 100;
                                                Ajusdepre02 = (DEPRESIACION5 * MV.getValor()) / 100;
                                                ajussemo2 = (depresiacionsemo * MV.getValor()) / 100;
                                                ajussemo02 = (depresiacionculti * MV.getValor()) / 100;

                                            }
                                            if (MV.getYear() == 3) {
                                                suAjusteDepre3 = ((depresiacion202 + depresiacion20 + suAjusteDepre2) * MV.getValor()) / 100;
                                                ajusdepre3 = (((depresiacion102 + depresiacion10 + ajusdepre2) * MV.getValor()) / 100);
                                                ajusdepre03 = (((DEPRESIACION102 + DEPRESIACION10 + ajusdepre02) * MV.getValor()) / 100);
                                                Ajusdepre3 = ((depresiacion52 + depresiacion5 + Ajusdepre2) * MV.getValor()) / 100;
                                                Ajusdepre03 = ((DEPRESIACION52 + DEPRESIACION5 + Ajusdepre02) * MV.getValor()) / 100;
                                                ajussemo3 = ((depresiacionsemo2 + depresiacionsemo + ajussemo2) * MV.getValor()) / 100;
                                                ajussemo03 = ((depresiacionculti + depresiacionculti2 + ajussemo02) * MV.getValor()) / 100;

                                            }
                                            if (MV.getYear() == 4) {
                                                suAjusteDepre4 = ((depresiacion202 + depresiacion20 + suAjusteDepre2 + depresiacion203 + suAjusteDepre3) * MV.getValor()) / 100;
                                                ajusdepre4 = (((depresiacion103 + depresiacion102 + depresiacion10 + ajusdepre2 + ajusdepre3) * MV.getValor()) / 100);
                                                ajusdepre04 = (((DEPRESIACION103 + DEPRESIACION102 + DEPRESIACION10 + ajusdepre02 + ajusdepre03) * MV.getValor()) / 100);
                                                Ajusdepre4 = ((depresiacion53 + depresiacion52 + depresiacion5 + Ajusdepre2 + Ajusdepre3) * MV.getValor()) / 100;
                                                Ajusdepre04 = ((DEPRESIACION53 + DEPRESIACION52 + DEPRESIACION5 + Ajusdepre02 + Ajusdepre03) * MV.getValor()) / 100;
                                                ajussemo4 = ((depresiacionsemo3 + depresiacionsemo2 + depresiacionsemo + ajussemo2 + ajussemo3) * MV.getValor()) / 100;
                                                ajussemo04 = ((depresiacionculti3 + depresiacionculti + depresiacionculti2 + ajussemo02 + ajussemo03) * MV.getValor()) / 100;

                                            }
                                            if (MV.getYear() == 5) {
                                                suAjusteDepre5 = ((depresiacion202 + depresiacion20 + suAjusteDepre2 + depresiacion203 + suAjusteDepre3 + depresiacion204 + suAjusteDepre4) * MV.getValor()) / 100;
                                                ajusdepre5 = (((depresiacion104 + depresiacion103 + depresiacion102 + depresiacion10 + ajusdepre2 + ajusdepre3 + ajusdepre4) * MV.getValor()) / 100);
                                                ajusdepre05 = (((DEPRESIACION104 + DEPRESIACION103 + DEPRESIACION102 + DEPRESIACION10 + ajusdepre02 + ajusdepre03 + ajusdepre04) * MV.getValor()) / 100);
                                                Ajusdepre5 = ((depresiacion54 + depresiacion53 + depresiacion52 + depresiacion5 + Ajusdepre2 + Ajusdepre3 + Ajusdepre4) * MV.getValor()) / 100;
                                                Ajusdepre05 = ((DEPRESIACION54 + DEPRESIACION53 + DEPRESIACION52 + DEPRESIACION5 + Ajusdepre02 + Ajusdepre03 + Ajusdepre04) * MV.getValor()) / 100;
                                                ajussemo5 = ((depresiacionsemo4 + depresiacionsemo3 + depresiacionsemo2 + depresiacionsemo + ajussemo2 + ajussemo3 + ajussemo4) * MV.getValor()) / 100;
                                                ajussemo05 = ((depresiacionculti3 + depresiacionculti4 + depresiacionculti + depresiacionculti2 + ajussemo02 + ajussemo03 + ajussemo04) * MV.getValor()) / 100;

                                            }
                                        }
*/

                                    %>
                                    
                                    <%                                        double utilidadAI = utilidadoperativo + (-interes) ;
                                        double utilidadAI2 = utilidadoperativo2 + (-interes2);
                                        double utilidadAI3 = utilidadoperativo3 + (-interes3);
                                        double utilidadAI4 = utilidadoperativo4 + (-interes4);
                                        double utilidadAI5 = utilidadoperativo5 + (-interes5);
                                    
                                    
                                        double impuestos = 0;
                                        double impuestos2 = (utilidadAI2 * tmv.getImpuestos()) / 100;
                                        double impuestos3 = (utilidadAI3 * tmv.getImpuestos()) / 100;
                                        double impuestos4 = (utilidadAI4 * tmv.getImpuestos()) / 100;
                                        double impuestos5 = (utilidadAI5 * tmv.getImpuestos()) / 100;

                                    
                                                                            double utilidadneta = 0;
                                        double utilidadneta2 = utilidadAI2 - (impuestos2);
                                        double utilidadneta3 = utilidadAI3 - (impuestos3);
                                        double utilidadneta4 = utilidadAI4 - (impuestos4);
                                        double utilidadneta5 = utilidadAI5 - (impuestos5);


                                    %>
                                    <%                                        ArrayList<InfInsumoVO> inf = new ArrayList();
                                        InfInsumoVO ifivo, ifV, ifV2, ifV3, ifV4;
                                        inf = iDao.Todo(idp, 11);

                                        double capital = fin.Reporte(idp);
                                        double Totalpatrimonio = 0, otroCalorpatrimonio = 0, patrimonio3 = 0, patrimonio4 = 0, patrimonio5 = 0;
                                        me = m.todito(2);
                                        for (int g = 0; g < me.size(); g++) {
                                            mv2 = me.get(g);
                                            ifivo = inf.get(0);
                                            ifV = inf.get(1);
                                            ifV2 = inf.get(2);
                                            ifV3 = inf.get(3);
                                            ifV4 = inf.get(4);

                                            Totalpatrimonio = (capital + ifivo.getValor());
                                            //* mv2.getValor())/100;
                                            otroCalorpatrimonio = Totalpatrimonio + ifV.getValor();
                                            patrimonio3 = otroCalorpatrimonio + ifV2.getValor();
                                            patrimonio4 = patrimonio3 + ifV3.getValor();
                                            patrimonio5 = patrimonio4 + ifV4.getValor();
                                        }
                                    %>
                                    <%
                                        
                                        double dividendo = 0, dividendo2 = 0, dividendo3 = 0, dividendo4 = 0, dividendo5 = 0;
                                     
                                        //revalorizacion de patrimonio  
                                        for (int g = 0; g < mo.size(); g++) {
                                            MV = mo.get(g);
                                             insu12 = insumo12.get(g); 
                                            if (MV.getYear() == 1) {
                                                
                                               
                                                impuestos = (utilidadAI * tmv.getImpuestos()) / 100;
                                                utilidadneta = utilidadAI - (impuestos);
                                               
                                                 dividendo = (utilidadneta * insu12.getValor()) / 100;
                                            }
                                            if (MV.getYear() == 2) {
                                               
                                                
                                                impuestos2 = (utilidadAI2 * tmv.getImpuestos()) / 100;
                                                utilidadneta2 = utilidadAI2 - (impuestos2);
                                               
                                                dividendo2 = (utilidadneta2 * insu12.getValor()) / 100;
                                            }
                                            if (MV.getYear() == 3) {
                                                
                                                impuestos3 = (utilidadAI3 * tmv.getImpuestos()) / 100;
                                                utilidadneta3 = utilidadAI3 - (impuestos3);
                                               
                                                dividendo3 = (utilidadneta3 * insu12.getValor()) / 100; 
                                               
                                            }
                                            if (MV.getYear() == 4) {
                                                
                                                impuestos4 = (utilidadAI4 * tmv.getImpuestos()) / 100;
                                                utilidadneta4 = utilidadAI4 - (impuestos4);
                                              
                                                dividendo4 = (utilidadneta4 * insu12.getValor()) / 100;
                                            }
                                            if (MV.getYear() == 5) {
                                               
                                                impuestos5 = (utilidadAI5 * tmv.getImpuestos()) / 100;
                                                utilidadneta5 = utilidadAI5 - (impuestos5);
                                              
                                                dividendo5 = (utilidadneta5 * insu12.getValor()) / 100;
                                            }
                                        }

                                      
                                    %>
                                    
                                  

                            <%--           <tr>
                                        <td>Ajuste Depreciación Acumulada</td>
                                        <td><div class="text-right">$ <%=formato.format(0)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(0-suAjusteDepre2 - ajusdepre2 - ajusdepre02 - Ajusdepre02 - Ajusdepre2)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(0-suAjusteDepre3 - ajusdepre3 - ajusdepre03 - Ajusdepre03 - Ajusdepre3)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(0-suAjusteDepre4 - ajusdepre4 - ajusdepre04 - Ajusdepre04 - Ajusdepre4)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(0-suAjusteDepre5 - ajusdepre5 - ajusdepre05 - Ajusdepre05 - Ajusdepre5)%></div></td>
                                    </tr>
                                         <tr class="danger">
                                                <td>Ajuste Amortización Acumulada</td>
                                                <td><div class="text-right">$ 0</div></td>
                                                <td><div class="text-right">$ 0</div></td>
                                                <td><div class="text-right">$ 0</div></td>
                                                <td><div class="text-right">$ 0</div></td>
                                                <td><div class="text-right">$ 0</div></td>
                                            </tr>
                                    <tr>
                                        <td>Ajuste Agotamiento Acumulada</td>
                                        <td><div class="text-right">$ 0</div></td>
                                        <td><div class="text-right">$ <%=formato.format(0-ajussemo2 - ajussemo02)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(0-ajussemo3 - ajussemo03)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(0-ajussemo4 - ajussemo04)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(0-ajussemo5 - ajussemo05)%></div></td>
                                    </tr>
                            --%>
                            

                                  

                                    <tr class="info">
                                        <td title="Utilidad Operativa + Otros ingresos y egresos">Utilidad antes de impuestos</td>
                                        <td><div class="text-right">$ <%=formato.format(utilidadAI)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(utilidadAI2)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(utilidadAI3)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(utilidadAI4)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(utilidadAI5)%></div></td>
                                    </tr>
                                    <tr class="success">
                                        <td>Impuestos</td>
                                        <td><div class="text-right">$ <%=formato.format(impuestos)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(impuestos2)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(impuestos3)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(impuestos4)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(impuestos5)%></div></td>
                                    </tr>
                                    <tr class="info">
                                        <td title="la utilidad resultante después de restar y sumar de la utilidad operacional, los gastos e Ingresos no operacionales respectivamente, los impuestos y la reserva legal. Es la utilidad que efectivamente se distribuye a los socios
                                             (Utilidad antes de impuestos - Impuestos)">Utilidad Neta Final</td>
                                        <td><div class="text-right">$ <%=formato.format(utilidadneta)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(utilidadneta2)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(utilidadneta3)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(utilidadneta4)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(utilidadneta5)%></div></td>
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
        <script src="../js/menu.js" type="text/javascript"></script>
        <script src="../js/sweetalert.min.js" type="text/javascript"></script>
        <script src="../js/jquery.PrintArea.js" type="text/javascript"></script>
        <script src="../js/ajax/Temporal.js" type="text/javascript"></script>
        <script src="../js/jquery-ui.min.js" type="text/javascript"></script>
        <script type="text/javascript">
                                    $("#btnImp").click(function () {
                                        $("div#areaImp").printArea();
                                    });
                                    $(document).tooltip();
                                    
        </script> 
    </body>
    <%}
    } catch (NullPointerException nule) { %>
    <script>

        swal({
            title: 'Error!',
            text: "Aun te faltan campos por llenar",
            type: "error",
            showCancelButton: false,
            showConfirmButton: true,
            textConfirmButton: "Entendido!",
            closeOnConfirm: false

        },
                function () {

                    window.location.href = '../inicio.jsp';

                });
    </script>
    <%   }%>
</html>
