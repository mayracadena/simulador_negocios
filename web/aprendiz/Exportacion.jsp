<%-- 
    Document   : Exportacion
    Created on : 16/08/2016, 10:34:18 AM
    Author     : mayracadena
--%>

<%@page import="DAO.ProyeccionVentasDAO"%>
<%@page import="DAO.ProductoDAO"%>
<%@page import="VO.NominaVO"%>
<%@page import="DAO.NominaDAO"%>
<%@page import="DAO.EmbarqueDAO"%>
<%@page import="VO.EmbarqueVO"%>
<%@page import="DAO.ExportacionDAO"%>
<%@page import="VO.ExportacionVO"%>
<%@page import="VO.UsuarioVO"%>
<%@page import="VO.ItemExportacionVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.ItemExportacionDAO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="VO.ProductoVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Exportación</title>
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
            ProductoVO pv = (ProductoVO) hs.getAttribute("Productito");
            DecimalFormat formato = new DecimalFormat("###,###,###");

            if (idu == null && idp == null) {
                response.sendRedirect("../index.jsp");
                return;
            }
            if (idu != null && idp == null) {
                response.sendRedirect("../principal.jsp");
                return;
            }
            if (pv == null) {
                response.sendRedirect("Producto.jsp");
                return;
            }
            if (idu == null) {
                response.sendRedirect("../index.jsp");
                return;
            }
            EmbarqueDAO eDAO = new EmbarqueDAO();

            EmbarqueVO emba = eDAO.read(pv.getIdProducto());
            double sip = Double.parseDouble(emba.getTiempo()) * Double.parseDouble(emba.getUnidadComercial());

            NominaDAO nomiDAO = new NominaDAO();

            ArrayList<NominaVO> anomina2 = new ArrayList();

            anomina2 = nomiDAO.consulta(idp, 1);
            NominaVO nomi2;

            ProductoDAO prd = new ProductoDAO();
            ProductoVO prv;
            ArrayList<ProductoVO> prA = new ArrayList();
            prA = prd.todos(idp);

            ProyeccionVentasDAO proyDAO = new ProyeccionVentasDAO();

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
                    <li>
                        <a href="../principal.jsp">Inicio</a>
                    </li>
                    <li>
                        <a href="../inicio.jsp">Menú Proyecto</a>
                    </li>
                    <li>
                        <a href="Proyecto.jsp">Proyecto</a>
                    </li>
                    <li>
                        <a href="Mercado.jsp">Mercado</a>
                    </li>
                    <li>
                        <a href="eOrganizacional.jsp">Estrategia Organizacional</a>
                    </li>
                    <li>
                        <a href="ePromocion.jsp">Estrategia Promoción</a>
                    </li>
                    <li>
                        <a href="eDistribucion.jsp">Estrategia Distribución</a>
                    </li>
                    <li>
                        <a href="Producto.jsp">Productos</a>
                    </li>
                    <li>
                        <a href="Detalle.jsp">Menú Productos</a>
                    </li>
                    <li>
                        <a href="Inversion.jsp">Inversión</a>
                    </li>
                    <li>
                        <a href="InversionDiferida.jsp">Inversión Diferida</a>
                    </li>
                    <li>
                        <a href="Nomina.jsp">Nomina</a>
                    </li>
                    <li>
                        <a href="GastosCostos.jsp">Gastos y Costos</a>
                    </li>
                    <li>
                        <a href="KC.jsp">Capitál Credito</a>
                    </li>
                    <li>
                        <a href="Financiacion.jsp">Financiación</a>
                    </li>
                    <li>
                        <a href="Insumo.jsp">Insumos</a>
                    </li>
                    <li>
                        <a href="Resultados.jsp">Resultados</a>
                    </li>
                    <li>
                        <a href="InfInsumo.jsp">Inf. Insumo</a>
                    </li>
                    <li>
                        <a href="PyG.jsp">P&G</a>
                    </li>
                    <li>
                        <a href="Balance.jsp">Balance</a>
                    </li>
                    <li>
                        <a href="FlujoCaja.jsp">Flujo de Caja</a>
                    </li>
                    <li>
                        <a href="ResultadosFinales.jsp">Resultados Finales</a>
                    </li>
                    <li>
                        <a href="Admin.jsp">Administrar Proyecto</a>
                    </li>
                    <li>
                        <a href="../index.jsp">Salir</a>
                    </li>
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

                            <h1 >Exportación</h1>
                            <h3 >(<%=pv.getNombre()%>)</h3><br>


                            <div class="row">
                                <div class="col-md-2"></div>
                                <div class="col-md-4">
                                    <a href="SIMULADOR_DE_COSTOS_2012.xls">Formato de exportación</a><br>
                                    <label class="label label-info">Tipo Envio</label>
                                    <select id="tipoEnvio" class="form-control">

                                        <option value="1">Marítimo</option>
                                        <option value="2">Aéreo</option>
                                        <option value="3">Terrestre</option>
                                    </select>
                                </div>

                            </div>
                            <br><br>

                            <div class="row">
                                <div class="col-md-2"></div>

                                <div id="mar" >

                                    <div class="col-md-8">
                                        <%
                                            ItemExportacionDAO ied = new ItemExportacionDAO();
                                            ItemExportacionVO iv, iv2;
                                            ArrayList<ItemExportacionVO> aie = new ArrayList();
                                            aie = ied.buscar();

                                            ExportacionVO e = null;
                                            ExportacionDAO exportaDAO = new ExportacionDAO();
                                            e = exportaDAO.todo(1, pv.getIdProducto(), 1);

                                            if (e == null) {
                                        %>   


                                        <form id="FormExportar" method="post" action="javascript:insertar()">
                                            <table class="table table-bordered table-hover">
                                                <thead>
                                                <th>Concepto Costos Exportación</th>
                                                <th>Costo total</th>
                                                <th>Dias</th>
                                                </thead>
                                                <tbody>
                                                    <%
                                                        for (int i = 0; i < aie.size(); i++) {
                                                            iv = aie.get(i);
                                                            if (iv.getIdItemExportacion() >= 1 && iv.getIdItemExportacion() <= 2) {
                                                    %>
                                                    <tr id="tr<%=iv.getIdItemExportacion()%>" class="danger">
                                                        <td><%=iv.getItem()%></td>
                                                        <td><input id="costo<%=iv.getIdItemExportacion()%>" type="number" step="any" class="form-control" required=""></td>
                                                        <td><input id="dias<%=iv.getIdItemExportacion()%>" type="number" step="any" class="form-control" required=""></td>
                                                    </tr>
                                                    <%} else if (iv.getIdItemExportacion() >= 3 && iv.getIdItemExportacion() <= 11) {%>
                                                    <tr id="tr<%=iv.getIdItemExportacion()%>" class="success">
                                                        <td><%=iv.getItem()%></td>
                                                        <td><input id="costo<%=iv.getIdItemExportacion()%>" type="number" step="any" class="form-control" required=""></td>
                                                        <td><input id="dias<%=iv.getIdItemExportacion()%>" type="number" step="any" class="form-control" required=""></td>
                                                    </tr>
                                                    <% } else if (iv.getIdItemExportacion() >= 12 && iv.getIdItemExportacion() <= 13) {%>
                                                    <tr id="tr<%=iv.getIdItemExportacion()%>" class="warning">
                                                        <td><%=iv.getItem()%></td>
                                                        <td><input id="costo<%=iv.getIdItemExportacion()%>" type="number" step="any" class="form-control" required=""></td>
                                                        <td><input id="dias<%=iv.getIdItemExportacion()%>" type="number" step="any" class="form-control" required=""></td>
                                                    </tr>
                                                    <%} else if (iv.getIdItemExportacion() >= 14 && iv.getIdItemExportacion() <= 18) {%>
                                                    <tr id="tr<%=iv.getIdItemExportacion()%>" class="info">
                                                        <td><%=iv.getItem()%></td>
                                                        <td><input id="costo<%=iv.getIdItemExportacion()%>" type="number" step="any" class="form-control" required=""></td>
                                                        <td><input id="dias<%=iv.getIdItemExportacion()%>" type="number" step="any" class="form-control" required=""></td>
                                                    </tr>
                                                    <%}
                                                        }%>
                                                </tbody>
                                            </table>
                                            <input type="submit" class="btn btn-success" id="guardar" value="Guardar" onclick="insertarExportarcion()">
                                        </form>
                                        <%} else {%>
                                        <table class="table table-bordered table-hover">
                                            <thead>
                                            <th>Concepto Costos Exportación</th>
                                            <th>Costo total</th>
                                            <th>Dias</th>

                                            </thead>
                                            <tbody>
                                                <%
                                                    double suma1 = 0, capitali = 0;
                                                    for (int t = 0; t < aie.size(); t++) {
                                                        iv2 = aie.get(t);

                                                        e = exportaDAO.todo(t + 1, pv.getIdProducto(), 1);

                                                        if (iv2.getIdItemExportacion() >= 1 && iv2.getIdItemExportacion() <= 2) {
                                                            suma1 = suma1 + e.getCostoTotal();
                                                %>
                                                <tr id="tr<%=e.getIdExportacion()%>" class="danger">
                                                    <td id="td<%=e.getIdExportacion()%>"><%=iv2.getItem()%></td>
                                                    <td>$ <%=formato.format(e.getCostoTotal())%></td>
                                                    <td><%=e.getDias()%></td>
                                                    <td><button class="btn btn-default" onclick="actualizar(<%=e.getIdExportacion()%>)"><img src="../img/iconos/edit.png" alt="" class="icono"/></button></td>


                                                    <%      } else if (iv2.getIdItemExportacion() >= 3 && iv2.getIdItemExportacion() <= 11) {
                                                        capitali = e.getCostoTotal() + capitali;
                                                    %>
                                                <tr id="tr<%=e.getIdExportacion()%>" class="success">

                                                    <td id="td<%=e.getIdExportacion()%>"><%=iv2.getItem()%></td>
                                                    <td>$ <%=formato.format(e.getCostoTotal())%></td>
                                                    <td><%=e.getDias()%></td>
                                                    <td><button class="btn btn-default" onclick="actualizar(<%=e.getIdExportacion()%>)"><img src="../img/iconos/edit.png" alt="" class="icono"/></button></td>


                                                    <%} else if (iv2.getIdItemExportacion() >= 12 && iv2.getIdItemExportacion() <= 13) {%>
                                                <tr id="tr<%=e.getIdExportacion()%>" class="warning">

                                                    <td id="td<%=e.getIdExportacion()%>"><%=iv2.getItem()%></td>
                                                    <td>$ <%=formato.format(e.getCostoTotal())%></td>
                                                    <td><%=e.getDias()%></td>
                                                    <td><button class="btn btn-default" onclick="actualizar(<%=e.getIdExportacion()%>)"><img src="../img/iconos/edit.png" alt="" class="icono"/></button></td>

                                                    <%} else if (iv2.getIdItemExportacion() >= 14 && iv2.getIdItemExportacion() <= 18) {%>
                                                <tr id="tr<%=e.getIdExportacion()%>" class="info">

                                                    <td id="td<%=e.getIdExportacion()%>"><%=iv2.getItem()%></td>
                                                    <td>$ <%=formato.format(e.getCostoTotal())%></td>
                                                    <td><%=e.getDias()%></td>
                                                    <td><button class="btn btn-default" onclick="actualizar(<%=e.getIdExportacion()%>)"><img src="../img/iconos/edit.png" alt="" class="icono"/></button></td>

                                                    <%}%>
                                                    <%}%>
                                                </tr>
                                            </tbody>
                                            <tr class="danger">

                                                <td>Valor EXW</td>
                                                <td>$ <%=formato.format(sip + suma1)%></td>
                                                <td>---</td>
                                                <td></td>
                                            </tr>

                                            <%

                                                double totalctas1 = 0;
                                                for (int z = 0; z < anomina2.size(); z++) {
                                                    nomi2 = anomina2.get(z);
                                                    double totalremensuals = 0;
                                                    double totalreanuals = 0;
                                                    double totalaportes = 0;

                                                    double rmensuals = (nomi2.getCantidad() * nomi2.getMeses() * nomi2.getSalario()) / 12;
                                                    double ranuals = rmensuals * 12;
                                                    double aportes = (ranuals * 46.85) / 100;

                                                    totalremensuals = rmensuals + totalremensuals;
                                                    totalreanuals = ranuals + totalreanuals;
                                                    totalaportes = aportes + totalaportes;
                                                    totalctas1 = (ranuals + aportes) + totalctas1;

                                                }

                                                double manoU = 0, totalproductos = 0, proyeccion = 0;

                                                for (int i = 0; i < prA.size(); i++) {
                                                    prv = prA.get(i);
                                                    proyeccion = (proyDAO.reporte(prv.getIdProducto())) + proyeccion;

                                                }
                                                double Tproy = proyDAO.Porcentaje(pv.getIdProducto());
                                                if (proyeccion != 0) {
                                                    manoU = (Tproy * 100) / proyeccion;
                                                }
                                                totalproductos = ((totalctas1 * manoU) / 100) / emba.getTipoCambio();
                                                //capitali
%>

                                            <tr class="success">
                                                <td>Administrativos - Costo Indirecto - (Nómina ADMINISTRACIÓN)</td>
                                                <td>$ <%=formato.format(totalproductos)%></td>
                                                <td></td>
                                                <td></td>
                                            </tr>

                                            <tr class="success">
                                                <td>Capital inventario</td>
                                                <td><%=formato.format((sip + suma1 + totalproductos) * 0.0394)%></td>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                            <tr class="success">
                                                <td>Seguro</td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                            <tr class="success">
                                                <td>COSTO DE LA DFI PAÍS EXPORTADOR</td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                            <tr class="success">
                                                <td>VALOR : FCA.No Incluye Embarque </td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                            <tr class="success">
                                                <td>VALOR : FAS  No Incluye Embarque</td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                            <tr class="success">
                                                <td>VALOR : FOB </td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                            <tr class="warning">
                                                <td>VALOR CFR</td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                            <tr class="warning">
                                                <td>VALOR CPT</td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                            <tr class="warning">
                                                <td>SEGURO INTERNACIONAL</td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                            <tr class="warning">
                                                <td>VALOR CIF</td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                            <tr class="warning">
                                                <td>VALOR CIP</td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                            <tr class="warning">
                                                <td>CAPITAL-INVENTARIO</td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                            <tr class="warning">
                                                <td>COSTO DE LA DFI EN TRANSITO INTERNACIONAL</td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                            <tr class="warning">
                                                <td>VALOR  DAP** No Incluye Desembarque</td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                            <tr class="warning">
                                                <td>VALOR DAT</td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                            <tr class="info">
                                                <td>VALOR  DAP</td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                            <tr class="info">
                                                <td>ADUANEROS (IMPUESTOS)</td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                            <tr class="info">
                                                <td>AGENTES</td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                            <tr class="info">
                                                <td>CAPITAL-INVENTARIO</td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                            <tr class="info">
                                                <td>SEGURO</td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                            <tr class="info">
                                                <td>COSTO DE LA DFI PAÍS IMPORTADOR</td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                            <tr class="info">
                                                <td>VALOR DDP TOTAL</td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                        </table>
                                        <% }%>
                                    </div>
                                </div>

                                <div id="aire" >

                                    <div class="col-md-8">
                                        <%

                                            e = exportaDAO.todo(1, pv.getIdProducto(), 2);

                                            if (e == null) {
                                        %>   


                                        <form id="FormExportar" method="post" action="javascript:insertar()">
                                            <table class="table table-bordered table-hover">
                                                <thead>
                                                <th>Concepto Costos Exportación</th>
                                                <th>Costo total</th>
                                                <th>Dias</th>
                                                </thead>
                                                <tbody>
                                                    <%
                                                        for (int i = 0; i < aie.size(); i++) {
                                                            iv = aie.get(i);
                                                            if (iv.getIdItemExportacion() >= 1 && iv.getIdItemExportacion() <= 2) {
                                                    %>
                                                    <tr id="tr<%=iv.getIdItemExportacion()%>" class="danger">
                                                        <td><%=iv.getItem()%></td>
                                                        <td><input id="costo<%=iv.getIdItemExportacion()%>" type="number" step="any" class="form-control" required=""></td>
                                                        <td><input id="dias<%=iv.getIdItemExportacion()%>" type="number" step="any" class="form-control" required=""></td>
                                                    </tr>
                                                    <%} else if (iv.getIdItemExportacion() >= 3 && iv.getIdItemExportacion() <= 11) {%>
                                                    <tr id="tr<%=iv.getIdItemExportacion()%>" class="success">
                                                        <td><%=iv.getItem()%></td>
                                                        <td><input id="costo<%=iv.getIdItemExportacion()%>" type="number" step="any" class="form-control" required=""></td>
                                                        <td><input id="dias<%=iv.getIdItemExportacion()%>" type="number" step="any" class="form-control" required=""></td>
                                                    </tr>
                                                    <% } else if (iv.getIdItemExportacion() >= 12 && iv.getIdItemExportacion() <= 13) {%>
                                                    <tr id="tr<%=iv.getIdItemExportacion()%>" class="warning">
                                                        <td><%=iv.getItem()%></td>
                                                        <td><input id="costo<%=iv.getIdItemExportacion()%>" type="number" step="any" class="form-control" required=""></td>
                                                        <td><input id="dias<%=iv.getIdItemExportacion()%>" type="number" step="any" class="form-control" required=""></td>
                                                    </tr>
                                                    <%} else if (iv.getIdItemExportacion() >= 14 && iv.getIdItemExportacion() <= 18) {%>
                                                    <tr id="tr<%=iv.getIdItemExportacion()%>" class="info">
                                                        <td><%=iv.getItem()%></td>
                                                        <td><input id="costo<%=iv.getIdItemExportacion()%>" type="number" step="any" class="form-control" required=""></td>
                                                        <td><input id="dias<%=iv.getIdItemExportacion()%>" type="number" step="any" class="form-control" required=""></td>
                                                    </tr>
                                                    <%}
                                                        }%>
                                                </tbody>
                                            </table>
                                            <input type="submit" class="btn btn-success" id="guardar" value="Guardar">
                                        </form>
                                        <%} else {%>
                                        <table class="table table-bordered table-hover">
                                            <thead>
                                            <th>Concepto Costos Exportación</th>
                                            <th>Costo total</th>
                                            <th>Dias</th>
                                            </thead>
                                            <tbody>
                                                <%
                                                    double suma11 = 0;

                                                    for (int t = 0; t < aie.size(); t++) {
                                                        iv2 = aie.get(t);
                                                        e = exportaDAO.todo(t + 1, pv.getIdProducto(), 2);

                                                        if (iv2.getIdItemExportacion() >= 1 && iv2.getIdItemExportacion() <= 2) {
                                                            suma11 = suma11 + e.getCostoTotal();
                                                %>
                                                <tr id="tr<%=e.getIdExportacion()%>" class="danger">
                                                    <td id="td<%=e.getIdExportacion()%>"><%=iv2.getItem()%></td>
                                                    <td>$ <%=formato.format(e.getCostoTotal())%></td>
                                                    <td><%=e.getDias()%></td>
                                                    <td><button class="btn btn-default" onclick="actualizar(<%=e.getIdExportacion()%>)"><img src="../img/iconos/edit.png" alt="" class="icono"/></button></td>


                                                    <%      } else if (iv2.getIdItemExportacion() >= 3 && iv2.getIdItemExportacion() <= 11) {
                                                    %>
                                                <tr id="tr<%=e.getIdExportacion()%>" class="success">

                                                    <td id="td<%=e.getIdExportacion()%>"><%=iv2.getItem()%></td>
                                                    <td>$ <%=formato.format(e.getCostoTotal())%></td>
                                                    <td><%=e.getDias()%></td>
                                                    <td><button class="btn btn-default" onclick="actualizar(<%=e.getIdExportacion()%>)"><img src="../img/iconos/edit.png" alt="" class="icono"/></button></td>

                                                    <%} else if (iv2.getIdItemExportacion() >= 12 && iv2.getIdItemExportacion() <= 13) {%>
                                                <tr id="tr<%=e.getIdExportacion()%>" class="warning">

                                                    <td id="td<%=e.getIdExportacion()%>"><%=iv2.getItem()%></td>
                                                    <td>$ <%=formato.format(e.getCostoTotal())%></td>
                                                    <td><%=e.getDias()%></td>
                                                    <td><button class="btn btn-default" onclick="actualizar(<%=e.getIdExportacion()%>)"><img src="../img/iconos/edit.png" alt="" class="icono"/></button></td>

                                                    <%} else if (iv2.getIdItemExportacion() >= 14 && iv2.getIdItemExportacion() <= 18) {%>
                                                <tr id="tr<%=e.getIdExportacion()%>" class="info">

                                                    <td id="td<%=e.getIdExportacion()%>"><%=iv2.getItem()%></td>
                                                    <td>$ <%=formato.format(e.getCostoTotal())%></td>
                                                    <td><%=e.getDias()%></td>
                                                    <td><button class="btn btn-default" onclick="actualizar(<%=e.getIdExportacion()%>)"><img src="../img/iconos/edit.png" alt="" class="icono"/></button></td>

                                                    <%}%>
                                                </tr>
                                                <%}%>
                                                <tr class="danger">
                                                    <td>Valor EXW</td>
                                                    <td>$ <%=formato.format(sip + suma11)%></td>
                                                    <td>---</td>
                                                    <td></td>
                                                </tr>    



                                                <%

                                                    String Totalctas = "";
                                                    double totalremensuals = 0;
                                                    double totalreanuals = 0;
                                                    double totalaportes = 0;
                                                    double totalctas = 0;
                                                    for (int z = 0; z < anomina2.size(); z++) {
                                                        nomi2 = anomina2.get(z);

                                                        double rmensuals = (nomi2.getCantidad() * nomi2.getMeses() * nomi2.getSalario()) / 12;
                                                        double ranuals = rmensuals * 12;
                                                        double aportes = (ranuals * 46.85) / 100;

                                                        totalremensuals = rmensuals + totalremensuals;
                                                        totalreanuals = ranuals + totalreanuals;
                                                        totalaportes = aportes + totalaportes;
                                                        totalctas = (ranuals + aportes) + totalctas;

                                                        Totalctas = formato.format(totalctas);
                                                    }
                                                %>






                                                <tr class="success">
                                                    <td>Administrativos - Costo Indirecto - (Nómina ADMINISTRACIÓN)</td>
                                                    <td><%=Totalctas%></td>
                                                    <td></td>
                                                    <td></td>
                                                </tr>
                                                <tr class="success">
                                                    <td>Capital inventario</td>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                </tr>
                                                <tr class="success">
                                                    <td>Seguro</td>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                </tr>
                                                <tr class="success">
                                                    <td>COSTO DE LA DFI PAÍS EXPORTADOR</td>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                </tr>
                                                <tr class="success">
                                                    <td>VALOR : FCA.No Incluye Embarque </td>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                </tr>
                                                <tr class="success">
                                                    <td>VALOR : FAS  No Incluye Embarque</td>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                </tr>
                                                <tr class="success">
                                                    <td>VALOR : FOB </td>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                </tr>
                                                <tr class="warning">
                                                    <td>VALOR CFR</td>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                </tr>
                                                <tr class="warning">
                                                    <td>VALOR CPT</td>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                </tr>
                                                <tr class="warning">
                                                    <td>SEGURO INTERNACIONAL</td>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                </tr>
                                                <tr class="warning">
                                                    <td>VALOR CIF</td>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                </tr>
                                                <tr class="warning">
                                                    <td>VALOR CIP</td>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                </tr>
                                                <tr class="warning">
                                                    <td>CAPITAL-INVENTARIO</td>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                </tr>
                                                <tr class="warning">
                                                    <td>COSTO DE LA DFI EN TRANSITO INTERNACIONAL</td>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                </tr>
                                                <tr class="warning">
                                                    <td>VALOR  DAP** No Incluye Desembarque</td>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                </tr>
                                                <tr class="warning">
                                                    <td>VALOR DAT</td>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                </tr>
                                                <tr class="info">
                                                    <td>VALOR  DAP</td>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                </tr>
                                                <tr class="info">
                                                    <td>ADUANEROS (IMPUESTOS)</td>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                </tr>
                                                <tr class="info">
                                                    <td>AGENTES</td>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                </tr>
                                                <tr class="info">
                                                    <td>CAPITAL-INVENTARIO</td>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                </tr>
                                                <tr class="info">
                                                    <td>SEGURO</td>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                </tr>
                                                <tr class="info">
                                                    <td>COSTO DE LA DFI PAÍS IMPORTADOR</td>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                </tr>
                                                <tr class="info">
                                                    <td>VALOR DDP TOTAL</td>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                </tr>

                                            </tbody>
                                        </table>
                                        <% }%>
                                    </div>
                                </div>

                                <div id="tierra" >
                                    <div class="col-md-8">
                                        <%

                                            e = exportaDAO.todo(1, pv.getIdProducto(), 3);

                                            if (e == null) {
                                        %>   


                                        <form id="FormExportar" method="post" action="javascript:insertar()">
                                            <table class="table table-bordered table-hover">
                                                <thead>
                                                <th>Concepto Costos Exportación</th>
                                                <th>Costo total</th>
                                                <th>Dias</th>
                                                </thead>
                                                <tbody>
                                                    <%
                                                        for (int i = 0; i < aie.size(); i++) {
                                                            iv = aie.get(i);
                                                            if (iv.getIdItemExportacion() >= 1 && iv.getIdItemExportacion() <= 2) {
                                                    %>
                                                    <tr id="tr<%=iv.getIdItemExportacion()%>" class="danger">
                                                        <td><%=iv.getItem()%></td>
                                                        <td><input id="costo<%=iv.getIdItemExportacion()%>" type="number" step="any" class="form-control" required=""></td>
                                                        <td><input id="dias<%=iv.getIdItemExportacion()%>" type="number" step="any" class="form-control" required=""></td>
                                                    </tr>
                                                    <%} else if (iv.getIdItemExportacion() >= 3 && iv.getIdItemExportacion() <= 11) {%>
                                                    <tr id="tr<%=iv.getIdItemExportacion()%>" class="success">
                                                        <td><%=iv.getItem()%></td>
                                                        <td><input id="costo<%=iv.getIdItemExportacion()%>" type="number" step="any" class="form-control" required=""></td>
                                                        <td><input id="dias<%=iv.getIdItemExportacion()%>" type="number" step="any" class="form-control" required=""></td>
                                                    </tr>
                                                    <% } else if (iv.getIdItemExportacion() >= 12 && iv.getIdItemExportacion() <= 13) {%>
                                                    <tr id="tr<%=iv.getIdItemExportacion()%>" class="warning">
                                                        <td><%=iv.getItem()%></td>
                                                        <td><input id="costo<%=iv.getIdItemExportacion()%>" type="number" step="any" class="form-control" required=""></td>
                                                        <td><input id="dias<%=iv.getIdItemExportacion()%>" type="number" step="any" class="form-control" required=""></td>
                                                    </tr>
                                                    <%} else if (iv.getIdItemExportacion() >= 14 && iv.getIdItemExportacion() <= 18) {%>
                                                    <tr id="tr<%=iv.getIdItemExportacion()%>" class="info">
                                                        <td><%=iv.getItem()%></td>
                                                        <td><input id="costo<%=iv.getIdItemExportacion()%>" type="number" step="any" class="form-control" required=""></td>
                                                        <td><input id="dias<%=iv.getIdItemExportacion()%>" type="number" step="any" class="form-control" required=""></td>
                                                    </tr>
                                                    <%}
                                                        }%>
                                                </tbody>
                                            </table>
                                            <input type="submit" class="btn btn-success" id="guardar" value="Guardar">
                                        </form>
                                        <%} else {%>
                                        <table class="table table-bordered table-hover">
                                            <thead>
                                            <th>Concepto Costos Exportación</th>
                                            <th>Costo total</th>
                                            <th>Dias</th>
                                            </thead>
                                            <tbody>
                                                <% double suma111 = 0;
                                                    for (int t = 0; t < aie.size(); t++) {
                                                        iv2 = aie.get(t);
                                                        e = exportaDAO.todo(t + 1, pv.getIdProducto(), 3);

                                                        if (iv2.getIdItemExportacion() >= 1 && iv2.getIdItemExportacion() <= 2) {
                                                            suma111 = suma111 + e.getCostoTotal();
                                                %>
                                                <tr id="tr<%=e.getIdExportacion()%>" class="danger">
                                                    <td id="td<%=e.getIdExportacion()%>"><%=iv2.getItem()%></td>
                                                    <td>$ <%=formato.format(e.getCostoTotal())%></td>
                                                    <td><%=e.getDias()%></td>
                                                    <td><button class="btn btn-default" onclick="actualizar(<%=e.getIdExportacion()%>)"><img src="../img/iconos/edit.png" alt="" class="icono"/></button></td>


                                                    <%      } else if (iv2.getIdItemExportacion() >= 3 && iv2.getIdItemExportacion() <= 11) {
                                                    %>
                                                <tr id="tr<%=e.getIdExportacion()%>" class="success">

                                                    <td id="td<%=e.getIdExportacion()%>"><%=iv2.getItem()%></td>
                                                    <td>$ <%=formato.format(e.getCostoTotal())%></td>
                                                    <td><%=e.getDias()%></td>
                                                    <td><button class="btn btn-default" onclick="actualizar(<%=e.getIdExportacion()%>)"><img src="../img/iconos/edit.png" alt="" class="icono"/></button></td>

                                                    <%} else if (iv2.getIdItemExportacion() >= 12 && iv2.getIdItemExportacion() <= 13) {%>
                                                <tr id="tr<%=e.getIdExportacion()%>" class="warning">

                                                    <td id="td<%=e.getIdExportacion()%>"><%=iv2.getItem()%></td>
                                                    <td>$ <%=formato.format(e.getCostoTotal())%></td>
                                                    <td><%=e.getDias()%></td>
                                                    <td><button class="btn btn-default" onclick="actualizar(<%=e.getIdExportacion()%>)"><img src="../img/iconos/edit.png" alt="" class="icono"/></button></td>

                                                    <%} else if (iv2.getIdItemExportacion() >= 14 && iv2.getIdItemExportacion() <= 18) {%>
                                                <tr id="tr<%=e.getIdExportacion()%>" class="info">

                                                    <td id="td<%=e.getIdExportacion()%>"><%=iv2.getItem()%></td>
                                                    <td>$ <%=formato.format(e.getCostoTotal())%></td>
                                                    <td><%=e.getDias()%></td>
                                                    <td><button class="btn btn-default" onclick="actualizar(<%=e.getIdExportacion()%>)"><img src="../img/iconos/edit.png" alt="" class="icono"/></button></td>

                                                    <%}%>
                                                </tr>
                                                <%}%>
                                                <tr class="danger">
                                                    <td>Valor EXW</td>
                                                    <td>$ <%=formato.format(sip + suma111)%></td>
                                                    <td>---</td>
                                                    <td></td>
                                                </tr>

                                                <%

                                                    double totalctas2 = 0;
                                                    for (int z = 0; z < anomina2.size(); z++) {
                                                        nomi2 = anomina2.get(z);
                                                        double totalremensuals = 0;
                                                        double totalreanuals = 0;
                                                        double totalaportes = 0;

                                                        double rmensuals = (nomi2.getCantidad() * nomi2.getMeses() * nomi2.getSalario()) / 12;
                                                        double ranuals = rmensuals * 12;
                                                        double aportes = (ranuals * 46.85) / 100;

                                                        totalremensuals = rmensuals + totalremensuals;
                                                        totalreanuals = ranuals + totalreanuals;
                                                        totalaportes = aportes + totalaportes;
                                                        totalctas2 = (ranuals + aportes) + totalctas2;

                                                    }
                                                %>


                                                <tr class="success">
                                                    <td>Administrativos - Costo Indirecto - (Nómina ADMINISTRACIÓN)</td>
                                                    <td><%=formato.format(totalctas2)%></td>
                                                    <td></td>
                                                    <td></td>
                                                </tr>
                                                <tr class="success">
                                                    <td>Capital inventario</td>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                </tr>
                                                <tr class="success">
                                                    <td>Seguro</td>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                </tr>
                                                <tr class="success">
                                                    <td>COSTO DE LA DFI PAÍS EXPORTADOR</td>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                </tr>
                                                <tr class="success">
                                                    <td>VALOR : FCA.No Incluye Embarque </td>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                </tr>
                                                <tr class="success">
                                                    <td>VALOR : FAS  No Incluye Embarque</td>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                </tr>
                                                <tr class="success">
                                                    <td>VALOR : FOB </td>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                </tr>
                                                <tr class="warning">
                                                    <td>VALOR CFR</td>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                </tr>
                                                <tr class="warning">
                                                    <td>VALOR CPT</td>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                </tr>
                                                <tr class="warning">
                                                    <td>SEGURO INTERNACIONAL</td>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                </tr>
                                                <tr class="warning">
                                                    <td>VALOR CIF</td>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                </tr>
                                                <tr class="warning">
                                                    <td>VALOR CIP</td>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                </tr>
                                                <tr class="warning">
                                                    <td>CAPITAL-INVENTARIO</td>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                </tr>
                                                <tr class="warning">
                                                    <td>COSTO DE LA DFI EN TRANSITO INTERNACIONAL</td>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                </tr>
                                                <tr class="warning">
                                                    <td>VALOR  DAP** No Incluye Desembarque</td>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                </tr>
                                                <tr class="warning">
                                                    <td>VALOR DAT</td>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                </tr>
                                                <tr class="info">
                                                    <td>VALOR  DAP</td>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                </tr>
                                                <tr class="info">
                                                    <td>ADUANEROS (IMPUESTOS)</td>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                </tr>
                                                <tr class="info">
                                                    <td>AGENTES</td>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                </tr>
                                                <tr class="info">
                                                    <td>CAPITAL-INVENTARIO</td>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                </tr>
                                                <tr class="info">
                                                    <td>SEGURO</td>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                </tr>
                                                <tr class="info">
                                                    <td>COSTO DE LA DFI PAÍS IMPORTADOR</td>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                </tr>
                                                <tr class="info">
                                                    <td>VALOR DDP TOTAL</td>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                </tr>

                                            </tbody>
                                        </table>
                                        <% }%>
                                    </div>
                                </div>



                                <div class="col-md-2"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <%@include file="../WEB-INF/masterpage/footer.jspf"%>
            </div>
        </div>

        <script src="../js/jquery.min.js" type="text/javascript"></script>
        <script src="../js/jquery.validate.js" type="text/javascript"></script>
        <script src="../js/menu.js" type="text/javascript"></script>
        <script src="../js/bootstrap.min.js" type="text/javascript"></script>
        <script src="../js/sweetalert.min.js" type="text/javascript"></script>
        <script src="../js/ajax/Exportacion.js" type="text/javascript"></script>
    </body>
</html>
