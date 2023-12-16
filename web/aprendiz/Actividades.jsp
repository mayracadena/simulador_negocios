<%-- 
    Document   : actividades
    Created on : 23/10/2017, 03:57:46 PM
    Author     : mayrayesenia
--%>

<%@page import="DAO.ProyectoDAO"%>
<%@page import="VO.ProyectoVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.ActividadesDAO"%>
<%@page import="VO.ActividadesVO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="VO.ProductoVO"%>
<%@page import="VO.UsuarioVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Actividades</title>
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
                                    <br><img src="../img/Mis_Iconos/actividades.png" alt="" class="dos"/>
                                </div>
                                <div class="col-md-6 col-xs-6" align="left">
                                    <h1 >Actividades</h1>
                                    <h3 >(<%=pv.getNombre()%>)</h3><br>

                                </div>
                            </div>

                            <table class="table table-bordered">
                                <tr>
                                    <th>Actividad</th>
                                    <th>Tiempo</th>
                                    <th>Cargos</th>
                                    <th>Número de cargos</th>
                                    <th>Equipos</th>
                                    <th></th>
                                </tr>
                                <tr>
                                    <td><input type="text" id="Actividad" class="form-control" title="Actividad del proceso de realización del producto <%=pv.getNombre()%>"></td>
                                    <td><input type="text" class="form-control" id="Tiempo" value="00:00" title="Tiempo estimado de realización (minutos/horas)"></td>
                                    <td><textarea id="Cargos" class="form-control" title="Cargos que partcipan en la actividad"></textarea></td>
                                    <td><textarea id="N_cargos" class="form-control" title="Número de personas que intervienen por cargo"></textarea></td>
                                    <td><textarea id="Equipos" class="form-control" title="Equipos y máquinas que se utilizan. 
                                                  Capacidad de producción por máquina (Cantidad de producto / unidad de tiempo)"></textarea></td>
                                                  <td><button class="btn btn-info" onclick="guardar()">Guardar</button></td>
                                </tr>
                            </table>
                            <br><br> 
                            <%
                                ActividadesVO aVO;
                                ActividadesDAO aDAO = new ActividadesDAO();
                                ArrayList<ActividadesVO> aAL = new ArrayList();

                                aAL = aDAO.all_Actividades(pv.getIdProducto());
                                if (aAL.isEmpty()) {

                                } else {
                            %>
                            <table class="table table-bordered">
                                <tr>
                                    <th>Actividad</th>
                                    <th>Tiempo</th>
                                    <th>Cargos</th>
                                    <th>Número de cargos</th>
                                    <th>Equipos</th>
                                    <th></th>
                                </tr>
                                <%
                                for(int w = 0; w < aAL.size(); w++){
                                    aVO = aAL.get(w);
                                    
                                
                                %>
                                <tr id="tr<%=aVO.getIdActividad()%>">
                                    <td><%=aVO.getActividad()%></td> 
                                    <td><%=aVO.getTiempo()%></td>
                                    <td><%=aVO.getCargos()%></td>
                                    <td><%=aVO.getN_cargos()%></td>
                                    <td><%=aVO.getEquipos()%></td>
                                    <td>
                                        <button class="btn btn-success" title="Editar" onclick="consulta(<%=aVO.getIdActividad()%>)"><span class="glyphicon glyphicon-edit"></span></button>
                                         <button class="btn btn-danger" title="Borrar" onclick="borrar(<%=aVO.getIdActividad()%>)"><span class="glyphicon glyphicon-remove"></span></button>
                                          
                                    </td>
                                </tr>
                                
                                <%}%>
                            </table>
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
        <script src="../js/sweetalert.min.js" type="text/javascript"></script>
        <script src="../js/expanding.jquery.js" type="text/javascript"></script>
        <script src="../js/expanding.js" type="text/javascript"></script>
        <script src="../js/ajax/Actividades.js" type="text/javascript"></script>
        <script>
            $('textarea').expanding();
            $('textarea').tooltip();
            $('input').tooltip();
        </script>
    </body>
</html>
