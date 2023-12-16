<%-- 
    Document   : InfInsumo
    Created on : 28/11/2016, 01:26:00 PM
    Author     : mayrayesenia
--%>

<%@page import="VO.InversionVO"%>
<%@page import="VO.TipoGastoCostoVO"%>
<%@page import="DAO.TipoGastoCostoDAO"%>
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
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Inf Insumo</title>
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
            DecimalFormat formato2 = new DecimalFormat("###,###,###.##");
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
                                    <div class="col-md-6 col-xs-5" align="right">
                                        <br><img src="../img/Mis_Iconos/inf_insumos.png" alt="" class="dos"/>
                                    </div>
                                    <div class="col-md-6 col-xs-6" align="left">
                                        <h1 >Inf. Insumos</h1>
                                        <h3 >(<%=pv.getNombreP()%>)</h3><br>
                                    </div>
                                </div>
                                <%

                                    double venta1 = 0, venta2 = 0, venta3 = 0, venta4 = 0, venta5 = 0, suma1 = 0;
                                    double cuentacobrar = 0, cuentacobrar2 = 0, cuentacobrar3 = 0, cuentacobrar4 = 0, cuentacobrar5 = 0;
                                    double provicioncobrar = 0, provicioncobrar2 = 0, provicioncobrar3 = 0, provicioncobrar4 = 0, provicioncobrar5 = 0;
                                    //insumos
                                    InfInsumoDAO iDao = new InfInsumoDAO();
                                    //gastos
                                    GastoCostoDAO gcDao = new GastoCostoDAO();
                                    //precio
                                    PrecioProductosVO ppvo;
                                    PrecioProductosDAO ppdao = new PrecioProductosDAO();
                                    ArrayList<PrecioProductosVO> ppal = new ArrayList();
                                    //proyeccion
                                    ProyeccionVentasVO pvVO;
                                    ProyeccionVentasDAO pvDAO = new ProyeccionVentasDAO();
                                    ArrayList<ProyeccionVentasVO> pvvv = new ArrayList();
                                    //PRODUCTO
                                    ProductoDAO prd = new ProductoDAO();
                                    ProductoVO prv;
                                    ArrayList<ProductoVO> prA = new ArrayList();
                                    prA = prd.todos(idp);
                                    //financiacion
                                    FinanciacionDAO fin = new FinanciacionDAO();
                                    //macroeconomia
                                    MacroeconomicoDAO m = new MacroeconomicoDAO();
                                    MacroeconomicoVO mv, mv2, MV;
                                    ArrayList<MacroeconomicoVO> ma, me, mi, mo;
                                    ma = m.todito(1);
                                    mo = m.todito(3);
                                    //inversion diferida
                                    InversionDiferidaDAO idDAO = new InversionDiferidaDAO();

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
                                    double totalNomSum = tmv.getAjustes() + gs.getCesantias() + gs.getInteresesCesantias() + gs.getPrimaServicios() + gs.getVacaciones() + gs.getCajaCompensacion() + gs.getEPSalud() + gs.getPension() + gs.getRiesgos();

                                    //gasto costo
                                    double totalremensual = 0, totalreanual = 0, totalaporte = 0, totalcta = 0, totalproducto = 0;
                                    double invmateria = 0, invmateria2 = 0, invmateria3 = 0, invmateria4 = 0, invmateria5 = 0;
                                    InfInsumoVO insumoVO, insumoVO2, ins3, insu4, insu5, insu6, insu7, insu8, insu9, insu10, insu11, insu12;
                                    ArrayList<InfInsumoVO> infinsumito, infinsumito2, insumo2, insumo3, insumo4, insumo5, insumo6, insumo7, insumo8, insumo9, insumo10, insumo11, insumo12;

                                    infinsumito2 = iDao.Todo(idp, 1);
                                    infinsumito = iDao.Todo(idp, 2);
                                    insumo2 = iDao.Todo(idp, 3);
                                    insumo4 = iDao.Todo(idp, 4);
                                    insumo11 = iDao.Todo(idp, 5);
                                    insumo3 = iDao.Todo(idp, 6);
                                    insumo5 = iDao.Todo(idp, 7);
                                    insumo7 = iDao.Todo(idp, 8);
                                    insumo8 = iDao.Todo(idp, 9);
                                    insumo9 = iDao.Todo(idp, 10);
                                    insumo10 = iDao.Todo(idp, 11);
                                    insumo12 = iDao.Todo(idp, 12);
                                    insumo6 = iDao.Todo(idp, 13);

                                    double manodeobra2 = 0, manodeobra3 = 0, manodeobra4 = 0, manodeobra5 = 0;
                                    double manodeobra02 = 0, manodeobra03 = 0, manodeobra04 = 0, manodeobra05 = 0;
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
                                    double CarteraClientes = 0, CarteraClientes2 = 0, CarteraClientes3 = 0, CarteraClientes4 = 0, CarteraClientes5 = 0;
                                    double ProvicionCuentasCobrar = 0, ProvicionCuentasCobrar2 = 0, ProvicionCuentasCobrar3 = 0, ProvicionCuentasCobrar4 = 0, ProvicionCuentasCobrar5 = 0;
                                    double totalremensuals = 0, totalreanuals = 0, totalaportes = 0, totalctas = 0, totalgastosVentas = 0;
                                    double preciopromedio = 0, preciopromedio2 = 0, preciopromedio3 = 0, preciopromedio4 = 0, preciopromedio5 = 0;
                                    double ventasdetodo = 0, ventasdetodo2 = 0, ventasdetodo3 = 0, ventasdetodo4 = 0, ventasdetodo5 = 0;
                                    double materiaRotacion = 0, materiaRotacion2 = 0, materiaRotacion3 = 0, materiaRotacion4 = 0, materiaRotacion5 = 0;
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
                                    double mateprimeacos = 0, mateprimeacos2 = 0, mateprimeacos3 = 0, mateprimeacos4 = 0, mateprimeacos5 = 0;
                                    double manodeobraprom = 0, manodeobraprom2 = 0, manodeobraprom3 = 0, manodeobraprom4 = 0, manodeobraprom5 = 0;

                                    for (int i = 0; i < prA.size(); i++) {
                                        prv = prA.get(i);
                                        pvvv = pvDAO.todo(prv.getIdProducto());

                                        //costos de mano de obra :c
                                        double totalproductos = costosDAO.total(prv.getIdProducto());
                                        totalproducto = totalproducto + totalproductos;

                                        ppal = ppdao.todo(prv.getIdProducto());
                                        for (int t = 0; t < pvvv.size(); t++) {
                                            pvVO = pvvv.get(t);
                                            if (ppal.isEmpty()) {
                                                response.sendRedirect("Producto.jsp");
                                                return;
                                            }
                                            for (int j = 0; j < ppal.size(); j++) {
                                                ppvo = ppal.get(j);
                                                if (pvVO.getYear() == 1 && ppvo.getYear() == 1) {
                                                    insumoVO = infinsumito.get(0);
                                                    insumoVO2 = insumo2.get(0);
                                                    ins3 = insumo3.get(0);
                                                    suma1 = suma1 + pvVO.getProyeccion();
                                                    venta1 = (pvVO.getProyeccion() * ppvo.getPrecio()) + venta1;
                                                    ventasdetodo = ventasdetodo + pvVO.getProyeccion();
                                                    preciopromedio = venta1 / (ventasdetodo);
                                                    cuentacobrar = (venta1 * insumoVO.getValor()) / 360;
                                                    provicioncobrar = (cuentacobrar * insumoVO2.getValor()) / 100;
                                                    mateprimeacos = totalproducto / ventasdetodo;
                                                    invmateria = (totalproducto * ins3.getValor()) / 360;
                                                    materiaRotacion = materiaRotacion + ins3.getValor();
                                                    ProvicionCuentasCobrar = ProvicionCuentasCobrar + insumoVO2.getValor();
                                                    CarteraClientes = CarteraClientes + insumoVO.getValor();
                                                }
                                                if (pvVO.getYear() == 2 && ppvo.getYear() == 2) {
                                                    mv = ma.get(1);
                                                    insumoVO2 = insumo2.get(1);
                                                    insumoVO = infinsumito.get(1);
                                                    ins3 = insumo3.get(1);
                                                    ventasdetodo2 = ventasdetodo2 + pvVO.getProyeccion();
                                                    venta2 = (pvVO.getProyeccion() * ppvo.getPrecio()) + venta2;
                                                    preciopromedio2 = venta2 / (ventasdetodo2);
                                                    cuentacobrar2 = (venta2 * insumoVO.getValor()) / 360;
                                                    provicioncobrar2 = (cuentacobrar2 * insumoVO2.getValor()) / 100;
                                                    ProvicionCuentasCobrar2 = ProvicionCuentasCobrar2 + insumoVO2.getValor();
                                                    CarteraClientes2 = CarteraClientes2 + insumoVO.getValor();
                                                    manodeobra02 = mv.getValor();
                                                    mateprimeacos2 = ((mateprimeacos * manodeobra02) / 100) + mateprimeacos;
                                                    manodeobra2 = mateprimeacos2 * ventasdetodo2;
                                                    invmateria2 = (manodeobra2 * ins3.getValor()) / 360;
                                                    materiaRotacion2 = materiaRotacion2 + ins3.getValor();
                                                }
                                                if (pvVO.getYear() == 3 && ppvo.getYear() == 3) {
                                                    insumoVO2 = insumo2.get(2);
                                                    insumoVO = infinsumito.get(2);
                                                    ins3 = insumo3.get(2);
                                                    mv = ma.get(2);

                                                    ventasdetodo3 = ventasdetodo3 + pvVO.getProyeccion();
                                                    venta3 = (pvVO.getProyeccion() * ppvo.getPrecio()) + venta3;
                                                    preciopromedio3 = venta3 / (ventasdetodo3);
                                                    cuentacobrar3 = (venta3 * insumoVO.getValor()) / 360;
                                                    provicioncobrar3 = (cuentacobrar3 * insumoVO2.getValor()) / 100;
                                                    manodeobra03 = mv.getValor();
                                                    mateprimeacos3 = ((mateprimeacos2 * manodeobra03) / 100) + mateprimeacos2;
                                                    manodeobra3 = mateprimeacos3 * ventasdetodo3;
                                                    invmateria3 = (manodeobra3 * ins3.getValor()) / 360;
                                                    ProvicionCuentasCobrar3 = ProvicionCuentasCobrar3 + insumoVO2.getValor();
                                                    CarteraClientes3 = CarteraClientes3 + insumoVO.getValor();
                                                    materiaRotacion3 = materiaRotacion3 + ins3.getValor();
                                                }
                                                if (pvVO.getYear() == 4 && ppvo.getYear() == 4) {
                                                    insumoVO2 = insumo2.get(3);
                                                    insumoVO = infinsumito.get(3);
                                                    ins3 = insumo3.get(3);
                                                    mv = ma.get(3);

                                                    ventasdetodo4 = ventasdetodo4 + pvVO.getProyeccion();
                                                    venta4 = (pvVO.getProyeccion() * ppvo.getPrecio()) + venta4;
                                                    preciopromedio4 = venta4 / (ventasdetodo4);
                                                    cuentacobrar4 = (venta4 * insumoVO.getValor()) / 360;
                                                    manodeobra04 = mv.getValor();
                                                    provicioncobrar4 = (cuentacobrar4 * insumoVO2.getValor()) / 100;
                                                    mateprimeacos4 = ((mateprimeacos3 * manodeobra04) / 100) + mateprimeacos3;
                                                    manodeobra4 = mateprimeacos4 * ventasdetodo4;
                                                    invmateria4 = (manodeobra4 * ins3.getValor()) / 360;
                                                    ProvicionCuentasCobrar4 = ProvicionCuentasCobrar4 + insumoVO2.getValor();
                                                    CarteraClientes4 = CarteraClientes4 + insumoVO.getValor();
                                                    materiaRotacion4 = materiaRotacion4 + ins3.getValor();
                                                }
                                                if (pvVO.getYear() == 5 && ppvo.getYear() == 5) {
                                                    insumoVO2 = insumo2.get(4);
                                                    insumoVO = infinsumito.get(4);
                                                    mv = ma.get(4);
                                                    ins3 = insumo3.get(4);

                                                    ventasdetodo5 = ventasdetodo5 + pvVO.getProyeccion();
                                                    venta5 = (pvVO.getProyeccion() * ppvo.getPrecio()) + venta5;
                                                    preciopromedio5 = venta5 / (ventasdetodo5);
                                                    cuentacobrar5 = (venta5 * insumoVO.getValor()) / 360;
                                                    manodeobra05 = mv.getValor();
                                                    provicioncobrar5 = (cuentacobrar5 * insumoVO2.getValor()) / 100;
                                                    mateprimeacos5 = ((mateprimeacos4 * manodeobra05) / 100) + mateprimeacos4;
                                                    manodeobra5 = mateprimeacos5 * ventasdetodo5;
                                                    invmateria5 = (manodeobra5 * ins3.getValor()) / 360;
                                                    ProvicionCuentasCobrar5 = ProvicionCuentasCobrar5 + insumoVO2.getValor();
                                                    CarteraClientes5 = CarteraClientes5 + insumoVO.getValor();
                                                    materiaRotacion5 = materiaRotacion5 + ins3.getValor();
                                                }
                                            }

                                        }
                                    }

                                %>
                                <%                                    double materiaprima = 0, materiaprima2 = 0, materiaprima3 = 0, materiaprima4 = 0, materiaprima5 = 0;

                                    me = m.todito(1);
                                    manodeobraprom = (totalcta + (gcDao.Reporte(idp, 1) * 12)) / ventasdetodo;
                                    manodeobraprom2 = ((totalcta + (gcDao.Reporte(idp, 1) * 12)) / ventasdetodo) * (1 + (manodeobra02 / 100));
                                    manodeobraprom3 = (((totalcta + (gcDao.Reporte(idp, 1) * 12)) / ventasdetodo) * (1 + (manodeobra02 / 100))) * (1 + (manodeobra03 / 100));
                                    manodeobraprom4 = ((((totalcta + (gcDao.Reporte(idp, 1) * 12)) / ventasdetodo) * (1 + (manodeobra02 / 100))) * (1 + (manodeobra03 / 100))) * (1 + (manodeobra04 / 100));
                                    manodeobraprom5 = (((((totalcta + (gcDao.Reporte(idp, 1) * 12)) / ventasdetodo) * (1 + (manodeobra02 / 100))) * (1 + (manodeobra03 / 100))) * (1 + (manodeobra04 / 100))) * (1 + (manodeobra05 / 100));

                                    materiaprima = totalcta + totalproducto + (gcDao.Reporte(idp, 1) * 12);

                                    materiaprima2 = (manodeobraprom2 * ventasdetodo2) + manodeobra2;
                                    materiaprima3 = (manodeobraprom3 * ventasdetodo3) + manodeobra3;
                                    materiaprima4 = (manodeobraprom4 * ventasdetodo4) + manodeobra4;
                                    materiaprima5 = (manodeobraprom5 * ventasdetodo5) + manodeobra5;

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

                                    double inventariosp = 0, inventariosp2 = 0, inventariosp3 = 0, inventariosp4 = 0, inventariosp5 = 0;
                                    inventariosp = materiaprima + depresiacion20 + DEPRESIACION10 + depresiacion10 + DEPRESIACION5 + depresiacion5 + depresiacionsemo + depresiacionculti;
                                    inventariosp2 = materiaprima2 + depresiacion202 + DEPRESIACION102 + depresiacion102 + DEPRESIACION52 + depresiacion52 + depresiacionsemo2 + depresiacionculti2;
                                    inventariosp3 = materiaprima3 + depresiacion203 + DEPRESIACION103 + depresiacion103 + DEPRESIACION53 + depresiacion53 + depresiacionsemo3 + depresiacionculti3;
                                    inventariosp4 = materiaprima4 + depresiacion204 + DEPRESIACION104 + depresiacion104 + DEPRESIACION54 + depresiacion54 + depresiacionsemo4 + depresiacionculti4;
                                    inventariosp5 = materiaprima5 + depresiacion205 + DEPRESIACION105 + depresiacion105 + DEPRESIACION55 + depresiacion55 + depresiacionsemo5 + depresiacionculti5;

                                %>
                                <%  double invenproducto = 0, invenproducto2 = 0, invenproducto3 = 0, invenproducto5 = 0, invenproducto4 = 0;
                                    double invenproducto0 = 0, invenproducto02 = 0, invenproducto03 = 0, invenproducto05 = 0, invenproducto04 = 0;
                                    for (int t = 0; t < insumo4.size(); t++) {
                                        insu4 = insumo4.get(t);
                                        if (insu4.getYear() == 1) {
                                            invenproducto = (inventariosp * insu4.getValor()) / 360;
                                            invenproducto0 = invenproducto0 + insu4.getValor();
                                        }
                                        if (insu4.getYear() == 2) {
                                            invenproducto2 = (inventariosp2 * insu4.getValor()) / 360;
                                            invenproducto02 = invenproducto02 + insu4.getValor();
                                        }
                                        if (insu4.getYear() == 3) {
                                            invenproducto3 = (inventariosp3 * insu4.getValor()) / 360;
                                            invenproducto03 = invenproducto03 + insu4.getValor();
                                        }
                                        if (insu4.getYear() == 4) {
                                            invenproducto4 = (inventariosp4 * insu4.getValor()) / 360;
                                            invenproducto04 = invenproducto04 + insu4.getValor();
                                        }
                                        if (insu4.getYear() == 5) {
                                            invenproducto5 = (inventariosp5 * insu4.getValor()) / 360;
                                            invenproducto05 = invenproducto05 + insu4.getValor();
                                        }
                                    }

                                    double invVariacionP = 0, invVariacionP2 = 0, invVariacionP3 = 0, invVariacionP4 = 0, invVariacionP5 = 0;
                                    double invVariacionP0 = 0, invVariacionP02 = 0, invVariacionP03 = 0, invVariacionP04 = 0, invVariacionP05 = 0;

                                    for (int i = 0; i < insumo11.size(); i++) {
                                        insu11 = insumo11.get(i);
                                        if (insu11.getYear() == 1) {
                                            invVariacionP = (inventariosp * insu11.getValor()) / 360;
                                            invVariacionP0 = invVariacionP0 + insu11.getValor();
                                        }
                                        if (insu11.getYear() == 2) {
                                            invVariacionP2 = (inventariosp2 * insu11.getValor()) / 360;
                                            invVariacionP02 = invVariacionP02 + insu11.getValor();
                                        }
                                        if (insu11.getYear() == 3) {
                                            invVariacionP3 = (inventariosp3 * insu11.getValor()) / 360;
                                            invVariacionP03 = invVariacionP03 + insu11.getValor();
                                        }
                                        if (insu11.getYear() == 4) {
                                            invVariacionP4 = (inventariosp4 * insu11.getValor()) / 360;
                                            invVariacionP04 = invVariacionP04 + insu11.getValor();
                                        }
                                        if (insu11.getYear() == 5) {
                                            invVariacionP5 = (inventariosp5 * insu11.getValor()) / 360;
                                            invVariacionP05 = invVariacionP05 + insu11.getValor();
                                        }
                                    }
                                %>
                                <%
                                    double anticipo = 0, anticipo2 = 0, anticipo3 = 0, anticipo4 = 0, anticipo5 = 0;

                                    for (int q = 0; q < insumo5.size(); q++) {
                                        insu5 = insumo5.get(q);
                                        if (insu5.getYear() == 1) {
                                            anticipo = insu5.getValor();
                                        }
                                        if (insu5.getYear() == 2) {
                                            anticipo2 = insu5.getValor();
                                        }
                                        if (insu5.getYear() == 3) {
                                            anticipo3 = insu5.getValor();
                                        }
                                        if (insu5.getYear() == 4) {
                                            anticipo4 = insu5.getValor();
                                        }
                                        if (insu5.getYear() == 5) {
                                            anticipo5 = insu5.getValor();
                                        }
                                    }

                                    double invdiferida = idDAO.total(idp);
                                    double invdiferida2 = idDAO.total(idp) / 5;
                                    double gastoanticipado = invdiferida - invdiferida2;
                                    double gastoanticipado2 = gastoanticipado - invdiferida2;
                                    double gastoanticipado3 = gastoanticipado2 - invdiferida2;
                                    double gastoanticipado4 = gastoanticipado3 - invdiferida2;
                                    double gastoanticipado5 = gastoanticipado4 - invdiferida2;
                                    double gastoanticipado6 = 0;
                                %>
                                <%
                                    double ajusdepre = 0, ajusdepre2 = 0, ajusdepre3 = 0, ajusdepre4 = 0, ajusdepre5 = 0;
                                    double Ajusdepre = 0, Ajusdepre2 = 0, Ajusdepre3 = 0, Ajusdepre4 = 0, Ajusdepre5 = 0;
                                    double Ajusdepre0 = 0, Ajusdepre02 = 0, Ajusdepre03 = 0, Ajusdepre04 = 0, Ajusdepre05 = 0;
                                    double ajusdepre0 = 0, ajusdepre02 = 0, ajusdepre03 = 0, ajusdepre04 = 0, ajusdepre05 = 0;
                                    double suAjusteDepre = 0, suAjusteDepre2 = 0, suAjusteDepre3 = 0, suAjusteDepre4 = 0, suAjusteDepre5 = 0;
                                    double ajussemo2 = 0, ajussemo3 = 0, ajussemo4 = 0, ajussemo5 = 0;
                                    double ajussemo02 = 0, ajussemo03 = 0, ajussemo04 = 0, ajussemo05 = 0;
                                    mo = m.todito(3);

                                    for (int h = 0; h < mo.size(); h++) {
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


                                %>
                                <%                                    double TotalActivosF = (total20 + totalTerrenos) + ((TOTAL20 + totalConstrucion) - (depresiacion20)) + (TOTAL10 + totalMaquinaria - (DEPRESIACION10)) + (total10 + totalMuebles - (depresiacion10)) + (TOTAL5 + totalTransporte - (DEPRESIACION5)) + (total5 + totalOficina - (depresiacion5)) + (totalsemo + semovientes - (depresiacionsemo)) + (totalculti + cultivos - (depresiacionculti));
                                    double TotalActivosF2 = (total202 + total20 + totalTerrenos) + (TOTAL201 + TOTAL20 + totalConstrucion - (depresiacion202 + depresiacion20 + suAjusteDepre2)) + (TOTAL102 + TOTAL10 + totalMaquinaria - (DEPRESIACION102 + DEPRESIACION10 + ajusdepre02)) + (total102 + total10 + totalMuebles - (depresiacion102 + depresiacion10 + ajusdepre2)) + (TOTAL52 + TOTAL5 + totalTransporte - (DEPRESIACION52 + DEPRESIACION5 + Ajusdepre02)) + (total52 + total5 + totalOficina - (depresiacion52 + depresiacion5 + Ajusdepre2)) + (totalsemo2 + totalsemo + semovientes - (depresiacionsemo2 + depresiacionsemo + ajussemo2)) + (totalculti2 + totalculti + cultivos - (depresiacionculti + depresiacionculti2 + ajussemo02));
                                    double TotalActivosF3 = (total203 + total202 + total20 + totalTerrenos) + (TOTAL203 + TOTAL201 + TOTAL20 + totalConstrucion - (depresiacion202 + depresiacion20 + suAjusteDepre2 + depresiacion203 + suAjusteDepre3)) + (TOTAL103 + TOTAL102 + TOTAL10 + totalMaquinaria - (DEPRESIACION103 + DEPRESIACION102 + DEPRESIACION10 + ajusdepre02 + ajusdepre03)) + (total103 + total102 + total10 + totalMuebles - (depresiacion103 + depresiacion102 + depresiacion10 + ajusdepre2 + ajusdepre3)) + (TOTAL53 + TOTAL52 + TOTAL5 + totalTransporte - (DEPRESIACION53 + DEPRESIACION52 + DEPRESIACION5 + Ajusdepre02 + Ajusdepre03)) + (total53 + total52 + total5 + totalOficina - (depresiacion53 + depresiacion52 + depresiacion5 + Ajusdepre2 + Ajusdepre3)) + (totalsemo3 + totalsemo2 + totalsemo + semovientes - (depresiacionsemo3 + depresiacionsemo2 + depresiacionsemo + ajussemo2 + ajussemo3)) + (totalculti3 + totalculti2 + totalculti + cultivos - (depresiacionculti4 + depresiacionculti + depresiacionculti2 + ajussemo02 + ajussemo03));
                                    double TotalActivosF4 = (total204 + total203 + total202 + total20 + totalTerrenos) + (TOTAL204 + TOTAL203 + TOTAL201 + TOTAL20 + totalConstrucion - (depresiacion202 + depresiacion20 + suAjusteDepre2 + depresiacion203 + suAjusteDepre3 + depresiacion204 + suAjusteDepre4)) + (TOTAL104 + TOTAL103 + TOTAL102 + TOTAL10 + totalMaquinaria - (DEPRESIACION104 + DEPRESIACION103 + DEPRESIACION102 + DEPRESIACION10 + ajusdepre02 + ajusdepre03 + ajusdepre04)) + (total104 + total103 + total102 + total10 + totalMuebles - (depresiacion104 + depresiacion103 + depresiacion102 + depresiacion10 + ajusdepre2 + ajusdepre3 + ajusdepre4)) + (TOTAL54 + TOTAL53 + TOTAL52 + TOTAL5 + totalTransporte - (DEPRESIACION54 + DEPRESIACION53 + DEPRESIACION52 + DEPRESIACION5 + Ajusdepre02 + Ajusdepre03 + Ajusdepre04)) + (total54 + total53 + total52 + total5 + totalOficina - (depresiacion54 + depresiacion53 + depresiacion52 + depresiacion5 + Ajusdepre2 + Ajusdepre3 + Ajusdepre4)) + (totalsemo4 + totalsemo3 + totalsemo2 + totalsemo + semovientes - (depresiacionsemo4 + depresiacionsemo3 + depresiacionsemo2 + depresiacionsemo + ajussemo2 + ajussemo3 + ajussemo4)) + (totalculti4 + totalculti3 + totalculti2 + totalculti + cultivos - (depresiacionculti3 + depresiacionculti4 + depresiacionculti + depresiacionculti2 + ajussemo02 + ajussemo03 + ajussemo04));
                                    double TotalActivosF5 = (total205 + total204 + total203 + total202 + total20 + totalTerrenos) + (TOTAL205 + TOTAL204 + TOTAL203 + TOTAL201 + TOTAL20 + totalConstrucion - (depresiacion205 + depresiacion202 + depresiacion20 + suAjusteDepre2 + depresiacion203 + suAjusteDepre3 + depresiacion204 + suAjusteDepre4 + suAjusteDepre5)) + (TOTAL105 + TOTAL104 + TOTAL103 + TOTAL102 + TOTAL10 + totalMaquinaria - (DEPRESIACION105 + DEPRESIACION104 + DEPRESIACION103 + DEPRESIACION102 + DEPRESIACION10 + ajusdepre02 + ajusdepre03 + ajusdepre04 + ajusdepre05)) + (total105 + total104 + total103 + total102 + total10 + totalMuebles - (depresiacion105 + depresiacion104 + depresiacion103 + depresiacion102 + depresiacion10 + ajusdepre2 + ajusdepre3 + ajusdepre4 + ajusdepre5)) + (TOTAL55 + TOTAL54 + TOTAL53 + TOTAL52 + TOTAL5 + totalTransporte - (DEPRESIACION55 + DEPRESIACION54 + DEPRESIACION53 + DEPRESIACION52 + DEPRESIACION5 + Ajusdepre02 + Ajusdepre03 + Ajusdepre04 + Ajusdepre05)) + (total55 + total54 + total53 + total52 + total5 + totalOficina - (depresiacion55 + depresiacion54 + depresiacion53 + depresiacion52 + depresiacion5 + Ajusdepre2 + Ajusdepre3 + Ajusdepre4 + Ajusdepre5)) + (totalsemo5 + totalsemo4 + totalsemo3 + totalsemo2 + totalsemo + semovientes - (depresiacionsemo5 + depresiacionsemo4 + depresiacionsemo3 + depresiacionsemo2 + depresiacionsemo + ajussemo2 + ajussemo3 + ajussemo4 + ajussemo5)) + (totalculti5 + totalculti4 + totalculti3 + totalculti2 + totalculti + cultivos - (depresiacionculti5 + depresiacionculti4 + depresiacionculti3 + depresiacionculti + depresiacionculti2 + ajussemo02 + ajussemo03 + ajussemo04 + ajussemo05));

                                    double otrosActivos = 0, otrosActivos2 = 0, otrosActivos3 = 0, otrosActivos4 = 0, otrosActivos5 = 0;
                                    for (int q = 0; q < insumo6.size(); q++) {
                                        insu6 = insumo6.get(q);
                                        if (insu6.getYear() == 1) {
                                            otrosActivos = insu6.getValor();
                                        }
                                        if (insu6.getYear() == 2) {
                                            otrosActivos2 = insu6.getValor();
                                        }
                                        if (insu6.getYear() == 3) {
                                            otrosActivos3 = insu6.getValor();
                                        }
                                        if (insu6.getYear() == 4) {
                                            otrosActivos4 = insu6.getValor();
                                        }
                                        if (insu6.getYear() == 5) {
                                            otrosActivos5 = insu6.getValor();
                                        }
                                    }

                                %>
                                <%  double cuentaapagar = 0, cuentaapagar2 = 0, cuentaapagar3 = 0, cuentaapagar4 = 0, cuentaapagar5 = 0;
                                    double cuentaapagar0 = 0, cuentaapagar02 = 0, cuentaapagar03 = 0, cuentaapagar04 = 0, cuentaapagar05 = 0;
                                    for (int l = 0; l < insumo7.size(); l++) {
                                        insu7 = insumo7.get(l);
                                        if (insu7.getYear() == 1) {
                                            cuentaapagar = (materiaprima * insu7.getValor()) / 360;
                                            cuentaapagar0 = cuentaapagar0 + insu7.getValor();
                                        }
                                        if (insu7.getYear() == 2) {
                                            cuentaapagar2 = (materiaprima2 * insu7.getValor()) / 360;
                                            cuentaapagar02 = cuentaapagar02 + insu7.getValor();
                                        }
                                        if (insu7.getYear() == 3) {
                                            cuentaapagar3 = (materiaprima3 * insu7.getValor()) / 360;
                                            cuentaapagar03 = cuentaapagar03 + insu7.getValor();
                                        }
                                        if (insu7.getYear() == 4) {
                                            cuentaapagar4 = (materiaprima4 * insu7.getValor()) / 360;
                                            cuentaapagar04 = cuentaapagar04 + insu7.getValor();
                                        }
                                        if (insu7.getYear() == 5) {
                                            cuentaapagar5 = (materiaprima5 * insu7.getValor()) / 360;
                                            cuentaapagar05 = cuentaapagar05 + insu7.getValor();
                                        }
                                    }

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
                                %>
                                <%
                                    if (infinsumito2.isEmpty()) {
                                        infinsumito2 = null;
                                    }

                                    InfInsumoVO insumoVO22;
                                    double rebaja1 = 0, rebaja2 = 0, rebaja3 = 0, rebaja4 = 0, rebaja5 = 0;
                                    double rebaja01 = 0, rebaja02 = 0, rebaja03 = 0, rebaja04 = 0, rebaja05 = 0;
                                    for (int i = 0; i < infinsumito2.size(); i++) {
                                        insumoVO22 = infinsumito2.get(i);
                                        if (insumoVO22.getYear() == 1) {
                                            rebaja1 = (venta1 * insumoVO22.getValor()) / 100;
                                            rebaja01 = insumoVO22.getValor();
                                        }
                                        if (insumoVO22.getYear() == 2) {
                                            rebaja2 = (venta2 * insumoVO22.getValor()) / 100;
                                            rebaja02 = insumoVO22.getValor();
                                        }
                                        if (insumoVO22.getYear() == 3) {
                                            rebaja3 = (venta3 * insumoVO22.getValor()) / 100;
                                            rebaja03 = insumoVO22.getValor();
                                        }
                                        if (insumoVO22.getYear() == 4) {
                                            rebaja4 = (venta4 * insumoVO22.getValor()) / 100;
                                            rebaja04 = insumoVO22.getValor();
                                        }
                                        if (insumoVO22.getYear() == 5) {
                                            rebaja5 = (venta5 * insumoVO22.getValor()) / 100;
                                            rebaja05 = insumoVO22.getValor();
                                        }

                                    }
                                %>
                                <%
                                    float dias_year =5; 
                                        double tasainteres = tmv.getCapitalTrabajo() / 100; 
                                        double obligacionfinanciera = fin.Reporte2(idp, 7);
                                        double interes = 0, interes2 = 0, interes3 = 0, interes4 = 0, interes5 = 0;
                                        double amortizacion = 0, amortizacion2 = 0, amortizacion3 = 0, amortizacion4 = 0, amortizacion5 = 0;
                                        double insobresal = 0, insobresal2 = 0, insobresal3 = 0, insobresal4 = 0, insobresal5 = 0;
                                        double rCuotaAnual = Math.pow((1 + tasainteres), dias_year) * obligacionfinanciera * tasainteres / (Math.pow((1 + tasainteres), dias_year) - 1);
                                        interes = obligacionfinanciera * tasainteres;
                                       
                                        insobresal = rCuotaAnual - interes;
                                        amortizacion = obligacionfinanciera - insobresal;
                                         if(dias_year >= 2){
                                        interes2 = amortizacion * tasainteres;
                                        insobresal2 = rCuotaAnual - interes2;
                                        amortizacion2 = amortizacion - insobresal2;
                                         }
                                          if(dias_year >= 3){
                                        interes3 = amortizacion2 * tasainteres;
                                        insobresal3 = rCuotaAnual - interes3;
                                        amortizacion3 = amortizacion2 - insobresal3;
                                          }
                                           if(dias_year >= 4){
                                        interes4 = amortizacion3 * tasainteres;
                                        insobresal4 = rCuotaAnual - interes4;
                                        amortizacion4 = amortizacion3 - insobresal4;
                                           }
                                            if(dias_year >= 5){
                                        interes5 = amortizacion4 * tasainteres;
                                        insobresal5 = rCuotaAnual - interes5;
                                        amortizacion5 = amortizacion4 - insobresal5;
                                            }
                                %>
                                <%
                                    double ivdiferida = (idDAO.total(idp) / 5) / 2;
                                    double intentodetotal = (tmv.getKit() * (gcDao.Reporte(idp, 2) * 12)) / 100;
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
                                %>
                                <%
                                    double utilidadbruta = venta1 - rebaja1 - materiaprima - (depresiacion20 + DEPRESIACION10 + depresiacion10 + DEPRESIACION5 + depresiacion5) - (depresiacionsemo + depresiacionculti) - totalcosotos;
                                    double utilidadbruta2 = venta2 - rebaja2 - materiaprima2 - (depresiacion202 + DEPRESIACION102 + depresiacion102 + DEPRESIACION52 + depresiacion52) - (depresiacionsemo2 + depresiacionculti2) - totalcostos2;
                                    double utilidadbruta3 = venta3 - rebaja3 - materiaprima3 - (depresiacion203 + DEPRESIACION103 + depresiacion103 + DEPRESIACION53 + depresiacion53) - (depresiacionsemo3 + depresiacionculti3) - totalcostos3;
                                    double utilidadbruta4 = venta4 - rebaja4 - materiaprima4 - (depresiacion204 + DEPRESIACION104 + depresiacion104 + DEPRESIACION54 + depresiacion54) - (depresiacionsemo4 + depresiacionculti4) - totalcostos4;
                                    double utilidadbruta5 = venta5 - rebaja5 - materiaprima5 - (depresiacion205 + DEPRESIACION105 + depresiacion105 + DEPRESIACION55 + depresiacion55) - (depresiacionsemo5 + depresiacionculti5) - totalcostos5;

                                    ArrayList<InfInsumoVO> idaoa1, idaoa2;
                                    idaoa1 = iDao.Todo(idp, 2);
                                    idaoa2 = iDao.Todo(idp, 3);
                                    InfInsumoVO insu01, insu02;
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
                                <%
                                    double totalkit = (gcDao.Reporte(idp, 2) * 12) - intentodetotal;
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
                                %>
                                <%
                                    double utilidadoperativo = utilidadbruta - (gastoventas + totaladministracion + provi1 + (idDAO.total(idp) / 5));
                                    double utilidadoperativo2 = utilidadbruta2 - (gastoventas2 + totaladministracion2 + provi2 + (idDAO.total(idp) / 5));
                                    double utilidadoperativo3 = utilidadbruta3 - (gastoventas3 + totaladministracion3 + provi3 + (idDAO.total(idp) / 5));
                                    double utilidadoperativo4 = utilidadbruta4 - (gastoventas4 + totaladministracion4 + provi4 + (idDAO.total(idp) / 5));
                                    double utilidadoperativo5 = utilidadbruta5 - (gastoventas5 + totaladministracion5 + provi5 + (idDAO.total(idp) / 5));

                                    double ajustenomonetario = total20 + TOTAL20 + total10 + TOTAL10 + total5 + TOTAL5 + totalsemo + totalculti;
                                    double ajustenomonetario2 = total202 + TOTAL201 + total102 + TOTAL102 + total52 + TOTAL52 + totalsemo2 + totalculti2;
                                    double ajustenomonetario3 = total203 + TOTAL203 + total103 + TOTAL103 + total53 + TOTAL53 + totalsemo3 + totalculti3;
                                    double ajustenomonetario4 = total204 + TOTAL204 + total104 + TOTAL104 + total54 + TOTAL54 + totalsemo4 + totalculti4;
                                    double ajustenomonetario5 = total205 + TOTAL205 + total105 + TOTAL105 + total55 + TOTAL55 + totalsemo5 + totalculti5;

                                    double totalcorrecion = ajustenomonetario;
                                    double totalcorrecion2 = ajustenomonetario2 + (-suAjusteDepre2 - ajusdepre2 - ajusdepre02 - Ajusdepre02 - Ajusdepre2) + (-ajussemo2 - ajussemo02);
                                    double totalcorrecion3 = ajustenomonetario3 + (-suAjusteDepre3 - ajusdepre3 - ajusdepre03 - Ajusdepre03 - Ajusdepre3) + (-ajussemo3 - ajussemo03);
                                    double totalcorrecion4 = ajustenomonetario4 + (-suAjusteDepre4 - ajusdepre4 - ajusdepre04 - Ajusdepre04 - Ajusdepre4) + (-ajussemo4 - ajussemo04);
                                    double totalcorrecion5 = ajustenomonetario5 + (-suAjusteDepre5 - ajusdepre5 - ajusdepre05 - Ajusdepre05 - Ajusdepre5) + (-ajussemo5 - ajussemo05);

                                    double utilidadAI = utilidadoperativo + (-interes) + totalcorrecion;
                                    double utilidadAI2 = utilidadoperativo2 + (-interes2) + totalcorrecion2;
                                    double utilidadAI3 = utilidadoperativo3 + (-interes3) + totalcorrecion3;
                                    double utilidadAI4 = utilidadoperativo4 + (-interes4) + totalcorrecion4;
                                    double utilidadAI5 = utilidadoperativo5 + (-interes5) + totalcorrecion5;

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

                                    ArrayList<InfInsumoVO> inf = new ArrayList();
                                    InfInsumoVO ifivo, ifV, ifV2, ifV3, ifV4;
                                    inf = iDao.Todo(idp, 11);

                                    double capital = fin.Reporte(idp);
                                    double CapitalAdicional = 0, CapitalAdicional2 = 0, CapitalAdicional3 = 0, CapitalAdicional4 = 0, CapitalAdicional5 = 0;
                                    double Totalpatrimonio = 0, otroCalorpatrimonio = 0, patrimonio3 = 0, patrimonio4 = 0, patrimonio5 = 0;
                                    me = m.todito(2);
                                    for (int g = 0; g < me.size(); g++) {
                                        mv2 = me.get(g);
                                        ifivo = inf.get(0);
                                        ifV = inf.get(1);
                                        ifV2 = inf.get(2);
                                        ifV3 = inf.get(3);
                                        ifV4 = inf.get(4);
                                        CapitalAdicional = ifivo.getValor();
                                        CapitalAdicional2 = ifV.getValor();
                                        CapitalAdicional3 = ifV2.getValor();
                                        CapitalAdicional4 = ifV3.getValor();
                                        CapitalAdicional5 = ifV4.getValor();

                                        Totalpatrimonio = (capital + ifivo.getValor());
                                        otroCalorpatrimonio = Totalpatrimonio + ifV.getValor();
                                        patrimonio3 = otroCalorpatrimonio + ifV2.getValor();
                                        patrimonio4 = patrimonio3 + ifV3.getValor();
                                        patrimonio5 = patrimonio4 + ifV4.getValor();
                                    }
                                %>
                                <%
                                    double revalorizacionpatrimonio = 0, revalorizacionpatrimonio2 = 0, revalorizacionpatrimonio3 = 0, revalorizacionpatrimonio4 = 0, revalorizacionpatrimonio5 = 0;
                                    double dividendo = 0, dividendo2 = 0, dividendo3 = 0, dividendo4 = 0, dividendo5 = 0;
                                    double dividendo0 = 0, dividendo02 = 0, dividendo03 = 0, dividendo04 = 0, dividendo05 = 0;


                                %>
                                <%                                    double acree = 0, acree2 = 0, acree3 = 0, acree4 = 0, acree5 = 0;
                                    for (int q = 0; q < insumo8.size(); q++) {
                                        insu8 = insumo8.get(q);
                                        if (insu8.getYear() == 1) {
                                            acree = insu8.getValor();
                                        }
                                        if (insu8.getYear() == 2) {
                                            acree2 = insu8.getValor();
                                        }
                                        if (insu8.getYear() == 3) {
                                            acree3 = insu8.getValor();
                                        }
                                        if (insu8.getYear() == 4) {
                                            acree4 = insu8.getValor();
                                        }
                                        if (insu8.getYear() == 5) {
                                            acree5 = insu8.getValor();
                                        }
                                    }
                                %>
                                <%
                                    double otropasivo = 0, otropasivo2 = 0, otropasivo3 = 0, otropasivo4 = 0, otropasivo5 = 0;
                                    for (int q = 0; q < insumo9.size(); q++) {
                                        insu9 = insumo9.get(q);
                                        if (insu9.getYear() == 1) {
                                            otropasivo = insu9.getValor();
                                        }
                                        if (insu9.getYear() == 2) {
                                            otropasivo2 = insu9.getValor();
                                        }
                                        if (insu9.getYear() == 3) {
                                            otropasivo3 = insu9.getValor();
                                        }
                                        if (insu9.getYear() == 4) {
                                            otropasivo4 = insu9.getValor();
                                        }
                                        if (insu9.getYear() == 5) {
                                            otropasivo5 = insu9.getValor();
                                        }
                                    }
                                %>
                                <%
                                    double obligacionFondoEmprender = 0;
                                    obligacionFondoEmprender = fin.Reporte2(idp, 1);
                                %>

                                <%
                                    double totalpasivo = 0, totalpasivo2 = 0, totalpasivo3 = 0, totalpasivo4 = 0, totalpasivo5 = 0;
                                    totalpasivo = cuentaapagar + acree + amortizacion + otropasivo + obligacionFondoEmprender + impuestos;
                                    totalpasivo2 = cuentaapagar2 + acree2 + amortizacion2 + otropasivo2 + obligacionFondoEmprender + (impuestos2 + impuestos);
                                    totalpasivo3 = cuentaapagar3 + impuestos3 + impuestos2 + impuestos + acree3 + amortizacion3 + otropasivo3 + obligacionFondoEmprender;
                                    totalpasivo4 = cuentaapagar4 + impuestos4 + impuestos3 + impuestos2 + impuestos + acree4 + amortizacion4 + otropasivo4 + obligacionFondoEmprender;
                                    totalpasivo5 = cuentaapagar5 + impuestos5 + impuestos4 + impuestos3 + impuestos2 + impuestos + acree5 + otropasivo5 + obligacionFondoEmprender;
                                %>
                                <%
                                    double capitalyotrososocios = fin.Reporte(idp);
                                    double capitalSocial = 0, capitalSocial2 = 0, capitalSocial3 = 0, capitalSocial4 = 0, capitalSocial5 = 0;

                                    double capitalAdicionalSocios = 0, capitalAdicionalSocios2 = 0, capitalAdicionalSocios3 = 0, capitalAdicionalSocios4 = 0, capitalAdicionalSocios5 = 0;
                                    for (int q = 0; q < insumo10.size(); q++) {
                                        insu10 = insumo10.get(q);
                                        if (insu10.getYear() == 1) {
                                            capitalSocial = capitalyotrososocios + insu10.getValor();
                                            capitalAdicionalSocios = insu10.getValor();
                                        }
                                        if (insu10.getYear() == 2) {
                                            capitalSocial2 = capitalSocial + insu10.getValor();
                                            capitalAdicionalSocios2 = insu10.getValor();
                                        }
                                        if (insu10.getYear() == 3) {
                                            capitalSocial3 = capitalSocial2 + insu10.getValor();
                                            capitalAdicionalSocios3 = insu10.getValor();
                                        }
                                        if (insu10.getYear() == 4) {
                                            capitalSocial4 = capitalSocial3 + insu10.getValor();
                                            capitalAdicionalSocios4 = insu10.getValor();
                                        }
                                        if (insu10.getYear() == 5) {
                                            capitalSocial5 = capitalSocial4 + insu10.getValor();
                                            capitalAdicionalSocios5 = insu10.getValor();
                                        }
                                    }

                                    double reservaLPeriodo = 0, reservaLPeriodo2 = 0, reservaLPeriodo3 = 0, reservaLPeriodo4 = 0, reservaLPeriodo5 = 0;

                                %>
                                <%                                    double BaseRevalorizacion = 0, BaseRevalorizacion2 = 0, BaseRevalorizacion3 = 0, BaseRevalorizacion4 = 0, BaseRevalorizacion5 = 0, BaseRevalorizacion6 = 0;
                                    BaseRevalorizacion = capital;

                                    //revalorizacion de patrimonio  
                                    for (int g = 0; g < mo.size(); g++) {
                                        MV = mo.get(g);
                                        insu12 = insumo12.get(g);
                                        if (MV.getYear() == 1) {
                                            revalorizacionpatrimonio = (capital * MV.getValor()) / 100;
                                            utilidadAI = utilidadAI - revalorizacionpatrimonio;
                                            impuestos = (utilidadAI * tmv.getImpuestos()) / 100;
                                            utilidadneta = utilidadAI - (impuestos);
                                            totalcorrecion = totalcorrecion - revalorizacionpatrimonio;
                                            dividendo = (utilidadneta * insu12.getValor()) / 100;
                                            dividendo0 = dividendo0 + insu12.getValor();

                                        }
                                        if (MV.getYear() == 2) {
                                            revalorizacionpatrimonio2 = (Totalpatrimonio * MV.getValor()) / 100;
                                            utilidadAI2 = utilidadAI2 - revalorizacionpatrimonio2;
                                            impuestos2 = (utilidadAI2 * tmv.getImpuestos()) / 100;
                                            utilidadneta2 = utilidadAI2 - (impuestos2);
                                            totalcorrecion2 = totalcorrecion2 - revalorizacionpatrimonio2;
                                            dividendo2 = (utilidadneta2 * insu12.getValor()) / 100;
                                            dividendo02 = dividendo02 + insu12.getValor();
                                            if (utilidadneta * 0.1 > capitalSocial2 * 0.5) {
                                                reservaLPeriodo = capitalSocial2 * 0.5;
                                            } else {
                                                reservaLPeriodo = utilidadneta * 0.1;

                                            }

                                        }
                                        if (MV.getYear() == 3) {
                                            revalorizacionpatrimonio3 = ((otroCalorpatrimonio + utilidadneta - dividendo) * MV.getValor()) / 100;
                                            utilidadAI3 = utilidadAI3 - revalorizacionpatrimonio3;
                                            impuestos3 = (utilidadAI3 * tmv.getImpuestos()) / 100;
                                            utilidadneta3 = utilidadAI3 - (impuestos3);
                                            totalcorrecion3 = totalcorrecion3 - revalorizacionpatrimonio3;
                                            dividendo3 = (utilidadneta3 * insu12.getValor()) / 100;
                                            dividendo03 = dividendo03 + insu12.getValor();
                                            if (utilidadneta2 * 0.1 + reservaLPeriodo > capitalSocial3 * 0.5) {
                                                reservaLPeriodo2 = capitalSocial3 * 0.5 - reservaLPeriodo;
                                            } else {
                                                reservaLPeriodo2 = utilidadneta2 * 0.1;

                                            }

                                        }
                                        if (MV.getYear() == 4) {
                                            revalorizacionpatrimonio4 = ((patrimonio3 + (utilidadneta2 + utilidadneta) - dividendo - dividendo2) * MV.getValor()) / 100;
                                            utilidadAI4 = utilidadAI4 - revalorizacionpatrimonio4;
                                            impuestos4 = (utilidadAI4 * tmv.getImpuestos()) / 100;
                                            utilidadneta4 = utilidadAI4 - (impuestos4);
                                            totalcorrecion4 = totalcorrecion4 - revalorizacionpatrimonio4;
                                            dividendo4 = (utilidadneta4 * insu12.getValor()) / 100;
                                            dividendo04 = dividendo04 + insu12.getValor();
                                            if (utilidadneta3 * 0.1 + reservaLPeriodo2 + reservaLPeriodo > capitalSocial4 * 0.5) {
                                                reservaLPeriodo3 = capitalSocial4 * 0.5 - reservaLPeriodo2 - reservaLPeriodo;
                                            } else {
                                                reservaLPeriodo3 = utilidadneta3 * 0.1;

                                            }

                                        }
                                        if (MV.getYear() == 5) {
                                            revalorizacionpatrimonio5 = ((patrimonio4 + (utilidadneta + utilidadneta2 + utilidadneta3) - dividendo - dividendo2 - dividendo3) * MV.getValor()) / 100;
                                            utilidadAI5 = utilidadAI5 - revalorizacionpatrimonio5;
                                            impuestos5 = (utilidadAI5 * tmv.getImpuestos()) / 100;
                                            utilidadneta5 = utilidadAI5 - (impuestos5);
                                            totalcorrecion5 = totalcorrecion5 - revalorizacionpatrimonio5;
                                            dividendo5 = (utilidadneta5 * insu12.getValor()) / 100;
                                            dividendo05 = dividendo05 + insu12.getValor();
                                        }
                                    }
                                    if (utilidadneta4 * 0.1 + reservaLPeriodo3 + reservaLPeriodo2 + reservaLPeriodo > capitalSocial5 * 0.5) {
                                        reservaLPeriodo4 = capitalSocial5 * 0.5 - reservaLPeriodo3 - reservaLPeriodo2 - reservaLPeriodo;
                                    } else {
                                        reservaLPeriodo4 = utilidadneta4 * 0.1;

                                    }
//                                     if (utilidadneta5 * 0.1 > capitalSocial5 * 0.5) {
//                                        reservaLPeriodo5 = capitalSocial5 * 0.5 - reservaLPeriodo4;
//                                    } else {
//                                        reservaLPeriodo5 = utilidadneta5 * 0.1;
//
//                                    }

                                    if (utilidadneta < 0 || utilidadneta2 < 0 || utilidadneta3 < 0 || utilidadneta4 < 0 || utilidadneta5 < 0) {
                                        reservaLPeriodo = 0;
                                        reservaLPeriodo2 = 0;
                                        reservaLPeriodo3 = 0;
                                        reservaLPeriodo4 = 0;
                                        reservaLPeriodo5 = 0;
                                    }
//das     
                                    BaseRevalorizacion2 = Totalpatrimonio;
                                    BaseRevalorizacion3 = capitalSocial2 + (utilidadneta - dividendo - reservaLPeriodo) + reservaLPeriodo;
                                    BaseRevalorizacion4 = capitalSocial3 + (utilidadneta + utilidadneta2 - dividendo - reservaLPeriodo2 - dividendo2 - reservaLPeriodo) + reservaLPeriodo + reservaLPeriodo2;
                                    BaseRevalorizacion5 = capitalSocial4 + (utilidadneta + utilidadneta2 + utilidadneta3 - dividendo - dividendo2 - dividendo3 - reservaLPeriodo3 - reservaLPeriodo2 - reservaLPeriodo) + reservaLPeriodo + reservaLPeriodo2 + reservaLPeriodo3;

                                    BaseRevalorizacion6 = capitalSocial5 + (utilidadneta + utilidadneta2 + utilidadneta3 + utilidadneta4 - dividendo - dividendo2 - dividendo3 - dividendo4 - reservaLPeriodo4 - reservaLPeriodo3 - reservaLPeriodo2 - reservaLPeriodo) + reservaLPeriodo + reservaLPeriodo2 + reservaLPeriodo3 + reservaLPeriodo4;
                                %>
                                <%  double TOTALPATRIMONIO = 0, TOTALPATRIMONIO2 = 0, TOTALPATRIMONIO3 = 0, TOTALPATRIMONIO4 = 0, TOTALPATRIMONIO5 = 0;
                                    TOTALPATRIMONIO = capitalSocial + utilidadneta + revalorizacionpatrimonio;
                                    TOTALPATRIMONIO2 = capitalSocial2 + utilidadneta + utilidadneta2 - dividendo + revalorizacionpatrimonio + revalorizacionpatrimonio2;
                                    TOTALPATRIMONIO3 = capitalSocial3 + utilidadneta + utilidadneta2 + utilidadneta3 - dividendo - dividendo2 + revalorizacionpatrimonio + revalorizacionpatrimonio2 + revalorizacionpatrimonio3;
                                    TOTALPATRIMONIO4 = capitalSocial4 + utilidadneta + utilidadneta2 + utilidadneta3 + utilidadneta4 - dividendo - dividendo2 - dividendo3 + revalorizacionpatrimonio + revalorizacionpatrimonio2 + revalorizacionpatrimonio3 + revalorizacionpatrimonio4;
                                    TOTALPATRIMONIO5 = capitalSocial5 + utilidadneta + utilidadneta2 + utilidadneta3 + utilidadneta4 + utilidadneta5 - dividendo - dividendo2 - dividendo3 - dividendo4 + revalorizacionpatrimonio + revalorizacionpatrimonio2 + revalorizacionpatrimonio3 + revalorizacionpatrimonio4 + revalorizacionpatrimonio5;
                                    double EFECTIVO0 = 0, EFECTIVO = 0, EFECTIVO2 = 0, EFECTIVO3 = 0, EFECTIVO4 = 0, EFECTIVO5 = 0;
                                    double cajafinanciamiento = 0, cajafinanciamiento2 = 0, cajafinanciamiento3 = 0, cajafinanciamiento4 = 0, cajafinanciamiento5 = 0;
                                    double flujooperativo = 0, flujooperativo2 = 0, flujooperativo3 = 0, flujooperativo4 = 0, flujooperativo5 = 0;
                                    double cajadeinversion = 0, cajadeinversion2 = 0, cajadeinversion3 = 0, cajadeinversion4 = 0, cajadeinversion5 = 0;

                                    double totalpaspat0 = (obligacionFondoEmprender + obligacionfinanciera + capitalyotrososocios);

                                    flujooperativo = utilidadoperativo + depresiacion20 + DEPRESIACION10 + depresiacion10 + DEPRESIACION5 + depresiacion5 + depresiacionsemo + depresiacionculti + (idDAO.total(idp) / 5) + provi1;
                                    cajadeinversion = -cuentacobrar - invmateria - invenproducto - invVariacionP - anticipo + cuentaapagar + acree + otropasivo - otrosActivos;

                                    flujooperativo2 = utilidadoperativo2 + depresiacion202 + DEPRESIACION102 + depresiacion102 + DEPRESIACION52 + depresiacion52 + depresiacionsemo2 + depresiacionculti2 + (idDAO.total(idp) / 5) + provi2;
                                    flujooperativo3 = utilidadoperativo3 + depresiacion203 + DEPRESIACION103 + depresiacion103 + DEPRESIACION53 + depresiacion53 + depresiacionsemo3 + depresiacionculti3 + (idDAO.total(idp) / 5) + provi3;
                                    flujooperativo4 = utilidadoperativo4 + depresiacion204 + DEPRESIACION104 + depresiacion104 + DEPRESIACION54 + depresiacion54 + depresiacionsemo4 + depresiacionculti4 + (idDAO.total(idp) / 5) + provi4;
                                    flujooperativo5 = utilidadoperativo5 + depresiacion205 + DEPRESIACION105 + depresiacion105 + DEPRESIACION55 + depresiacion55 + depresiacionsemo5 + depresiacionculti5 + (idDAO.total(idp) / 5) + provi5;

                                    cajadeinversion2 = (cuentacobrar - cuentacobrar2) + (invmateria - invmateria2) + (invenproducto - invenproducto2) + (invVariacionP - invVariacionP2) + (anticipo - anticipo2) + (cuentaapagar2 - cuentaapagar) + (acree2 - acree) + (otropasivo2 - otropasivo) - (otrosActivos2 - otrosActivos);
                                    cajadeinversion3 = (cuentacobrar2 - cuentacobrar3) + (invmateria2 - invmateria3) + (invenproducto2 - invenproducto3) + (invVariacionP2 - invVariacionP3) + (anticipo2 - anticipo3) + (cuentaapagar3 - cuentaapagar2) + (acree3 - acree2) + (otropasivo3 - otropasivo2) - (otrosActivos3 - otrosActivos2);
                                    cajadeinversion4 = (cuentacobrar3 - cuentacobrar4) + (invmateria3 - invmateria4) + (invenproducto3 - invenproducto4) + (invVariacionP3 - invVariacionP4) + (anticipo3 - anticipo4) + (cuentaapagar4 - cuentaapagar3) + (acree4 - acree3) + (otropasivo4 - otropasivo3) - (otrosActivos4 - otrosActivos3);
                                    cajadeinversion5 = (cuentacobrar4 - cuentacobrar5) + (invmateria4 - invmateria5) + (invenproducto4 - invenproducto5) + (invVariacionP4 - invVariacionP5) + (anticipo4 - anticipo5) + (cuentaapagar5 - cuentaapagar4) + (acree5 - acree4) + (otropasivo5 - otropasivo4) - (otrosActivos5 - otrosActivos4);

                                    if (utilidadneta > 0) {
                                        cajafinanciamiento = -amortizacion - interes;
                                    } else {
                                        cajafinanciamiento = -amortizacion - interes + capitalAdicionalSocios;
                                        cajafinanciamiento2 = -insobresal2 - interes2 + capitalAdicionalSocios2 - dividendo;
                                        cajafinanciamiento3 = -insobresal3 - interes3 + capitalAdicionalSocios3 - dividendo2;
                                        cajafinanciamiento4 = -insobresal4 - interes4 + capitalAdicionalSocios4 - dividendo3;
                                        cajafinanciamiento5 = -insobresal5 - interes5 + capitalAdicionalSocios5 - dividendo4;

                                    }

                                    EFECTIVO0 = totalpaspat0 - gastoanticipado - totalTerrenos - totalConstrucion - totalMaquinaria - totalTransporte - totalMuebles - totalOficina - semovientes - cultivos;
                                    EFECTIVO = cajafinanciamiento + cajadeinversion + flujooperativo;
                                    EFECTIVO2 = cajafinanciamiento2 + cajadeinversion2 + flujooperativo2;
                                    EFECTIVO3 = cajafinanciamiento3 + cajadeinversion3 + flujooperativo3;
                                    EFECTIVO4 = cajafinanciamiento4 + cajadeinversion4 + flujooperativo4;
                                    EFECTIVO5 = cajafinanciamiento5 + cajadeinversion5 + flujooperativo5;

                                %>
                                <table class="table table-bordered table-hover">
                                    <tr>
                                        <th>Concepto</th>
                                        <th>Año 1</th>
                                        <th>Año 2</th>
                                        <th>Año 3</th>
                                        <th>Año 4</th>
                                        <th>Año 5</th>
                                    </tr>
                                    <tr>
                                        <th colspan="6" class="info text-center">Total Ventas</th>
                                    </tr> 
                                    <tr>
                                        <td title="Precio Promedio de todos los productos">Precio Promedio</td>
                                        <td><div class="text-right">$ <%=formato.format(preciopromedio)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(preciopromedio2)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(preciopromedio3)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(preciopromedio4)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(preciopromedio5)%></div></td>
                                    </tr>
                                    <tr>
                                        <td title="Total de ventas de todos los productos">Ventas</td>
                                        <td><div class="text-right"> <%=formato.format(ventasdetodo)%></div></td>
                                        <td><div class="text-right"> <%=formato.format(ventasdetodo2)%></div></td>
                                        <td><div class="text-right"> <%=formato.format(ventasdetodo3)%></div></td>
                                        <td><div class="text-right"> <%=formato.format(ventasdetodo4)%></div></td>
                                        <td><div class="text-right"> <%=formato.format(ventasdetodo5)%></div></td>
                                    </tr>
                                    <tr>
                                        <td title="Precio Promedio *  Ventas">Total Ventas</td>
                                        <td><div class="text-right">$ <%=formato.format(venta1)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(venta2)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(venta3)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(venta4)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(venta5)%></div></td>
                                    </tr>
                                    <tr>
                                        <th colspan="6" class="info text-center">Rebajas en Ventas</th>
                                    </tr>
                                    <tr class="success">
                                        <td title="Disminución o descuentos del total de las ventas ">Rebaja</td>
                                        <td><div class="text-right"><%=rebaja01%> % </div></td>
                                        <td><div class="text-right"><%=rebaja02%> % </div></td>
                                        <td><div class="text-right"><%=rebaja03%> % </div></td>
                                        <td><div class="text-right"><%=rebaja04%> % </div></td>
                                        <td><div class="text-right"><%=rebaja05%> % </div></td>
                                    </tr>
                                    <tr>
                                        <td title="Contabilización de la rebaja (Total Ventas * Rebaja)">Pronto pago</td>
                                        <td><div class="text-right">$<%=formato.format(rebaja1)%></div></td>
                                        <td><div class="text-right">$<%=formato.format(rebaja2)%></div></td>
                                        <td><div class="text-right">$<%=formato.format(rebaja3)%></div></td>
                                        <td><div class="text-right">$<%=formato.format(rebaja4)%></div></td>
                                        <td><div class="text-right">$<%=formato.format(rebaja5)%></div></td>
                                    </tr>
                                    <tr>
                                        <th colspan="6" class="info text-center">Costos Variables Unitarios</th>
                                    </tr>
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
                                    
                                    
                                        TipoGastoCostoDAO tnd = new TipoGastoCostoDAO();
                                        TipoGastoCostoVO tnv;
                                        ArrayList<TipoGastoCostoVO> tn = new ArrayList();
                                        tn = tnd.readAll();
                                        double manodeobra = 0, depresiacion = 0, otroscostosp = 0, otrosgastos = 0, gastosventas = 0, servicios = 0;
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
                                        }

                                     
                                                                             //proyeccion
                                        ProyeccionVentasDAO proyDAO = new ProyeccionVentasDAO();
                                        double total = 0, manoU = 0, totalproduccion = 0, depresiacion2 = 0, otrocta = 0, proyeccion = 0, Tproy = 0, precio1 = 0, puntoequilibrio = 0;
                                        double agotamiento = ((totalsemovientesdepre + totalcultivosdepre) * manoU) / 100;
                                        double otroctas = 0, totalgastosycostoss = 0, gastosventass = 0, otroscostosps = 0, intentodetotals = 0, depresiacion2s = 0, depresiacions = 0, totalkits = 0, ivdiferidass = 0, otrosgastoss = 0;
                                        depresiacion = (total20 / 20) + (total10 / 10) + (total5 / 5);
                                        depresiacion2 = (total102 / 10) + (total52 / 5);
                                        for (int i = 0; i < prA.size(); i++) {
                                            prv = prA.get(i);
                                            ppal = ppdao.todo(prv.getIdProducto());

                                            total = costosDAO.total(prv.getIdProducto());
                                            proyeccion = proyDAO.Porcentaje(prv.getIdProducto());
                                            Tproy = proyDAO.reporte(idp);

                                            manoU = (proyeccion * 100) / Tproy;
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
                                        }

                                    %>
                                    <tr>
                                        <td title="Recursos naturales o artificiales que se utiliza para la elaboración de un bien(Costo unitario)">Materia Prima (Costo Promedio)</td>
                                        <td><div class="text-right">$ <%=formato.format(mateprimeacos)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(mateprimeacos2)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(mateprimeacos3)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(mateprimeacos4)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(mateprimeacos5)%></div></td>
                                    </tr>
                                    <tr>
                                        <td title="Esfuerzo fisico y mental que se realiza para la elaboración de un bien(Costo unitario)">Mano de Obra (Costo Promedio)</td>
                                        <td><div class="text-right">$ <%=formato.format(manodeobraprom)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(manodeobraprom2)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(manodeobraprom3)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(manodeobraprom4)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(manodeobraprom5)%></div></td>
                                    </tr>
                                    <tr>
                                        <td title="Suma de Materia Prima (costo unitario)+ Mano de obra (costo unitario)">Materia Prima y Mano de Obra</td>
                                        <td><div class="text-right">$ <%=formato.format(mateprimeacos + manodeobraprom)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(mateprimeacos2 + manodeobraprom2)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(mateprimeacos3 + manodeobraprom3)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(mateprimeacos4 + manodeobraprom4)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(mateprimeacos5 + manodeobraprom5)%></div></td>
                                    </tr>
                                    <tr>
                                        <th colspan="6" class="info text-center">Otros Costos de Fabricación</th>
                                    </tr>
                                    <tr>
                                        <td title="Suma de Otros Costos de producción + servicios públicos (Producción) + (inversión diferida/2)">Otros Costos de Fabricación</td>
                                        <td><div class="text-right">$ <%=formato.format(totalcosotos)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(totalcostos2)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(totalcostos3)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(totalcostos4)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(totalcostos5)%></div></td>
                                    </tr>
                                    <tr>
                                        <th colspan="6" class="info text-center">Costos Producción Inventariables</th>
                                    </tr>

                                    <tr>
                                        <td title="Recursos naturales o artificiales que se utiliza para la elaboración de un bien (M.P c.u * Total Ventas)">Materia Prima</td>
                                        <td><div class="text-right">$ <%=formato.format(totalproducto)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(manodeobra2)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(manodeobra3)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(manodeobra4)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(manodeobra5)%></div></td>
                                    </tr>
                                    <tr>
                                        <td title="Esfuerzo fisico y mental que se realiza para la elaboración de un bien(M.O c.u * Total Ventas)">Mano de Obra</td>
                                        <td><div class="text-right">$ <%=formato.format(manodeobraprom * ventasdetodo)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(manodeobraprom2 * ventasdetodo2)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(manodeobraprom3 * ventasdetodo3)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(manodeobraprom4 * ventasdetodo4)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(manodeobraprom5 * ventasdetodo5)%></div></td>
                                    </tr>
                                    <tr>
                                        <td title="Suma de Materia Prima(M.P) + Mano de Obra(M.O)">Materia Prima y Mano de Obra</td>
                                        <td><div class="text-right">$<%=formato.format(materiaprima)%></div></td>
                                        <td><div class="text-right">$<%=formato.format(materiaprima2)%></div></td>
                                        <td><div class="text-right">$<%=formato.format(materiaprima3)%></div></td>
                                        <td><div class="text-right">$<%=formato.format(materiaprima4)%></div></td>
                                        <td><div class="text-right">$<%=formato.format(materiaprima5)%></div></td>
                                    </tr>
                                    <tr>
                                        <td title="Disminución del valor de un bien material (suma de Depreciación Período de 
                                            (Construcciones y Edificios + Maquinaria y Equipo + Muebles y Enseres + Equipo de Transporte + Equipo de Oficina) )">Depreciación</td>
                                        <td><div class="text-right">$ <%=formato.format(depresiacion20 + DEPRESIACION10 + depresiacion10 + DEPRESIACION5 + depresiacion5)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(depresiacion202 + DEPRESIACION102 + depresiacion102 + DEPRESIACION52 + depresiacion52)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(depresiacion203 + DEPRESIACION103 + depresiacion103 + DEPRESIACION53 + depresiacion53)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(depresiacion204 + DEPRESIACION104 + depresiacion104 + DEPRESIACION54 + depresiacion54)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(depresiacion205 + DEPRESIACION105 + depresiacion105 + DEPRESIACION55 + depresiacion55)%></div></td>
                                    </tr>
                                    <tr>
                                        <td title="Disminución del valor de la tierra (Recuersos naturales) (suma de Amortización Período de (Activos biológicos (Agrícolas + Pecuarios )))">Agotamiento</td>
                                        <td><div class="text-right">$ <%=formato.format(depresiacionsemo + depresiacionculti)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(depresiacionsemo2 + depresiacionculti2)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(depresiacionsemo3 + depresiacionculti3)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(depresiacionsemo4 + depresiacionculti4)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(depresiacionsemo5 + depresiacionculti5)%></div></td>
                                    </tr>
                                    <%
                                        double totalcostoproduccion = 0, totalcostoproduccion2 = 0, totalcostoproduccion3 = 0, totalcostoproduccion4 = 0, totalcostoproduccion5 = 0;
                                        totalcostoproduccion = materiaprima + depresiacion20 + DEPRESIACION10 + depresiacion10 + DEPRESIACION5 + depresiacion5 + depresiacionsemo + depresiacionculti;
                                        totalcostoproduccion2 = materiaprima2 + depresiacion202 + DEPRESIACION102 + depresiacion102 + DEPRESIACION52 + depresiacion52 + depresiacionsemo2 + depresiacionculti2;
                                        totalcostoproduccion3 = materiaprima3 + depresiacion203 + DEPRESIACION103 + depresiacion103 + DEPRESIACION53 + depresiacion53 + depresiacionsemo3 + depresiacionculti3;
                                        totalcostoproduccion4 = materiaprima4 + depresiacion204 + DEPRESIACION104 + depresiacion104 + DEPRESIACION54 + depresiacion54 + depresiacionsemo4 + depresiacionculti4;
                                        totalcostoproduccion5 = materiaprima5 + depresiacion205 + DEPRESIACION105 + depresiacion105 + DEPRESIACION55 + depresiacion55 + depresiacionsemo5 + depresiacionculti5;

                                    %>
                                    <tr>
                                        <td title="Materia Prima + Mano de Obra + Depreciación + Agotamiento">Total</td>
                                        <td><div class="text-right">$<%=formato.format(totalcostoproduccion)%></div></td>
                                        <td><div class="text-right">$<%=formato.format(totalcostoproduccion2)%></div></td>
                                        <td><div class="text-right">$<%=formato.format(totalcostoproduccion3)%></div></td>
                                        <td><div class="text-right">$<%=formato.format(totalcostoproduccion4)%></div></td>
                                        <td><div class="text-right">$<%=formato.format(totalcostoproduccion5)%></div></td>
                                    </tr>
                                    <%
                                        double margenbruto = 0, margenbruto2 = 0, margenbruto3 = 0, margenbruto4 = 0, margenbruto5 = 0;
                                        margenbruto = (1 - totalcostoproduccion / venta1) * 100;
                                        margenbruto2 = (1 - totalcostoproduccion2 / venta2) * 100;
                                        margenbruto3 = (1 - totalcostoproduccion3 / venta3) * 100;
                                        margenbruto4 = (1 - totalcostoproduccion4 / venta4) * 100;
                                        margenbruto5 = (1 - totalcostoproduccion5 / venta5) * 100;
                                    %>
                                    <tr>
                                        <td title="Porcentaje de la utilidad bruta después de incurrir en los costos asociados a la producción de bienes y/o servicios(Total Costos Producción Inventariables / Total Ventas)">Margen Bruto</td>
                                        <td><div class="text-right"><%=formato2.format(margenbruto)%> % </div></td>
                                        <td><div class="text-right"><%=formato2.format(margenbruto2)%> % </div></td>
                                        <td><div class="text-right"><%=formato2.format(margenbruto3)%> % </div></td>
                                        <td><div class="text-right"><%=formato2.format(margenbruto4)%> % </div></td>
                                        <td><div class="text-right"><%=formato2.format(margenbruto5)%> % </div></td>
                                    </tr>
                                    <tr>
                                        <th colspan="6" class="info text-center">Gastos Operacionales</th>
                                    </tr>
                                    <tr>
                                        <td title="Valor total anual de Gastos de Ventas">Gastos de Ventas</td>
                                        <td><div class="text-right">$ <%=formato.format(gastoventas)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(gastoventas2)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(gastoventas3)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(gastoventas4)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(gastoventas5)%></div></td>
                                    </tr>
                                    <tr>
                                        <td title="suma de Nómina Admin + Otros Gastos + 
                                            servicios públicos (Administración) + (Inversión Diferida/2)">Gastos Administación</td>
                                        <td><div class="text-right">$ <%=formato.format(totaladministracion)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(totaladministracion2)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(totaladministracion3)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(totaladministracion4)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(totaladministracion5)%></div></td>
                                    </tr>
                                    <tr>
                                        <td title="Gastos de Ventas + Gastos Administación">Total Gastos</td>
                                        <td><div class="text-right">$ <%=formato.format(totaladministracion + gastoventas)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(totaladministracion2 + gastoventas2)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(totaladministracion3 + gastoventas3)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(totaladministracion4 + gastoventas4)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(totaladministracion5 + gastoventas5)%></div></td>
                                    </tr>
                                    <tr>
                                        <th colspan="6" class="info text-center">Cuentas por cobrar</th>
                                    </tr>
                                    <tr class="success">
                                        <td title="Tiempo en el cual la empresa toma en cobrar la cartera de sus clientes">Rotación Cartera Clientes (días)</td>
                                        <td><div class="text-right"> <%=formato.format(CarteraClientes)%> </div></td>
                                        <td><div class="text-right"> <%=formato.format(CarteraClientes2)%> </div></td>
                                        <td><div class="text-right"> <%=formato.format(CarteraClientes3)%> </div></td>
                                        <td><div class="text-right"> <%=formato.format(CarteraClientes4)%> </div></td>
                                        <td><div class="text-right"> <%=formato.format(CarteraClientes5)%> </div></td>
                                    </tr>
                                    <tr>
                                        <td title="Total Ventas * Rotación Cartera Clientes /360">Cartera Clientes</td>
                                        <td><div class="text-right">$ <%=formato.format(cuentacobrar)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(cuentacobrar2)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(cuentacobrar3)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(cuentacobrar4)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(cuentacobrar5)%></div></td>
                                    </tr>
                                 <%--   <tr>
                                        <td>Cartera Clientes (Var.)</td>
                                        <td><div class="text-right">$ <%=formato.format(0 - cuentacobrar)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(cuentacobrar - cuentacobrar2)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(cuentacobrar2 - cuentacobrar3)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(cuentacobrar3 - cuentacobrar4)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(cuentacobrar4 - cuentacobrar5)%></div></td>
                                    </tr>
                                 --%>
                                    <tr class="success">
                                        <td title="Cuentas impagables o dificil cobro por tanto constituyen un gasto para la empresa">Provisión Cuentas por Cobrar</td>
                                        <td><div class="text-right"> <%=formato.format(ProvicionCuentasCobrar)%> % </div></td>
                                        <td><div class="text-right"> <%=formato.format(ProvicionCuentasCobrar2)%> % </div></td>
                                        <td><div class="text-right"> <%=formato.format(ProvicionCuentasCobrar3)%> % </div></td>
                                        <td><div class="text-right"> <%=formato.format(ProvicionCuentasCobrar4)%> % </div></td>
                                        <td><div class="text-right"> <%=formato.format(ProvicionCuentasCobrar5)%> % </div></td>
                                    </tr>
                                    <tr>
                                        <td title="Provisión Cuentas por Cobrar (%) * Cartera Clientes">Provisión Cuentas por Cobrar</td>
                                        <td><div class="text-right">$ <%=formato.format(provicioncobrar)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(provicioncobrar2)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(provicioncobrar3)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(provicioncobrar4)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(provicioncobrar5)%></div></td>
                                    </tr>
                                <%--    <tr>
                                        <td>Provisión Período</td>
                                        <td><div class="text-right">$ <%=formato.format(provicioncobrar)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(provicioncobrar2 - provicioncobrar)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(provicioncobrar3 - provicioncobrar2)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(provicioncobrar4 - provicioncobrar3)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(provicioncobrar5 - provicioncobrar4)%></div></td>
                                    </tr>
                                --%>
                                    <tr>
                                        <th colspan="6" class="info text-center"
                                            title="Registro documental de los bienes tangibles">Inventarios</th>
                                    </tr>
                                    <tr class="success">
                                        <td title="Días de inventario Producto Terminado">Invent. Prod. Final Rotación</td>
                                        <td><div class="text-right"> <%=formato.format(invenproducto0)%></div></td>
                                        <td><div class="text-right"> <%=formato.format(invenproducto02)%></div></td>
                                        <td><div class="text-right"> <%=formato.format(invenproducto03)%></div></td>
                                        <td><div class="text-right"> <%=formato.format(invenproducto04)%></div></td>
                                        <td><div class="text-right"> <%=formato.format(invenproducto05)%></div></td>
                                    </tr>
                                    <tr>
                                        <td title="Invent. Prod. Final Rotación * Total Costos Producción Inventariables/360">Invent. Prod. Final</td>
                                        <td><div class="text-right">$ <%=formato.format(invenproducto)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(invenproducto2)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(invenproducto3)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(invenproducto4)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(invenproducto5)%></div></td>
                                    </tr>
                                    <%--
                                    <tr>
                                        <td>Invent. Prod. Final Variación</td>
                                        <td><div class="text-right">$ <%=formato.format(0 - invenproducto)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(invenproducto - invenproducto2)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(invenproducto2 - invenproducto3)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(invenproducto3 - invenproducto4)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(invenproducto4 - invenproducto5)%></div></td>
                                    </tr>
                                    --%>
                                    <tr class="success">
                                        <td title="Días de inventario Producto en Proceso en el cual será renovadas las existencias">Invent. Prod. en Proceso Rotación </td>
                                        <td><div class="text-right"> <%=formato.format(invVariacionP0)%></div></td>
                                        <td><div class="text-right"> <%=formato.format(invVariacionP02)%></div></td>
                                        <td><div class="text-right"> <%=formato.format(invVariacionP03)%></div></td>
                                        <td><div class="text-right"> <%=formato.format(invVariacionP04)%></div></td>
                                        <td><div class="text-right"> <%=formato.format(invVariacionP05)%></div></td>
                                    </tr>
                                    <tr>
                                        <td title="Invent. Prod. en Proceso Rotación * Total Costos Producción Inventariables/360">Invent. Prod. Proceso</td>
                                        <td><div class="text-right">$ <%=formato.format(invVariacionP)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(invVariacionP2)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(invVariacionP3)%> </div></td>
                                        <td><div class="text-right">$ <%=formato.format(invVariacionP4)%> </div></td>
                                        <td><div class="text-right">$ <%=formato.format(invVariacionP5)%> </div></td>
                                    </tr>
                                 <%--
                                    <tr>
                                        <td>Invent. Prod. Proceso Variación</td>
                                        <td><div class="text-right">$ <%=formato.format(0 - invVariacionP)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(invVariacionP - invVariacionP2)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(invVariacionP2 - invVariacionP3)%> </div></td>
                                        <td><div class="text-right">$ <%=formato.format(invVariacionP3 - invVariacionP4)%> </div></td>
                                        <td><div class="text-right">$ <%=formato.format(invVariacionP4 - invVariacionP5)%> </div></td>
                                    </tr>
                                 --%>
                                    <tr class="success">
                                        <td title="Días de inventario Materia Prima en el cual será renovadas las existencias">Invent. Materia Prima Rotación </td>
                                        <td><div class="text-right"> <%=formato.format(materiaRotacion)%></div></td>
                                        <td><div class="text-right"> <%=formato.format(materiaRotacion)%></div></td>
                                        <td><div class="text-right"> <%=formato.format(materiaRotacion)%></div></td>
                                        <td><div class="text-right"> <%=formato.format(materiaRotacion)%></div></td>
                                        <td><div class="text-right"> <%=formato.format(materiaRotacion)%></div></td>
                                    </tr>
                                    <tr>
                                        <td title="Materia Prima * Invent. Materia Prima Rotación/360">Invent. Materia Prima</td>
                                        <td><div class="text-right">$ <%=formato.format(invmateria)%> </div></td>
                                        <td><div class="text-right">$ <%=formato.format(invmateria2)%> </div></td>
                                        <td><div class="text-right">$ <%=formato.format(invmateria3)%> </div></td>
                                        <td><div class="text-right">$ <%=formato.format(invmateria4)%> </div></td>
                                        <td><div class="text-right">$ <%=formato.format(invmateria5)%> </div></td>
                                    </tr>
                                    <%--
                                    <tr>
                                        <td>Invent. Materia Prima Variación</td>
                                        <td><div class="text-right">$ <%=formato.format(0 - invmateria)%>  </div></td>
                                        <td><div class="text-right">$ <%=formato.format(invmateria - invmateria2)%>  </div></td>
                                        <td><div class="text-right">$ <%=formato.format(invmateria2 - invmateria3)%>  </div></td>
                                        <td><div class="text-right">$ <%=formato.format(invmateria3 - invmateria4)%>  </div></td>
                                        <td><div class="text-right">$ <%=formato.format(invmateria4 - invmateria5)%>  </div></td>
                                    </tr>
                                    --%>
                                    <tr>
                                        <td title="Invent. Prod. Final + Invent. Prod. Proceso + Invent. Materia Prima">Total Inventario</td>
                                        <td><div class="text-right">$ <%=formato.format(invenproducto + invVariacionP + invmateria)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(invenproducto2 + invVariacionP2 + invmateria2)%> </div></td>
                                        <td><div class="text-right">$ <%=formato.format(invenproducto3 + invVariacionP3 + invmateria3)%> </div></td>
                                        <td><div class="text-right">$ <%=formato.format(invenproducto4 + invVariacionP4 + invmateria4)%> </div></td>
                                        <td><div class="text-right">$ <%=formato.format(invenproducto5 + invVariacionP5 + invmateria5)%> </div></td>
                                    </tr>
                                    <tr>
                                        <th colspan="6" class="info text-center">Anticipos y Otras Cuentas por Cobar</th>
                                    </tr>
                                    <tr class="success">
                                        <td title="Pago de una obligación a su empresa por adelantado">Anticipos y Otras Cuentas por Cobar</td>
                                        <td><div class="text-right">$ <%=formato.format(anticipo)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(anticipo2)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(anticipo3)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(anticipo4)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(anticipo5)%></div></td>
                                    </tr>
                                    <%--      <tr>
                                        <td>Anticipos y Otras Cuentas por Cobar (Var.)</td>
                                        <td><div class="text-right">$ <%=formato.format(anticipo)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(anticipo2 - anticipo)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(anticipo3 - anticipo2)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(anticipo4 - anticipo3)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(anticipo5 - anticipo4)%></div></td>
                                    </tr>
                                    --%>
                                    <tr>
                                        <th colspan="6" class="info text-center">Cuentas por Pagar</th>
                                    </tr>
                                    <tr class="success">
                                        <td title="Cuentas a pagar empresas o persona que proporciona un servicio o un bien">Cuentas por Pagar Proveedores</td>
                                        <td><div class="text-right"> <%=formato.format(cuentaapagar0)%></div></td>
                                        <td><div class="text-right"> <%=formato.format(cuentaapagar02)%></div></td>
                                        <td><div class="text-right"> <%=formato.format(cuentaapagar03)%></div></td>
                                        <td><div class="text-right"> <%=formato.format(cuentaapagar04)%></div></td>
                                        <td><div class="text-right"> <%=formato.format(cuentaapagar05)%></div></td>
                                    </tr>
                                    <tr>
                                        <td title="Materia Prima y Mano de Obra * Cuentas por Pagar Proveedores / 360">Cuentas por Pagar Proveedores</td>
                                        <td><div class="text-right">$ <%=formato.format(cuentaapagar)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(cuentaapagar2)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(cuentaapagar3)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(cuentaapagar4)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(cuentaapagar5)%></div></td>
                                    </tr>
                                    <%--
                                    <tr>
                                        <td>Cuentas por Pagar Proveedores (Var.)</td>
                                        <td><div class="text-right">$ <%=formato.format(cuentaapagar)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(cuentaapagar2 - cuentaapagar)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(cuentaapagar3 - cuentaapagar2)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(cuentaapagar4 - cuentaapagar3)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(cuentaapagar5 - cuentaapagar4)%></div></td>
                                    </tr>
                                    --%>
                                    <tr class="success">
                                        <td title="Empresa o Persona que exige cumplimiento de una obligación (Pago)">Acreedores Varios</td>
                                        <td><div class="text-right">$ <%=formato.format(acree)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(acree2)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(acree3)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(acree4)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(acree5)%></div></td>
                                    </tr>
                                    <%--
                                    <tr>
                                        <td>Acreedores Varios (Var.)</td>
                                        <td><div class="text-right">$ <%=formato.format(acree)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(acree2 - acree)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(acree3 - acree2)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(acree4 - acree3)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(acree5 - acree4)%></div></td>
                                    </tr>
                                    --%>
                                    <tr class="success">
                                        <td title="Otras deudas o obligaciones que la empresa tiene">Otros Pasivos</td>
                                        <td><div class="text-right">$ <%=formato.format(otropasivo)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(otropasivo2)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(otropasivo3)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(otropasivo4)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(otropasivo5)%></div></td>
                                    </tr>
                                    <%--
                                    <tr>
                                        <td>Otros Pasivos (Var.)</td>
                                        <td><div class="text-right">$ <%=formato.format(otropasivo)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(otropasivo2 - otropasivo)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(otropasivo3 - otropasivo2)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(otropasivo4 - otropasivo3)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(otropasivo5 - otropasivo4)%></div></td>
                                    </tr>
                                    --%>
                                     <tr>
                                        <th colspan="6" class="info text-center">Terrenos</th>
                                    </tr>
                                    <tr>
                                        <td title="Total Inversión Terrenos ">Valor Ajustado</td>
                                        <td><div class="text-right">$<%=formato.format(totalTerrenos + total20)%></div></td>
                                        <td><div class="text-right">$<%=formato.format(totalTerrenos + total20 + total202)%></div></td>
                                        <td><div class="text-right">$<%=formato.format(totalTerrenos + total20 + total202 + total203)%></div></td>
                                        <td><div class="text-right">$<%=formato.format(totalTerrenos + total20 + total202 + total203 + total204)%></div></td>
                                        <td><div class="text-right">$<%=formato.format(totalTerrenos + total20 + total202 + total203 + total204 + total205)%></div></td>
                                    </tr>
                                  <tr>
                                        <td title="Ajuste por inflación">Axi</td>
                                        <td title="Total inversion Terrenos * Inflación(año 1)"><div class="text-right">$ <%=formato.format(total20)%></div></td>
                                        <td title="Valor Ajustado (año 1) * Inflación (año 2)"><div class="text-right">$ <%=formato.format(total202)%></div></td>
                                        <td title="Valor Ajustado (año 2) * Inflación (año 3)"><div class="text-right">$ <%=formato.format(total203)%></div></td>
                                        <td title="Valor Ajustado (año 3) * Inflación (año 4)"><div class="text-right">$ <%=formato.format(total204)%></div></td>
                                        <td title="Valor Ajustado (año 4) * Inflación (año 5)"><div class="text-right">$ <%=formato.format(total205)%></div></td>
                                    </tr>
                         
                                    <tr>
                                        <th colspan="6" class="info text-center">Construcciones y Edificios</th>
                                    </tr>
                                    <tr>
                                        <td title="Total inversion Construcciones y Edificios ">Valor Ajustado</td>
                                        <td><div class="text-right">$ <%=formato.format(totalConstrucion + TOTAL20)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(totalConstrucion + TOTAL20 + TOTAL201)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(totalConstrucion + TOTAL20 + TOTAL201 + TOTAL203)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(totalConstrucion + TOTAL20 + TOTAL201 + TOTAL203 + TOTAL204)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(totalConstrucion + TOTAL20 + TOTAL201 + TOTAL203 + TOTAL204 + TOTAL205)%></div></td>
                                    </tr>
                                   <%-- <tr>
                                        <td title="Ajuste por inflación">Axi</td>
                                        <td title="Total inversion Construcciones y Edificios * Inflación(año 1)"><div class="text-right">$ <%=formato.format(TOTAL20)%></div></td>
                                        <td title="Valor Ajustado (año 1) * Inflación (año 2)"><div class="text-right">$ <%=formato.format(TOTAL201)%></div></td>
                                        <td title="Valor Ajustado (año 2) * Inflación (año 3)"><div class="text-right">$ <%=formato.format(TOTAL203)%></div></td>
                                        <td title="Valor Ajustado (año 3) * Inflación (año 4)"><div class="text-right">$ <%=formato.format(TOTAL204)%></div></td>
                                        <td title="Valor Ajustado (año 4) * Inflación (año 5)"><div class="text-right">$ <%=formato.format(TOTAL205)%></div></td>
                                    </tr>
                             --%>
                                    <tr>
                                        <td title="Valor Ajustado Construcciones y Edificios / 10">Depreciación Período</td>
                                        <td><div class="text-right">$ <%=formato.format(depresiacion20)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(depresiacion202)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(depresiacion203)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(depresiacion204)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(depresiacion205)%></div></td>
                                    </tr>
                           <%--         <tr>
                                        <td>Axi Depreciación acumulada</td>
                                        <td><div class="text-right">$ <%=formato.format(0)%></div></td>
                                        <td title="Depreciación acum (año 1) * PAGG (año 2)"><div class="text-right">$ <%=formato.format(suAjusteDepre2)%></div></td>
                                        <td title="Depreciación acum (año 2) * PAGG (año 3)"><div class="text-right">$ <%=formato.format(suAjusteDepre3)%></div></td>
                                        <td title="Depreciación acum (año 3) * PAGG (año 4)"><div class="text-right">$ <%=formato.format(suAjusteDepre4)%></div></td>
                                        <td title="Depreciación acum (año 4) * PAGG (año 5)"><div class="text-right">$ <%=formato.format(suAjusteDepre5)%></div></td>
                                    </tr>
                          
                                    <tr>
                                        <td>Depreciación acumulada</td>
                                        <td  title="Depreciación Período (año 1)"><div class="text-right">$ <%=formato.format(depresiacion20)%></div></td>
                                        <td title="Depreciación acum. (año 1) + Depreciación Período (año 2) "><div class="text-right">$ <%=formato.format(depresiacion20 + depresiacion202 + suAjusteDepre2)%></div></td>
                                        <td title="Depreciación acum. (año 2) + Depreciación Período (año 3) "><div class="text-right">$ <%=formato.format(depresiacion20 + depresiacion202 + suAjusteDepre2 + depresiacion203 + suAjusteDepre3)%></div></td>
                                        <td title="Depreciación acum. (año 3) + Depreciación Período (año 4) "><div class="text-right">$ <%=formato.format(depresiacion20 + depresiacion202 + suAjusteDepre2 + depresiacion203 + suAjusteDepre3 + depresiacion204 + suAjusteDepre4)%></div></td>
                                        <td title="Depreciación acum. (año 4) + Depreciación Período (año 5) "><div class="text-right">$ <%=formato.format(depresiacion20 + depresiacion202 + suAjusteDepre2 + depresiacion203 + suAjusteDepre3 + depresiacion204 + suAjusteDepre4 + depresiacion205 + suAjusteDepre5)%></div></td>
                                    </tr>
                            --%>
                                    <tr>
                                        <td>Valor neto</td>
                                        <td title="Total Inversion  - Depreciación acum. (año 1)"><div class="text-right">$ <%=formato.format(totalConstrucion + TOTAL20 - depresiacion20)%></div></td>
                                        <td title="Total Inversion  - Depreciación acum. (año 2)"><div class="text-right">$ <%=formato.format(totalConstrucion + TOTAL20 + TOTAL201 - depresiacion20 - depresiacion202 - suAjusteDepre2)%></div></td>
                                        <td title="Total Inversion  - Depreciación acum. (año 3)"><div class="text-right">$ <%=formato.format(totalConstrucion + TOTAL20 + TOTAL201 + TOTAL203 - depresiacion20 - depresiacion202 - suAjusteDepre2 - depresiacion203 - suAjusteDepre3)%></div></td>
                                        <td title="Total Inversion  - Depreciación acum. (año 4)"><div class="text-right">$ <%=formato.format(totalConstrucion + TOTAL20 + TOTAL201 + TOTAL203 + TOTAL204 - depresiacion20 - depresiacion202 - suAjusteDepre2 - depresiacion203 - suAjusteDepre3 - depresiacion204 - suAjusteDepre4)%></div></td>
                                        <td title="Total Inversion  - Depreciación acum. (año 5)"><div class="text-right">$ <%=formato.format(totalConstrucion + TOTAL20 + TOTAL201 + TOTAL203 + TOTAL204 + TOTAL205 - depresiacion20 - depresiacion202 - suAjusteDepre2 - depresiacion203 - suAjusteDepre3 - depresiacion204 - suAjusteDepre4 - depresiacion205 - suAjusteDepre5)%></div></td>
                                    </tr>
                                    <tr>
                                        <th colspan="6" class="info text-center">Maquinaria y Equipo</th>
                                    </tr>
                                  <%--    <tr>
                                        <td>Valor Ajustado</td>
                                        <td title="Total inversion Maquinaria y Equipo "><div class="text-right">$ <%=formato.format(totalMaquinaria + TOTAL10)%></div></td>
                                        <td title="Valor Ajustado (año 1) "><div class="text-right">$ <%=formato.format(totalMaquinaria + TOTAL10 + TOTAL102)%></div></td>
                                        <td title="Valor Ajustado (año 2) "><div class="text-right">$ <%=formato.format(totalMaquinaria + TOTAL10 + TOTAL102 + TOTAL103)%></div></td>
                                        <td title="Valor Ajustado (año 3) "><div class="text-right">$ <%=formato.format(totalMaquinaria + TOTAL10 + TOTAL102 + TOTAL103 + TOTAL104)%></div></td>
                                        <td title="Valor Ajustado (año 4) "><div class="text-right">$ <%=formato.format(totalMaquinaria + TOTAL10 + TOTAL102 + TOTAL103 + TOTAL104 + TOTAL105)%></div></td>
                                    </tr>
                                  <tr>
                                        <td title="Ajuste por inflación">Axi</td>
                                        <td title="Total inversion Maquinaria y Equipo * PAGG(año 1)"><div class="text-right">$ <%=formato.format(TOTAL10)%></div></td>
                                        <td title="Valor Ajustado (año 1) * PAGG (año 2)"><div class="text-right">$ <%=formato.format(TOTAL102)%></div></td>
                                        <td title="Valor Ajustado (año 2) * PAGG (año 3)"><div class="text-right">$ <%=formato.format(TOTAL103)%></div></td>
                                        <td title="Valor Ajustado (año 3) * PAGG (año 4)"><div class="text-right">$ <%=formato.format(TOTAL104)%></div></td>
                                        <td title="Valor Ajustado (año 4) * PAGG (año 5)"><div class="text-right">$ <%=formato.format(TOTAL105)%></div></td>
                                    </tr>
                              --%>
                                    <tr>
                                        <td title="Valor Ajustado Maquinaria y Equipo / 10">Depreciación Período</td>
                                        <td><div class="text-right">$ <%=formato.format(DEPRESIACION10)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(DEPRESIACION102)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(DEPRESIACION103)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(DEPRESIACION104)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(DEPRESIACION105)%></div></td>
                                    </tr>
                               <%--     <tr>
                                        <td>Axi Depreciación acumulada</td>
                                        <td><div class="text-right">$ <%=formato.format(0)%></div></td>
                                        <td title="Depreciación acum (año 1) * PAGG (año 2)"><div class="text-right">$ <%=formato.format(ajusdepre02)%></div></td>
                                        <td title="Depreciación acum (año 2) * PAGG (año 3)"><div class="text-right">$ <%=formato.format(ajusdepre03)%></div></td>
                                        <td title="Depreciación acum (año 3) * PAGG (año 4)"><div class="text-right">$ <%=formato.format(ajusdepre04)%></div></td>
                                        <td title="Depreciación acum (año 4) * PAGG (año 5)"><div class="text-right">$ <%=formato.format(ajusdepre05)%></div></td>
                                    </tr>
                               
                                    <tr>
                                        <td>Depreciación acumulada</td>
                                        <td title="Depreciación Período (año 1) + Axi Depreciación acumulada (año 1)"><div class="text-right">$ <%=formato.format(DEPRESIACION10)%></div></td>
                                        <td title="Depreciación acum. (año 1) + Depreciación Período (año 2) +  Axi Depreciación acumulada (año 2)"><div class="text-right">$ <%=formato.format(DEPRESIACION10 + DEPRESIACION102 + ajusdepre02)%></div></td>
                                        <td title="Depreciación acum. (año 2) + Depreciación Período (año 3) +  Axi Depreciación acumulada (año 3)"><div class="text-right">$ <%=formato.format(DEPRESIACION10 + DEPRESIACION102 + ajusdepre02 + DEPRESIACION103 + ajusdepre03)%></div></td>
                                        <td title="Depreciación acum. (año 3) + Depreciación Período (año 4) +  Axi Depreciación acumulada (año 4)"><div class="text-right">$ <%=formato.format(DEPRESIACION10 + DEPRESIACION102 + ajusdepre02 + DEPRESIACION103 + ajusdepre03 + DEPRESIACION104 + ajusdepre04)%></div></td>
                                        <td title="Depreciación acum. (año 4) + Depreciación Período (año 5) +  Axi Depreciación acumulada (año 5)"><div class="text-right">$ <%=formato.format(DEPRESIACION10 + DEPRESIACION102 + ajusdepre02 + DEPRESIACION103 + ajusdepre03 + DEPRESIACION104 + ajusdepre04 + DEPRESIACION105 + ajusdepre05)%></div></td>
                                    </tr>
                               --%>
                                    <tr>
                                        <td>Valor neto</td>
                                        <td title="Total Inversion  -  Depreciación  (año 1)"><div class="text-right">$ <%=formato.format(totalMaquinaria  - DEPRESIACION10)%></div></td>
                                        <td title="Total Inversion  -  Depreciación  (año 2)"><div class="text-right">$ <%=formato.format(totalMaquinaria + TOTAL10 + TOTAL102 - DEPRESIACION10 - DEPRESIACION102 - ajusdepre02)%></div></td>
                                        <td title="Total Inversion  -  Depreciación  (año 3)"><div class="text-right">$ <%=formato.format(totalMaquinaria + TOTAL10 + TOTAL102 + TOTAL103 - DEPRESIACION10 - DEPRESIACION102 - ajusdepre02 - DEPRESIACION103 - ajusdepre03)%></div></td>
                                        <td title="Total Inversion  -  Depreciación  (año 4)"><div class="text-right">$ <%=formato.format(totalMaquinaria + TOTAL10 + TOTAL102 + TOTAL103 + TOTAL104 - DEPRESIACION10 - DEPRESIACION102 - ajusdepre02 - DEPRESIACION103 - ajusdepre03 - DEPRESIACION104 - ajusdepre04)%></div></td>
                                        <td title="Total Inversion  -  Depreciación  (año 5)"><div class="text-right">$ <%=formato.format(totalMaquinaria + TOTAL10 + TOTAL102 + TOTAL103 + TOTAL104 + TOTAL105 - DEPRESIACION10 - DEPRESIACION102 - ajusdepre02 - DEPRESIACION103 - ajusdepre03 - DEPRESIACION104 - ajusdepre04 - DEPRESIACION105 - ajusdepre05)%></div></td>
                                    </tr>
                                    <tr>
                                        <th colspan="6" class="info text-center">Muebles y Enseres</th>
                                    </tr>
                                  <%--   <tr>
                                        <td>Valor Ajustado</td>
                                        <td title="Total inversion Muebles y Enseres "><div class="text-right">$ <%=formato.format(totalMuebles + total10)%></div></td>
                                        <td title="Valor Ajustado (año 1) "><div class="text-right">$ <%=formato.format(totalMuebles + total10 + total102)%></div></td>
                                        <td title="Valor Ajustado (año 2) "><div class="text-right">$ <%=formato.format(totalMuebles + total10 + total102 + total103)%></div></td>
                                        <td title="Valor Ajustado (año 3) "><div class="text-right">$ <%=formato.format(totalMuebles + total10 + total102 + total103 + total104)%></div></td>
                                        <td title="Valor Ajustado (año 4) "><div class="text-right">$ <%=formato.format(totalMuebles + total10 + total102 + total103 + total104 + total105)%></div></td>
                                    </tr>
                                   
                                    <tr>
                                        <td title="Ajuste por inflación">Axi</td>
                                        <td title="Muebles y Enseres * PAGG (año 1)"><div class="text-right">$ <%=formato.format(total10)%></div></td>
                                        <td title="Muebles y Enseres * PAGG (año 2)"><div class="text-right">$ <%=formato.format(total102)%></div></td>
                                        <td title="Muebles y Enseres * PAGG (año 3)"><div class="text-right">$ <%=formato.format(total103)%></div></td>
                                        <td title="Muebles y Enseres * PAGG (año 4)"><div class="text-right">$ <%=formato.format(total104)%></div></td>
                                        <td title="Muebles y Enseres * PAGG (año 5)"><div class="text-right">$ <%=formato.format(total105)%></div></td>
                                    </tr>
                                    --%>
                                    <tr>
                                        <td title="Valor Ajustado Muebles y Enseres / 10">Depreciación Período</td>
                                        <td><div class="text-right">$ <%=formato.format(depresiacion10)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(depresiacion102)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(depresiacion103)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(depresiacion104)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(depresiacion105)%></div></td>
                                    </tr>
                                    <%--
                                    <tr>
                                        <td>Axi Depreciación acumulada</td>
                                        <td><div class="text-right">$ <%=formato.format(0)%></div></td>
                                        <td title="Depreciación acum (año 1) * PAGG (año 2)"><div class="text-right">$ <%=formato.format(ajusdepre2)%></div></td>
                                        <td title="Depreciación acum (año 2) * PAGG (año 3)"><div class="text-right">$ <%=formato.format(ajusdepre3)%></div></td>
                                        <td title="Depreciación acum (año 3) * PAGG (año 4)"><div class="text-right">$ <%=formato.format(ajusdepre4)%></div></td>
                                        <td title="Depreciación acum (año 4) * PAGG (año 5)"><div class="text-right">$ <%=formato.format(ajusdepre5)%></div></td>
                                    </tr>
                                    <tr>
                                        <td>Depreciación acumulada</td>
                                        <td title="Depreciación Período (año 1) + Axi Depreciación acumulada (año 1)"><div class="text-right">$ <%=formato.format(depresiacion10)%></div></td>
                                        <td title="Depreciación acum. (año 1) + Depreciación Período (año 2) +  Axi Depreciación acumulada (año 2)"><div class="text-right">$ <%=formato.format(depresiacion10 + depresiacion102 + ajusdepre2)%></div></td>
                                        <td title="Depreciación acum. (año 2) + Depreciación Período (año 3) +  Axi Depreciación acumulada (año 3)"><div class="text-right">$ <%=formato.format(depresiacion10 + depresiacion102 + ajusdepre2 + depresiacion103 + ajusdepre3)%></div></td>
                                        <td title="Depreciación acum. (año 3) + Depreciación Período (año 4) +  Axi Depreciación acumulada (año 4)"><div class="text-right">$ <%=formato.format(depresiacion10 + depresiacion102 + ajusdepre2 + depresiacion103 + ajusdepre3 + depresiacion104 + ajusdepre4)%></div></td>
                                        <td title="Depreciación acum. (año 4) + Depreciación Período (año 5) +  Axi Depreciación acumulada (año 5)"><div class="text-right">$ <%=formato.format(depresiacion10 + depresiacion102 + ajusdepre2 + depresiacion103 + ajusdepre3 + depresiacion104 + ajusdepre4 + depresiacion105 + ajusdepre5)%></div></td>
                                    </tr>
                                    --%>
                                    <tr>
                                        <td>Valor neto</td>
                                        <td title="Total Inversion  -  Depreciación  (año 1)"><div class="text-right">$ <%=formato.format(totalMuebles - depresiacion10)%></div></td>
                                        <td title="Total Inversion  -  Depreciación  (año 2)"><div class="text-right">$ <%=formato.format(totalMuebles - depresiacion10 - depresiacion102)%></div></td>
                                        <td title="Total Inversion  -  Depreciación  (año 3)"><div class="text-right">$ <%=formato.format(totalMuebles - depresiacion10 - depresiacion102 - depresiacion103 )%></div></td>
                                        <td title="Total Inversion  -  Depreciación  (año 4)"><div class="text-right">$ <%=formato.format(totalMuebles - depresiacion10 - depresiacion102 - depresiacion103  - depresiacion104)%></div></td>
                                        <td title="Total Inversion  -  Depreciación  (año 5)"><div class="text-right">$ <%=formato.format(totalMuebles - depresiacion10 - depresiacion102 - depresiacion103  - depresiacion104 - depresiacion105)%></div></td>
                                    </tr>



                                    <tr>
                                        <th colspan="6" class="info text-center">Equipo de Transporte</th>
                                    </tr>
                                 <%--       <tr>
                                        <td>Valor Ajustado</td>
                                        <td title="Total inversion Equipo de Transporte + Axi (año 1)"><div class="text-right">$ <%=formato.format(totalTransporte + TOTAL5)%></div></td>
                                        <td title="Valor Ajustado (año 1) + Axi (año 2)"><div class="text-right">$ <%=formato.format(totalTransporte + TOTAL5 + TOTAL52)%></div></td>
                                        <td title="Valor Ajustado (año 2) + Axi (año 3)"><div class="text-right">$ <%=formato.format(totalTransporte + TOTAL5 + TOTAL52 + TOTAL53)%></div></td>
                                        <td title="Valor Ajustado (año 3) + Axi (año 4)"><div class="text-right">$ <%=formato.format(totalTransporte + TOTAL5 + TOTAL52 + TOTAL53 + TOTAL54)%></div></td>
                                        <td title="Valor Ajustado (año 4) + Axi (año 5)"><div class="text-right">$ <%=formato.format(totalTransporte + TOTAL5 + TOTAL52 + TOTAL53 + TOTAL54 + TOTAL55)%></div></td>
                                    </tr>
                                <tr>
                                        <td title="Ajuste por inflación">Axi</td>
                                        <td title="totalTransporte * PAGG (año 1)"><div class="text-right">$ <%=formato.format(TOTAL5)%></div></td>
                                        <td title="totalTransporte * PAGG (año 2)"><div class="text-right">$ <%=formato.format(TOTAL52)%></div></td>
                                        <td title="totalTransporte * PAGG (año 3)"><div class="text-right">$ <%=formato.format(TOTAL53)%></div></td>
                                        <td title="totalTransporte * PAGG (año 4)"><div class="text-right">$ <%=formato.format(TOTAL54)%></div></td>
                                        <td title="totalTransporte * PAGG (año 5)"><div class="text-right">$ <%=formato.format(TOTAL55)%></div></td>
                                    </tr>
                               --%>
                                    <tr>
                                        <td title="Valor Ajustado Equipo de Transporte / 5">Depreciación Período</td>
                                        <td><div class="text-right">$ <%=formato.format(DEPRESIACION5)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(DEPRESIACION52)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(DEPRESIACION53)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(DEPRESIACION54)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(DEPRESIACION55)%></div></td>
                                    </tr>
                                <%--    <tr>
                                        <td>Axi Depreciación acumulada</td>
                                        <td><div class="text-right">$ <%=formato.format(0)%></div></td>
                                        <td title="Depreciación acum (año 1) * PAGG (año 2)"><div class="text-right">$ <%=formato.format(Ajusdepre02)%></div></td>
                                        <td title="Depreciación acum (año 2) * PAGG (año 3)"><div class="text-right">$ <%=formato.format(Ajusdepre03)%></div></td>
                                        <td title="Depreciación acum (año 3) * PAGG (año 4)"><div class="text-right">$ <%=formato.format(Ajusdepre04)%></div></td>
                                        <td title="Depreciación acum (año 4) * PAGG (año 5)"><div class="text-right">$ <%=formato.format(Ajusdepre05)%></div></td>
                                    </tr>
                                    <tr>
                                        <td>Depreciación acumulada</td>
                                        <td title="Depreciación Período (año 1) + Axi Depreciación acumulada (año 1)"><div class="text-right">$ <%=formato.format(DEPRESIACION5)%></div></td>
                                        <td title="Depreciación acum. (año 1) + Depreciación Período (año 2) +  Axi Depreciación acumulada (año 2)"><div class="text-right">$ <%=formato.format(DEPRESIACION5 + DEPRESIACION52 + Ajusdepre02)%></div></td>
                                        <td title="Depreciación acum. (año 2) + Depreciación Período (año 3) +  Axi Depreciación acumulada (año 3)"><div class="text-right">$ <%=formato.format(DEPRESIACION5 + DEPRESIACION52 + Ajusdepre02 + DEPRESIACION53 + Ajusdepre03)%></div></td>
                                        <td title="Depreciación acum. (año 3) + Depreciación Período (año 4) +  Axi Depreciación acumulada (año 4)"><div class="text-right">$ <%=formato.format(DEPRESIACION5 + DEPRESIACION52 + Ajusdepre02 + DEPRESIACION53 + Ajusdepre03 + DEPRESIACION54 + Ajusdepre04)%></div></td>
                                        <td title="Depreciación acum. (año 4) + Depreciación Período (año 5) +  Axi Depreciación acumulada (año 5)"><div class="text-right">$ <%=formato.format(DEPRESIACION5 + DEPRESIACION52 + Ajusdepre02 + DEPRESIACION53 + Ajusdepre03 + DEPRESIACION54 + Ajusdepre04 + DEPRESIACION55 + Ajusdepre05)%></div></td>
                                    </tr>
                                --%>
                                    <tr>
                                        <td>Valor neto</td>
                                        <td title="Total Inversion  -  Depreciación acum. (año 1)"><div class="text-right">$ <%=formato.format(totalTransporte  - DEPRESIACION5)%></div></td>
                                        <td title="Total Inversion  -  Depreciación acum. (año 2)"><div class="text-right">$ <%=formato.format(totalTransporte  - DEPRESIACION5 - DEPRESIACION52)%></div></td>
                                        <td title="Total Inversion  -  Depreciación acum. (año 3)"><div class="text-right">$ <%=formato.format(totalTransporte  - DEPRESIACION5 - DEPRESIACION52 - DEPRESIACION53 )%></div></td>
                                        <td title="Total Inversion  -  Depreciación acum. (año 4)"><div class="text-right">$ <%=formato.format(totalTransporte  - DEPRESIACION5 - DEPRESIACION52 - DEPRESIACION53 - DEPRESIACION54)%></div></td>
                                        <td title="Total Inversion  -  Depreciación acum. (año 5)"><div class="text-right">$ <%=formato.format(totalTransporte  - DEPRESIACION5 - DEPRESIACION52 - DEPRESIACION53 - DEPRESIACION54 - DEPRESIACION55)%></div></td>
                                    </tr>


                                    <tr>
                                        <th colspan="6" class="info text-center">Equipo de Oficina</th>
                                    </tr>
                                    <%--  <tr>
                                        <td>Valor Ajustado</td>
                                        <td title="Total inversion Equipo de Oficina "><div class="text-right">$ <%=formato.format(totalOficina + total5)%></div></td>
                                        <td title="Valor Ajustado (año 1) "><div class="text-right">$ <%=formato.format(totalOficina + total5 + total52)%></div></td>
                                        <td title="Valor Ajustado (año 2)"><div class="text-right">$ <%=formato.format(totalOficina + total5 + total52 + total53)%></div></td>
                                        <td title="Valor Ajustado (año 3)"><div class="text-right">$ <%=formato.format(totalOficina + total5 + total52 + total53 + total54)%></div></td>
                                        <td title="Valor Ajustado (año 4) "><div class="text-right">$ <%=formato.format(totalOficina + total5 + total52 + total53 + total54 + total55)%></div></td>
                                    </tr>
                                  
                                    <tr>
                                        <td title="Ajuste por inflación">Axi</td>
                                        <td title="Total inversion Equipo de Oficina * PAGG(año 1)"><div class="text-right">$ <%=formato.format(total5)%></div></td>
                                        <td title="Valor Ajustado (año 1) * PAGG (año 2)"><div class="text-right">$ <%=formato.format(total52)%></div></td>
                                        <td title="Valor Ajustado (año 2) * PAGG (año 3)"><div class="text-right">$ <%=formato.format(total53)%></div></td>
                                        <td title="Valor Ajustado (año 3) * PAGG (año 4)"><div class="text-right">$ <%=formato.format(total54)%></div></td>
                                        <td title="Valor Ajustado (año 4) * PAGG (año 5)"><div class="text-right">$ <%=formato.format(total55)%></div></td>
                                    </tr>
                                    --%>
                                    <tr>
                                        <td title="Valor Ajustado Equipo de Oficina / 5">Depreciación Período</td>
                                        <td><div class="text-right">$ <%=formato.format(depresiacion5)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(depresiacion52)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(depresiacion53)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(depresiacion54)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(depresiacion55)%></div></td>
                                    </tr>
                                <%--    <tr>
                                        <td>Axi Depreciación acumulada</td>
                                        <td><div class="text-right">$ <%=formato.format(0)%></div></td>
                                        <td title="Depreciación acum (año 1) * PAGG (año 2)"><div class="text-right">$ <%=formato.format(Ajusdepre2)%></div></td>
                                        <td title="Depreciación acum (año 2) * PAGG (año 3)"><div class="text-right">$ <%=formato.format(Ajusdepre3)%></div></td>
                                        <td title="Depreciación acum (año 3) * PAGG (año 4)"><div class="text-right">$ <%=formato.format(Ajusdepre4)%></div></td>
                                        <td title="Depreciación acum (año 4) * PAGG (año 5)"><div class="text-right">$ <%=formato.format(Ajusdepre5)%></div></td>
                                    </tr>
                                    <tr>
                                        <td>Depreciación acumulada</td>
                                        <td title="Depreciación Período (año 1) + Axi Depreciación acumulada (año 1)"><div class="text-right">$ <%=formato.format(depresiacion5)%></div></td>
                                        <td title="Depreciación acum. (año 1) + Depreciación Período (año 2) +  Axi Depreciación acumulada (año 2)"><div class="text-right">$ <%=formato.format(depresiacion5 + depresiacion52 + Ajusdepre2)%></div></td>
                                        <td title="Depreciación acum. (año 2) + Depreciación Período (año 3) +  Axi Depreciación acumulada (año 2)"><div class="text-right">$ <%=formato.format(depresiacion5 + depresiacion52 + Ajusdepre2 + depresiacion53 + Ajusdepre3)%></div></td>
                                        <td title="Depreciación acum. (año 3) + Depreciación Período (año 4) +  Axi Depreciación acumulada (año 2)"><div class="text-right">$ <%=formato.format(depresiacion5 + depresiacion52 + Ajusdepre2 + depresiacion53 + Ajusdepre3 + depresiacion54 + Ajusdepre4)%></div></td>
                                        <td title="Depreciación acum. (año 4) + Depreciación Período (año 5) +  Axi Depreciación acumulada (año 2)"><div class="text-right">$ <%=formato.format(depresiacion5 + depresiacion52 + Ajusdepre2 + depresiacion53 + Ajusdepre3 + depresiacion54 + Ajusdepre4 + depresiacion55 + Ajusdepre5)%></div></td>
                                    </tr>
                                --%>
                                    <tr>
                                        <td>Valor neto</td>
                                        <td title="Total Inversion  -  Depreciación acum. (año 1)"><div class="text-right">$ <%=formato.format(totalOficina  - depresiacion5)%></div></td>
                                        <td title="Total Inversion  -  Depreciación acum. (año 2)"><div class="text-right">$ <%=formato.format(totalOficina - depresiacion5 - depresiacion52)%></div></td>
                                        <td title="Total Inversion  -  Depreciación acum. (año 3)"><div class="text-right">$ <%=formato.format(totalOficina - depresiacion5 - depresiacion52- depresiacion53)%></div></td>
                                        <td title="Total Inversion  -  Depreciación acum. (año 4)"><div class="text-right">$ <%=formato.format(totalOficina - depresiacion5 - depresiacion52 - depresiacion53 - depresiacion54 )%></div></td>
                                        <td title="Total Inversion  -  Depreciación acum. (año 5)"><div class="text-right">$ <%=formato.format(totalOficina - depresiacion5 - depresiacion52 - depresiacion53 - depresiacion54 - depresiacion55)%></div></td>
                                    </tr>




                                    <tr>
                                        <th colspan="6" class="info text-center">Activos Biológicos Pecuarios</th>
                                    </tr>
                               <%--     <tr>
                                        <td>Valor Ajustado</td>
                                        <td><div class="text-right">$ <%=formato.format(semovientes + totalsemo)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(semovientes + totalsemo + totalsemo2)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(semovientes + totalsemo + totalsemo2 + totalsemo3)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(semovientes + totalsemo + totalsemo2 + totalsemo3 + totalsemo4)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(semovientes + totalsemo + totalsemo2 + totalsemo3 + totalsemo4 + totalsemo5)%></div></td>
                                    </tr>
                                    <tr>
                                        <td title="Ajuste por inflación">Axi</td>
                                        <td><div class="text-right">$ <%=formato.format(totalsemo)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(totalsemo2)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(totalsemo3)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(totalsemo4)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(totalsemo5)%></div></td>
                                    </tr>
                               --%>
                                    <tr>
                                        <td>Amortización Período</td>
                                        <td><div class="text-right">$ <%=formato.format(depresiacionsemo)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(depresiacionsemo2)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(depresiacionsemo3)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(depresiacionsemo4)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(depresiacionsemo5)%></div></td>
                                    </tr>
                               <%--     <tr>
                                        <td>Axi Depreciación acumulada</td>
                                        <td><div class="text-right">$ <%=formato.format(0)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(ajussemo2)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(ajussemo3)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(ajussemo4)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(ajussemo5)%></div></td>
                                    </tr>
                                    <tr>
                                        <td>Amortización acum.</td>
                                        <td><div class="text-right">$ <%=formato.format(depresiacionsemo)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(depresiacionsemo + depresiacionsemo2 + ajussemo2)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(depresiacionsemo + depresiacionsemo2 + ajussemo2 + depresiacionsemo3 + ajussemo3)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(depresiacionsemo + depresiacionsemo2 + ajussemo2 + depresiacionsemo3 + ajussemo3 + depresiacionsemo4 + ajussemo4)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(depresiacionsemo + depresiacionsemo2 + ajussemo2 + depresiacionsemo3 + ajussemo3 + depresiacionsemo4 + ajussemo4 + depresiacionsemo5 + ajussemo5)%></div></td>
                                    </tr>
                               --%>
                                    <tr>
                                        <td>Valor neto</td>
                                        <td><div class="text-right">$ <%=formato.format(semovientes  - depresiacionsemo)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(semovientes  - depresiacionsemo - depresiacionsemo2 )%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(semovientes  - depresiacionsemo - depresiacionsemo2 - depresiacionsemo3 )%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(semovientes  - depresiacionsemo - depresiacionsemo2 - depresiacionsemo3 - depresiacionsemo4 )%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(semovientes  - depresiacionsemo - depresiacionsemo2 - depresiacionsemo3  - depresiacionsemo4  - depresiacionsemo5 )%></div></td>
                                    </tr>
                                    </tr>
                                    <tr>
                                        <th colspan="6" class="info text-center">Activos Biológicos Agrícolas</th>
                                    </tr>
                                  <%--  <tr>
                                        <td>Valor Ajustado</td>
                                        <td><div class="text-right">$ <%=formato.format(cultivos + totalculti)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(cultivos + totalculti + totalculti2)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(cultivos + totalculti + totalculti2 + totalculti3)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(cultivos + totalculti + totalculti2 + totalculti3 + totalculti4)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(cultivos + totalculti + totalculti2 + totalculti3 + totalculti4 + totalculti5)%></div></td>
                                    </tr>
                                    <tr>
                                        <td title="Ajuste por inflación">Axi</td>
                                        <td><div class="text-right">$ <%=formato.format(totalculti)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(totalculti2)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(totalculti3)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(totalculti4)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(totalculti5)%></div></td>
                                    </tr>
                                  --%>
                                    <tr>
                                        <td>Amortización Período</td>
                                        <td><div class="text-right">$ <%=formato.format(depresiacionculti)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(depresiacionculti2)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(depresiacionculti3)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(depresiacionculti4)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(depresiacionculti5)%></div></td>
                                    </tr>
                                 <%--   <tr>
                                        <td>Axi Depreciación acumulada</td>
                                        <td><div class="text-right">$ <%=formato.format(0)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(ajussemo02)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(ajussemo03)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(ajussemo04)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(ajussemo05)%></div></td>
                                    </tr>
                                    <tr>
                                        <td>Amortización acum.</td>
                                        <td><div class="text-right">$ <%=formato.format(depresiacionculti)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(depresiacionculti + depresiacionculti2 + ajussemo02)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(depresiacionculti + depresiacionculti2 + depresiacionculti3 + ajussemo02 + ajussemo03)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(depresiacionculti + depresiacionculti2 + depresiacionculti3 + depresiacionculti4 + ajussemo02 + ajussemo03 + ajussemo04)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(depresiacionculti + depresiacionculti2 + depresiacionculti3 + depresiacionculti4 + depresiacionculti5 + ajussemo02 + ajussemo03 + ajussemo04 + ajussemo05)%></div></td>

                                    </tr>
                                 --%>
                                    <tr>
                                        <td>Valor neto</td>
                                        <td><div class="text-right">$ <%=formato.format(cultivos  - depresiacionculti)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(cultivos  - depresiacionculti - depresiacionculti2 )%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(cultivos  - depresiacionculti - depresiacionculti2 - depresiacionculti3 )%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(cultivos   - depresiacionculti - depresiacionculti2 - depresiacionculti3 - depresiacionculti4 )%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(cultivos  - depresiacionculti - depresiacionculti2 - depresiacionculti3 - depresiacionculti4 - depresiacionculti5 )%></div></td>

                                    </tr>
                                    <tr>
                                        <th colspan="6" class="info text-center">Otros Activos</th>
                                    </tr>
                                    <tr class="success">
                                        <td>Valor Ajustado</td>
                                        <td><div class="text-right">$ <%=formato.format(otrosActivos)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(otrosActivos2)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(otrosActivos3)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(otrosActivos4)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(otrosActivos5)%></div></td>
                                    </tr>
                                    <tr>
                                        <th colspan="6" class="info text-center">Estructura de Capital</th>
                                    </tr>
                                    <tr>
                                        <td title="Valor inicial de aportes de socios,
                                            Fuentes de financiación(Donación+ Propios + Municipio + Departamento + Otro)">Capital Socios y Otros</td>
                                        <td><div class="text-right">$ <%=formato.format(Totalpatrimonio)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(otroCalorpatrimonio)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(patrimonio3)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(patrimonio4)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(patrimonio5)%></div></td>
                                    </tr>
                                    <tr class="success">
                                        <td title="NUEVOS APORTES, Valor adicional de aportes de capital">Capital Adicional Socios</td>
                                        <td><div class="text-right">$ <%=formato.format(CapitalAdicional)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(CapitalAdicional2)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(CapitalAdicional3)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(CapitalAdicional4)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(CapitalAdicional5)%></div></td>
                                    </tr>
                                    <tr>
                                        <td title="Valor solicitado de financiación al Fondo Emprender">Obligaciones Fondo Emprender</td>
                                        <td><div class="text-right">$ <%=formato.format(obligacionFondoEmprender)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(obligacionFondoEmprender)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(obligacionFondoEmprender)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(obligacionFondoEmprender)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(obligacionFondoEmprender)%></div></td>
                                    </tr>
                                    <tr>
                                        <th colspan="6" class="info text-center">Patrimonio</th>
                                    </tr>
                                    <tr>
                                        <td title="Capital que los socios de una sociedad aportan a esta para desarrollar su actividad comercial 
                                            (Capital Adicional Socios + Capital Socios y Otros)">Capital Social</td>
                                        <td><div class="text-right">$ <%=formato.format(capitalSocial)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(capitalSocial2)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(capitalSocial3)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(capitalSocial4)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(capitalSocial5)%></div></td>
                                    </tr>

                                    <tr>
                                        <td title="La reserva legal consiste en una especie de ahorro que deben hacer las sociedades anónimas; la reserva legal debe ser de por lo menos el 50% del capital suscrito; para completar este monto en cada ejercicio se debe tomar el 10% de las utilidades">Reserva Legal Período</td>
                                        <td><div class="text-right">$ <%=formato.format(0)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(reservaLPeriodo)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(reservaLPeriodo2)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(reservaLPeriodo3)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(reservaLPeriodo4)%></div></td>
                                    </tr>
                              <%--      <tr>
                                        <td>Reserva Legal Acumulada</td>
                                        <td><div class="text-right">$ <%=formato.format(0)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(reservaLPeriodo)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(reservaLPeriodo + reservaLPeriodo2)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(reservaLPeriodo + reservaLPeriodo2 + reservaLPeriodo3)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(reservaLPeriodo + reservaLPeriodo2 + reservaLPeriodo3 + reservaLPeriodo4)%></div></td>
                                    </tr>
                             --%>
                                    <tr>
                                        <td title="Las utilidades retenidas son aquellas que la empresa ha ganado y no ha pagado a los accionistas en forma de dividendos. Estos fondos son retenidos y se reinvierten en la empresa, permiteindo que crezca, cambie de giro o haga frente a gastos de emergencia">Utilidades Retenidas</td>
                                        <td><div class="text-right">$ <%=formato.format(0)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(utilidadneta - dividendo - reservaLPeriodo)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(utilidadneta + utilidadneta2 - dividendo - reservaLPeriodo2 - dividendo2 - reservaLPeriodo)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(utilidadneta + utilidadneta2 + utilidadneta3 - dividendo - dividendo2 - dividendo3 - reservaLPeriodo3 - reservaLPeriodo2 - reservaLPeriodo)%></div></td> 
                                        <td><div class="text-right">$ <%=formato.format(utilidadneta + utilidadneta2 + utilidadneta3 + utilidadneta4 - dividendo - dividendo2 - dividendo3 - dividendo4 - reservaLPeriodo4 - reservaLPeriodo3 - reservaLPeriodo2 - reservaLPeriodo)%></div></td>
                                    </tr>
                                    <tr>
                                        <td title="Registra el valor de los resultados positivos obtenidos por el ente económico, como consecuencia de las operaciones realizadas durante el período">Utilidades del Ejercicio</td>
                                        <td><div class="text-right">$ <%=formato.format(utilidadneta)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(utilidadneta2)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(utilidadneta3)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(utilidadneta4)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(utilidadneta5)%></div></td>
                                    </tr>

                                    <tr>
                                        <td>Base Revalorización</td>
                                        <td><div class="text-right">$ <%=formato.format(BaseRevalorizacion2)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(BaseRevalorizacion3)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(BaseRevalorizacion4)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(BaseRevalorizacion5)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(BaseRevalorizacion6)%></div></td>
                                    </tr>
                               <%--     <tr>
                                        <td>Revalorizacion patrimonio período</td>
                                        <td><div class="text-right">$ <%=formato.format(revalorizacionpatrimonio)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(revalorizacionpatrimonio2)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(revalorizacionpatrimonio3)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(revalorizacionpatrimonio4)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(revalorizacionpatrimonio5)%></div></td>
                                    </tr>
                                    <tr>
                                        <td>Revalorizacion patrimonio acumulado</td>
                                        <td><div class="text-right">$ <%=formato.format(revalorizacionpatrimonio)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(revalorizacionpatrimonio + revalorizacionpatrimonio2)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(revalorizacionpatrimonio + revalorizacionpatrimonio2 + revalorizacionpatrimonio3)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(revalorizacionpatrimonio + revalorizacionpatrimonio2 + revalorizacionpatrimonio3 + revalorizacionpatrimonio4)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(revalorizacionpatrimonio + revalorizacionpatrimonio2 + revalorizacionpatrimonio3 + revalorizacionpatrimonio4 + revalorizacionpatrimonio5)%></div></td>
                                    </tr>
                               --%>
                                    <tr>
                                        <th colspan="6" class="info text-center">Dividendos</th>
                                    </tr>
                                    <%
                                        double utilidadesRepartibles = 0, utilidadesRepartibles2 = 0, utilidadesRepartibles3 = 0, utilidadesRepartibles4 = 0, utilidadesRepartibles5 = 0;
                                        if (0 - reservaLPeriodo + utilidadneta < 0) {

                                        } else {
                                            utilidadesRepartibles = 0;
                                        }

                                        if ((utilidadneta - dividendo - reservaLPeriodo) + utilidadneta - reservaLPeriodo < 0) {

                                        } else {
                                            utilidadesRepartibles2 = 0 - reservaLPeriodo + utilidadneta;
                                        }

                                        if ((utilidadneta - dividendo - reservaLPeriodo2 - reservaLPeriodo) + utilidadneta2 < 0) {

                                        } else {
                                            utilidadesRepartibles3 = (utilidadneta - dividendo - reservaLPeriodo2 - reservaLPeriodo) + utilidadneta2;
                                        }

                                        if ((utilidadneta + utilidadneta2 - dividendo - reservaLPeriodo2 - dividendo2 - reservaLPeriodo3 - reservaLPeriodo) + utilidadneta3 < 0) {
                                        } else {
                                            utilidadesRepartibles4 = (utilidadneta + utilidadneta2 - dividendo - reservaLPeriodo2 - dividendo2 - reservaLPeriodo3 - reservaLPeriodo) + utilidadneta3;

                                        }
                                        if ((utilidadneta + utilidadneta2 + utilidadneta3 - dividendo - dividendo2 - dividendo3 - reservaLPeriodo4 - reservaLPeriodo3 - reservaLPeriodo2 - reservaLPeriodo) + utilidadneta4 < 0) {
                                        } else {
                                            utilidadesRepartibles5 = (utilidadneta + utilidadneta2 + utilidadneta3 - dividendo - dividendo2 - dividendo3 - reservaLPeriodo4 - reservaLPeriodo3 - reservaLPeriodo2 - reservaLPeriodo) + utilidadneta4;

                                        }
                                    %>
                                    <tr>
                                        <td title="Aquella porción de la Utilidad neta de un ejercicio y de ejercicios anteriores, que no ha sido distribuida y que una vez deducida la Reserva Legal, es susceptible de repartir">Utilidades Repartibles</td>
                                        <td><div class="text-right">$ <%=formato.format(utilidadesRepartibles)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(utilidadesRepartibles2)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(utilidadesRepartibles3)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(utilidadesRepartibles4)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(utilidadesRepartibles5)%></div></td>
                                    </tr>
                                    <tr class="success">
                                        <td title="Porcentaje de dividendos que será repartido (respecto de la utilidad repartible)">Dividendos</td>
                                        <td><div class="text-right"> <%=formato.format(dividendo0)%> %</div></td>
                                        <td><div class="text-right"> <%=formato.format(dividendo02)%> %</div></td>
                                        <td><div class="text-right"> <%=formato.format(dividendo03)%> %</div></td>
                                        <td><div class="text-right"> <%=formato.format(dividendo04)%> %</div></td>
                                        <td><div class="text-right"> <%=formato.format(dividendo05)%> %</div></td>
                                    </tr>
                                    <tr>
                                        <td title="El dividendo es la parte del beneficio de una empresa que ésta decide repartir entre sus accionistas">Dividendos</td>
                                        <td><div class="text-right">$ <%=formato.format(0)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(dividendo)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(dividendo2)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(dividendo3)%></div></td>
                                        <td><div class="text-right">$ <%=formato.format(dividendo4)%></div></td>
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
        <script src="../js/jquery-ui.min.js" type="text/javascript"></script>
        
        <script type="text/javascript">
            $("#btnImp").click(function () {
                $("div#areaImp").printArea();
            });

            $(document).tooltip();
        </script>                           
    </body>
    <%}
    } catch ( java.lang.IndexOutOfBoundsException nule  ) { %>
    <script src="../js/sweetalert.min.js" type="text/javascript">

            swal({
                title: 'Error!',
                text: "Aun te faltan campos por llenar",
                type: "error",
                showCancelButton: false,
                showConfirmButton: false,
                timer: 2500,
                closeOnConfirm: false

            },
                    function () {

                        window.location.href = 'Insumo.jsp';

                    });






    </script>

    <%}%>
</html>
