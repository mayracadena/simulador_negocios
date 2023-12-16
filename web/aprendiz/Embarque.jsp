<%-- 
    Document   : Embarque
    Created on : 19/08/2016, 11:48:26 AM
    Author     : mayracadena
--%>

<%@page import="VO.UnidadMedidaVO"%>
<%@page import="DAO.UnidadMedidaDAO"%>
<%@page import="DAO.EmbarqueDAO"%>
<%@page import="VO.EmbarqueVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="VO.ProductoVO"%>
<%@page import="VO.UsuarioVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Embarque</title>
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
            ArrayList<EmbarqueVO> em = new ArrayList();
            em = eDAO.todo(pv.getIdProducto());
            EmbarqueVO e = null;

            UnidadMedidaDAO umd = new UnidadMedidaDAO();
            UnidadMedidaVO umv;
            ArrayList<UnidadMedidaVO> a = new ArrayList();
            a = umd.readAll();
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

                            <div class="row">
                                <div class="col-md-5 col-xs-4" align="right">
                                    <br><img src="../img/iconos/truck.png" alt="" class="dos"/>
                                </div>
                                <div class="col-md-6 col-xs-6" align="left">
                                    <h1 >Embarque</h1>
                                    <h3 >(<%=pv.getNombre()%>)</h3><br>

                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-2"></div>
                                <div class="col-md-8">
                                    <%
                                        if (em.isEmpty()) {

                                    %>

                                    <table class="table table-bordered table-hover">
                                        <tr>
                                            <td>Origen: País - Punto de cargue</td>
                                            <td><input type="text" id="origen" class="form-control"></td>
                                        </tr>
                                        <tr>
                                            <td>Destino: País - Punto de desembarque - Entrega</td>
                                            <td><input type="text" id="destino" class="form-control"></td>
                                        </tr>
                                        <tr>
                                            <td>Peso Total KG/TON</td>
                                            <td><input type="number" step="any" id="peso" class="form-control"></td>
                                        </tr>
                                        <tr>
                                            <td>Unidad de Carga</td>
                                            <td><select id="unidadMedida" class="form-control">
                                                    <%                                                        a = umd.readAll();
                                                        for (int y = 0; y < a.size(); y++) {
                                                            umv = a.get(y);
                                                    %>
                                                    <option value="<%=umv.getIdUnidadMedida()%>"><%=umv.getUMedida()%></option>
                                                    <%}%>
                                                </select></td>
                                        </tr>
                                        <tr>
                                            <td>Unidades Comerciales</td>
                                            <td><input type="number" id="unidades" class="form-control"></td>
                                        </tr>
                                        <tr>
                                            <td>Valor por unidad comercial</td>
                                            <td><input type="number" step="any" id="valoruc" class="form-control"></td>
                                        </tr>
                                        <tr>
                                            <td>Volumen total embarque Cm3 - M3</td>
                                            <td><input type="text" id="volumen" class="form-control"></td>
                                        </tr>
                                        <tr>
                                            <td>Termino de venta (INCOTERM)</td>
                                            <td><textarea id="termino" class="form-control"></textarea></td>
                                        </tr>
                                        <tr>
                                            <td>Forma de pago y tiempo</td>
                                            <td><input type="text" id="pago" class="form-control"></td>
                                        </tr>
                                        <tr>
                                            <td>Tipo de cambio Utilizado</td>
                                            <td><input type="number" step="any" id="cambio" class="form-control"></td>
                                        </tr> 
                                        <tr>
                                            <td></td>
                                            <td>
                                                <button id="Guardar" class="btn btn-info">Guardar</button>
                                            </td>
                                        </tr>

                                    </table>
                                    <%} else {%>
                                    <!-- oh si! -->
                                    <%
                                        for (int i = 0; i < em.size(); i++) {
                                            e = em.get(i);

                                    %>
                                    <table class="table table-bordered table-hover">
                                        <tr>
                                            <td>Origen: País - Punto de cargue</td>
                                            <td><input type="text" id="origenU" class="form-control" value="<%=e.getOrigen()%>"></td>
                                        </tr>
                                        <tr>
                                            <td>Destino: País - Punto de desembarque - Entrega</td>
                                            <td><input type="text" id="destinoU" class="form-control" value="<%=e.getDestino()%>" ></td>
                                        </tr>
                                        <tr>
                                            <td>Peso Total KG/TON</td>
                                            <td><input type="number" step="any" id="pesoU" class="form-control" value="<%=e.getPesoTotal()%>"></td>
                                        </tr>
                                        <tr>
                                            <td>Unidad de Carga</td>
                                            <td><select id="unidadMedidaU" class="form-control">
                                                    <option value="<%=e.getIdUnidadMedida()%>"><%=e.getUMedida()%></option>
                                                    <%

                                                        for (int y = 0; y < a.size(); y++) {
                                                            umv = a.get(y);
                                                            if (umv.getIdUnidadMedida() != e.getIdUnidadMedida()) {
                                                    %>
                                                    <option value="<%=umv.getIdUnidadMedida()%>"><%=umv.getUMedida()%></option>
                                                    <%}
                                                        }%>
                                                </select></td>
                                        </tr>
                                        <tr>
                                            <td>Unidades Comerciales</td>
                                            <td><input type="number" id="unidadesU" class="form-control" value="<%=e.getUnidadComercial()%>"></td>
                                        </tr>
                                        <tr>
                                            <td>Valor por unidad comercial</td>
                                            <td><input type="number" step="any" id="valorucU" class="form-control" value="<%=e.getTiempo()%>"></td>
                                        </tr>
                                        <tr>
                                            <td>Volumen total embarque Cm3 - M3</td>
                                            <td><input type="text" id="volumenU" class="form-control" value="<%=e.getVolumenTotal()%>"></td>
                                        </tr>
                                        <tr>
                                            <td>Termino de venta (INCOTERM)</td>
                                            <td><textarea  id="terminoU" class="form-control"><%=e.getTerminoVenta()%></textarea></td>
                                        </tr>
                                        <tr>
                                            <td>Forma de pago y tiempo</td>
                                            <td><input type="text" id="pagoU" class="form-control" value="<%=e.getFormaPago()%>"></td>
                                        </tr>

                                        <tr>
                                            <td>Tipo de cambio Utilizado</td>
                                            <td><input type="text" id="cambioU" class="form-control" value="<%=e.getTipoCambio()%>"></td>
                                        </tr> 
                                        <tr>
                                            <td></td>
                                            <td>
                                                <button id="Actualizar" class="btn btn-info" onclick="Actualizar(<%=e.getIdEmbarque()%>)">Actualizar</button>
                                            </td>
                                        </tr>

                                    </table>
                                    <%}
                                        }%>
                                </div>
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
        <script src="../js/ajax/Embarque.js" type="text/javascript"></script>
        <script src="../js/bootstrap.min.js" type="text/javascript"></script>
    </body>
</html>
