<%-- 
    Document   : Imprimir
    Created on : 7/11/2017, 08:51:32 AM
    Author     : mayrayesenia
--%>

<%@page import="VO.FinanciacionVO"%>
<%@page import="DAO.FinanciacionDAO"%>
<%@page import="DAO.GastoCostoDAO"%>
<%@page import="VO.GastoCostoVO"%>
<%@page import="VO.GastoCostoVO"%>
<%@page import="DAO.TemporalDAO"%>
<%@page import="VO.TemporalVO"%>
<%@page import="DAO.GeneralDAO"%>
<%@page import="VO.GeneralVO"%>
<%@page import="VO.NominaVO"%>
<%@page import="DAO.NominaDAO"%>
<%@page import="DAO.InversionDiferidaDAO"%>
<%@page import="VO.InversionDiferidaVO"%>
<%@page import="DAO.InversionDAO"%>
<%@page import="VO.InversionVO"%>
<%@page import="DAO.EPreciosDAO"%>
<%@page import="VO.EPreciosVO"%>
<%@page import="VO.CompetenciaVO"%>
<%@page import="DAO.CompetenciaDAO"%>
<%@page import="DAO.ConsumidorDAO"%>
<%@page import="VO.ConsumidorVO"%>
<%@page import="DAO.ClienteDAO"%>
<%@page import="VO.ClienteVO"%>
<%@page import="DAO.ActividadesDAO"%>
<%@page import="VO.ActividadesVO"%>
<%@page import="DAO.PrecioProductosDAO"%>
<%@page import="VO.PrecioProductosVO"%>
<%@page import="VO.CostosProductosVO"%>
<%@page import="DAO.CostosProductosDAO"%>
<%@page import="DAO.ProyeccionVentasDAO"%>
<%@page import="VO.ProyeccionVentasVO"%>
<%@page import="VO.ProductoVO"%>
<%@page import="DAO.ProductoDAO"%>
<%@page import="VO.EDistribuicionVO"%>
<%@page import="DAO.EDistribucionDAO"%>
<%@page import="VO.EPromocionVO"%>
<%@page import="DAO.EPromocionDAO"%>
<%@page import="VO.OrganizacionVO"%>
<%@page import="DAO.OrganizacionDAO"%>
<%@page import="VO.EOrganizacionalVO"%>
<%@page import="DAO.EOrganizacionalDAO"%>
<%@page import="VO.ConceptoOrganizacionalVO"%>
<%@page import="DAO.ConceptoOrganizacionalDAO"%>
<%@page import="DAO.MercadoDAO"%>
<%@page import="VO.MercadoVO"%>
<%@page import="VO.TipoSociedadVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.TipoSociedadDAO"%>
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
        <title>Imprimir</title>
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
            TipoSociedadDAO tsd = new TipoSociedadDAO();

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
                            <br>
                            <button class="btn btn-default" id="menusito" ><span class="glyphicon glyphicon-align-justify"></span></button> 

                            <br>
                            <center>
                                <a type="button" id="btnImp" class="btn btn-info " >Exportar</a>
                                <a href="http://combinepdf.com/es/" class="btn btn-default" target="_blank"
                                   title="descarga todos los reportes, luego unelos por medio de la siguiente página">
                                    <span class="glyphicon glyphicon-print"></span> Unir Todos los PDF</a>
                            </center>
                            <div  id="areaImp">
                                <center>
                                    <h1 ><%=pv.getNombreP()%></h1>
                                </center>

                                <!-- inicio de proyecto -->
                                <h3>Descripción del proyecto</h3>
                                <textarea id="descripcion" class=" form-control" disabled=""><%=pv.getDescripcion()%></textarea><br>


                                <h3>Objetivo General</h3>
                                <textarea id="OGeneral" class=" form-control "disabled><%=pv.getOGeneral()%></textarea><br>


                                <h3>Objetivos Especificos</h3>
                                <textarea id="OEspecificos" class="form-control" disabled><%=pv.getOEspecificos()%></textarea><br>



                                <h3>Justificiación</h3>
                                <textarea id="Justificacion" class="form-control" disabled><%=pv.getJustificacion()%></textarea><br>



                                <h3>Problema</h3>
                                <textarea id="Problema" class="form-control" disabled><%=pv.getProblema()%></textarea><br>

                                <%if (pv.getHistoria() != "") {%>
                                <h3>Historia</h3>
                                <textarea disabled class="form-control"><%=pv.getHistoria()%></textarea><br>
                                <%}
                                    if (pv.getAvances() != "") {%>
                                <h3>Avances</h3>
                                <textarea disabled class="form-control"><%=pv.getAvances()%></textarea><br>
                                <%}%>
                                <h3>Meses Improductivos</h3>
                                <%=pv.getMesesImproductivos()%><br>
                                <%if (pv.getRazonSocial() != "") {%>
                                <h3>Razon Social</h3>
                                <%=pv.getRazonSocial()%><br>
                                <%}%>
                                <h3>Tipo Sociedad</h3>
                                <%if (pv.getIdTipoSociedad() == 0) {
                                %>

                                <select id="TipoSociedad" class="form-control">
                                    <%
                                        ArrayList<TipoSociedadVO> ts = new ArrayList();
                                        ts = tsd.readAll();
                                        TipoSociedadVO tsv;
                                        for (int i = 0; i < ts.size(); i++) {
                                            tsv = ts.get(i);
                                    %>
                                    <option value="<%=tsv.getIdTipoSociedad()%>"><%=tsv.getTSociedad()%></option>
                                    <%}%>
                                </select><br>
                                <%} else {

                                    TipoSociedadVO t;
                                    t = tsd.read(pv.getIdTipoSociedad());

                                    ArrayList<TipoSociedadVO> ts = new ArrayList();
                                    ts = tsd.readAll();
                                    TipoSociedadVO tsv;

                                %>



                                <%=t.getTSociedad()%>

                                </select>
                                <%}%>
                                <!-- fin de proyecto-->
                                <!-- inicio de mercado -->

                                <%
                                    MercadoVO m = null;
                                    MercadoDAO md = new MercadoDAO();
                                    m = md.read(idp);
                                    if (m != null) {

                                %>


                                <h3>Sector:</h3>
                                <textarea class="form-control" disabled><%=m.getSector()%></textarea>
                                <br>

                                <h3>Tendencia</h3>
                                <textarea class="form-control" disabled><%=m.getComportamiento()%></textarea><br>


                                <h3>Componente innovador</h3>
                                <textarea class="form-control" disabled><%=m.getEvolucion()%></textarea><br>


                                <h3>Validación</h3>
                                <textarea class="form-control" disabled><%=m.getDiagnostico()%></textarea><br>


                                <h3>Ingresos</h3>
                                <textarea class="form-control" disabled><%=m.getObjetivos()%></textarea><br>


                                <h3>Período de arranque del proyecto </h3>
                                <textarea class="form-control" disabled><%=m.getJustificación()%></textarea><br>


                                <%}%>
                                <!-- fin de mercado -->

                                <!-- inicio estrategia organizacional -->
                                <%

                                    ConceptoOrganizacionalDAO cod = new ConceptoOrganizacionalDAO();
                                    ArrayList<ConceptoOrganizacionalVO> acov = new ArrayList();
                                    acov = cod.readAll();
                                    ConceptoOrganizacionalVO c;

                                    EOrganizacionalDAO ed = new EOrganizacionalDAO();
                                    ArrayList<EOrganizacionalVO> e = new ArrayList();
                                    EOrganizacionalVO eo;
                                    e = ed.todos(idp);

                                    if (!e.isEmpty()) {


                                %>
                                <br>
                                <h3>Estrategia Organizacional</h3><br>
                                <table class="table table-bordered ">
                                    <thead>
                                    <th>Concepto</th>
                                    <th>Impacto</th>
                                    <th>Estrategia</th>

                                    </thead>
                                    <tbody>
                                        <%                                            for (int i = 0; i < e.size(); i++) {
                                                eo = e.get(i);
                                        %>
                                        <tr id="tr<%=eo.getIdOrganizacional()%>">
                                            <td><%=eo.getConceptoO()%></td>
                                            <td><%=eo.getImpacto()%></td>
                                            <td><%=eo.getEstrategia()%></td>

                                        </tr>
                                        <% }%>
                                    </tbody>
                                </table>
                                <% } %>
                                <!-- fin estrategia organizacional -->
                                <!-- inicio Organizacion -->
                                <%
                                    OrganizacionDAO orDAO = new OrganizacionDAO();
                                    OrganizacionVO or = orDAO.read(idp);
                                    if (or != null) {

                                %>
                                <br><h3>Organización</h3><br>

                                <h4>Normativa Empresarial</h4>
                                <textarea class="form-control" disabled><%=or.getNor_empresarial()%></textarea>
                                <br>
                                <h4>Normativa tributaria</h4>
                                <textarea class="form-control" disabled><%=or.getNor_tributaria()%></textarea>
                                <br>
                                <h4>Normativa técnica</h4>
                                <textarea class="form-control" disabled><%=or.getNor_tecnica()%></textarea>
                                <br>
                                <h4>Normativa laboral</h4>
                                <textarea class="form-control" disabled><%=or.getNor_laboral()%></textarea>
                                <br>
                                <h4>Normativa ambiental</h4>
                                <textarea class="form-control" disabled><%=or.getNor_ambiental()%></textarea>
                                <br>
                                <h4>Registro marca - Propiedad intelectual</h4>
                                <textarea class="form-control" disabled><%=or.getRegistro_marca()%></textarea>
                                <br>
                                <%}%>
                                <!-- fin Organizacion -->
                                <!-- inicio estrategia de promoción -->

                                <%
                                    EPromocionDAO eds = new EPromocionDAO();
                                    EPromocionVO es = eds.read(idp);
                                    if (es != null) {


                                %>
                                <br><h3>Estrategia Promoción</h3><br>
                                <h4>Estrategia</h4>
                                <textarea class="form-control" disabled><%=es.getEstrategia()%></textarea>
                                <br>

                                <h4>Manejo Clientes Especiales</h4>
                                <textarea class="form-control" disabled><%=es.getManejoClienteEspecial()%></textarea>
                                <br>


                                <h4>Concepto Motivacion</h4>
                                <textarea class="form-control" disabled><%=es.getConceptoMotivacion()%></textarea>
                                <br>

                                <h4>Promocion Publicidad</h4>
                                <textarea  class="form-control" disabled><%=es.getPromocionPublicidad()%></textarea>
                                <br>

                                <%}%>
                                <!-- fin Estrategia de promoción -->

                                <!--  inicio estrategia de distribución -->

                                <%
                                    EDistribucionDAO ed2 = new EDistribucionDAO();
                                    EDistribuicionVO e2 = null;
                                    e2 = ed2.read(idp);
                                    if (e2 != null) {

                                %>
                                <h3>Estrategia de Distribución</h3><br>  
                                <h4>Penetracion</h4>
                                <textarea class="form-control" disabled><%=e2.getPenetracion()%></textarea>
                                <br>

                                <h4>Comercializacion</h4>
                                <textarea class="form-control" disabled><%=e2.getComercializacion()%></textarea>
                                <br>

                                <h4>Distribución física</h4>
                                <textarea class="form-control" disabled><%=e2.getDistribuicionNI()%></textarea>
                                <br>

                                <h4>Tactica</h4>
                                <textarea class="form-control" disabled><%=e2.getTactica()%></textarea>
                                <br>

                                <h4>Canal<h4>
                                        <textarea class="form-control" disabled><%=e2.getCanal()%></textarea>
                                        <br>

                                        <%}%>
                                        <!-- fin estrategi de distribucion -->
                                        <!-- inicio de productos -->

                                        <h3>Producto(s) o  servicio(s)</h3><br>
                                        <%
                                            ProductoDAO prd = new ProductoDAO();
                                            ProductoVO prv;
                                            ArrayList<ProductoVO> prA = new ArrayList();
                                            prA = prd.todos(idp);

                                            for (int i = 0; i < prA.size(); i++) {
                                                prv = prA.get(i);


                                        %>
                                        <table class="table table-bordered" >
                                            <thead>

                                            <th>Item</th>
                                            <th>Descripción</th>

                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>Producto Especifico</td>
                                                    <td><%=prv.getProdu_especifico()%></td>
                                                </tr>
                                                <tr>
                                                    <td>Nombre Comercial</td>
                                                    <td><%=prv.getNombre()%></td>
                                                </tr>
                                                <tr>
                                                    <td>Unidad de medida</td>
                                                    <td><%=prv.getUMedida()%></td>
                                                </tr>
                                                <tr>
                                                    <td>Descripción general</td>
                                                    <td><%=prv.getDescripcion_general()%></td>
                                                </tr>
                                                <tr>
                                                    <td>Condiciones especiales</td>
                                                    <td><%=prv.getCondiciones_especiales()%></td>
                                                </tr>
                                                <tr>
                                                    <td>Otro</td>
                                                    <td><%=prv.getOtro()%></td>
                                                </tr>
                                            </tbody>
                                        </table><br>

                                        <!-- inicio Proyección Ventas -->
                                        <h3>Proyección ventas (<%=prv.getNombre()%>)</h3>

                                        <table class="table table-bordered table-hover">
                                            <tr>
                                                <th >Proyección</th>
                                                <th >Año</th>

                                            </tr>
                                            <%
                                                ProyeccionVentasVO pvVO;
                                                ProyeccionVentasDAO pvDAO = new ProyeccionVentasDAO();
                                                ArrayList<ProyeccionVentasVO> pvvv = new ArrayList();
                                                pvvv = pvDAO.todo(prv.getIdProducto());
                                                for (int k = 0; k < pvvv.size(); k++) {
                                                    pvVO = pvvv.get(k);

                                                    String proyeccion = formato.format(pvVO.getProyeccion());
                                            %>

                                            <tr id="tr<%=pvVO.getIdProyeccionVO()%>">
                                                <td><%=proyeccion%></td>
                                                <td><%=pvVO.getYear()%></td>

                                            </tr>

                                            <%}%>
                                        </table>

                                        <!-- fin proyección ventas -->
                                        <!-- inicio costos -->
                                        <%

                                        %>
                                        <br><h3>Costos Directos (<%=prv.getNombre()%>)</h3>
                                        <table class="table table-bordered table-hover">
                                            <thead >
                                                <tr>
                                                    <th rowspan="2" class="text-center ">Detalle</th>
                                                    <th rowspan="2" class="text-center">Iva</th>
                                                    <th rowspan="2" class="text-center">Cantidad</th>
                                                    <th colspan="2" class="text-center">Presentación</th>
                                                    <th rowspan="2" class="text-center">Costo<br> Mensual</th>
                                                    <th rowspan="2" class="text-center">Costo<br> Anual</th>


                                                </tr>
                                                <tr>
                                                    <th class="text-center">Unidad Medida</th>
                                                    <th class="text-center ">Precio</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%
                                                    CostosProductosDAO cp = new CostosProductosDAO();
                                                    CostosProductosVO c2;
                                                    ArrayList<CostosProductosVO> acp = new ArrayList();
                                                    acp = cp.todo(prv.getIdProducto(), 1);

                                                    String precio = "", CostoA = "", CostoM = "";
                                                    double costoa = 0, costom = 0;
                                                    for (int caaa = 0; caaa < acp.size(); caaa++) {
                                                        c2 = acp.get(caaa);
                                                        precio = formato.format(c2.getPrecio());
                                                        costom = (c2.getPrecio() * c2.getCantidad()) / 12;
                                                        CostoM = formato.format(costom);

                                                        costoa = costom * 12;
                                                        CostoA = formato.format(costoa);

                                                %>
                                                <tr id="tr<%=c2.getIdCosto()%>">
                                                    <td><%=c2.getDetalle()%></td>
                                                    <td><div class="text-right"><%=c2.getIva()%> %</div></td>
                                                    <td><div class="text-right"><%=formato.format(c2.getCantidad())%></div></td>
                                                    <td><%=c2.getUMedida()%></td>
                                                    <td><div class="text-right">$ <%=precio%></div></td>
                                                    <td><div class="text-right">$ <%=CostoM%></div></td>
                                                    <td><div class="text-right">$ <%=CostoA%></div></td>

                                                </tr>
                                                <%}%>
                                            </tbody>
                                        </table>

                                        <br><h3>Costos Indirectos (<%=prv.getNombre()%>)</h3>
                                        <table class="table table-bordered table-hover">
                                            <thead >
                                                <tr>
                                                    <th rowspan="2" class="text-center ">Detalle</th>
                                                    <th rowspan="2" class="text-center">Iva</th>
                                                    <th rowspan="2" class="text-center">Cantidad</th>
                                                    <th colspan="2" class="text-center">Presentación</th>
                                                    <th rowspan="2" class="text-center">Costo<br> Mensual</th>
                                                    <th rowspan="2" class="text-center">Costo<br> Anual</th>


                                                </tr>
                                                <tr>
                                                    <th class="text-center">Unidad Medida</th>
                                                    <th class="text-center col-md-2">Precio</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%

                                                    acp = cp.todo(prv.getIdProducto(), 2);

                                                    String precios = "", CostoAs = "", CostoMs = "";
                                                    double costoas = 0, costoms = 0;
                                                    for (int i3 = 0; i3 < acp.size(); i3++) {
                                                        c2 = acp.get(i3);
                                                        precios = formato.format(c2.getPrecio());

                                                        costoas = c2.getPrecio() * c2.getCantidad();
                                                        CostoAs = formato.format(costoas);

                                                        costoms = costoas / 12;
                                                        CostoMs = formato.format(costoms);
                                                %>
                                                <tr id="tr<%=c2.getIdCosto()%>">
                                                    <td><%=c2.getDetalle()%></td>
                                                    <td><div class="text-right"><%=c2.getIva()%> %</div></td>
                                                    <td><div class="text-right"><%=formato.format(c2.getCantidad())%></div></td>
                                                    <td><%=c2.getUMedida()%></td>
                                                    <td><div class="text-right">$ <%=precios%></div></td>
                                                    <td><div class="text-right">$ <%=CostoMs%></div></td>
                                                    <td><div class="text-right">$ <%=CostoAs%></div></td>

                                                </tr>
                                                <%}%>
                                            </tbody>
                                        </table>
                                        <!-- fin costos -->
                                        <!-- inicio precio producto -->
                                        <%
                                            PrecioProductosVO pvVOpp;
                                            PrecioProductosDAO pvDAOpp = new PrecioProductosDAO();
                                            ArrayList<PrecioProductosVO> pvvvpp = new ArrayList();
                                            pvvvpp = pvDAOpp.todo(prv.getIdProducto());
                                            if (!pvvvpp.isEmpty()) {
                                        %>
                                        <br><h3>Precio Producto (<%=prv.getNombre()%>)</h3>
                                        <table class="table table-bordered table-hover">
                                            <tr>
                                                <th class="col-md-5">Precio</th>
                                                <th class="col-md-5">Año</th>

                                            </tr>
                                            <%
                                                for (int k = 0; k < pvvvpp.size(); k++) {
                                                    pvVOpp = pvvvpp.get(k);

                                            %>
                                            <tr id="tr<%=pvVOpp.getIdPrecioProductos()%>">
                                                <td>$ <%=formato.format(pvVOpp.getPrecio())%></td>
                                                <td><%=pvVOpp.getYear()%></td>

                                            </tr>
                                            <% }%>
                                        </table>   
                                        <%}%>

                                        <!-- fin precio producto -->
                                        <!-- actividades -->
                                        <%
                                            ActividadesVO actVO;
                                            ActividadesDAO actDAO = new ActividadesDAO();
                                            ArrayList<ActividadesVO> actAL = new ArrayList();

                                            actAL = actDAO.all_Actividades(prv.getIdProducto());
                                            if (!actAL.isEmpty()) {


                                        %>
                                        <br><h3>Actividades  (<%=prv.getNombre()%>)</h3><br>
                                        <table class="table table-bordered">
                                            <tr>
                                                <th>Actividad</th>
                                                <th>Tiempo</th>
                                                <th>Cargos</th>
                                                <th>Número de cargos</th>
                                                <th>Equipos</th>

                                            </tr>
                                            <%                                    for (int w = 0; w < actAL.size(); w++) {
                                                    actVO = actAL.get(w);


                                            %>
                                            <tr id="tr<%=actVO.getIdActividad()%>">
                                                <td><%=actVO.getActividad()%></td> 
                                                <td><%=actVO.getTiempo()%></td>
                                                <td><%=actVO.getCargos()%></td>
                                                <td><%=actVO.getN_cargos()%></td>
                                                <td><%=actVO.getEquipos()%></td>

                                            </tr>

                                            <%}%>
                                        </table>
                                        <%}%>

                                        <!-- fin actividades -->
                                        <!-- inicio Cliente Consumidor -->

                                        <%
                                            ArrayList<ClienteVO> acli = new ArrayList();
                                            ClienteVO cliVO;
                                            ClienteDAO cliDAO = new ClienteDAO();

                                            acli = cliDAO.consultar_All(prv.getIdProducto());
                                            if (!acli.isEmpty()) {
                                                for (int a = 0; a < acli.size(); a++) {
                                                    cliVO = acli.get(a);

                                        %>
                                        <br><br>

                                        <table class="table table-bordered table-hover">
                                            <tr>
                                                <td colspan="2"><center><h3>Cliente (<%=prv.getNombre()%>)</h3></center></td>
                                            </tr>
                                            <tr>
                                                <td>Perfil</td>
                                                <td><%=cliVO.getPerfil()%></td>
                                            </tr>
                                            <tr>
                                                <td>Localización</td>
                                                <td><%=cliVO.getLocalizacion()%></td>
                                            </tr>
                                            <tr>
                                                <td>Justificación</td>
                                                <td><%=cliVO.getJustificacion()%></td>
                                            </tr>
                                            <tr>
                                                <td>Satisfacción</td>
                                                <td><%=cliVO.getSatisfaccion()%></td>
                                            </tr>
                                            <tr>
                                                <td>Volumen Compra</td>
                                                <td><%=cliVO.getVolumen_compra()%></td>
                                            </tr>
                                            <tr>
                                                <td>Características</td>
                                                <td><%=cliVO.getCaracteristicas()%></td>
                                            </tr>
                                            <tr>
                                                <td>Sitio Compra</td>
                                                <td><%=cliVO.getSitio_compra()%></td>
                                            </tr>
                                            <tr>
                                                <td>Forma de pago</td>
                                                <td><%=cliVO.getForma_pago()%></td>
                                            </tr>
                                            <tr>
                                                <td>Precio</td>
                                                <td><%=cliVO.getPrecio()%></td>
                                            </tr>
                                            <tr>
                                                <td>Requisitos post-venta</td>
                                                <td><%=cliVO.getRequisitos_posventa()%></td>
                                            </tr>
                                            <tr>
                                                <td>Garantías</td>
                                                <td><%=cliVO.getGarantias()%></td>
                                            </tr>
                                            <tr>
                                                <td>Margen de comercialización</td>
                                                <td><%=cliVO.getMargen_comercial()%></td>
                                            </tr>

                                        </table>
                                        <%}
                                            }%>

                                        <%
                                            ArrayList<ConsumidorVO> aconsumi = new ArrayList();
                                            ConsumidorVO cVO;
                                            ConsumidorDAO consumiDAO = new ConsumidorDAO();
                                            aconsumi = consumiDAO.consultar_All(prv.getIdProducto());
                                            if (!aconsumi.isEmpty()) {

                                                for (int g = 0; g < aconsumi.size(); g++) {
                                                    cVO = aconsumi.get(g);


                                        %>
                                        <br>
                                        <table class="table table-bordered table-hover">
                                            <tr>
                                                <td colspan="2"><center><h3>Consumidor (<%=prv.getNombre()%>)</h3></center></td>
                                            </tr>
                                            <tr>
                                                <td>Perfil</td>
                                                <td><%=cVO.getPerfil()%></td>
                                            </tr>
                                            <tr>
                                                <td>Localización</td>
                                                <td><%=cVO.getLocalizacion()%></td>
                                            </tr>
                                            <tr>
                                                <td>Justificación</td>
                                                <td><%=cVO.getJustificacion()%></td>
                                            </tr>
                                            <tr>
                                                <td>Satisfacción</td>
                                                <td><%=cVO.getSatisfaccion()%></td>
                                            </tr>
                                            <tr>
                                                <td>Donde compra</td>
                                                <td><%=cVO.getDonde_compra()%></td>
                                            </tr>
                                            <tr>
                                                <td>Características</td>
                                                <td><%=cVO.getCaracteristicas()%></td>
                                            </tr>
                                            <tr>
                                                <td>Frecuencia</td>
                                                <td><%=cVO.getFrecuencia()%></td>
                                            </tr>
                                            <tr>
                                                <td>Precio</td>
                                                <td><%=cVO.getPrecio()%></td>
                                            </tr>

                                        </table>
                                        <%}
                                            }%>

                                        <!-- final cliente consumidor -->
                                        <!-- inicio competencia -->
                                        <%
                                            CompetenciaDAO compe = new CompetenciaDAO();
                                            ArrayList<CompetenciaVO> ca = new ArrayList();
                                            CompetenciaVO cv;
                                            ca = compe.Todo(prv.getIdProducto());
                                            if (!ca.isEmpty()) {


                                        %>
                                        <br>  <h3>Competencia (<%=prv.getNombre()%>)</h3><br>

                                        <table class="table table-bordered table-hover">
                                            <thead>
                                            <th>Nombre</th>
                                            <th>Análisis</th>
                                            <th>Imagen competencia</th>
                                            <th>Posición</th>

                                            </thead>
                                            <%                                                for (int t = 0; t < ca.size(); t++) {
                                                    cv = ca.get(t);
                                            %>
                                            <tr id="tr<%=cv.getIdCompetencia()%>">
                                                <td><%=cv.getNombre()%></td>
                                                <td><%=cv.getAnalisis()%></td>
                                                <td><%=cv.getImagenEmpresa()%></td>
                                                <td><%=cv.getFrenteCompetencia()%></td>

                                                <%}%>
                                        </table>
                                        <% }%>  

                                        <!-- fin competencia -->
                                        <!-- inicio estrategia precios -->

                                        <%
                                            EPreciosVO eEPs = null;
                                            EPreciosDAO edEPs = new EPreciosDAO();
                                            eEPs = edEPs.consulta(prv.getIdProducto());
                                            if (eEPs != null) {


                                        %>
                                        <br><h3>Estrategia de precios (<%=prv.getNombre()%>)</h3>
                                        <h4>Lanzamiento</h4>
                                        <textarea class="form-control" disabled><%=eEPs.getLanzamiento()%></textarea><br>

                                        <h4>Imprevistos</h4>
                                        <%=eEPs.getPuntoEquilibrio()%> %<br>

                                        <h4>Condición pago</h4>
                                        <textarea class="form-control" disabled><%=eEPs.getCondicionPago()%></textarea><br>

                                        <h4>Seguro Credito</h4>
                                        <textarea class="form-control" disabled><%=eEPs.getSeguroCredito()%></textarea><br>

                                        <h4>Impuestos</h4>
                                        <textarea class="form-control" disabled><%=eEPs.getImpuestos()%></textarea><br>

                                        <h4>Riesgo Cambiario</h4>
                                        <textarea class="form-control" disabled><%=eEPs.getRiesgoCambiario()%></textarea><br>

                                        <h4>Preferencia Arancelaria</h4>
                                        <textarea class="form-control" disabled><%=eEPs.getPreferenciaArancelaria()%></textarea><br>

                                        <h4>Tactica</h4>
                                        <textarea class="form-control" disabled><%=eEPs.getTactica()%></textarea><br>

                                        <h4>Guerra Variación</h4>
                                        <textarea class="form-control" disabled><%=eEPs.getGuerraVariacionP()%></textarea><br>

                                        <h4>Análisis de Precios</h4>
                                        <textarea class="form-control" disabled><%=eEPs.getAnaDefinicionP()%></textarea><br>

                                        <h4>Comportamiento Esperado</h4>
                                        <textarea class="form-control" disabled><%=eEPs.getComportamientoEsperado()%></textarea><br>

                                        <%}%>
                                        <!-- fin estrtegia precios -->

                                        <% }%>




                                        <!-- fin de productos -->

                                        <!-- inicio Inversion -->
                                        <br> <h3>Inversión</h3>
                                        <%
                                            InversionDAO ivd = new InversionDAO();
                                            ArrayList<InversionVO> ia = new ArrayList();
                                            InversionVO iv;
                                            ia = ivd.todo(1, idp);
                                            if (!ia.isEmpty()) {


                                        %>


                                        <br>
                                        <h4>Inversión Depreciables Producción</h4>
                                        <br>
                                        <table class="table table-bordered table-hover">
                                            <tr>
                                                <th>Detalle</th>
                                                <th>Cantidad</th>
                                                <th>Valor Unitario</th>
                                                <th>Años (Vida Util)</th>
                                                <th>Total</th>

                                            </tr>
                                            <%                                        String valors = "", totalsito;
                                                double totalInversion = 0, totaldepresiables = 0, totalcantidadD = 0, totaltodoD = 0;
                                                for (int i = 0; i < ia.size(); i++) {

                                                    iv = ia.get(i);
                                                    valors = formato.format(iv.getValorUnitario());
                                                    totalInversion = iv.getCantidad() * iv.getValorUnitario();
                                                    totalsito = formato.format(totalInversion);
                                                    totalcantidadD = totalcantidadD + iv.getCantidad();
                                                    totaldepresiables = totaldepresiables + iv.getValorUnitario();
                                                    totaltodoD = totaltodoD + totalInversion;
                                            %>
                                            <tr id="tr<%=iv.getIdInversion()%>">
                                                <td><%=iv.getDetalle()%></td>
                                                <td><%=iv.getCantidad()%></td>
                                                <td><div class="text-right">$ <%=valors%></div></td>
                                                <td><%=iv.getVidaUtil()%></td>
                                                <td><div class="text-right">$ <%=totalsito%></div></td>

                                            </tr>
                                            <%}%>
                                            <tr>
                                                <th>Total</th>
                                                <td><%=formato.format(totalcantidadD)%></td>
                                                <td><div class="text-right">$ <%=formato.format(totaldepresiables)%></div></td>
                                                <td></td>
                                                <td><div class="text-right">$ <%=formato.format(totaltodoD)%></div></td>

                                            </tr>
                                        </table>
                                        <%
                                            ArrayList<InversionVO> iasa = new ArrayList();
                                            InversionVO ivsa;
                                            iasa = ivd.todo(5, idp);
                                            if (!iasa.isEmpty()) {
                                        %>

                                        <br><h4>Inversión Depreciables Administración</h4><br>
                                        <table class="table table-bordered table-hover">
                                            <tr>
                                                <th>Detalle</th>
                                                <th>Cantidad</th>
                                                <th>Valor Unitario</th>
                                                <th>Años (Vida Util)</th>
                                                <th>Total</th>

                                            </tr>
                                            <%
                                                String valorssa = "", totalsitosa;
                                                double totalInversionsa = 0, totalcantidada = 0, totalinversiona = 0, totaltodoaa = 0;
                                                for (int i = 0; i < iasa.size(); i++) {

                                                    ivsa = iasa.get(i);
                                                    if (ivsa.getVidaUtil() != 20) {

                                                        valorssa = formato.format(ivsa.getValorUnitario());
                                                        totalInversionsa = ivsa.getCantidad() * ivsa.getValorUnitario();
                                                        totalsitosa = formato.format(totalInversionsa);
                                                        totalcantidada = totalcantidada + ivsa.getCantidad();
                                                        totalinversiona = totalinversiona + ivsa.getValorUnitario();
                                                        totaltodoaa = totaltodoaa + totalInversionsa;
                                            %>
                                            <tr id="tr<%=ivsa.getIdInversion()%>">
                                                <td><%=ivsa.getDetalle()%></td>
                                                <td><%=ivsa.getCantidad()%></td>
                                                <td><div class="text-right">$ <%=valorssa%></div></td>
                                                <td><%=ivsa.getVidaUtil()%></td>
                                                <td><div class="text-right">$ <%=totalsitosa%></div></td>

                                            </tr>
                                            <%}
                                                }%>
                                            <tfoot>
                                                <tr>
                                                    <th>Total</th>
                                                    <td><%=formato.format(totalcantidada)%></td>
                                                    <td><div class="text-right">$ <%=formato.format(totalinversiona)%></div></td>
                                                    <td></td>
                                                    <td><div class="text-right">$ <%=formato.format(totaltodoaa)%></div></td>

                                                </tr>
                                            </tfoot>
                                        </table>
                                        <%}%>      

                                        <% }%>
                                        <%
                                            ArrayList<InversionVO> ias = new ArrayList();
                                            InversionVO ivs;
                                            ias = ivd.todo(2, idp);
                                            if (!ias.isEmpty()) {


                                        %>
                                        <br><h4>Inversión No Depreciables</h4><br>
                                        <table class="table table-bordered table-hover">
                                            <tr>
                                                <th>Detalle</th>
                                                <th>Cantidad</th>
                                                <th>Valor Unitario</th>

                                                <th>Total</th>

                                            </tr>
                                            <%                                        ArrayList<InversionVO> iasInv = new ArrayList();
                                                InversionVO ivsInv;
                                                iasInv = ivd.todo(2, idp);
                                                String valorss = "", totalsitos;
                                                double totalInversions = 0, totalcantidad = 0, totalinversion = 0, totaltodo = 0;
                                                for (int i = 0; i < iasInv.size(); i++) {

                                                    ivsInv = iasInv.get(i);
                                                    if (ivsInv.getVidaUtil() == 20) {

                                                        valorss = formato.format(ivsInv.getValorUnitario());
                                                        totalInversions = ivsInv.getCantidad() * ivsInv.getValorUnitario();
                                                        totalsitos = formato.format(totalInversions);
                                                        totalcantidad = totalcantidad + ivsInv.getCantidad();
                                                        totalinversion = totalinversion + ivsInv.getValorUnitario();
                                                        totaltodo = totaltodo + totalInversions;
                                            %>
                                            <tr id="tr<%=ivsInv.getIdInversion()%>">
                                                <td><%=ivsInv.getDetalle()%></td>
                                                <td><%=ivsInv.getCantidad()%></td>
                                                <td><div class="text-right">$ <%=valorss%></div></td>

                                                <td><div class="text-right">$ <%=totalsitos%></div></td>

                                            </tr>
                                            <%}
                                                }%>
                                            <tfoot>
                                                <tr>
                                                    <th>Total</th>
                                                    <td><%=formato.format(totalcantidad)%></td>
                                                    <td><div class="text-right">$ <%=formato.format(totalinversion)%></div></td>

                                                    <td><div class="text-right">$ <%=formato.format(totaltodo)%></div></td>

                                                </tr>
                                            </tfoot>
                                        </table>
                                        <%}%>
                                        <%
                                            ArrayList<InversionVO> iaa = new ArrayList();
                                            InversionVO iva;
                                            iaa = ivd.todo(3, idp);
                                            if (!iaa.isEmpty()) {
                                        %>

                                        <br><h4>Inversión activos biológicos pecuarios</h4><br>
                                        <table class="table table-bordered table-hover">
                                            <tr>
                                                <th>Detalle</th>
                                                <th>Cantidad</th>
                                                <th>Valor Unitario</th>
                                                <th>Años (Vida Util)</th>
                                                <th>Total</th>

                                            </tr>
                                            <%
                                                String valorsa = "", totalsitoa;
                                                double totalInversiona = 0, cantidada = 0, totaltodoa = 0, otrototala = 0;
                                                for (int i = 0; i < iaa.size(); i++) {

                                                    iva = iaa.get(i);
                                                    valorsa = formato.format(iva.getValorUnitario());
                                                    totalInversiona = iva.getCantidad() * iva.getValorUnitario();
                                                    totalsitoa = formato.format(totalInversiona);
                                                    cantidada = cantidada + iva.getCantidad();
                                                    otrototala = otrototala + iva.getValorUnitario();
                                                    totaltodoa = totaltodoa + totalInversiona;
                                            %>
                                            <tr id="tr<%=iva.getIdInversion()%>">
                                                <td><%=iva.getDetalle()%></td>
                                                <td><%=iva.getCantidad()%></td>
                                                <td><div class="text-right">$ <%=valorsa%></div></td>
                                                <td><%=iva.getVidaUtil()%></td>
                                                <td><div class="text-right">$ <%=totalsitoa%></div></td>

                                            </tr>
                                            <%}%>
                                            <tr>
                                                <th>Total</th>
                                                <td><%=formato.format(cantidada)%></td>
                                                <td><div class="text-right">$ <%=formato.format(otrototala)%></div></td>
                                                <td></td>
                                                <td><div class="text-right">$ <%=formato.format(totaltodoa)%></div></td>

                                            </tr>
                                        </table>
                                        <%}
                                            ArrayList<InversionVO> iaz = new ArrayList();
                                            InversionVO ivz;
                                            iaz = ivd.todo(4, idp);
                                            if (!iaz.isEmpty()) {
                                        %>
                                        <br><h4>Inversión activos biológicos agricolas</h4><br>
                                        <table class="table table-bordered table-hover">
                                            <tr>
                                                <th>Detalle</th>
                                                <th>Cantidad</th>
                                                <th>Valor Unitario</th>
                                                <th>Años (Vida Util)</th>
                                                <th>Total</th>

                                            </tr>
                                            <%
                                                ArrayList<InversionVO> iazInv = new ArrayList();
                                                InversionVO ivzInv;
                                                iazInv = ivd.todo(4, idp);
                                                String valorsz = "", totalsitoz;
                                                double totalInversionz = 0, totaldecantidad = 0, totaldecosas = 0, totaldetodo = 0;
                                                for (int i = 0; i < iazInv.size(); i++) {

                                                    ivzInv = iazInv.get(i);
                                                    valorsz = formato.format(ivzInv.getValorUnitario());
                                                    totalInversionz = ivzInv.getCantidad() * ivzInv.getValorUnitario();
                                                    totalsitoz = formato.format(totalInversionz);
                                                    totaldecantidad = totaldecantidad + ivzInv.getCantidad();
                                                    totaldecosas = totaldecosas + ivzInv.getValorUnitario();
                                                    totaldetodo = totaldetodo + totalInversionz;
                                            %>
                                            <tr id="tr<%=ivzInv.getIdInversion()%>">
                                                <td><%=ivzInv.getDetalle()%></td>
                                                <td><%=ivzInv.getCantidad()%></td>
                                                <td><div class="text-right">$ <%=valorsz%></div></td>
                                                <td><%=ivzInv.getVidaUtil()%></td>
                                                <td><div class="text-right">$ <%=totalsitoz%></div></td>

                                            </tr>
                                            <%}%>
                                            <tr>
                                                <th>Total</th>
                                                <td><%=formato.format(totaldecantidad)%></td>
                                                <td><div class="text-right">$ <%=formato.format(totaldecosas)%></div></td>
                                                <td></td>
                                                <td><div class="text-right">$ <%=formato.format(totaldetodo)%></div></td>

                                            </tr>
                                        </table>
                                        <%}%>

                                        <!-- fin inversion -->

                                        <!-- inicio inversion intangible -->

                                        <%
                                            ArrayList<InversionDiferidaVO> indiferida = new ArrayList();
                                            InversionDiferidaDAO indao = new InversionDiferidaDAO();
                                            InversionDiferidaVO idvo;
                                            indiferida = indao.todo(idp);
                                            double totals = 0;
                                            if (!indiferida.isEmpty()) {

                                        %>

                                        <br><h3>Inversión Intangible</h3><br>

                                        <table class="table table-bordered table-hover" >
                                            <% for (int j = 0; j < indiferida.size(); j++) {
                                                    idvo = indiferida.get(j);
                                                    String total = formato.format(idvo.getTotal());
                                                    totals = idvo.getTotal() + totals;
                                            %>
                                            <tr id="tr<%=idvo.getIdInversionDiferida()%>">
                                                <td class="col-md-5"><%=idvo.getTipoInversionDiferida()%></td>
                                                <td class="col-md-5">$ <%=total%></td>

                                            </tr>
                                            <%}%>
                                            <tr>
                                                <th>Total</th>
                                                <th>$ <%=formato.format(totals)%></th>

                                            </tr>
                                        </table>
                                        <%}%>
                                        <!-- fin inversion intangible -->

                                        <!-- inicio nomina -->
                                        <br><h3>Nómina</h3><br>
                                        <%

                                            GeneralVO gv;

                                            GeneralDAO gd = new GeneralDAO();
                                            gv = gd.read(1);
                                            NominaDAO nd = new NominaDAO();
                                            NominaVO nv;
                                            ArrayList<NominaVO> n = new ArrayList();
                                            n = nd.consulta(idp, 1);

                                            double salarioM = gv.getSalarioM();
                                            if (!n.isEmpty()) {
                                        %>
                                        <h4>Nómina administrativa</h4><br>
                                        <table class="table table-bordered table-hover" >
                                            <tr>
                                                <th class="col-md-2">Cargo</th>
                                                <th class="col-md-1">Meses</th>
                                                <th class="col-md-2">Cantidad</th>
                                                <th class="col-md-2">Salario</th>
                                                <th class="col-md-2">Valor a pagar</th>
                                                <th class="col-md-2">Subsidio transporte a pagar</th>

                                            </tr>
                                            <%
                                                double total = 0;
                                                double total2 = 0;
                                                for (int j = 0; j < n.size(); j++) {
                                                    nv = n.get(j);
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


                                            </tr>    
                                            <%}%>

                                        </table>


                                        <%}%>

                                        <%

                                            NominaVO nvs;
                                            ArrayList<NominaVO> ns = new ArrayList();
                                            ns = nd.consulta(idp, 2);
                                            if (!ns.isEmpty()) {
                                        %>
                                        <br><h4>Nómina producción</h4><br>
                                        <table class="table table-bordered table-hover" >
                                            <tr>
                                                <th class="col-md-2">Cargo</th>
                                                <th class="col-md-1">Meses</th>
                                                <th class="col-md-2">Cantidad</th>
                                                <th class="col-md-2">Salario</th>
                                                <th class="col-md-2">Valor a pagar</th>
                                                <th class="col-md-2">Subsidio transporte a pagar</th>

                                            </tr>
                                            <%
                                                GeneralVO gvs;
                                                GeneralDAO gds = new GeneralDAO();
                                                gvs = gds.read(1);

                                                double totalsnm = 0;
                                                double total2s = 0;
                                                for (int j = 0; j < ns.size(); j++) {
                                                    nvs = ns.get(j);
                                                    if ((salarioM * 2) >= nvs.getSalario() && (salarioM / 2) <= nvs.getSalario()) {
                                                        totalsnm = nvs.getMeses() * gvs.getSubsidioT() * nvs.getCantidad();
                                                    } else {
                                                        totalsnm = 0;
                                                    }
                                                    String Totals = formato.format(totalsnm);
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


                                            </tr>    
                                            <%}%>

                                        </table>


                                        <%}%>
                                        <!-- fin nomina -->

                                        <!-- inicio gastos y costos -->

                                        <%
                                            GastoCostoDAO gcDAO = new GastoCostoDAO();
                                            ArrayList<GastoCostoVO> agc = new ArrayList();
                                            GastoCostoVO gcVO;
                                            agc = gcDAO.todo(idp, 1);
                                            if (!agc.isEmpty()) {
                                        %>
                                        <br>    <h4>Mano de obra no permanente</h4><br>
                                        
                                        <table class="table table-bordered table-hover">
                                            <thead>
                                            <th>Cargo o servicio</th>
                                            <th >Meses</th>
                                            <th >Cantidad Mensual</th>
                                            <th>Costo Mensual</th>
                                            <th>Costo Anual</th>

                                            </thead>
                                            <tbody>
                                                <%
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
                                        <%}

                                            ArrayList<GastoCostoVO> agcs = new ArrayList();
                                            GastoCostoVO g2;
                                            agcs = gcDAO.todo(idp, 2);
                                            if (!agcs.isEmpty()) {
                                        %>
                                        <br> <h4>Servicios públicos</h4><br>
                                        <table class="table table-bordered table-hover">
                                            <thead>
                                            <th>Detalle</th>
                                            <th>Valor Mensual</th>
                                            <th>Valor Anual</th>

                                            </thead>
                                            <tbody>
                                                <%
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
                                        </table><br>

                                        <%
                                            TemporalDAO td = new TemporalDAO();
                                            TemporalVO tv = td.read(idp);

                                            if (tv != null) {
                                        %>
                                        <table class="table table-bordered table-hover" id="kit">
                                            <thead>
                                            <th class="col-md-4 col-xs-4">Detalle</th>
                                            <th>%</th>
                                            <th class="col-md-4 col-xs-4">Total</th>
                                            </thead>
                                            <tbody>

                                                <% double Tporcentaje = 100 - tv.getKit();%>
                                                <tr>
                                                    <td>Kit Servicios Producción</td>
                                                    <td><%=tv.getKit()%> % </td>
                                                    <td id="valor1"><div class="text-right">$ <%=formato.format((totala * tv.getKit()) / 100)%></div></td>
                                                </tr>
                                                <tr>
                                                    <td>Kit Administración Ventas</td>
                                                    <td id="porcentaje1"><%=Tporcentaje%> %</td>
                                                    <td id="valor2"><div class="text-right">$ <%=formato.format((totala * Tporcentaje) / 100)%></div></td>
                                                </tr>

                                                <% } %>



                                            </tbody>
                                        </table>

                                        <%}
                                            ArrayList<GastoCostoVO> g = new ArrayList();
                                            GastoCostoVO g3;
                                            g = gcDAO.todo(idp, 3);
                                            if (!g.isEmpty()) {
                                        %>
                                        <br><h4>Otros Costos</h4><br>
                                        <table class="table table-bordered table-hover">
                                            <thead>
                                            <th>Detalle</th>
                                            <th>Cantidad mensual</th>
                                            <th>Valor unitario mensual</th>
                                            <th>Valor Anual</th>

                                            </thead>
                                            <tbody>
                                                <%
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
                                        <%}
                                            ArrayList<GastoCostoVO> gg = new ArrayList();
                                            GastoCostoVO g4;
                                            gg = gcDAO.todo(idp, 4);
                                            if (!gg.isEmpty()) {
                                        %>
                                        <br><h4>Ventas</h4><br>
                                        <table class="table table-bordered table-hover">
                                            <tr>
                                                <th>Detalle</th>
                                                <th>Gasto Anual</th>

                                            </tr>
                                            <%
                                                double totalanual = 0;
                                                for (int p = 0; p < gg.size(); p++) {
                                                    g4 = gg.get(p);
                                                    String valorM = formato.format(g4.getValorMoA());
                                                    totalanual = totalanual + g4.getValorMoA();

                                            %>
                                            <tr id="tr<%=g4.getIdGastoCosto()%>">
                                                <td><%=g4.getDetalle()%></td>
                                                <td><div class="text-right">$ <%=valorM%></div></td>

                                            </tr>
                                            <%}%>
                                            <tr>
                                                <th>total</th>
                                                <td><div class="text-right">$ <%=formato.format(totalanual)%></div></td>
                                            </tr>
                                        </table>
                                        <%}
                                            ArrayList<GastoCostoVO> ggg = new ArrayList();
                                            GastoCostoVO g5;
                                            ggg = gcDAO.todo(idp, 5);
                                            if (!ggg.isEmpty()) {
                                        %>
                                        <br><h4>Otros Gastos</h4><br>
                                        <table class="table table-bordered table-hover">
                                            <tr>
                                                <th>Detalle</th>
                                                <th>meses</th>
                                                <th>Gasto Anual</th>

                                            </tr>
                                            <%
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

                                            </tr>
                                            <%}%>
                                            <tr>
                                                <th>Total</th>
                                                <td></td>
                                                <td><div class="text-right">$ <%=formato.format(totalGastos)%></div></td>
                                            </tr>
                                        </table>
                                        <%}%>


                                        <!-- fin gastos  y costos -->

                                        <!-- inicio financiación -->
                                        
                                        <%
                                         FinanciacionDAO f = new FinanciacionDAO();
                                    FinanciacionVO fv = null;
                                    ArrayList<FinanciacionVO> af = new ArrayList();
                                    af = f.todo(idp);
                                        if(!af.isEmpty()){
                                        %>
                                        <br><h4>Financiación</h4><br>
                                         <table class="table table-bordered table-hover">
                                <tr>
                                    <th>Concepto</th>
                                    <th>Monto</th>
                                    
                                </tr>
                                <%
                                   
                                    double totalsf = 0;

                                  

                                    for (int i = 0; i < af.size(); i++) {
                                        fv = af.get(i);
                                        totalsf = fv.getMonto() + totalsf;
                                %>
                                <tr id="tr<%=fv.getIdFinanciacion()%>">
                                    <td><%=fv.getConcepto()%></td>
                                    <td>$ <%=formato.format(fv.getMonto())%></td>
                                
                                </tr>
                                <% }%>
                                <tr>
                                    <th>Total</th>
                                    <th>$ <%=formato.format(totalsf)%></th>
                                    
                                </tr>
                            </table>
                                        <%}%> 
                                        
                                        <!-- fin financiacion -->
                                        
                                        <!-- inicio insumos -->

                                        </div>
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
                                        <script src="../js/jquery.PrintArea.js" type="text/javascript"></script>
                                        <script src="../js/expanding.jquery.js" type="text/javascript"></script>
                                        <script src="../js/expanding.js" type="text/javascript"></script>
                                        <script type="text/javascript">
                                            $("#btnImp").click(function () {
                                                $("div#areaImp").printArea();
                                            });
                                        </script>
                                        <script>
                                            $('textarea').expanding();
                                            $('textarea').tooltip({
                                                hide: {
                                                    effect: 'explode'
                                                }
                                            });
                                            $('a').tooltip();
                                        </script>

                                        </body>
                                        </html>
