<%-- 
    Document   : Inversion
    Created on : 16/08/2016, 01:13:03 PM
    Author     : mayracadena
--%>

<%@page import="VO.UsuarioVO"%>
<%@page import="VO.InversionVO"%>
<%@page import="DAO.InversionDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="VO.TipoInversionVO"%>
<%@page import="DAO.TipoInversionDAO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="DAO.ProyectoDAO"%>
<%@page import="VO.ProyectoVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Inversion</title>
        <link href="../css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="../css/intento.css" rel="stylesheet" type="text/css"/>
        <link href="../css/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <link href="../css/simple-sidebar.css" rel="stylesheet" type="text/css"/>
        <link href="../css/sweetalert.css" rel="stylesheet" type="text/css"/>
        <link rel="shortcut icon" type="image/x-icon" href="../img/demostrarLogo3.ico">
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

            InversionDAO ivd = new InversionDAO();
            Integer opcionInversion = (Integer) hs.getAttribute("opcionInversion");
            if (opcionInversion == null) {
                opcionInversion = 0;
            }

        %>
        <div id="opcionInversion" hidden=""><%=opcionInversion%></div>
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
                                    <br><img src="../img/Mis_Iconos/inversion.png" alt="" class="dos"/>
                                </div>
                                <div class="col-md-6 col-xs-6" align="left">
                                    <h1 >Inversión</h1>
                                    <h3 >(<%=pv.getNombreP()%>)</h3><br>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-4">
                                    <label class="label label-info">Tipo Inversión</label>
                                    <select class="form-control" id="TipoInversion">

                                        <%  TipoInversionDAO tnd = new TipoInversionDAO();
                                            TipoInversionVO tnv;
                                            ArrayList<TipoInversionVO> tn = new ArrayList();
                                            tn = tnd.readAll();
                                            if (opcionInversion == 1) { %>
                                        <optgroup label="Activos para la producción">
                                            <option value="1">Depreciables Producción</option>
                                            <option value="2">No Depreciables</option>
                                            <option value="3">Pecuarios</option>
                                            <option value="4">Agricolas</option>
                                        </optgroup>
                                        <optgroup label="Activos para la admistración">
                                            <option value="5">Depreciables Administración</option>
                                            <option value="2">No Depreciables</option>

                                        </optgroup>

                                        <%      }else 
                                            if (opcionInversion == 2) { %>
                                         <optgroup label="Activos para la producción">
                                            <option value="2">No Depreciables</option>
                                            <option value="1">Depreciables Producción</option>
                                            <option value="3">Pecuarios</option>
                                            <option value="4">Agricolas</option>
                                        </optgroup>
                                        <optgroup label="Activos para la admistración">
                                            <option value="5">Depreciables Administración</option>
                                            <option value="2">No Depreciables</option>

                                        </optgroup>
                                        <%     }else 
                                            if (opcionInversion == 3) { %>
                                         <optgroup label="Activos para la producción">
                                            <option value="3">Pecuarios</option>
                                            <option value="1">Depreciables Producción</option>
                                            <option value="2">No Depreciables</option>
                                            <option value="4">Agricolas</option>
                                        </optgroup>
                                        <optgroup label="Activos para la admistración">
                                            <option value="5">Depreciables Administración</option>
                                            <option value="2">No Depreciables</option>

                                        </optgroup>
                                        <%     }else 
                                            if (opcionInversion == 4) { %>
                                        <optgroup label="Activos para la producción">
                                            <option value="4">Agricolas</option>
                                            <option value="1">Depreciables Producción</option>
                                            <option value="2">No Depreciables</option>
                                            <option value="3">Pecuarios</option>
                                        </optgroup>
                                        <optgroup label="Activos para la admistración">
                                            <option value="5">Depreciables Administración</option>
                                            <option value="2">No Depreciables</option>

                                        </optgroup>
                                        <% }else
                                            if (opcionInversion == 0) {

                                        %>
                                         <optgroup label="Activos para la producción">
                                            <option value="1">Depreciables Producción</option>
                                            <option value="2">No Depreciables</option>
                                            <option value="3">Pecuarios</option>
                                            <option value="4">Agricolas</option>
                                        </optgroup>
                                        <optgroup label="Activos para la admistración">
                                            <option value="5">Depreciables Administración</option>
                                            <option value="2">No Depreciables</option>

                                        </optgroup>

                                        <% }else if (opcionInversion == 5) {%>
                                        <optgroup label="Activos para la admistración">
                                            <option value="5">Depreciables Administración</option>
                                            <option value="2">No Depreciables</option>

                                        </optgroup>
                                         <optgroup label="Activos para la producción">
                                            <option value="1">Depreciables Producción</option>
                                            <option value="2">No Depreciables</option>
                                            <option value="3">Pecuarios</option>
                                            <option value="4">Agricolas</option>
                                        </optgroup>
                                        <%}%>
                                    </select>
                                </div>

                            </div>
                            <br><br>
                            <div id="depresiable" class="panelsito">

                                <table class="table table-bordered table-hover">
                                    <tr>
                                        <th>Detalle</th>
                                        <th>Cantidad</th>
                                        <th>Valor Unitario</th>
                                        <th>Años (Vida Util)</th>
                                        <th></th>
                                    </tr>
                                    <tr>
                                        <td><input type="text" id="detalleD" class="form-control"
                                                   title="Inversion activos fijos tangibles para producción"></td>
                                        <td><input type="number" id="cantidadD" class="form-control"></td>
                                        <td><input type="number" step="any" id="valorUnitarioD" class="form-control"></td>
                                        <td>
                                            <select id="vidaUtilD" class="form-control">
                                                <option id="20" value="20" title="Cuantifique y relacione Construcciones y Edificaciones propias a emplear en producción">20</option>
                                                <option id="10" value="10" title="Relacione Maquinaria y Equipo propios a emplear en la Producción, otros activos, entre otros">10</option>
                                                <option id="5" value="5" title="Relacione: Flota y Equipo de Transporte, Computación y Comunicación, otros activos a emplear en Producción">5</option>
                                            </select>
                                        </td>
                                        <td><button class="btn btn-info" id="guardarD" >Guardar</button></td>
                                    </tr>
                                </table>

                                <table class="table table-bordered table-hover">
                                    <tr>
                                        <th>Detalle</th>
                                        <th>Cantidad</th>
                                        <th>Valor Unitario</th>
                                        <th>Años (Vida Util)</th>
                                        <th>Total</th>
                                        <th></th>
                                    </tr>
                                    <%

                                        ArrayList<InversionVO> ia = new ArrayList();
                                        InversionVO iv;
                                        ia = ivd.todo(1, idp);
                                        String valors = "", totalsito;
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
                                        <td class="col-md-1">
                                            <button class="btn btn-success"  title="Editar" onclick="actualizar(<%=iv.getIdInversion()%>)"><span class="glyphicon glyphicon-edit"></span></button>
                                            <button class="btn btn-danger" title="Borrar" onclick="borrar(<%=iv.getIdInversion()%>)"><span class="glyphicon glyphicon-remove"></span></button>
                                        </td>
                                    </tr>
                                    <%}%>
                                    <tr>
                                        <th>Total</th>
                                        <td><%=formato.format(totalcantidadD)%></td>
                                        <td><div class="text-right">$ <%=formato.format(totaldepresiables)%></div></td>
                                        <td></td>
                                        <td><div class="text-right">$ <%=formato.format(totaltodoD)%></div></td>
                                        <td></td>
                                    </tr>
                                </table>
                            </div>


                            <div id="No" class="panelsito">
                                <table class="table table-bordered table-hover">
                                    <tr>
                                        <th>Detalle</th>
                                        <th>Cantidad</th>
                                        <th>Valor Unitario</th>
                                        
                                        <th></th>
                                    </tr>
                                    <tr>
                                        <td><input type="text" id="detalleN" class="form-control"
                                                   title="Relacione los predios o terrenos que compra y destina a producción
                                                   (Se toma como inversión al inicio del año).
                                                   Si no los compra considérelos  como (arriendo)
                                                   en la celda otros costos de producción"></td>
                                        <td><input type="number" id="cantidadN" class="form-control"></td>
                                        <td><input type="number" step="any" class="form-control" id="valorUnitarioN"></td>
                                        <td hidden>
                                            <select id="vidaUtilN" class="form-control">
                                                <option value="20" title="Relacione los predios o terrenos que compra y destina a producción (Se toma como inversión al inicio del año). Si no los compra considérelos  como (arriendo) en la celda otros costos de producción">20</option>
                                                 </select>
                                        </td>
                                        <td><button class="btn btn-info" id="guardarN">Guardar</button></td>
                                    </tr>
                                </table>

                                <table class="table table-bordered table-hover">
                                    <tr>
                                        <th>Detalle</th>
                                        <th>Cantidad</th>
                                        <th>Valor Unitario</th>
                                        
                                        <th>Total</th>
                                        <th></th>
                                    </tr>
                                    <%

                                        ArrayList<InversionVO> ias = new ArrayList();
                                        InversionVO ivs;
                                        ias = ivd.todo(2, idp);
                                        String valorss = "", totalsitos;
                                        double totalInversions = 0, totalcantidad = 0, totalinversion = 0, totaltodo = 0;
                                        for (int i = 0; i < ias.size(); i++) {

                                            ivs = ias.get(i);
                                            if (ivs.getVidaUtil() == 20) {
                                                    
                                                
                                            valorss = formato.format(ivs.getValorUnitario());
                                            totalInversions = ivs.getCantidad() * ivs.getValorUnitario();
                                            totalsitos = formato.format(totalInversions);
                                            totalcantidad = totalcantidad + ivs.getCantidad();
                                            totalinversion = totalinversion + ivs.getValorUnitario();
                                            totaltodo = totaltodo + totalInversions;
                                    %>
                                    <tr id="tr<%=ivs.getIdInversion()%>">
                                        <td><%=ivs.getDetalle()%></td>
                                        <td><%=ivs.getCantidad()%></td>
                                        <td><div class="text-right">$ <%=valorss%></div></td>
                                        
                                        <td><div class="text-right">$ <%=totalsitos%></div></td>
                                        <td class="col-md-1">
                                            <button class="btn btn-success"  title="Editar" onclick="actualizar(<%=ivs.getIdInversion()%>)"><span class="glyphicon glyphicon-edit"></span></button>
                                            <button class="btn btn-danger" title="Borrar" onclick="borrar(<%=ivs.getIdInversion()%>)"><span class="glyphicon glyphicon-remove"></span></button>
                                        </td>
                                    </tr>
                                    <%}}%>
                                    <tfoot>
                                        <tr>
                                            <th>Total</th>
                                            <td><%=formato.format(totalcantidad)%></td>
                                            <td><div class="text-right">$ <%=formato.format(totalinversion)%></div></td>
                                            <td></td>
                                            <td><div class="text-right">$ <%=formato.format(totaltodo)%></div></td>
                                           
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>


                            <div id="semoviente" class="panelsito">
                                <table class="table table-bordered table-hover">
                                    <tr>
                                        <th>Detalle</th>
                                        <th>Cantidad</th>
                                        <th>Valor Unitario</th>
                                        <th>Años (Vida Util)</th>
                                        <th></th>
                                    </tr>
                                    <tr>
                                        <td><input type="text" id="detalleS" class="form-control" title="Incluye animales, como cerdos, bovinos, equinos,entre otros; en procesos productivos superiores a un (1) año"></td>
                                        <td><input type="number" id="cantidadS" class="form-control"></td>
                                        <td><input type="number" step="any" class="form-control" id="valorUnitarioS"></td>
                                        <td><input type="number" id="vidaUtilS" class="form-control"></td>
                                        <td><button class="btn btn-info" id="guardarS">Guardar</button></td>
                                    </tr>
                                </table>

                                <table class="table table-bordered table-hover">
                                    <tr>
                                        <th>Detalle</th>
                                        <th>Cantidad</th>
                                        <th>Valor Unitario</th>
                                        <th>Años (Vida Util)</th>
                                        <th>Total</th>
                                        <th></th>
                                    </tr>
                                    <%

                                        ArrayList<InversionVO> iaa = new ArrayList();
                                        InversionVO iva;
                                        iaa = ivd.todo(3, idp);
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
                                        <td class="col-md-1">
                                            <button class="btn btn-success"  title="Editar" onclick="actualizar(<%=iva.getIdInversion()%>)"><span class="glyphicon glyphicon-edit"></span></button>
                                            <button class="btn btn-danger" title="Borrar" onclick="borrar(<%=iva.getIdInversion()%>)"><span class="glyphicon glyphicon-remove"></span></button>
                                        </td>
                                    </tr>
                                    <%}%>
                                    <tr>
                                        <th>Total</th>
                                        <td><%=formato.format(cantidada)%></td>
                                        <td><div class="text-right">$ <%=formato.format(otrototala)%></div></td>
                                        <td></td>
                                        <td><div class="text-right">$ <%=formato.format(totaltodoa)%></div></td>
                                        <td></td>
                                    </tr>
                                </table>
                            </div>

                            <div id="cultivo" class="panelsito">
                                <table class="table table-bordered table-hover">
                                    <tr>
                                        <th>Detalle</th>
                                        <th>Cantidad</th>
                                        <th>Valor Unitario</th>
                                        <th>Años (Vida Util)</th>
                                        <th></th>
                                    </tr>
                                    <tr>
                                        <td><input type="text" id="detalleC" class="form-control" title="Incluye cultivos en procesos productivos superiores a un(1)año, como por ejemplo Caducifolios,cafè, tuna, entre otros."></td>
                                        <td><input type="number" id="cantidadC" class="form-control"></td>
                                        <td><input type="number" step="any" class="form-control" id="valorUnitarioC"></td>
                                        <td><input type="number" id="vidaUtilC" class="form-control"></td>
                                        <td><button class="btn btn-info" id="guardarC">Guardar</button></td>
                                    </tr>
                                </table>

                                <table class="table table-bordered table-hover">
                                    <tr>
                                        <th>Detalle</th>
                                        <th>Cantidad</th>
                                        <th>Valor Unitario</th>
                                        <th>Años (Vida Util)</th>
                                        <th>Total</th>
                                        <th></th>
                                    </tr>
                                    <%

                                        ArrayList<InversionVO> iaz = new ArrayList();
                                        InversionVO ivz;
                                        iaz = ivd.todo(4, idp);
                                        String valorsz = "", totalsitoz;
                                        double totalInversionz = 0, totaldecantidad = 0, totaldecosas = 0, totaldetodo = 0;
                                        for (int i = 0; i < iaz.size(); i++) {

                                            ivz = iaz.get(i);
                                            valorsz = formato.format(ivz.getValorUnitario());
                                            totalInversionz = ivz.getCantidad() * ivz.getValorUnitario();
                                            totalsitoz = formato.format(totalInversionz);
                                            totaldecantidad = totaldecantidad + ivz.getCantidad();
                                            totaldecosas = totaldecosas + ivz.getValorUnitario();
                                            totaldetodo = totaldetodo + totalInversionz;
                                    %>
                                    <tr id="tr<%=ivz.getIdInversion()%>">
                                        <td><%=ivz.getDetalle()%></td>
                                        <td><%=ivz.getCantidad()%></td>
                                        <td><div class="text-right">$ <%=valorsz%></div></td>
                                        <td><%=ivz.getVidaUtil()%></td>
                                        <td><div class="text-right">$ <%=totalsitoz%></div></td>
                                        <td class="col-md-1">
                                            <button class="btn btn-success"  title="Editar" onclick="actualizar(<%=ivz.getIdInversion()%>)"><span class="glyphicon glyphicon-edit"></span></button>
                                            <button class="btn btn-danger" title="Borrar" onclick="borrar(<%=ivz.getIdInversion()%>)"><span class="glyphicon glyphicon-remove"></span></button>
                                        </td>
                                    </tr>
                                    <%}%>
                                    <tr>
                                        <th>Total</th>
                                        <td><%=formato.format(totaldecantidad)%></td>
                                        <td><div class="text-right">$ <%=formato.format(totaldecosas)%></div></td>
                                        <td></td>
                                        <td><div class="text-right">$ <%=formato.format(totaldetodo)%></div></td>
                                        <td></td>
                                    </tr>
                                </table>
                            </div>

                            <div id="administracion" class="panelsito">
                                 <table class="table table-bordered table-hover">
                                    <tr>
                                        <th>Detalle</th>
                                        <th>Cantidad</th>
                                        <th>Valor Unitario</th>
                                        <th>Años (Vida Util)</th>
                                        <th></th>
                                    </tr>
                                    <tr>
                                        <td><input type="text" id="detalleNa" class="form-control"></td>
                                        <td><input type="number" id="cantidadNa" class="form-control"></td>
                                        <td><input type="number" step="any" class="form-control" id="valorUnitarioNa"></td>
                                        <td>
                                            <select id="vidaUtilNa" class="form-control">
                                                
                                                <option value="10" title="Relacione Equipo de Oficina propios para la administración del Proyecto.
                                                        Ej: Escritorio, archivador, calculadora,etc.">10</option>
                                                <option value="5" title="Relacione Equipo de Computación, comunicación, Flota y Equipo de Transporte, otros activos, para Administrar el Proyecto">5</option>
                                            </select>
                                        </td>
                                        <td><button class="btn btn-info" onclick="guardarAdmin()">Guardar</button></td>
                                    </tr>
                                </table>

                                <table class="table table-bordered table-hover">
                                    <tr>
                                        <th>Detalle</th>
                                        <th>Cantidad</th>
                                        <th>Valor Unitario</th>
                                        <th>Años (Vida Util)</th>
                                        <th>Total</th>
                                        <th></th>
                                    </tr>
                                    <%

                                        ArrayList<InversionVO> iasa = new ArrayList();
                                        InversionVO ivsa;
                                        iasa = ivd.todo(5, idp);
                                        String valorssa = "", totalsitosa;
                                        double totalInversionsa = 0, totalcantidada = 0, totalinversiona= 0, totaltodoaa = 0;
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
                                        <td class="col-md-1">
                                            <button class="btn btn-success"  title="Editar" onclick="actualizar(<%=ivsa.getIdInversion()%>)"><span class="glyphicon glyphicon-edit"></span></button>
                                            <button class="btn btn-danger" title="Borrar" onclick="borrar(<%=ivsa.getIdInversion()%>)"><span class="glyphicon glyphicon-remove"></span></button>
                                        </td>
                                    </tr>
                                    <%}}%>
                                    <tfoot>
                                        <tr>
                                            <th>Total</th>
                                            <td><%=formato.format(totalcantidada)%></td>
                                            <td><div class="text-right">$ <%=formato.format(totalinversiona)%></div></td>
                                            <td></td>
                                            <td><div class="text-right">$ <%=formato.format(totaltodoaa)%></div></td>
                                            <td></td>
                                        </tr>
                                    </tfoot>
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
        <script src="../js/ajax/Inversion.js" type="text/javascript"></script>
        <script src="../js/mensajes/mInversion.js" type="text/javascript"></script>
    </body>
</html>
