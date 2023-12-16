<%-- 
    Document   : DFI
    Created on : 28/10/2016, 09:48:35 AM
    Author     : demo02
--%>

<%@page import="DAO.EmbarqueDAO"%>
<%@page import="VO.EmbarqueVO"%>
<%@page import="DAO.NominaDAO"%>
<%@page import="VO.NominaVO"%>
<%@page import="DAO.ProductoDAO"%>
<%@page import="DAO.ProyeccionVentasDAO"%>
<%@page import="DAO.ExportacionDAO"%>
<%@page import="VO.ExportacionVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="VO.ItemExportacionVO"%>
<%@page import="DAO.ItemExportacionDAO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="VO.ProductoVO"%>
<%@page import="VO.UsuarioVO"%>
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
            DecimalFormat formato = new DecimalFormat("###,###,###.#");

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
            if (emba == null) {
                   response.sendRedirect("Embarque.jsp");
                return; 
                }
            double sip = Double.parseDouble(emba.getTiempo()) * Double.parseDouble(emba.getUnidadComercial());
            if (sip == 0) {
                sip = 0;
            }

            NominaDAO nomiDAO = new NominaDAO();

            ArrayList<NominaVO> anomina2 = new ArrayList();

            anomina2 = nomiDAO.consulta(idp, 1);
            NominaVO nomi2;

            ProductoDAO prd = new ProductoDAO();
            ProductoVO prv;
            ArrayList<ProductoVO> prA = new ArrayList();
            prA = prd.todos(idp);

            if (prA.isEmpty()) {
                prA = null;
            }

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
                           
                            <div class="row">
                                <div class="col-md-5 col-xs-4" align="right">
                                    <br><img src="../img/iconos/route.png" alt="" class="dos"/>
                                </div>
                                <div class="col-md-6 col-xs-6" align="left">
                            <h1 >Exportación</h1>
                            <h3 >(<%=pv.getNombre()%>)</h3><br>
                                    
                                </div>
                            </div>


                            <div class="row">
                                <div class="col-md-2"></div>
                                <div class="col-md-4">
                                    <label class="label label-info">Tipo Envío</label>
                                    <select id="tipoEnvio"class="form-control">
                                        <option value="1">Maritimo</option>
                                        <option value="2">Areo</option>
                                        <option value="3">Terrestre</option>
                                    </select>
                                </div>
                                <div class="col-md-2"></div>
                            </div>
                        </div>




                        <%
                            for (int m = 1; m <= 3; m++) {
                                ItemExportacionDAO ied = new ItemExportacionDAO();
                                ItemExportacionVO iv, iv2;
                                ArrayList<ItemExportacionVO> aie = new ArrayList();
                                aie = ied.buscar();

                                ExportacionVO e = null;
                                ExportacionDAO exportaDAO = new ExportacionDAO();
                                e = exportaDAO.todo(1, pv.getIdProducto(), m);
                                if (e == null) {

                        %>
                        <div class="row">

                            <div class="col-md-2"></div>
                            <div id="envio<%=m%>" >
                                <div class="col-md-8">
                                    <br><br>
                                    <form id="FormExportar" method="post" action="javascript:insertar()">
                                        <table class=" table table-bordered table-hover">
                                            <thead>
                                            <th>Concepto Costos Exportacion</th>
                                            <th>Costo Total</th>
                                            <th>Dias</th>
                                            </thead>
                                            <tbody>
                                                <%
                                                    for (int i = 0; i < aie.size(); i++) {
                                                        iv = aie.get(i);

                                                        if (iv.getIdItemExportacion() >= 1 && iv.getIdItemExportacion() <= 2) {
                                                %>
                                                <tr id="tr <%=iv.getIdItemExportacion()%>" class="danger">
                                                    <td><%=iv.getItem()%></td>
                                                    <td><input id="costos<%=iv.getIdItemExportacion()%><%=m%>" type=" number"step="any"class="form-control"requierd=""></td>
                                                    <td><input id="dias<%=iv.getIdItemExportacion()%><%=m%>" type=" number"step="any"class="form-control"requierd=""></td>
                                                </tr>
                                                <%} else if (iv.getIdItemExportacion() >= 3 && iv.getIdItemExportacion() <= 11) {%>
                                                <tr id="tr <%=iv.getIdItemExportacion()%>" class="success">
                                                    <td><%=iv.getItem()%></td>
                                                    <td><input id="costos<%=iv.getIdItemExportacion()%><%=m%>" type=" number"step="any"class="form-control"requierd=""></td>
                                                    <td><input id="dias<%=iv.getIdItemExportacion()%><%=m%>" type=" number"step="any"class="form-control"requierd=""></td>
                                                </tr>
                                                <%} else if (iv.getIdItemExportacion() >= 12 && iv.getIdItemExportacion() <= 13) {%>
                                                <tr id="tr <%=iv.getIdItemExportacion()%>" class="warning">
                                                    <td><%=iv.getItem()%></td>
                                                    <td><input id="costos<%=iv.getIdItemExportacion()%><%=m%>" type=" number"step="any"class="form-control"requierd=""></td>
                                                    <td><input id="dias<%=iv.getIdItemExportacion()%><%=m%>" type=" number"step="any"class="form-control"requierd=""></td>
                                                </tr>
                                                <%} else if (iv.getIdItemExportacion() >= 14 && iv.getIdItemExportacion() <= 18) {%>
                                                <tr id="tr <%=iv.getIdItemExportacion()%>" class="info">
                                                    <td><%=iv.getItem()%></td>
                                                    <td><input id="costos<%=iv.getIdItemExportacion()%><%=m%>" type=" number"step="any"class="form-control"requierd=""></td>
                                                    <td><input id="dias<%=iv.getIdItemExportacion()%><%=m%>" type=" number"step="any"class="form-control"requierd=""></td>
                                                </tr>
                                                <%}%>

                                                <%}%>
                                            </tbody>
                                        </table>
                                        <input type="submit" class="btn btn-success" id="guardar"value="Guardar">

                                    </form >
                                </div>
                            </div>
                        </div>
                        <% } else {%>
                        <div class="row">
                            <div class="col-md-2"></div>
                            <div id="envio<%=m%>" >
                                <div class="col-md-8">
                                    <br><br>
                                    <table class="table table-bordered table-hover">
                                        <thead>
                                        <th>Concepto Costos Exportacion</th>
                                        <th>Costo Total</th>
                                        <th>Dias</th>
                                        </thead>
                                        <%
                                            double suma1 = 0, capitali = 0, sumadias = 0, resta = 0, transinter = 0, manipuleo = 0, sumadias2 = 0, valorDAP = 0, documentacion = 0, docudias = 0;

                                            for (int t = 0; t < aie.size(); t++) {
                                                iv2 = aie.get(t);
                                                e = exportaDAO.todo(t + 1, pv.getIdProducto(), m);

                                                if (iv2.getIdItemExportacion() >= 1 && iv2.getIdItemExportacion() <= 2) {
                                                    suma1 = suma1 + e.getCostoTotal();
                                                }
                                                if (iv2.getIdItemExportacion() >= 1 && iv2.getIdItemExportacion() < 11) {
                                                    sumadias = sumadias + e.getDias();
                                                    sumadias2 = sumadias;
                                                }
                                                if (iv2.getIdItemExportacion() >= 3 && iv2.getIdItemExportacion() <= 11) {
                                                    capitali = capitali + e.getCostoTotal();
                                                }
                                                if (iv2.getIdItemExportacion() == 8) {
                                                    resta = e.getCostoTotal();
                                                }
                                                if (iv2.getIdItemExportacion() == 12) {
                                                    transinter = e.getCostoTotal();
                                                    sumadias2 = sumadias2 + e.getDias();
                                                }
                                                if (iv2.getIdItemExportacion() == 13) {
                                                    manipuleo = e.getCostoTotal();
                                                    sumadias2 = sumadias2 + e.getDias();
                                                }
                                                if (iv2.getIdItemExportacion() >= 14 && iv2.getIdItemExportacion() <= 15) {
                                                    valorDAP = valorDAP + e.getCostoTotal();
                                                    docudias = docudias + e.getDias();
                                                }
                                                if (iv2.getIdItemExportacion() >= 16 && iv2.getIdItemExportacion() <= 17) {
                                                    documentacion = documentacion + e.getCostoTotal();
                                                    docudias = docudias + e.getDias();
                                                }

                                                if (iv2.getIdItemExportacion() >= 1 && iv2.getIdItemExportacion() <= 2) {
                                        %>
                                        <tr id="tr<%=e.getIdExportacion()%>" class="danger">
                                            <td id="td<%=e.getIdExportacion()%>"><%=iv2.getItem()%></td>
                                            <td><div class="text-right">$ <%=formato.format(e.getCostoTotal())%></div></td>
                                            <td><%=e.getDias()%></td>
                                            <td><button class="btn btn-default" onclick="actualizar(<%=e.getIdExportacion()%>)" ><span class="glyphicon glyphicon-edit"></span></button></td>
                                        </tr>
                                        <%} else if (iv2.getIdItemExportacion() >= 3 && iv2.getIdItemExportacion() <= 11) {%>

                                        <tr id="tr<%=e.getIdExportacion()%>" class="success">
                                            <td id="td<%=e.getIdExportacion()%>"><%=iv2.getItem()%></td>
                                            <td><div class="text-right">$ <%=formato.format(e.getCostoTotal())%></div></td>
                                            <td><%=e.getDias()%></td>
                                            <td><button class="btn btn-default" onclick="actualizar(<%=e.getIdExportacion()%>)" ><span class="glyphicon glyphicon-edit"></span>></button></td>
                                        </tr>
                                        <%} else if (iv2.getIdItemExportacion() >= 12 && iv2.getIdItemExportacion() <= 13) {%>

                                        <tr id="tr<%=e.getIdExportacion()%>" class="warning">
                                            <td id="td<%=e.getIdExportacion()%>"><%=iv2.getItem()%></td>
                                            <td><div class="text-right">$ <%=formato.format(e.getCostoTotal())%></div></td>
                                            <td><%=e.getDias()%></td>
                                            <td><button class="btn btn-default" onclick="actualizar(<%=e.getIdExportacion()%>)" ><span class="glyphicon glyphicon-edit"></span></button></td>
                                        </tr>
                                        <%} else if (iv2.getIdItemExportacion() >= 14 && iv2.getIdItemExportacion() <= 18) {%>

                                        <tr id="tr<%=e.getIdExportacion()%>" class="info">
                                            <td id="td<%=e.getIdExportacion()%>"><%=iv2.getItem()%></td>
                                            <td><div class="text-right">$ <%=formato.format(e.getCostoTotal())%></div></td>
                                            <td><%=e.getDias()%></td>
                                            <td><button class="btn btn-default" onclick="actualizar(<%=e.getIdExportacion()%>)" ><span class="glyphicon glyphicon-edit"></span></button></td>
                                        </tr>
                                        <%}%>


                                        <%}%>
                                        <%

                                            double totalctas1 = 0;
                                            if (anomina2.isEmpty()) {
                                                response.sendRedirect("Embarque.jsp");
                                                return;
                                            }
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
                                            double capitalInventario = ((suma1 + sip) + totalproductos + capitali) * 0.0394 * sumadias / 360;
                                            double seguro = ((suma1 + sip) + totalproductos + capitali + capitalInventario) * 0.0065;
                                            double costopaisimportador = totalproductos + capitali + capitalInventario + seguro;
                                            double segurointernacional = ((costopaisimportador + sip + suma1 + transinter) - seguro) * 0.0065;
                                            double valorcif = costopaisimportador + sip + suma1 + transinter + segurointernacional;
                                            double capitalinventario = (((valorcif - capitalInventario) + manipuleo) * 0.039 * sumadias2) / 360;
                                            double costoDFInternacional = costopaisimportador + transinter + segurointernacional + manipuleo + capitalinventario;
                                            double ValorDAP = (valorcif + manipuleo + capitalinventario + valorDAP) - manipuleo;
                                            double valorDAT = valorcif + manipuleo + capitalinventario;
                                            double CapitalInventario2 = ((documentacion + ValorDAP + (valorcif * 0.18) + (0.004 * valorcif)) * 0.039 * (docudias + sumadias2) / 360) - capitalinventario;
                                            double seguroimportador = (valorDAT + valorDAP + documentacion + (valorcif * 0.18) + (0.004 * valorcif) + CapitalInventario2 - segurointernacional) * 0.0065;
                                            double costoDFImportador = costoDFInternacional + valorDAP + documentacion + (valorcif * 0.18) + (0.004 * valorcif) + CapitalInventario2 + seguroimportador;
                                            double TotalDPP = ValorDAP + documentacion + (valorcif * 0.18) + (0.004 * valorcif) + CapitalInventario2 + seguroimportador;
                                        %>
                                        <tr class="danger">

                                            <td>Valor EXW</td>
                                            <td><div class="text-right">$ <%=formato.format(sip + suma1)%></div></td>
                                            <td>---</td>
                                            <td></td>
                                        </tr>
                                        <tr class="success">
                                            <td>Administrativos - Costo Indirecto - (Nómina ADMINISTRACIÓN)</td>
                                            <td><div class="text-right">$ <%=formato.format(totalproductos)%></div></td>
                                            <td>---</td>
                                            <td></td>
                                        </tr>

                                        <tr class="success">
                                            <td>Capital inventario</td>
                                            <td><div class="text-right">$ <%=formato.format(capitalInventario)%></div></td>
                                            <td>---</td>
                                            <td></td>
                                        </tr>
                                        <tr class="success">
                                            <td>Seguro</td>
                                            <td><div class="text-right">$ <%=formato.format(seguro)%></div></td>
                                            <td>---</td>
                                            <td></td>
                                        </tr>
                                        <tr class="success">
                                            <td>COSTO DE LA DFI PAÍS EXPORTADOR</td>
                                            <td><div class="text-right">$ <%=formato.format(costopaisimportador)%></div></td>
                                            <td>---</td>
                                            <td></td>
                                        </tr>
                                        <tr class="success">
                                            <td>VALOR : FCA.No Incluye Embarque </td>
                                            <td><div class="text-right">$ <%=formato.format(costopaisimportador + sip + suma1 - resta)%></div></td>
                                            <td>---</td>
                                            <td></td>
                                        </tr>
                                        <% if (m == 2 || m == 3) {%>

                                        <tr class="success">
                                            <td>VALOR : FAS  No Incluye Embarque</td>
                                            <td><div class="text-center"> N/A</div></td>
                                            <td>---</td>
                                            <td></td>
                                        </tr>
                                        <tr class="success">
                                            <td>VALOR : FOB </td>
                                            <td><div class="text-center"> N/A </div></td>
                                            <td>---</td>
                                            <td></td>
                                        </tr>
                                         <tr class="warning">
                                            <td>VALOR CFR</td>
                                            <td><div class="text-center"> N/A </div></td>
                                            <td>---</td>
                                            <td></td>
                                        </tr>
                                        <% }else{%>
                                        <tr class="success">
                                            <td>VALOR : FAS  No Incluye Embarque</td>
                                            <td><div class="text-right">$ <%=formato.format((costopaisimportador + sip + suma1) - resta)%></div></td>
                                            <td>---</td>
                                            <td></td>
                                        </tr>
                                        <tr class="success">
                                            <td>VALOR : FOB </td>
                                            <td><div class="text-right">$ <%=formato.format((costopaisimportador + sip + suma1))%></div></td>
                                            <td>---</td>
                                            <td></td>
                                        </tr>
                                         <tr class="warning">
                                            <td>VALOR CFR</td>
                                            <td><div class="text-right">$ <%=formato.format(costopaisimportador + sip + suma1 + transinter)%></div></td>
                                            <td>---</td>
                                            <td></td>
                                        </tr>
                                        <% } %>
                                       
                                        <tr class="warning">
                                            <td>VALOR CPT</td>
                                            <td><div class="text-right">$ <%=formato.format(costopaisimportador + sip + suma1 + transinter)%></div></td>
                                            <td>---</td>
                                            <td></td>
                                        </tr>
                                        <tr class="warning">
                                            <td>SEGURO INTERNACIONAL</td>
                                            <td><div class="text-right">$ <%=formato.format(segurointernacional)%></div></td>
                                            <td>---</td>
                                            <td></td>
                                        </tr>
                                         <% if (m == 2 || m == 3) {
                                         valorcif = 0;
                                         %>
                                        <tr class="warning">
                                            <td>VALOR CIF</td>
                                            <td><div class="text-center"> N/A</div></td>
                                            <td>---</td>
                                            <td></td>
                                        </tr>
                                        <%}else{ %>
                                        <tr class="warning">
                                            <td>VALOR CIF</td>
                                            <td><div class="text-right">$ <%=formato.format(valorcif)%></div></td>
                                            <td>---</td>
                                            <td></td>
                                        </tr>
                                        <% } %>
                                        <tr class="warning">
                                            <td>VALOR CIP</td>
                                            <td><div class="text-right">$ <%=formato.format(costopaisimportador + sip + suma1 + transinter + segurointernacional)%></div></td>
                                            <td>---</td>
                                            <td></td>
                                        </tr>
                                        <tr class="warning">
                                            <td>CAPITAL-INVENTARIO</td>
                                            <td><div class="text-right">$ <%=formato.format(capitalinventario)%></div></td>
                                            <td>---</td>
                                            <td></td>
                                        </tr>
                                        <tr class="warning">
                                            <td>COSTO DE LA DFI EN TRANSITO INTERNACIONAL</td>
                                            <td><div class="text-right">$ <%=formato.format(costoDFInternacional)%></div></td>
                                            <td>---</td>
                                            <td></td>
                                        </tr>
                                         <% if (m == 2 || m == 3) {%>
                                        <tr class="warning">
                                            <td>VALOR  DAP** No Incluye Desembarque</td>
                                            <td><div class="text-center"> N/A </div></td>
                                            <td>---</td>
                                            <td></td>
                                        </tr>
                                        <%}else{%>
                                        <tr class="warning">
                                            <td>VALOR  DAP** No Incluye Desembarque</td>
                                            <td><div class="text-right">$ <%=formato.format(capitalinventario + valorcif)%></div></td>
                                            <td>---</td>
                                            <td></td>
                                        </tr>
                                        <%}%>
                                        <tr class="warning">
                                            <td>VALOR DAT</td>
                                            <td><div class="text-right">$ <%=formato.format(valorDAT)%></div></td>
                                            <td>---</td>
                                            <td></td>
                                        </tr>
                                        <tr class="info">
                                            <td>VALOR  DAP</td>
                                            <td><div class="text-right">$ <%=formato.format(ValorDAP)%></div></td>
                                            <td>---</td>
                                            <td></td>
                                        </tr>
                                        <tr class="info">
                                            <td>ADUANEROS (IMPUESTOS)</td>
                                            <td><div class="text-right">$ <%=formato.format(valorcif * 0.18)%></div></td>
                                            <td>---</td>
                                            <td></td>
                                        </tr>
                                        <tr class="info">
                                            <td>AGENTES</td>
                                            <td><div class="text-right">$ <%=formato.format(0.004 * valorcif)%></div></td>
                                            <td>---</td>
                                            <td></td>
                                        </tr>
                                        <tr class="info">
                                            <td>CAPITAL-INVENTARIO</td>
                                            <td><div class="text-right">$ <%=formato.format(CapitalInventario2)%></div></td>
                                            <td>---</td>
                                            <td></td>
                                        </tr>
                                        <tr class="info">
                                            <td>SEGURO</td>
                                            <td><div class="text-right">$ <%=formato.format(seguroimportador)%></div></td>
                                            <td>---</td>
                                            <td></td>
                                        </tr>
                                        <tr class="info">
                                            <td>COSTO DE LA DFI PAÍS IMPORTADOR</td>
                                            <td><div class="text-right">$ <%=formato.format(costoDFImportador)%></div></td>
                                            <td>---</td>
                                            <td></td>
                                        </tr>
                                        <tr class="info">
                                            <td>VALOR DDP TOTAL</td>
                                            <td><div class="text-right">$ <%=formato.format(TotalDPP)%></div></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td><div class="text-right">$ <%=formato.format(TotalDPP * emba.getTipoCambio())%></div></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td>Valor de la D.F.I. (Sin Costos Administrativos)</td>
                                            <td><div class="text-right">$ <%=formato.format((TotalDPP * emba.getTipoCambio()) - (totalproductos * emba.getTipoCambio()))%></div></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                    </table>
                                    <% } %>
                                </div>
                            </div>
                            <div class="col-md-2"></div>
                        </div>

                        <% }%>




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
