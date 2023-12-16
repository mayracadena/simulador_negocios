<%-- 
    Document   : ResultadosG
    Created on : 3/01/2017, 12:44:28 PM
    Author     : mayrayesenia
--%>
<%@page import="DAO.ReporteDAO"%>
<%@page import="VO.TipoGastoCostoVO"%>
<%@page import="DAO.TipoGastoCostoDAO"%>
<%@page import="VO.InversionVO"%>
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
        <title>Resultados Finales</title>
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
        <link rel="shortcut icon" type="image/x-icon" href="../img/demostrarLogo3.ico">
    </head>
    <body>
        <%            ProyectoVO pv;
            ProyectoDAO pd = new ProyectoDAO();
            pv = pd.read(idp);
            DecimalFormat formato = new DecimalFormat("###,###,###");
            DecimalFormat formato2 = new DecimalFormat("###,###,###.#");

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
                         if (pv.getIdEtapa() == 1) {

                             if (pv.getIdEspecialidad() == 1) {%>
                    <%@include file="../WEB-INF/masterpage/menu_aux.jspf" %>

                    <%   } else if (pv.getIdEspecialidad() == 2) {
                    %>
                    <%@include file="../WEB-INF/masterpage/menu_tec.jspf" %>
                    <% } else if (pv.getIdEspecialidad() == 3) {%>
                    <%@include file="../WEB-INF/masterpage/menu.jspf" %>
                    <%} else if (pv.getIdEspecialidad() == 4) {%>
                    <%@include file="../WEB-INF/masterpage/menu_fondoe.jspf" %>
                    <% } else {%>
                    <%@include file="../WEB-INF/masterpage/menu_fondoe.jspf" %>
                    <%}
                    } else { %>
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
                                <button title="Tasa de oportunidad" class="btn btn-default" data-toggle="modal" data-target="#tasa_oportunidad"><label>Tasa de <br>oportunidad</label></button>
                                <br> <br>  <a type="button" id="btnImp" class="btn btn-info " >Exportar</a>
                            </center>


                            <%
                                TemporalDAO td = new TemporalDAO();
                                TemporalVO tv = td.read(idp);

                            %>

                            <div id="tasa_oportunidad" class="modal fade" role="dialog">
                                <div class="modal-dialog">

                                    <!-- Modal content-->
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            <h4 class="modal-title">Tasa de oportunidad</h4>
                                        </div>
                                        <div class="modal-body">
                                            Tasa mínima de rendimiento a la que aspira el emprendedor <br><br>

                                            <div class="row">
                                                <div class="col-md-7">
                                                    <input type="number" id="tasa_o" value="<%=tv.getTasa_Oportunidad()%>" class="form-control" placeholder="Porcentaje de ajustes">
                                                </div>
                                                <div class="col-md-2">
                                                    <button class="btn btn-success" onclick="tasa_oportunidad()" ><span class="glyphicon glyphicon-edit"></span></button>
                                                </div>
                                            </div>

                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                                        </div>
                                    </div>

                                </div>
                            </div>





                            <div  id="areaImp">
                                <div class="row">
                                    <div class="col-md-6 col-xs-5" align="right">
                                        <br><img src="../img/Mis_Iconos/resultados_finales.png" alt="" class="dos"/>
                                    </div>
                                    <div class="col-md-6 col-xs-6" align="left">
                                        <h1 >Resultados Finales</h1>
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
                                    MacroeconomicoVO mv, mv2, MV, MEvo, mevo, dtf2;
                                    ArrayList<MacroeconomicoVO> ma, me, mi, mo, MA, Cp, dtf;
                                    ma = m.todito(1);
                                    mo = m.todito(3);
                                    MA = m.todito(2);
                                    Cp = m.todito(5);
                                    dtf = m.todito(6);
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

                                    double CarteraClientes = 0, CarteraClientes2 = 0, CarteraClientes3 = 0, CarteraClientes4 = 0, CarteraClientes5 = 0;
                                    double ProvicionCuentasCobrar = 0, ProvicionCuentasCobrar2 = 0, ProvicionCuentasCobrar3 = 0, ProvicionCuentasCobrar4 = 0, ProvicionCuentasCobrar5 = 0;
                                    double mateprimeacos = 0, mateprimeacos2 = 0, mateprimeacos3 = 0, mateprimeacos4 = 0, mateprimeacos5 = 0;
                                    double preciopromedio = 0, preciopromedio2 = 0, preciopromedio3 = 0, preciopromedio4 = 0, preciopromedio5 = 0;
                                    double ventasdetodo = 0, ventasdetodo2 = 0, ventasdetodo3 = 0, ventasdetodo4 = 0, ventasdetodo5 = 0;
                                    double materiaRotacion = 0, materiaRotacion2 = 0, materiaRotacion3 = 0, materiaRotacion4 = 0, materiaRotacion5 = 0;
                                    double manodeobraprom = 0, manodeobraprom2 = 0, manodeobraprom3 = 0, manodeobraprom4 = 0, manodeobraprom5 = 0;

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
                                <%
                                    double materiaprima = 0, materiaprima2 = 0, materiaprima3 = 0, materiaprima4 = 0, materiaprima5 = 0;

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
                                    for (int t = 0; t < insumo4.size(); t++) {
                                        insu4 = insumo4.get(t);
                                        if (insu4.getYear() == 1) {
                                            invenproducto = (inventariosp * insu4.getValor()) / 360;
                                        }
                                        if (insu4.getYear() == 2) {
                                            invenproducto2 = (inventariosp2 * insu4.getValor()) / 360;
                                        }
                                        if (insu4.getYear() == 3) {
                                            invenproducto3 = (inventariosp3 * insu4.getValor()) / 360;
                                        }
                                        if (insu4.getYear() == 4) {
                                            invenproducto4 = (inventariosp4 * insu4.getValor()) / 360;
                                        }
                                        if (insu4.getYear() == 5) {
                                            invenproducto5 = (inventariosp5 * insu4.getValor()) / 360;
                                        }
                                    }
                                %>
                                <%
                                    double invVariacionP = 0, invVariacionP2 = 0, invVariacionP3 = 0, invVariacionP4 = 0, invVariacionP5 = 0;

                                    for (int i = 0; i < insumo11.size(); i++) {
                                        insu11 = insumo11.get(i);
                                        if (insu11.getYear() == 1) {
                                            invVariacionP = (inventariosp * insu11.getValor()) / 360;
                                        }
                                        if (insu11.getYear() == 2) {
                                            invVariacionP2 = (inventariosp2 * insu11.getValor()) / 360;
                                        }
                                        if (insu11.getYear() == 3) {
                                            invVariacionP3 = (inventariosp3 * insu11.getValor()) / 360;
                                        }
                                        if (insu11.getYear() == 4) {
                                            invVariacionP4 = (inventariosp4 * insu11.getValor()) / 360;
                                        }
                                        if (insu11.getYear() == 5) {
                                            invVariacionP5 = (inventariosp5 * insu11.getValor()) / 360;
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
                                <%                                    double TotalActivosF0 = (total20 + totalTerrenos) + (TOTAL20 + totalConstrucion) + (TOTAL10 + totalMaquinaria) + (total10 + totalMuebles) + (TOTAL5 + totalTransporte) + (total5 + totalOficina) + (totalsemo + semovientes) + (totalculti + cultivos);
                                    double TotalActivosF = (total20 + totalTerrenos) + ((TOTAL20 + totalConstrucion) - (depresiacion20)) + (TOTAL10 + totalMaquinaria - (DEPRESIACION10)) + (total10 + totalMuebles - (depresiacion10)) + (TOTAL5 + totalTransporte - (DEPRESIACION5)) + (total5 + totalOficina - (depresiacion5)) + (totalsemo + semovientes - (depresiacionsemo)) + (totalculti + cultivos - (depresiacionculti));
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

                                <%                                    double cuentaapagar = 0, cuentaapagar2 = 0, cuentaapagar3 = 0, cuentaapagar4 = 0, cuentaapagar5 = 0;
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

                                %>
                                <%                                             double gastoventas = gcDao.Reporte(idp, 4);
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
                                    for (int i = 0; i < infinsumito2.size(); i++) {
                                        insumoVO22 = infinsumito2.get(i);
                                        if (insumoVO22.getYear() == 1) {
                                            rebaja1 = (venta1 * insumoVO22.getValor()) / 100;
                                        }
                                        if (insumoVO22.getYear() == 2) {
                                            rebaja2 = (venta2 * insumoVO22.getValor()) / 100;
                                        }
                                        if (insumoVO22.getYear() == 3) {
                                            rebaja3 = (venta3 * insumoVO22.getValor()) / 100;
                                        }
                                        if (insumoVO22.getYear() == 4) {
                                            rebaja4 = (venta4 * insumoVO22.getValor()) / 100;
                                        }
                                        if (insumoVO22.getYear() == 5) {
                                            rebaja5 = (venta5 * insumoVO22.getValor()) / 100;
                                        }

                                    }
                                %>
                                <%
                                    float dias_year = 5;
                                    double tasainteres = tmv.getCapitalTrabajo() / 100;
                                    double obligacionfinanciera = fin.Reporte2(idp, 7);
                                    double interes = 0, interes2 = 0, interes3 = 0, interes4 = 0, interes5 = 0;
                                    double amortizacion = 0, amortizacion2 = 0, amortizacion3 = 0, amortizacion4 = 0, amortizacion5 = 0;
                                    double insobresal = 0, insobresal2 = 0, insobresal3 = 0, insobresal4 = 0, insobresal5 = 0;
                                    double rCuotaAnual = Math.pow((1 + tasainteres), dias_year) * obligacionfinanciera * tasainteres / (Math.pow((1 + tasainteres), dias_year) - 1);
                                    interes = obligacionfinanciera * tasainteres;

                                    insobresal = rCuotaAnual - interes;
                                    amortizacion = obligacionfinanciera - insobresal;
                                    if (dias_year >= 2) {
                                        interes2 = amortizacion * tasainteres;
                                        insobresal2 = rCuotaAnual - interes2;
                                        amortizacion2 = amortizacion - insobresal2;
                                    }
                                    if (dias_year >= 3) {
                                        interes3 = amortizacion2 * tasainteres;
                                        insobresal3 = rCuotaAnual - interes3;
                                        amortizacion3 = amortizacion2 - insobresal3;
                                    }
                                    if (dias_year >= 4) {
                                        interes4 = amortizacion3 * tasainteres;
                                        insobresal4 = rCuotaAnual - interes4;
                                        amortizacion4 = amortizacion3 - insobresal4;
                                    }
                                    if (dias_year >= 5) {
                                        interes5 = amortizacion4 * tasainteres;
                                        insobresal5 = rCuotaAnual - interes5;
                                        amortizacion5 = amortizacion4 - insobresal5;
                                    }

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
                                    double ajustenomonetario = total20 + TOTAL20 + total10 + TOTAL10 + total5 + TOTAL5 + totalsemo + totalculti;
                                    double ajustenomonetario2 = total202 + TOTAL201 + total102 + TOTAL102 + total52 + TOTAL52 + totalsemo2 + totalculti2;
                                    double ajustenomonetario3 = total203 + TOTAL203 + total103 + TOTAL103 + total53 + TOTAL53 + totalsemo3 + totalculti3;
                                    double ajustenomonetario4 = total204 + TOTAL204 + total104 + TOTAL104 + total54 + TOTAL54 + totalsemo4 + totalculti4;
                                    double ajustenomonetario5 = total205 + TOTAL205 + total105 + TOTAL105 + total55 + TOTAL55 + totalsemo5 + totalculti5;
                                %>
                                <%
                                    double totalcorrecion = ajustenomonetario;
                                    double totalcorrecion2 = ajustenomonetario2 + (-suAjusteDepre2 - ajusdepre2 - ajusdepre02 - Ajusdepre02 - Ajusdepre2) + (-ajussemo2 - ajussemo02);
                                    double totalcorrecion3 = ajustenomonetario3 + (-suAjusteDepre3 - ajusdepre3 - ajusdepre03 - Ajusdepre03 - Ajusdepre3) + (-ajussemo3 - ajussemo03);
                                    double totalcorrecion4 = ajustenomonetario4 + (-suAjusteDepre4 - ajusdepre4 - ajusdepre04 - Ajusdepre04 - Ajusdepre4) + (-ajussemo4 - ajussemo04);
                                    double totalcorrecion5 = ajustenomonetario5 + (-suAjusteDepre5 - ajusdepre5 - ajusdepre05 - Ajusdepre05 - Ajusdepre5) + (-ajussemo5 - ajussemo05);

                                    ArrayList<InfInsumoVO> inf = new ArrayList();
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

                                    double utilidadoperativo = utilidadbruta - (gastoventas + totaladministracion + provi1 + (idDAO.total(idp) / 5));
                                    double utilidadoperativo2 = utilidadbruta2 - (gastoventas2 + totaladministracion2 + provi2 + (idDAO.total(idp) / 5));
                                    double utilidadoperativo3 = utilidadbruta3 - (gastoventas3 + totaladministracion3 + provi3 + (idDAO.total(idp) / 5));
                                    double utilidadoperativo4 = utilidadbruta4 - (gastoventas4 + totaladministracion4 + provi4 + (idDAO.total(idp) / 5));
                                    double utilidadoperativo5 = utilidadbruta5 - (gastoventas5 + totaladministracion5 + provi5 + (idDAO.total(idp) / 5));

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

                                    double reservaLPeriodo = 0, reservaLPeriodo2 = 0, reservaLPeriodo3 = 0, reservaLPeriodo4 = 0, reservaLPeriodo5 = 0;
                                    if (utilidadneta < 0 || utilidadneta2 < 0 || utilidadneta3 < 0 || utilidadneta4 < 0 || utilidadneta5 < 0) {
                                        reservaLPeriodo = 0;
                                        reservaLPeriodo2 = 0;
                                        reservaLPeriodo3 = 0;
                                        reservaLPeriodo4 = 0;
                                        reservaLPeriodo5 = 0;
                                    } else {
                                        if (utilidadneta * 0.1 > utilidadneta * 0.5) {
                                            reservaLPeriodo = utilidadneta * 0.1;
                                        }
                                        if (utilidadneta2 * 0.1 > utilidadneta2 * 0.5) {
                                            reservaLPeriodo2 = utilidadneta2 * 0.1;
                                        }
                                        if (utilidadneta3 * 0.1 > utilidadneta3 * 0.5) {
                                            reservaLPeriodo3 = utilidadneta3 * 0.1;
                                        }
                                        if (utilidadneta4 * 0.1 > utilidadneta4 * 0.5) {
                                            reservaLPeriodo4 = utilidadneta4 * 0.1;
                                        }
                                        if (utilidadneta5 * 0.1 > utilidadneta5 * 0.5) {
                                            reservaLPeriodo5 = utilidadneta5 * 0.1;
                                        }
                                    }
                                %>
                                <%
                                    double acree = 0, acree2 = 0, acree3 = 0, acree4 = 0, acree5 = 0;
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

                                    double revalorizacionpatrimonio = 0, revalorizacionpatrimonio2 = 0, revalorizacionpatrimonio3 = 0, revalorizacionpatrimonio4 = 0, revalorizacionpatrimonio5 = 0;
                                    double dividendo = 0, dividendo2 = 0, dividendo3 = 0, dividendo4 = 0, dividendo5 = 0;

                                    double BaseRevalorizacion = 0, BaseRevalorizacion2 = 0, BaseRevalorizacion3 = 0, BaseRevalorizacion4 = 0, BaseRevalorizacion5 = 0;
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
                                            BaseRevalorizacion2 = Totalpatrimonio + reservaLPeriodo;
                                        }
                                        if (MV.getYear() == 2) {
                                            revalorizacionpatrimonio2 = (Totalpatrimonio * MV.getValor()) / 100;
                                            utilidadAI2 = utilidadAI2 - revalorizacionpatrimonio2;
                                            impuestos2 = (utilidadAI2 * tmv.getImpuestos()) / 100;
                                            utilidadneta2 = utilidadAI2 - (impuestos2);
                                            totalcorrecion2 = totalcorrecion2 - revalorizacionpatrimonio2;
                                            dividendo2 = (utilidadneta2 * insu12.getValor()) / 100;
                                            BaseRevalorizacion3 = otroCalorpatrimonio + utilidadneta - dividendo + reservaLPeriodo + reservaLPeriodo2;
                                        }
                                        if (MV.getYear() == 3) {
                                            revalorizacionpatrimonio3 = ((otroCalorpatrimonio + utilidadneta - dividendo) * MV.getValor()) / 100;
                                            utilidadAI3 = utilidadAI3 - revalorizacionpatrimonio3;
                                            impuestos3 = (utilidadAI3 * tmv.getImpuestos()) / 100;
                                            utilidadneta3 = utilidadAI3 - (impuestos3);
                                            totalcorrecion3 = totalcorrecion3 - revalorizacionpatrimonio3;
                                            dividendo3 = (utilidadneta3 * insu12.getValor()) / 100;
                                            BaseRevalorizacion4 = patrimonio3 + (utilidadneta2 + utilidadneta) - dividendo - dividendo2 + reservaLPeriodo + reservaLPeriodo2 + reservaLPeriodo3;

                                        }
                                        if (MV.getYear() == 4) {
                                            revalorizacionpatrimonio4 = ((patrimonio3 + (utilidadneta2 + utilidadneta) - dividendo - dividendo2) * MV.getValor()) / 100;
                                            utilidadAI4 = utilidadAI4 - revalorizacionpatrimonio4;
                                            impuestos4 = (utilidadAI4 * tmv.getImpuestos()) / 100;
                                            utilidadneta4 = utilidadAI4 - (impuestos4);
                                            totalcorrecion4 = totalcorrecion4 - revalorizacionpatrimonio4;
                                            dividendo4 = (utilidadneta4 * insu12.getValor()) / 100;
                                            BaseRevalorizacion5 = patrimonio4 + (utilidadneta + utilidadneta2 + utilidadneta3) - dividendo - dividendo2 - dividendo3 + reservaLPeriodo + reservaLPeriodo2 + reservaLPeriodo3 + reservaLPeriodo4;
                                        }
                                        if (MV.getYear() == 5) {
                                            revalorizacionpatrimonio5 = ((patrimonio4 + (utilidadneta + utilidadneta2 + utilidadneta3) - dividendo - dividendo2 - dividendo3) * MV.getValor()) / 100;
                                            utilidadAI5 = utilidadAI5 - revalorizacionpatrimonio5;
                                            impuestos5 = (utilidadAI5 * tmv.getImpuestos()) / 100;
                                            utilidadneta5 = utilidadAI5 - (impuestos5);
                                            totalcorrecion5 = totalcorrecion5 - revalorizacionpatrimonio5;
                                            dividendo5 = (utilidadneta5 * insu12.getValor()) / 100;
                                        }
                                    }


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

                                    cajafinanciamiento = -amortizacion - interes + capitalAdicionalSocios;
                                    cajafinanciamiento2 = -insobresal2 - interes2 + capitalAdicionalSocios2 - dividendo;
                                    cajafinanciamiento3 = -insobresal3 - interes3 + capitalAdicionalSocios3 - dividendo2;
                                    cajafinanciamiento4 = -insobresal4 - interes4 + capitalAdicionalSocios4 - dividendo3;
                                    cajafinanciamiento5 = -insobresal5 - interes5 + capitalAdicionalSocios5 - dividendo4;

                                    EFECTIVO0 = totalpaspat0 - gastoanticipado - totalTerrenos - totalConstrucion - totalMaquinaria - totalTransporte - totalMuebles - totalOficina - semovientes - cultivos;
                                    EFECTIVO = cajafinanciamiento + cajadeinversion + flujooperativo;
                                    EFECTIVO2 = cajafinanciamiento2 + cajadeinversion2 + flujooperativo2;
                                    EFECTIVO3 = cajafinanciamiento3 + cajadeinversion3 + flujooperativo3;
                                    EFECTIVO4 = cajafinanciamiento4 + cajadeinversion4 + flujooperativo4;
                                    EFECTIVO5 = cajafinanciamiento5 + cajadeinversion5 + flujooperativo5;

                                %>
                                <%                                    double totalactivocorriente0 = 0, totalactivocorriente = 0, totalactivocorriente2 = 0, totalactivocorriente3 = 0, totalactivocorriente4 = 0, totalactivocorriente5 = 0;
                                    totalactivocorriente0 = EFECTIVO0 + gastoanticipado;
                                    totalactivocorriente = EFECTIVO + EFECTIVO0 + cuentacobrar - provicioncobrar + invmateria + invVariacionP + invenproducto + anticipo + gastoanticipado2;
                                    totalactivocorriente2 = EFECTIVO2 + EFECTIVO + EFECTIVO0 + cuentacobrar2 - provicioncobrar2 + invmateria2 + invVariacionP2 + invenproducto2 + anticipo2 + gastoanticipado3;
                                    totalactivocorriente3 = EFECTIVO3 + EFECTIVO2 + EFECTIVO + EFECTIVO0 + cuentacobrar3 - provicioncobrar3 + invmateria3 + invVariacionP3 + invenproducto3 + anticipo3 + gastoanticipado4;
                                    totalactivocorriente4 = EFECTIVO4 + EFECTIVO3 + EFECTIVO2 + EFECTIVO + EFECTIVO0 + cuentacobrar4 - provicioncobrar4 + invmateria4 + invVariacionP4 + invenproducto4 + anticipo4;
                                    totalactivocorriente5 = EFECTIVO5 + EFECTIVO4 + EFECTIVO3 + EFECTIVO2 + EFECTIVO + EFECTIVO0 + cuentacobrar5 - provicioncobrar5 + invmateria5 + invVariacionP5 + invenproducto5 + anticipo5;
                                %>
                                <%
                                    double totalpasivo = 0, totalpasivo2 = 0, totalpasivo3 = 0, totalpasivo4 = 0, totalpasivo5 = 0;
                                    totalpasivo = cuentaapagar + acree + amortizacion + otropasivo + obligacionFondoEmprender + impuestos;
                                    totalpasivo2 = cuentaapagar2 + acree2 + amortizacion2 + otropasivo2 + obligacionFondoEmprender + (impuestos2 + impuestos);
                                    totalpasivo3 = cuentaapagar3 + impuestos3 + impuestos2 + impuestos + acree3 + amortizacion3 + otropasivo3 + obligacionFondoEmprender;
                                    totalpasivo4 = cuentaapagar4 + impuestos4 + impuestos3 + impuestos2 + impuestos + acree4 + amortizacion4 + otropasivo4 + obligacionFondoEmprender;
                                    totalpasivo5 = cuentaapagar5 + impuestos5 + impuestos4 + impuestos3 + impuestos2 + impuestos + acree5 + otropasivo5 + obligacionFondoEmprender;
                                %>
                                <%               double ipc = 0, ipc2 = 0, ipc3 = 0, ipc4 = 0, ipc5 = 0;
                                    double devalua = 0, devalua2 = 0, devalua3 = 0, devalua4 = 0, devalua5 = 0;
                                    double variaPIB = 0, variaPIB2 = 0, variaPIB3 = 0, variaPIB4 = 0, variaPIB5 = 0;
                                    double DTF = 0, DTF2 = 0, DTF3 = 0, DTF4 = 0, DTF5 = 0;
                                    for (int g = 0; g < ma.size(); g++) {
                                        mv = ma.get(g);
                                        if (mv.getYear() == 1) {
                                            ipc = ipc + mv.getValor();
                                        }
                                        if (mv.getYear() == 2) {
                                            ipc2 = ipc2 + mv.getValor();
                                        }
                                        if (mv.getYear() == 3) {
                                            ipc3 = ipc3 + mv.getValor();
                                        }
                                        if (mv.getYear() == 4) {
                                            ipc4 = ipc4 + mv.getValor();
                                        }
                                        if (mv.getYear() == 5) {
                                            ipc5 = ipc5 + mv.getValor();
                                        }
                                    }
                                    for (int t = 0; t < MA.size(); t++) {
                                        MEvo = MA.get(t);
                                        if (MEvo.getYear() == 1) {
                                            devalua = devalua + MEvo.getValor();
                                        }
                                        if (MEvo.getYear() == 2) {
                                            devalua2 = devalua2 + MEvo.getValor();
                                        }
                                        if (MEvo.getYear() == 3) {
                                            devalua3 = devalua3 + MEvo.getValor();
                                        }
                                        if (MEvo.getYear() == 4) {
                                            devalua4 = devalua4 + MEvo.getValor();
                                        }
                                        if (MEvo.getYear() == 5) {
                                            devalua5 = devalua5 + MEvo.getValor();
                                        }
                                    }
                                    for (int f = 0; f < Cp.size(); f++) {
                                        mevo = Cp.get(f);
                                        if (mevo.getYear() == 1) {
                                            variaPIB = variaPIB + mevo.getValor();
                                        }
                                        if (mevo.getYear() == 2) {
                                            variaPIB2 = variaPIB2 + mevo.getValor();
                                        }
                                        if (mevo.getYear() == 3) {
                                            variaPIB3 = variaPIB3 + mevo.getValor();
                                        }
                                        if (mevo.getYear() == 4) {
                                            variaPIB4 = variaPIB4 + mevo.getValor();
                                        }
                                        if (mevo.getYear() == 5) {
                                            variaPIB5 = variaPIB5 + mevo.getValor();
                                        }
                                    }

                                    for (int f = 0; f < dtf.size(); f++) {
                                        dtf2 = dtf.get(f);
                                        if (dtf2.getYear() == 1) {
                                            DTF = DTF + dtf2.getValor();
                                        }
                                        if (dtf2.getYear() == 2) {
                                            DTF2 = DTF2 + dtf2.getValor();
                                        }
                                        if (dtf2.getYear() == 3) {
                                            DTF3 = DTF3 + dtf2.getValor();
                                        }
                                        if (dtf2.getYear() == 4) {
                                            DTF4 = DTF4 + dtf2.getValor();
                                        }
                                        if (dtf2.getYear() == 5) {
                                            DTF5 = DTF5 + dtf2.getValor();
                                        }
                                    }

                                    double variacionPrecio = 0, variacionPrecio2 = 0, variacionPrecio3 = 0, variacionPrecio4 = 0;
                                    variacionPrecio = ((preciopromedio2 / preciopromedio) - 1) * 100;
                                    variacionPrecio2 = ((preciopromedio3 / preciopromedio2) - 1) * 100;
                                    variacionPrecio3 = ((preciopromedio4 / preciopromedio3) - 1) * 100;
                                    variacionPrecio4 = ((preciopromedio5 / preciopromedio4) - 1) * 100;
                                    double variacionCantidad = 0, variacionCantidad2 = 0, variacionCantidad3 = 0, variacionCantidad4 = 0, variacionCantidad5 = 0;
                                    variacionCantidad = ((ventasdetodo2 / ventasdetodo) - 1) * 100;
                                    variacionCantidad2 = ((ventasdetodo3 / ventasdetodo2) - 1) * 100;
                                    variacionCantidad3 = ((ventasdetodo4 / ventasdetodo3) - 1) * 100;
                                    variacionCantidad4 = ((ventasdetodo5 / ventasdetodo4) - 1) * 100;
                                    double totalcostoproduccion = 0, totalcostoproduccion2 = 0, totalcostoproduccion3 = 0, totalcostoproduccion4 = 0, totalcostoproduccion5 = 0;
                                    double variacioncostosp = 0, variacioncostosp2 = 0, variacioncostosp3 = 0, variacioncostosp4 = 0, variacioncostosp5 = 0;
                                    double variacionadminis = 0, variacionadminis2 = 0, variacionadminis3 = 0, variacionadminis4 = 0, variacionadminis5 = 0;
                                    totalcostoproduccion = materiaprima + depresiacion20 + DEPRESIACION10 + depresiacion10 + DEPRESIACION5 + depresiacion5 + depresiacionsemo + depresiacionculti;
                                    totalcostoproduccion2 = materiaprima2 + depresiacion202 + DEPRESIACION102 + depresiacion102 + DEPRESIACION52 + depresiacion52 + depresiacionsemo2 + depresiacionculti2;
                                    totalcostoproduccion3 = materiaprima3 + depresiacion203 + DEPRESIACION103 + depresiacion103 + DEPRESIACION53 + depresiacion53 + depresiacionsemo3 + depresiacionculti3;
                                    totalcostoproduccion4 = materiaprima4 + depresiacion204 + DEPRESIACION104 + depresiacion104 + DEPRESIACION54 + depresiacion54 + depresiacionsemo4 + depresiacionculti4;
                                    totalcostoproduccion5 = materiaprima5 + depresiacion205 + DEPRESIACION105 + depresiacion105 + DEPRESIACION55 + depresiacion55 + depresiacionsemo5 + depresiacionculti5;
                                    variacioncostosp = ((totalcostoproduccion2 / totalcostoproduccion) - 1) * 100;
                                    variacioncostosp2 = ((totalcostoproduccion3 / totalcostoproduccion2) - 1) * 100;
                                    variacioncostosp3 = ((totalcostoproduccion4 / totalcostoproduccion3) - 1) * 100;
                                    variacioncostosp4 = ((totalcostoproduccion5 / totalcostoproduccion4) - 1) * 100;

                                    variacionadminis = ((totaladministracion2 / totaladministracion) - 1) * 100;
                                    variacionadminis2 = ((totaladministracion3 / totaladministracion2) - 1) * 100;
                                    variacionadminis3 = ((totaladministracion4 / totaladministracion3) - 1) * 100;
                                    variacionadminis4 = ((totaladministracion5 / totaladministracion4) - 1) * 100;

                                    //rotacion
                                    double rotacioninventario = 0, rotacioninventario2 = 0, rotacioninventario3 = 0, rotacioninventario4 = 0, rotacioninventario5 = 0;

                                    rotacioninventario = ((invenproducto + invVariacionP + invmateria) / totalcostoproduccion) * 360;
                                    rotacioninventario2 = ((invenproducto2 + invVariacionP2 + invmateria2) / totalcostoproduccion2) * 360;
                                    rotacioninventario3 = ((invenproducto3 + invVariacionP3 + invmateria3) / totalcostoproduccion3) * 360;
                                    rotacioninventario4 = ((invenproducto4 + invVariacionP4 + invmateria4) / totalcostoproduccion4) * 360;
                                    rotacioninventario5 = ((invenproducto5 + invVariacionP5 + invmateria5) / totalcostoproduccion5) * 360;

                                    double liquidez0 = 0, liquidez02 = 0, liquidez03 = 0, liquidez04 = 0, liquidez05 = 0;
                                    liquidez0 = totalactivocorriente / (cuentaapagar + impuestos + acree);
                                    liquidez02 = totalactivocorriente2 / (cuentaapagar2 + impuestos2 + impuestos + acree2);
                                    liquidez03 = totalactivocorriente3 / (cuentaapagar3 + impuestos3 + impuestos2 + impuestos + acree3);
                                    liquidez04 = totalactivocorriente4 / (cuentaapagar4 + impuestos4 + impuestos3 + impuestos2 + impuestos + acree4);
                                    liquidez05 = totalactivocorriente5 / (cuentaapagar5 + impuestos5 + impuestos4 + impuestos3 + impuestos2 + impuestos + acree5);

                                    double pruebaacida = 0, pruebaacida2 = 0, pruebaacida3 = 0, pruebaacida4 = 0, pruebaacida5 = 0;
                                    pruebaacida = (totalactivocorriente - (invmateria + invVariacionP + invenproducto)) / (cuentaapagar + impuestos + acree);
                                    pruebaacida2 = (totalactivocorriente2 - (invmateria2 + invVariacionP2 + invenproducto2)) / (cuentaapagar2 + impuestos2 + impuestos + acree2);
                                    pruebaacida3 = (totalactivocorriente3 - (invmateria3 + invVariacionP3 + invenproducto3)) / (cuentaapagar3 + impuestos3 + impuestos2 + impuestos + acree3);
                                    pruebaacida4 = (totalactivocorriente4 - (invmateria4 + invVariacionP4 + invenproducto4)) / (cuentaapagar4 + impuestos4 + impuestos3 + impuestos2 + impuestos + acree4);
                                    pruebaacida5 = (totalactivocorriente5 - (invmateria5 + invVariacionP5 + invenproducto5)) / (cuentaapagar5 + impuestos5 + impuestos4 + impuestos3 + impuestos2 + impuestos + acree5);

                                    double rotacioncarteradia = 0, rotacioncarteradia2 = 0, rotacioncarteradia3 = 0, rotacioncarteradia4 = 0, rotacioncarteradia5 = 0;
                                    rotacioncarteradia = (cuentacobrar / venta1) * 360;
                                    rotacioncarteradia2 = (cuentacobrar2 / venta2) * 360;
                                    rotacioncarteradia3 = (cuentacobrar3 / venta3) * 360;
                                    rotacioncarteradia4 = (cuentacobrar4 / venta4) * 360;
                                    rotacioncarteradia5 = (cuentacobrar5 / venta5) * 360;

                                    double rotacioninventariodia = 0, rotacioninventariodia2 = 0, rotacioninventariodia3 = 0, rotacioninventariodia4 = 0, rotacioninventariodia5 = 0;
                                    rotacioninventariodia = ((invmateria + invVariacionP + invenproducto) / venta1) * 360;
                                    rotacioninventariodia2 = ((invmateria2 + invVariacionP2 + invenproducto2) / venta2) * 360;
                                    rotacioninventariodia3 = ((invmateria3 + invVariacionP3 + invenproducto3) / venta3) * 360;
                                    rotacioninventariodia4 = ((invmateria4 + invVariacionP4 + invenproducto4) / venta4) * 360;
                                    rotacioninventariodia5 = ((invmateria5 + invVariacionP5 + invenproducto5) / venta5) * 360;

                                    double rotacionprovedoresdia = 0, rotacionprovedoresdia2 = 0, rotacionprovedoresdia3 = 0, rotacionprovedoresdia4 = 0, rotacionprovedoresdia5 = 0;
                                    rotacionprovedoresdia = cuentaapagar / (materiaprima + depresiacion20 + DEPRESIACION10 + depresiacion10 + DEPRESIACION5 + depresiacion5 + depresiacionsemo + depresiacionculti + (idDAO.total(idp) / 5)) * 360;
                                    rotacionprovedoresdia2 = cuentaapagar2 / (materiaprima2 + depresiacion202 + DEPRESIACION102 + depresiacion102 + DEPRESIACION52 + depresiacion52 + depresiacionsemo2 + depresiacionculti2 + (idDAO.total(idp) / 5)) * 360;
                                    rotacionprovedoresdia3 = cuentaapagar3 / (materiaprima3 + depresiacion203 + DEPRESIACION103 + depresiacion103 + DEPRESIACION53 + depresiacion53 + depresiacionsemo3 + depresiacionculti3 + (idDAO.total(idp) / 5)) * 360;
                                    rotacionprovedoresdia4 = cuentaapagar4 / (materiaprima4 + depresiacion204 + DEPRESIACION104 + depresiacion104 + DEPRESIACION54 + depresiacion54 + depresiacionsemo4 + depresiacionculti4 + (idDAO.total(idp) / 5)) * 360;
                                    rotacionprovedoresdia5 = cuentaapagar5 / (materiaprima5 + depresiacion205 + DEPRESIACION105 + depresiacion105 + DEPRESIACION55 + depresiacion55 + depresiacionsemo5 + depresiacionculti5 + (idDAO.total(idp) / 5)) * 360;

                                    double lvlendeudamiento = 0, lvlendeudamiento2 = 0, lvlendeudamiento3 = 0, lvlendeudamiento4 = 0, lvlendeudamiento5 = 0;
                                    lvlendeudamiento = totalpasivo / (totalactivocorriente + TotalActivosF + otrosActivos);
                                    lvlendeudamiento2 = totalpasivo2 / (totalactivocorriente2 + TotalActivosF2 + otrosActivos2);
                                    lvlendeudamiento3 = totalpasivo3 / (totalactivocorriente3 + TotalActivosF3 + otrosActivos3);
                                    lvlendeudamiento4 = totalpasivo4 / (totalactivocorriente4 + TotalActivosF4 + otrosActivos4);
                                    lvlendeudamiento5 = totalpasivo5 / (totalactivocorriente5 + TotalActivosF5 + otrosActivos5);

                                    double cortoplazo = 0, cortoplazo2 = 0, cortoplazo3 = 0, cortoplazo4 = 0, cortoplazo5 = 0;
                                    cortoplazo = (cuentaapagar + impuestos + acree) / totalpasivo;
                                    cortoplazo2 = (cuentaapagar2 + impuestos2 + impuestos + acree2) / totalpasivo;
                                    cortoplazo3 = (cuentaapagar3 + impuestos3 + impuestos2 + impuestos + acree3) / totalpasivo;
                                    cortoplazo4 = (cuentaapagar4 + impuestos4 + impuestos3 + impuestos2 + impuestos + acree4) / totalpasivo;
                                    cortoplazo5 = (cuentaapagar5 + impuestos5 + impuestos4 + impuestos3 + impuestos2 + impuestos + acree5) / totalpasivo;

                                    double gasfinanciero = 0, gasfinanciero2 = 0, gasfinanciero3 = 0, gasfinanciero4 = 0, gasfinanciero5 = 0;
                                    gasfinanciero = ((depresiacion20 + DEPRESIACION10 + depresiacion10 + DEPRESIACION5 + depresiacion5) + (depresiacionsemo + depresiacionculti) + provi1 + (idDAO.total(idp) / 5) + utilidadoperativo) / interes;
                                    gasfinanciero2 = ((depresiacion202 + DEPRESIACION102 + depresiacion102 + DEPRESIACION52 + depresiacion52) + (depresiacionsemo2 + depresiacionculti2) + provi2 + (idDAO.total(idp) / 5) + utilidadoperativo2) / interes2;
                                    gasfinanciero3 = ((depresiacion203 + DEPRESIACION103 + depresiacion103 + DEPRESIACION53 + depresiacion53) + (depresiacionsemo3 + depresiacionculti3) + provi3 + (idDAO.total(idp) / 5) + utilidadoperativo3) / interes3;
                                    gasfinanciero4 = ((depresiacion204 + DEPRESIACION104 + depresiacion104 + DEPRESIACION54 + depresiacion54) + (depresiacionsemo4 + depresiacionculti4) + provi4 + (idDAO.total(idp) / 5) + utilidadoperativo4) / interes4;
                                    gasfinanciero5 = ((depresiacion205 + DEPRESIACION105 + depresiacion105 + DEPRESIACION55 + depresiacion55) + (depresiacionsemo5 + depresiacionculti5) + provi5 + (idDAO.total(idp) / 5) + utilidadoperativo5) / interes5;

                                    double serviciodeuda = 0, serviciodeuda2 = 0, serviciodeuda3 = 0, serviciodeuda4 = 0, serviciodeuda5 = 0;
                                    serviciodeuda = ((depresiacion20 + DEPRESIACION10 + depresiacion10 + DEPRESIACION5 + depresiacion5) + (depresiacionsemo + depresiacionculti) + provi1 + (idDAO.total(idp) / 5) + utilidadoperativo) / (amortizacion + interes);
                                    serviciodeuda2 = ((depresiacion202 + DEPRESIACION102 + depresiacion102 + DEPRESIACION52 + depresiacion52) + (depresiacionsemo2 + depresiacionculti2) + provi2 + (idDAO.total(idp) / 5) + utilidadoperativo2) / (insobresal2 + interes2);
                                    serviciodeuda3 = ((depresiacion203 + DEPRESIACION103 + depresiacion103 + DEPRESIACION53 + depresiacion53) + (depresiacionsemo3 + depresiacionculti3) + provi3 + (idDAO.total(idp) / 5) + utilidadoperativo3) / (insobresal3 + interes3);
                                    serviciodeuda4 = ((depresiacion204 + DEPRESIACION104 + depresiacion104 + DEPRESIACION54 + depresiacion54) + (depresiacionsemo4 + depresiacionculti4) + provi4 + (idDAO.total(idp) / 5) + utilidadoperativo4) / (insobresal4 + interes4);
                                    serviciodeuda5 = ((depresiacion205 + DEPRESIACION105 + depresiacion105 + DEPRESIACION55 + depresiacion55) + (depresiacionsemo5 + depresiacionculti5) + provi5 + (idDAO.total(idp) / 5) + utilidadoperativo5) / (insobresal5 + interes5);

                                    double rentaoperacional = 0, rentaoperacional2 = 0, rentaoperacional3 = 0, rentaoperacional4 = 0, rentaoperacional5 = 0;
                                    rentaoperacional = utilidadoperativo / venta1;
                                    rentaoperacional2 = utilidadoperativo2 / venta2;
                                    rentaoperacional3 = utilidadoperativo3 / venta3;
                                    rentaoperacional4 = utilidadoperativo4 / venta4;
                                    rentaoperacional5 = utilidadoperativo5 / venta5;

                                    double rentaneta = 0, rentaneta2 = 0, rentaneta3 = 0, rentaneta4 = 0, rentaneta5;
                                    rentaneta = utilidadneta / venta1;
                                    rentaneta2 = utilidadneta2 / venta2;
                                    rentaneta3 = utilidadneta3 / venta3;
                                    rentaneta4 = utilidadneta4 / venta4;
                                    rentaneta5 = utilidadneta5 / venta5;

                                    double rentapatrimonio = 0, rentapatrimonio2 = 0, rentapatrimonio3 = 0, rentapatrimonio4 = 0, rentapatrimonio5 = 0;
                                    rentapatrimonio = utilidadneta / TOTALPATRIMONIO;
                                    rentapatrimonio2 = utilidadneta2 / TOTALPATRIMONIO2;
                                    rentapatrimonio3 = utilidadneta3 / TOTALPATRIMONIO3;
                                    rentapatrimonio4 = utilidadneta4 / TOTALPATRIMONIO4;
                                    rentapatrimonio5 = utilidadneta5 / TOTALPATRIMONIO5;

                                    double rentaactivo = 0, rentaactivo2 = 0, rentaactivo3 = 0, rentaactivo4 = 0, rentaactivo5 = 0;
                                    rentaactivo = utilidadneta / (totalactivocorriente + TotalActivosF + otrosActivos);
                                    rentaactivo2 = utilidadneta2 / (totalactivocorriente2 + TotalActivosF2 + otrosActivos2);
                                    rentaactivo3 = utilidadneta3 / (totalactivocorriente3 + TotalActivosF3 + otrosActivos3);
                                    rentaactivo4 = utilidadneta4 / (totalactivocorriente4 + TotalActivosF4 + otrosActivos4);
                                    rentaactivo5 = utilidadneta5 / (totalactivocorriente5 + TotalActivosF5 + otrosActivos5);

                                    double flujoinversion = 0;
                                    flujoinversion = -(totalactivocorriente0 + (totalTerrenos + totalConstrucion + totalMaquinaria + totalMuebles + totalTransporte + totalOficina + semovientes + cultivos));

                                    double obligacion = fin.Reporte2(idp, 1);

                                    double cajafinanciamiento0 = obligacionfinanciera + obligacion + capital;

                                %>

                                <table class="table table-bordered table-hover">
                                    <tr>
                                        <th>Conceptos</th>
                                        <th>Año 1</th>
                                        <th>Año 2</th>
                                        <th>Año 3</th>
                                        <th>Año 4</th>
                                        <th>Año 5</th>
                                    </tr>
                                    <tr class="info">
                                        <th colspan="6"><div class="text-center">Supuestos Macroeconómicos</div></th>
                                    </tr>
                                    <tr>
                                        <td title="El IPC o Indice de Precios al Consumidor es un indicador con el cual se calcula
                                            la evolución de la inflación">Variación Anual IPC</td>
                                        <td><div class="text-center"><%=ipc%> %</div></td>
                                        <td><div class="text-center"><%=ipc2%> %</div></td>
                                        <td><div class="text-center"><%=ipc3%> %</div></td>
                                        <td><div class="text-center"><%=ipc4%> %</div></td>
                                        <td><div class="text-center"><%=ipc5%> %</div></td>
                                    </tr>
                                    <tr>
                                        <td>Devaluación</td>
                                        <td><div class="text-center"><%=devalua%> %</div></td>
                                        <td><div class="text-center"><%=devalua2%> %</div></td>
                                        <td><div class="text-center"><%=devalua3%> %</div></td>
                                        <td><div class="text-center"><%=devalua4%> %</div></td>
                                        <td><div class="text-center"><%=devalua5%> %</div></td>
                                    </tr>
                                    <tr>
                                        <td>Variación PIB</td>
                                        <td><div class="text-center"><%=variaPIB%> %</div></td>
                                        <td><div class="text-center"><%=variaPIB%> %</div></td>
                                        <td><div class="text-center"><%=variaPIB%> %</div></td>
                                        <td><div class="text-center"><%=variaPIB%> %</div></td>
                                        <td><div class="text-center"><%=variaPIB%> %</div></td>
                                    </tr>
                                    <tr>
                                        <td>DTF ATA</td>
                                        <td><div class="text-center"><%=DTF%> %</div></td>
                                        <td><div class="text-center"><%=DTF2%> %</div></td>
                                        <td><div class="text-center"><%=DTF3%> %</div></td>
                                        <td><div class="text-center"><%=DTF4%> %</div></td>
                                        <td><div class="text-center"><%=DTF5%> %</div></td>
                                    </tr>
                                    <tr class="info">
                                        <th colspan="6"><div class="text-center">Supuestos Operativos</div></th>
                                    </tr>
                                    <tr>
                                        <td title="Variación de los precios de su(s) producto(s) o servicio(s)">Variación precios</td>
                                        <td><div class="text-center">N.A.</div></td>
                                        <td><div class="text-center"><%=formato2.format(variacionPrecio)%> %</div></td>
                                        <td><div class="text-center"><%=formato2.format(variacionPrecio2)%> %</div></td>
                                        <td><div class="text-center"><%=formato2.format(variacionPrecio3)%> %</div></td>
                                        <td><div class="text-center"><%=formato2.format(variacionPrecio4)%> %</div></td>
                                    </tr>
                                    <tr>
                                        <td title="Variación de las cantidades vendidas de su(s) producto(s) o servicio(s)">Variación Cantidades vendidas</td>
                                        <td><div class="text-center">N.A.</div></td>
                                        <td><div class="text-center"><%=formato2.format(variacionCantidad)%> %</div></td>
                                        <td><div class="text-center"><%=formato2.format(variacionCantidad2)%> %</div></td>
                                        <td><div class="text-center"><%=formato2.format(variacionCantidad3)%> %</div></td>
                                        <td><div class="text-center"><%=formato2.format(variacionCantidad4)%> %</div></td>
                                    </tr>
                                    <tr>
                                        <td title="Variación de los costos de producción de su(s) producto(s) o servicio(s)">Variación costos de producción</td>
                                        <td><div class="text-center">N.A.</div></td>
                                        <td><div class="text-center"><%=formato2.format(variacioncostosp)%> %</div></td>
                                        <td><div class="text-center"><%=formato2.format(variacioncostosp2)%> %</div></td>
                                        <td><div class="text-center"><%=formato2.format(variacioncostosp3)%> %</div></td>
                                        <td><div class="text-center"><%=formato2.format(variacioncostosp4)%> %</div></td>
                                    </tr>
                                    <tr>
                                        <td title="Variación de los gastos administrativos de su(s) producto(s) o servicio(s)">Variación Gastos Administrativos</td>
                                        <td><div class="text-center">N.A.</div></td>
                                        <td><div class="text-center"><%=formato2.format(variacionadminis)%> %</div></td>
                                        <td><div class="text-center"><%=formato2.format(variacionadminis2)%> %</div></td>
                                        <td><div class="text-center"><%=formato2.format(variacionadminis3)%> %</div></td>
                                        <td><div class="text-center"><%=formato2.format(variacionadminis4)%> %</div></td>
                                    </tr>
                                    <tr>
                                        <td title="Tiempo en el cual la empresa toma en cobrar la cartera de sus clientes">Rotación Cartera (días)</td>
                                        <td><div class="text-center"><%=CarteraClientes%></div></td>
                                        <td><div class="text-center"><%=CarteraClientes2%></div></td>
                                        <td><div class="text-center"><%=CarteraClientes3%></div></td>
                                        <td><div class="text-center"><%=CarteraClientes4%></div></td>
                                        <td><div class="text-center"><%=CarteraClientes5%></div></td>
                                    </tr>
                                    <tr>
                                        <td  title="Cuentas a pagar empresas o persona que proporciona un servicio o un bien">Rotación Proveedores (días)</td>
                                        <td><div class="text-center"><%=cuentaapagar0%></div></td>
                                        <td><div class="text-center"><%=cuentaapagar02%></div></td>
                                        <td><div class="text-center"><%=cuentaapagar03%></div></td>
                                        <td><div class="text-center"><%=cuentaapagar04%></div></td>
                                        <td><div class="text-center"><%=cuentaapagar05%></div></td>
                                    </tr> 
                                    <tr>
                                        <td title="Total Inventario/Total Costos Producción Inventariables * 360">Rotación inventarios (días)</td>
                                        <td><div class="text-center"><%=formato.format(rotacioninventario)%></div></td>
                                        <td><div class="text-center"><%=formato.format(rotacioninventario2)%></div></td>
                                        <td><div class="text-center"><%=formato.format(rotacioninventario3)%></div></td>
                                        <td><div class="text-center"><%=formato.format(rotacioninventario4)%></div></td>
                                        <td><div class="text-center"><%=formato.format(rotacioninventario5)%></div></td>
                                    </tr>
                                    <tr class="info">
                                        <th colspan="6"><div class="text-center">Indicadores Financieros Proyectados</div></th>
                                    </tr>
                                    <tr>
                                        <td title="Capacidad que tiene la empresa para cumplir con sus obligaciones financieras, deudas o pasivos a corto plazo">Liquidez - Razón Corriente</td>
                                        <td><div class="text-center"><%=formato2.format(liquidez0)%></div></td>
                                        <td><div class="text-center"><%=formato2.format(liquidez02)%></div></td>
                                        <td><div class="text-center"><%=formato2.format(liquidez03)%></div></td>
                                        <td><div class="text-center"><%=formato2.format(liquidez04)%></div></td>
                                        <td><div class="text-center"><%=formato2.format(liquidez05)%></div></td>
                                    </tr> 
                                    <tr>
                                        <td title="Capacidad de la empresa para cancelar sus obligaciones corrientes, sin contar con la venta de sus existencias">Prueba Acida</td>
                                        <td><div class="text-center"><%=formato2.format(pruebaacida)%></div></td>
                                        <td><div class="text-center"><%=formato2.format(pruebaacida2)%></div></td>
                                        <td><div class="text-center"><%=formato2.format(pruebaacida3)%></div></td>
                                        <td><div class="text-center"><%=formato2.format(pruebaacida4)%></div></td>
                                        <td><div class="text-center"><%=formato2.format(pruebaacida5)%></div></td>
                                    </tr>
                                    <tr>
                                        <td>Rotacion cartera (días)</td>
                                        <td><div class="text-center"><%=formato2.format(rotacioncarteradia)%></div></td>
                                        <td><div class="text-center"><%=formato2.format(rotacioncarteradia2)%></div></td>
                                        <td><div class="text-center"><%=formato2.format(rotacioncarteradia3)%></div></td>
                                        <td><div class="text-center"><%=formato2.format(rotacioncarteradia4)%></div></td>
                                        <td><div class="text-center"><%=formato2.format(rotacioncarteradia5)%></div></td>
                                    </tr>
                                    <tr>
                                        <td>Rotación Inventarios (días)</td>
                                        <td><div class="text-center"><%=formato2.format(rotacioninventariodia)%></div></td>
                                        <td><div class="text-center"><%=formato2.format(rotacioninventariodia2)%></div></td>
                                        <td><div class="text-center"><%=formato2.format(rotacioninventariodia3)%></div></td>
                                        <td><div class="text-center"><%=formato2.format(rotacioninventariodia4)%></div></td>
                                        <td><div class="text-center"><%=formato2.format(rotacioninventariodia5)%></div></td>
                                    </tr>
                                    <tr>
                                        <td>Rotacion Proveedores (días)</td>
                                        <td><div class="text-center"><%=formato2.format(rotacionprovedoresdia)%></div></td>
                                        <td><div class="text-center"><%=formato2.format(rotacionprovedoresdia2)%></div></td>
                                        <td><div class="text-center"><%=formato2.format(rotacionprovedoresdia3)%></div></td>
                                        <td><div class="text-center"><%=formato2.format(rotacionprovedoresdia4)%></div></td>
                                        <td><div class="text-center"><%=formato2.format(rotacionprovedoresdia5)%></div></td>
                                    </tr>
                                    <tr >
                                        <td>Nivel de Endeudamiento Total</td>
                                        <td><div class="text-center"><%=formato2.format(lvlendeudamiento * 100)%>%</div></td>
                                        <td><div class="text-center"><%=formato2.format(lvlendeudamiento2 * 100)%>%</div></td>
                                        <td><div class="text-center"><%=formato2.format(lvlendeudamiento3 * 100)%>%</div></td>
                                        <td><div class="text-center"><%=formato2.format(lvlendeudamiento4 * 100)%>%</div></td>
                                        <td><div class="text-center"><%=formato2.format(lvlendeudamiento5 * 100)%>%</div></td>
                                    </tr>
                                    <tr>
                                        <td>Concentración Corto Plazo</td>
                                        <td><div class="text-center"><%=formato.format(cortoplazo)%>%</div></td>
                                        <td><div class="text-center"><%=formato.format(cortoplazo2)%>%</div></td>
                                        <td><div class="text-center"><%=formato.format(cortoplazo3)%>%</div></td>
                                        <td><div class="text-center"><%=formato.format(cortoplazo4 + 0.09)%>%</div></td>
                                        <td><div class="text-center"><%=formato.format(cortoplazo5 + 0.09)%>%</div></td>
                                    </tr>
                                    <tr>
                                        <td>Ebitda / Gastos Financieros</td>
                                        <%
                                            if(formato2.format(gasfinanciero * 100).equals("∞")){
                                               gasfinanciero = 0;
                                            }
                                            if(formato.format(gasfinanciero2 * 100).equals("∞")){
                                               gasfinanciero2 = 0;
                                            }
                                            if(formato2.format(gasfinanciero3 * 100).equals("∞")){
                                               gasfinanciero3 = 0;
                                            }
                                            if(formato2.format(gasfinanciero4 * 100).equals("∞")){
                                               gasfinanciero4 = 0;
                                            }
                                            if(formato2.format(gasfinanciero5 * 100).equals("∞")){
                                               gasfinanciero5 = 0;
                                            }
                                        %>
                                        <td><div class="text-center"><%=formato2.format(gasfinanciero * 100)%>%</div></td>
                                        <td><div class="text-center"><%=formato2.format(gasfinanciero2 * 100)%>%</div></td>
                                        <td><div class="text-center"><%=formato2.format(gasfinanciero3 * 100)%>%</div></td>
                                        <td><div class="text-center"><%=formato2.format(gasfinanciero4 * 100)%>%</div></td>
                                        <td><div class="text-center"><%=formato2.format(gasfinanciero5 * 100)%>%</div></td>
                                    </tr>
                                    <tr> 
                                        <td>Ebitda / Servicio de Deuda</td>
                                        <%
                                        if(formato2.format(serviciodeuda * 100).equals("∞")){
                                               serviciodeuda = 0;
                                            }
                                        if(formato2.format(serviciodeuda2 * 100).equals("∞")){
                                               serviciodeuda2 = 0;
                                            }
                                        if(formato2.format(serviciodeuda3 * 100).equals("∞")){
                                               serviciodeuda3 = 0;
                                            }
                                        if(formato2.format(serviciodeuda4 * 100).equals("∞")){
                                               serviciodeuda4 = 0;
                                            }
                                        if(formato2.format(serviciodeuda5 * 100).equals("∞")){
                                               serviciodeuda5 = 0;
                                            }
                                        %>
                                        <td><div class="text-center"><%=formato2.format(serviciodeuda * 100)%>%</div></td>
                                        <td><div class="text-center"><%=formato2.format(serviciodeuda2 * 100)%>%</div></td>
                                        <td><div class="text-center"><%=formato2.format(serviciodeuda3 * 100)%>%</div></td>
                                        <td><div class="text-center"><%=formato2.format(serviciodeuda4 * 100)%>%</div></td>
                                        <td><div class="text-center"><%=formato2.format(serviciodeuda5 * 100)%>%</div></td>
                                    </tr>
                                    <tr>
                                        <td>Rentabilidad Operacional</td>
                                        <td><div class="text-center"><%=formato2.format(rentaoperacional * 100)%>%</div></td>
                                        <td><div class="text-center"><%=formato2.format(rentaoperacional2 * 100)%>%</div></td>
                                        <td><div class="text-center"><%=formato2.format(rentaoperacional3 * 100)%>%</div></td>
                                        <td><div class="text-center"><%=formato2.format(rentaoperacional4 * 100)%>%</div></td>
                                        <td><div class="text-center"><%=formato2.format(rentaoperacional5 * 100)%>%</div></td>
                                    </tr>
                                    <tr>
                                        <td>Rentabilidad Neta</td>
                                        <td><div class="text-center"><%=formato2.format(rentaneta * 100)%>%</div></td>
                                        <td><div class="text-center"><%=formato2.format(rentaneta2 * 100)%>%</div></td>
                                        <td><div class="text-center"><%=formato2.format(rentaneta3 * 100)%>%</div></td>
                                        <td><div class="text-center"><%=formato2.format(rentaneta4 * 100)%>%</div></td>
                                        <td><div class="text-center"><%=formato2.format(rentaneta5 * 100)%>%</div></td>
                                    </tr>
                                    <tr>
                                        <td>Rentabilidad Patrimonio</td>
                                        <td><div class="text-center"><%=formato2.format(rentapatrimonio * 100)%>%</div></td>
                                        <td><div class="text-center"><%=formato2.format(rentapatrimonio2 * 100)%>%</div></td>
                                        <td><div class="text-center"><%=formato2.format(rentapatrimonio3 * 100)%>%</div></td>
                                        <td><div class="text-center"><%=formato2.format(rentapatrimonio4 * 100)%>%</div></td>
                                        <td><div class="text-center"><%=formato2.format(rentapatrimonio5 * 100)%>%</div></td>
                                    </tr>
                                    <tr>
                                        <td>Rentabilidad del Activo</td>
                                        <td><div class="text-center"><%=formato2.format(rentaactivo * 100)%>%</div></td>
                                        <td><div class="text-center"><%=formato2.format(rentaactivo2 * 100)%>%</div></td>
                                        <td><div class="text-center"><%=formato2.format(rentaactivo3 * 100)%>%</div></td>
                                        <td><div class="text-center"><%=formato2.format(rentaactivo4 * 100)%>%</div></td>
                                        <td><div class="text-center"><%=formato2.format(rentaactivo5 * 100)%>%</div></td>
                                    </tr>

                                </table>

                                <table class="table table-bordered table-hover">
                                    <tr><th colspan="7" class="info">Flujo de Caja y Rentabilidad</th> </tr>
                                    <tr>
                                        <td>Flujo de Operación</td>
                                        <td></td>
                                        <td><%=formato.format(flujooperativo)%></td>
                                        <td><%=formato.format(flujooperativo2)%></td>
                                        <td><%=formato.format(flujooperativo3)%></td>
                                        <td><%=formato.format(flujooperativo4)%></td>
                                        <td><%=formato.format(flujooperativo5)%></td>
                                    </tr>
                                    <tr>
                                        <td>Flujo de Inversión</td>
                                        <td><%=formato.format(flujoinversion)%></td>
                                        <td><%=formato.format(cajadeinversion)%></td>
                                        <td><%=formato.format(cajadeinversion2)%></td>
                                        <td><%=formato.format(cajadeinversion3)%></td>
                                        <td><%=formato.format(cajadeinversion4)%></td>
                                        <td><%=formato.format(cajadeinversion5)%></td>
                                    </tr>
                                    <tr>
                                        <td>Flujo de Financiación</td>
                                        <td><%=formato.format(cajafinanciamiento0)%></td>
                                        <td><%=formato.format(cajafinanciamiento)%></td>
                                        <td><%=formato.format(cajafinanciamiento2)%></td>
                                        <td><%=formato.format(cajafinanciamiento3)%></td>
                                        <td><%=formato.format(cajafinanciamiento4)%></td>
                                        <td><%=formato.format(cajafinanciamiento5)%></td>
                                    </tr>
                                    <%
                                        double porcentajeflujo_caja = tv.getTasa_Oportunidad() / 100;
                                        double flujo_caja_d1 = 0, flujo_caja_d2 = 0, flujo_caja_d3 = 0, flujo_caja_d4 = 0, flujo_caja_d5 = 0, flujo_caja_d6 = 0;
                                        double f_c_e1 = 0, f_c_e2 = 0, f_c_e3 = 0, f_c_e4 = 0, f_c_e5 = 0;

                                        f_c_e1 = flujooperativo + cajadeinversion;
                                        f_c_e2 = flujooperativo2 + cajadeinversion2;
                                        f_c_e3 = flujooperativo3 + cajadeinversion3;
                                        f_c_e4 = flujooperativo4 + cajadeinversion4;
                                        f_c_e5 = flujooperativo5 + cajadeinversion5;

                                        flujo_caja_d1 = (flujooperativo + cajadeinversion) / (1 + porcentajeflujo_caja);
                                        flujo_caja_d2 = (flujooperativo2 + cajadeinversion2) / (1 + porcentajeflujo_caja);
                                        flujo_caja_d3 = (flujooperativo3 + cajadeinversion3) / (1 + porcentajeflujo_caja);
                                        flujo_caja_d4 = (flujooperativo4 + cajadeinversion4) / (1 + porcentajeflujo_caja);
                                        flujo_caja_d5 = (flujooperativo5 + cajadeinversion5) / (1 + porcentajeflujo_caja);

                                    %>
                                    <tr>
                                        <td>Flujo de caja para evaluación</td>
                                        <td><%=formato.format(flujoinversion)%></td>
                                        <td><%=formato.format(f_c_e1)%></td>
                                        <td><%=formato.format(f_c_e2)%></td>
                                        <td><%=formato.format(f_c_e3)%></td>
                                        <td><%=formato.format(f_c_e4)%></td>
                                        <td><%=formato.format(f_c_e5)%></td>
                                    </tr>
                                    <tr>
                                        <td>Tasa de descuento Utilizada</td>
                                        <td></td>
                                        <td><%=tv.getTasa_Oportunidad()%> %</td>
                                        <td><%=tv.getTasa_Oportunidad()%> %</td>
                                        <td><%=tv.getTasa_Oportunidad()%> %</td>
                                        <td><%=tv.getTasa_Oportunidad()%> %</td>
                                        <td><%=tv.getTasa_Oportunidad()%> %</td>
                                    </tr>
                                    <tr>
                                        <td>Flujo de caja descontado</td> 
                                        <td><%=formato.format(flujoinversion)%></td>
                                        <td><%=formato.format(flujo_caja_d1)%></td>
                                        <td><%=formato.format(flujo_caja_d2)%></td>
                                        <td><%=formato.format(flujo_caja_d3)%></td>
                                        <td><%=formato.format(flujo_caja_d4)%></td>
                                        <td><%=formato.format(flujo_caja_d5)%></td>
                                    </tr> 
                                </table> 
                                <%
                                    double tir = 0, pri = 0, afe = 0, van = 0;
                                    ReporteDAO reporte_dao = new ReporteDAO();

                                    tir = reporte_dao.TIR(flujoinversion, f_c_e1, f_c_e2, f_c_e3, f_c_e4, f_c_e5, tv.getTasa_Oportunidad());
                                    van = reporte_dao.VAN(flujoinversion, f_c_e1, f_c_e2, f_c_e3, f_c_e4, f_c_e5, tv.getTasa_Oportunidad());
                                    pri = reporte_dao.PRI(flujoinversion, f_c_e1, f_c_e2, f_c_e3, f_c_e4, f_c_e5);
                                    afe = (obligacionfinanciera + obligacionFondoEmprender) / ((gastoanticipado + EFECTIVO0) + TotalActivosF0);

                                    if (formato2.format(tir).equals(formato2.format(tv.getTasa_Oportunidad()))) {
                                        tir = 0;
                                    }
                                %>

                                <table class="table table-bordered table-hover">
                                    <tr><th class="info" colspan="2">Criterios de Decisión</th></tr>
                                    <tr>
                                        <td>Tasa mínima de rendimiento</td>
                                        <td><%=tv.getTasa_Oportunidad()%> %</td>
                                    </tr>
                                    <tr>
                                        <td title=" tasa de interés o rentabilidad que ofrece una inversión. Es decir, es el porcentaje de beneficio o pérdida que tendrá una inversión para las cantidades que no se han retirado del proyecto">TIR (Tasa Interna de Retorno) </td>
                                        <td><%=formato2.format(tir)%> %</td>
                                    </tr>
                                    <tr>
                                        <td title="El Valor Actual Neto (VAN) es un criterio de inversión que consiste en actualizar los cobros y pagos de un proyecto o inversión para conocer cuanto se va a ganar o perder con esa inversión">VAN (Valor actual neto) </td>
                                        <td><%=formato2.format(van)%></td>
                                    </tr>
                                    <tr>
                                        <td>PRI (Periodo de recuperación de la inversión)</td>
                                        <td><%=formato2.format(pri)%></td>
                                    </tr>
                                    <tr>
                                        <td>Nivel de endeudamiento inicial del negocio,<br> teniendo en cuenta los recursos del fondo emprender. ( AFE/AT)</td>
                                        <td><%=formato2.format(afe * 100)%> %</td>
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
        <script src="../js/bootstrap.min.js" type="text/javascript"></script>
        <script src="../js/ajax/Temporal.js" type="text/javascript"></script>
        <script type="text/javascript">
                                                        $("#btnImp").click(function () {
                                                            $("div#areaImp").printArea();
                                                        });
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
