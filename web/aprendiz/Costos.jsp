<%-- 
    Document   : Costos
    Created on : 14/08/2016, 01:41:08 PM
    Author     : mayrayesenia
--%>

<%@page import="DAO.ProyectoDAO"%>
<%@page import="VO.ProyectoVO"%>
<%@page import="VO.UsuarioVO"%>
<%@page import="servlet.Usuario"%>
<%@page import="VO.UnidadMedidaVO"%>
<%@page import="DAO.UnidadMedidaDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="VO.CostosProductosVO"%>
<%@page import="DAO.CostosProductosDAO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="VO.ProductoVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Costos</title>
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
            Integer idp = null;
            UsuarioVO idu = null;
            ProductoVO pv = null;
            DecimalFormat formato = new DecimalFormat("###,###,###");

            idu = (UsuarioVO) hs.getAttribute("usuarioAll");
            idp = (Integer) hs.getAttribute("idproyectito");
            pv = (ProductoVO) hs.getAttribute("Productito");

            Integer opcionCosto = (Integer) hs.getAttribute("opcionCostosP");

            if (opcionCosto == null) {
                opcionCosto = 0;
            }

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
                        <a href="Detalle.jsp"><label>Menú Productos</label></a>
                        </li>
                        <%
                            ProyectoVO pvs;
           ProyectoDAO pds = new ProyectoDAO();
           pvs = pds.read(idp);
                   if(pvs.getIdEtapa() == 1){
                
               if (pvs.getIdEspecialidad() == 1) {%>
                        <%@include file="../WEB-INF/masterpage/menu_aux.jspf" %>

                        <%   }else if (pvs.getIdEspecialidad() == 2) {
                        %>
                        <%@include file="../WEB-INF/masterpage/menu_tec.jspf" %>
                        <% }else if (pvs.getIdEspecialidad() == 3) {%>
                        <%@include file="../WEB-INF/masterpage/menu.jspf" %>
                        <%} else if (pvs.getIdEspecialidad() == 4) {%>
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
                                    <br><img src="../img/Mis_Iconos/costos.png" alt="" class="dos"/>
                                </div>
                                <div class="col-md-6 col-xs-6" align="left">
                                    <h1 >Costos </h1>
                                    <h3 >(<%=pv.getNombre()%>)</h3><br>

                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-4">
                                    <label class="label label-info">Tipo Costo</label>
                                    <select class="form-control" id="TipoCosto">
                                        <%        if (opcionCosto == 1) {
                                        %>
                                        <option value="1">Costos Directos</option>
                                        <option value="2">Costos Indirectos</option>
                                        <%}
                                            if (opcionCosto == 2) {%>  
                                        <option value="2">Costos Indirectos</option>
                                        <option value="1">Costos Directos</option>
                                        <%}
                                            if (opcionCosto == 0) {

                                        %>
                                        <option value="1">Costos Directos</option>
                                        <option value="2">Costos Indirectos</option>

                                        <% }%>


                                    </select>
                                </div>

                            </div>
                            <br><br>

                            <div id="directa" class="panelsito">

                                <table class="table table-bordered table-hover">
                                    <thead >
                                        <tr>
                                            <th rowspan="2" class="text-center">Detalle</th>
                                            <th rowspan="2" class="text-center">Iva</th>
                                            <th rowspan="2" class="text-center">Cantidad</th>
                                            <th colspan="2" class="text-center">Presentación</th>
                                            <th rowspan="2"></th>

                                        </tr>
                                        <tr>
                                            <th class="text-center ">Unidad Medida</th>
                                            <th class="text-center ">Precio</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td><input type="text" class="form-control" id="detalleD" title="De acuerdo al bien a producir relacione productos agrícolas,
                                                       forestales, minerales, entre otros; que han sufrido poca o ninguna transformación y que formarán integralmente físicamente un producto terminado"></td>
                                            <td><input type="number" step="any" class="form-control" id="ivaD" title="Impuesto al Valor Agregado I.V.A. Escriba el porcentaje  de Impuesto, en caso de tener."></td>
                                            <td><input type="number" class="form-control" id="cantidadD"></td>
                                            <td><select id="unidadMedidaD" class="form-control">
                                                    <%
                                                        UnidadMedidaDAO umd = new UnidadMedidaDAO();
                                                        UnidadMedidaVO umv;
                                                        ArrayList<UnidadMedidaVO> a = new ArrayList();
                                                        a = umd.readAll();
                                                        for (int y = 0;
                                                                y < a.size();
                                                                y++) {
                                                            umv = a.get(y);
                                                    %>
                                                    <option value="<%=umv.getIdUnidadMedida()%>"><%=umv.getUMedida()%></option>
                                                    <%}%>
                                                </select></td>
                                            <td><input type="number" step="any" class="form-control" id="precioD" title="precio incluido IVA por unidad de medida"></td>
                                            <td><button class="btn btn-info" id="guardarD">Guardar</button></td>
                                        </tr>
                                    </tbody>
                                </table>



                                <table class="table table-bordered table-hover">
                                    <thead >
                                        <tr>
                                            <th rowspan="2" class="text-center ">Detalle</th>
                                            <th rowspan="2" class="text-center">Iva</th>
                                            <th rowspan="2" class="text-center">Cantidad</th>
                                            <th colspan="2" class="text-center">Presentación</th>
                                            <th rowspan="2" class="text-center">Costo<br> Mensual</th>
                                            <th rowspan="2" class="text-center">Costo<br> Anual</th>
                                            <th rowspan="2" ></th>

                                        </tr>
                                        <tr>
                                            <th class="text-center">Unidad Medida</th>
                                            <th class="text-center ">Precio</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            CostosProductosDAO cp = new CostosProductosDAO();
                                            CostosProductosVO c;
                                            ArrayList<CostosProductosVO> acp = new ArrayList();
                                            acp = cp.todo(pv.getIdProducto(), 1);

                                            String precio = "", CostoA = "", CostoM = "";
                                            double costoa = 0, costom = 0;
                                            for (int i = 0;
                                                    i < acp.size();
                                                    i++) {
                                                c = acp.get(i);
                                                precio = formato.format(c.getPrecio());
                                                costom = (c.getPrecio() * c.getCantidad()) / 12;
                                                CostoM = formato.format(costom);

                                                costoa = costom * 12;
                                                CostoA = formato.format(costoa);

                                        %>
                                        <tr id="tr<%=c.getIdCosto()%>">
                                            <td><%=c.getDetalle()%></td>
                                            <td><%=c.getIva()%> %</td>
                                            <td><%=formato.format(c.getCantidad())%></td>
                                            <td><%=c.getUMedida()%></td>
                                            <td>$ <%=precio%></td>
                                            <td>$ <%=CostoM%></td>
                                            <td>$ <%=CostoA%></td>
                                            <td>
                                                <button class="btn btn-success" onclick="actualizar(<%=c.getIdCosto()%>)"><span class="glyphicon glyphicon-edit"></span></button>
                                                <button class="btn btn-danger" onclick="borrar(<%=c.getIdCosto()%>)"><span class="glyphicon glyphicon-remove"></span></button>
                                            </td>
                                        </tr>
                                        <%}%>
                                    </tbody>
                                </table>
                            </div>


                            <div id="indirecta" class="panelsito">
                                <table class="table table-bordered table-hover">
                                    <thead >
                                        <tr>
                                            <th rowspan="2" class="text-center ">Detalle</th>
                                            <th rowspan="2" class="text-center">Iva</th>
                                            <th rowspan="2" class="text-center">Cantidad</th>
                                            <th colspan="2" class="text-center">Presentación</th>
                                            <th rowspan="2"></th>

                                        </tr>
                                        <tr>
                                            <th class="text-center ">Unidad Medida</th>
                                            <th class="text-center ">Precio</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td><input type="text" class="form-control" id="detalleI" title="Otros materiales usados en la producción de un bien Ej: Vacunas, desinfectantes, Pegante, aceites, lubricantes, entre otros."></td>
                                            <td><input type="number" step="any" class="form-control" id="ivaI" title="Impuesto al Valor Agregado I.V.A. Escriba el porcentaje  de Impuesto, en caso de tener."></td>
                                            <td><input type="number" class="form-control" id="cantidadI"></td>
                                            <td><select id="unidadMedidaI" class="form-control">
                                                    <%

                                                        a = umd.readAll();
                                                        for (int y = 0;
                                                                y < a.size();
                                                                y++) {
                                                            umv = a.get(y);
                                                    %>
                                                    <option value="<%=umv.getIdUnidadMedida()%>"><%=umv.getUMedida()%></option>
                                                    <%}%>
                                                </select></td>
                                            <td><input type="number" step="any" class="form-control" id="precioI" title="precio incluido IVA por unidad de medida"></td>
                                            <td><button class="btn btn-info" id="guardarI">Guardar</button></td>
                                        </tr>
                                    </tbody>
                                </table>



                                <table class="table table-bordered table-hover">
                                    <thead >
                                        <tr>
                                            <th rowspan="2" class="text-center ">Detalle</th>
                                            <th rowspan="2" class="text-center">Iva</th>
                                            <th rowspan="2" class="text-center">Cantidad</th>
                                            <th colspan="2" class="text-center">Presentación</th>
                                            <th rowspan="2" class="text-center">Costo<br> Mensual</th>
                                            <th rowspan="2" class="text-center">Costo<br> Anual</th>
                                            <th rowspan="2" ></th>

                                        </tr>
                                        <tr>
                                            <th class="text-center">Unidad Medida</th>
                                            <th class="text-center col-md-2">Precio</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%

                                            acp = cp.todo(pv.getIdProducto(), 2);

                                            String precios = "", CostoAs = "", CostoMs = "";
                                            double costoas = 0, costoms = 0, costo_total_indi = 0, total_cantidad_indi = 0;
                                            for (int i = 0;
                                                    i < acp.size();
                                                    i++) {
                                                c = acp.get(i);
                                                precios = formato.format(c.getPrecio());

                                                costoas = c.getPrecio() * c.getCantidad();
                                                CostoAs = formato.format(costoas);

                                                costoms = costoas / 12;
                                                CostoMs = formato.format(costoms);
                                                costo_total_indi = costo_total_indi + costoas;
                                                total_cantidad_indi = total_cantidad_indi + c.getCantidad(); 
                                        %>
                                        <tr id="tr<%=c.getIdCosto()%>">
                                            <td><%=c.getDetalle()%></td>
                                            <td><div class="text-right"><%=c.getIva()%> %</div></td>
                                            <td><div class="text-right"><%=formato.format(c.getCantidad())%></div></td>
                                            <td><%=c.getUMedida()%></td>
                                            <td><div class="text-right">$ <%=precios%></div></td>
                                            <td><div class="text-right">$ <%=CostoMs%></div></td>
                                            <td><div class="text-right">$ <%=CostoAs%></div></td>
                                            <td>
                                                <button class="btn btn-success" onclick="actualizar(<%=c.getIdCosto()%>)"><span class="glyphicon glyphicon-edit"></span></button>
                                                <button class="btn btn-danger" onclick="borrar(<%=c.getIdCosto()%>)"><span class="glyphicon glyphicon-remove"></span></button>
                                            </td>
                                        </tr>
                                        <%}%>
                                    </tbody>
                                
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
        <script src="../js/jquery.slides.js" type="text/javascript"></script>
        <script src="../js/ajax/Costos.js" type="text/javascript"></script>
        <script src="../js/jquery-ui.min.js" type="text/javascript"></script>
        <script src="../js/sweetalert.min.js" type="text/javascript"></script>

    </body>
</html>
