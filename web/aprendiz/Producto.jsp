<%-- 
    Document   : Producto
    Created on : 10/08/2016, 10:33:06 AM
    Author     : mayracadena
--%>

<%@page import="VO.UsuarioVO"%>
<%@page import="VO.UnidadMedidaVO"%>
<%@page import="DAO.UnidadMedidaDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="VO.ProductoVO"%>
<%@page import="DAO.ProductoDAO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="DAO.ProyectoDAO"%>
<%@page import="VO.ProyectoVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Productos</title>
        <link href="../css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="../css/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <link href="../css/intento.css" rel="stylesheet" type="text/css"/>
        <link href="../css/simple-sidebar.css" rel="stylesheet" type="text/css"/>
        <link href="../css/sweetalert.css" rel="stylesheet" type="text/css"/>
        <link rel="shortcut icon" type="image/x-icon" href="../img/demostrarLogo3.ico">
    </head>
    <body>
        <%
            HttpSession hs = request.getSession(true);
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
            if (idp == null) {
                response.sendRedirect("../principal.jsp");
                return;
            }

            ProyectoVO pv;
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


                            <div class="row">
                                <div class="col-md-5 col-xs-4" align="right">
                                    <br><img src="../img/Mis_Iconos/productos.png" alt="" class="dos"/>
                                </div>
                                <div class="col-md-6 col-xs-6" align="left">
                                    <h1 >Productos</h1>
                                    <h3 >(<%=pv.getNombreP()%>)</h3><br>
                                </div>
                            </div>

                            <center>
                                <button  class="botoncitos" data-toggle="modal" data-target="#ins_producto" ><label>Crear Producto</label></button>
                            </center>

                            <div id="ins_producto" class="modal fade" role="dialog">
                                <div class="modal-dialog">
                                    
                                    <!-- Modal content-->
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            <h4 class="modal-title">Guardar Producto</h4>
                                        </div>
                                        <div class="modal-body">
                                            <label class="label label-success">Producto especifico</label>
                                            <input type="text" id="produ_especifico" class="form-control" title="Denominación común del bien o servicio"><br>
                                            <label class="label label-success">Nombre comercial</label>
                                            <input type="text" id="nombre" class="form-control" title="Denominación comercial que se propone"><br>
                                            <label class="label label-success">Unidad de medida</label>
                                            <select id="unidadMedida" class="form-control" title="Unidad de medida a través de la cual se comercializará el bien o servicio a ofrecer">
                                                <%
                                                    UnidadMedidaDAO umd = new UnidadMedidaDAO();
                                                    UnidadMedidaVO umv;
                                                    ArrayList<UnidadMedidaVO> a = new ArrayList();
                                                    a = umd.readAll();
                                                    for (int y = 0; y < a.size(); y++) {
                                                        umv = a.get(y);
                                                %>
                                                <option value="<%=umv.getIdUnidadMedida()%>"><%=umv.getUMedida()%></option>
                                                <%}%>
                                            </select><br>
                                            <label class="label label-success">Descripción general</label>
                                            <textarea id="descripcion_general" class="form-control" title="Descripción de las características técnicas del bien o servicio"></textarea><br>
                                            <label class="label label-success">Condiciones especiales</label>
                                            <textarea id="condiciones_especiales" class="form-control" title="Describa las advertencias o condiciones especiales del almacenamiento o uso del producto o servicio"></textarea><br>
                                            <label class="label label-success">Otro</label>
                                            <textarea id="otro" class="form-control" title="Otras consideraciones que usted crea conveniente"></textarea><br>
                                            <button class="btn btn-success" onclick="GuardarProducto()">Guardar</button>
                                        </div>
                                        <div class="modal-footer">
                                            <div id="b_limpiar"></div>
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                                        </div>
                                    </div>

                                </div>
                            </div>

                                            
                                            <br><br>
                                                
                                    <%
                                ProductoDAO prd = new ProductoDAO();
                                ProductoVO prv;
                                ArrayList<ProductoVO> prA = new ArrayList();
                                prA = prd.todos(idp);

                                for (int i = 0; i < prA.size(); i++) {
                                    prv = prA.get(i);
                                    
                            %>
                            <table class="table table-bordered table-hover" id="tb<%=prv.getIdProducto()%>">
                                <tr>
                                    <th class="col-md-4">Item</th>
                                    <th>Descripción</th>
                                </tr>
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
                                <tr >
                                <td colspan="2"><button class="btn btn-success" title="Actualizar" data-toggle="modal" data-target="#act_producto<%=prv.getIdProducto()%>"><span class="glyphicon glyphicon-edit"></span></button>
                                        <button class="btn btn-warning" title="Detalles" onclick="productoAll(<%=prv.getIdProducto()%>)"><span class="glyphicon glyphicon-th-large"></span></button>
                                        <button class="btn btn-danger" title="Eliminar" onclick="Eliminar(<%=prv.getIdProducto()%>)"><span class="glyphicon glyphicon-remove"></span></button>
                                </td>
                                </tr>
                                            </table>
                                
                                 <div id="act_producto<%=prv.getIdProducto()%>" class="modal fade" role="dialog">
                                    <div class="modal-dialog">

                                        <!-- Modal content-->
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                <h4 class="modal-title">Actualizar Producto</h4>
                                            </div>
                                            <div class="modal-body">
                                             <label class="label label-success">Producto especifico</label>
                                             <input type="text" id="produ_especifico<%=prv.getIdProducto()%>" value="<%=prv.getProdu_especifico()%>" class="form-control" title="Denominación común del bien o servicio"><br>
                                            <label class="label label-success">Nombre comercial</label>
                                            <input type="text" id="nombre<%=prv.getIdProducto()%>" value="<%=prv.getNombre()%>" class="form-control" title="Denominación comercial que se propone"><br>
                                            <label class="label label-success">Unidad de medida</label>
                                            <select id="unidadMedida<%=prv.getIdProducto()%>" class="form-control" title="Unidad de medida a través de la cual se comercializará el bien o servicio a ofrecer">
                                            <option value="<%=prv.getIdUnidadVenta()%>"><%=prv.getUMedida()%></option>
                                            <%
                                                for (int g = 0; g < a.size(); g++) {

                                                    umv = a.get(g);
                                                    if (umv.getIdUnidadMedida() != prv.getIdUnidadVenta()) {


                                            %>
                                            <option value="<%=umv.getIdUnidadMedida()%>"><%=umv.getUMedida()%></option>
                                            <%}
                                                }%>
                                        </select><br>
                                            <label class="label label-success">Descripción general</label>
                                            <textarea id="descripcion_general<%=prv.getIdProducto()%>" class="form-control" title="Descripción de las características técnicas del bien o servicio"><%=prv.getDescripcion_general()%></textarea><br>
                                            <label class="label label-success">Condiciones especiales</label>
                                            <textarea id="condiciones_especiales<%=prv.getIdProducto()%>" class="form-control" title="Describa las advertencias o condiciones especiales del almacenamiento o uso del producto o servicio"><%=prv.getCondiciones_especiales()%></textarea><br>
                                            <label class="label label-success">Otro</label>
                                            <textarea id="otro<%=prv.getIdProducto()%>" class="form-control" title="Otras consideraciones que usted crea conveniente"><%=prv.getOtro()%></textarea><br>
                                           
                                           <button class="btn btn-success" title="Actualizar" onclick="actualizar(<%=prv.getIdProducto()%>)">Actualizar <span class="glyphicon glyphicon-edit"></span></button>
                                            </div>
                                            <div class="modal-footer">
                                                
                                                <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            <%}%>        
                        </div>
                    </div>
                </div>
                <%@include file="../WEB-INF/masterpage/footer.jspf"%>
            </div>
        </div>

        <script src="../js/jquery.min.js" type="text/javascript"></script>
        <script src="../js/jquery-ui.min.js" type="text/javascript"></script>
        <script src="../js/menu.js" type="text/javascript"></script>
        <script src="../js/bootstrap.min.js" type="text/javascript"></script>
        <script src="../js/sweetalert.min.js" type="text/javascript"></script>
        <script src="../js/ajax/Producto.js" type="text/javascript"></script>
       
    </body>
</html>
