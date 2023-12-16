<%-- 
    Document   : Cliente_Consumidor
    Created on : 16/10/2017, 12:16:52 PM
    Author     : mayrayesenia
--%>

<%@page import="DAO.ProyectoDAO"%>
<%@page import="VO.ProyectoVO"%>
<%@page import="DAO.ConsumidorDAO"%>
<%@page import="VO.ConsumidorVO"%>
<%@page import="DAO.ClienteDAO"%>
<%@page import="VO.ClienteVO"%>
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
        <title>Proyeccion</title>
        <link href="../css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="../css/simple-sidebar.css" rel="stylesheet" type="text/css"/>
        <link href="../css/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <link href="../css/sweetalert.css" rel="stylesheet" type="text/css"/>
        <link rel="shortcut icon" type="image/x-icon" href="../img/demostrarLogo3.ico">
        <link href="../css/intento.css" rel="stylesheet" type="text/css"/>
        <script src="../js/jquery.min.js" type="text/javascript"></script>
         <script src="../js/bootstrap.min.js" type="text/javascript"></script>
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
                                    <br><img src="../img/Mis_Iconos/cliente.png" alt="" class="dos"/>
                                </div>
                                <div class="col-md-6 col-xs-6" align="left">
                                    <h1 >Cliente y/o Consumidor</h1>
                                    <h3 >(<%=pv.getNombre()%>)</h3><br>

                                </div>
                            </div>
                            <center>
                                <div class="row">
                                    <div class="col-md-6">
                                        <button  class="botoncitos" data-toggle="modal" data-target="#Ins_Cliente">Cliente</button>
                                    </div>
                                    <div class="col-md-6 ">
                                        <button  class="botoncitos2" data-toggle="modal" data-target="#Ins_Consumidor">Consumidor</button>
                                    </div>
                                </div>
                            </center>
                            <div id="Ins_Cliente" class="modal fade" role="dialog">
                                <div class="modal-dialog">

                                    <!-- Modal content-->
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            <h4 class="modal-title">Cliente</h4>
                                        </div>
                                        <div class="modal-body">
                                            <div id="primero" >
                                                <label class="label label-success">Perfil</label>
                                                <textarea class="form-control" id="Perfil" title="Describa el perfil de su cliente"></textarea><br>
                                                <label class="label label-success">Localización</label>
                                                <textarea class="form-control" id="Localizacion" title="Describa su localización"></textarea><br>
                                                <label class="label label-success">Justificación</label>
                                                <textarea class="form-control" id="Justificacion" title="Justifique las razones de su elección"></textarea><br>
                                                <label class="label label-success">Satisfacción</label>
                                                <textarea class="form-control" id="Satisfaccion" title="¿Cuáles son las necesidades que usted
                                                          espera satisfacer de sus potenciales clintes?"></textarea><br>

                                                <button class="btn btn-info" onclick="siguiente()">Siguiente <span class="glyphicon glyphicon-chevron-right"></span></button>
                                            </div>
                                            <div id="segundo" class="panelsito">
                                                <label class="label label-success">Volumen Compra</label>
                                                <textarea class="form-control" id="Volumen_compra" title="¿Cuáles son los volúmenes y su
                                                          frecuencuia de compra?"></textarea><br>
                                                <label class="label label-success">Características</label>
                                                <textarea class="form-control" id="Caracteristicas" title="¿Qué características se exigen para la compra? 
                                                          (EJ: calidades, presentación - empaque)"></textarea><br>
                                                <label class="label label-success">Sitio compra</label>
                                                <textarea class="form-control" id="Sitio_compra" title=""></textarea><br>
                                                <label class="label label-success">Forma de pago</label>
                                                <textarea class="form-control" id="Forma_pago" title=""></textarea><br>
                                                <label class="label label-success">Precio</label>
                                                <textarea class="form-control" id="Precio" title=""></textarea><br>
                                                <label class="label label-success">Requisitos post-venta</label>
                                                <textarea class="form-control" id="Requisitos_posventa" title=""></textarea><br>
                                                <label class="label label-success">Garantías</label>
                                                <textarea class="form-control" id="Garantias" title=""></textarea><br>
                                                <label class="label label-success">Margen de comercialización</label>
                                                <textarea class="form-control" id="Margen_comercial" title=""></textarea><br>
                                                <button class="btn btn-info" onclick="atras()"><span class="glyphicon glyphicon-chevron-left"></span> Atrás</button>
                                                <button class="btn btn-success" onclick="guardar()">Guardar</button>
                                            </div>
                                        </div>
                                        <div class="modal-footer">

                                            <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                                        </div>
                                    </div>

                                </div>
                            </div>





                            <div id="Ins_Consumidor" class="modal fade" role="dialog">
                                <div class="modal-dialog">

                                    <!-- Modal content-->
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            <h4 class="modal-title">Consumidor</h4>
                                        </div>
                                        <div class="modal-body">
                                            <div id="primeroc" >
                                                <label class="label label-success">Perfil</label>
                                                <textarea class="form-control" id="Perfilc" title="Describa el perfil de su consumidor"></textarea><br>
                                                <label class="label label-success">Localización</label>
                                                <textarea class="form-control" id="Localizacionc" title="Describa su localización"></textarea><br>
                                                <label class="label label-success">Justificación</label>
                                                <textarea class="form-control" id="Justificacionc" title="Justifique las razones de su elección"></textarea><br>
                                                <label class="label label-success">Satisfacción</label>
                                                <textarea class="form-control" id="Satisfaccionc" title="¿Cuáles son las necesidades que usted
                                                          espera satisfacer de sus potenciales consumidores?"></textarea><br>

                                                <button class="btn btn-info" onclick="siguientec()">Siguiente <span class="glyphicon glyphicon-chevron-right"></span></button>
                                            </div>
                                            <div id="segundoc" class="panelsito">
                                                <label class="label label-success">Donde compra</label>
                                                <textarea class="form-control" id="Donde_comprac" title="Describa el perfil de su consumidor"></textarea><br>
                                                <label class="label label-success">Características</label>
                                                <textarea class="form-control" id="Caracteristicasc" title="Describa el perfil de su consumidor"></textarea><br>
                                                <label class="label label-success">Frecuencia</label>
                                                <textarea class="form-control" id="Frecuenciac" title="Describa el perfil de su consumidor"></textarea><br>
                                                <label class="label label-success">Precio</label>
                                                <textarea class="form-control" id="Precioc" title="Describa el perfil de su consumidor"></textarea><br>
                                                
                                                <button class="btn btn-info" onclick="atrasc()"><span class="glyphicon glyphicon-chevron-left"></span> Atrás</button>
                                                <button class="btn btn-success" onclick="guardarc()">Guardar</button>
                                            </div>
                                        </div>
                                        <div class="modal-footer">

                                            <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <%
                                ArrayList<ClienteVO> acli = new ArrayList();
                                ClienteVO cliVO;
                                ClienteDAO cliDAO = new ClienteDAO();

                                acli = cliDAO.consultar_All(pv.getIdProducto());

                                for (int a = 0; a < acli.size(); a++) {
                                    cliVO = acli.get(a);

                            %>
                            <br><br>

                            <table class="table table-bordered">
                                <tr>
                                    <td colspan="2"><center><h3>Cliente</h3></center></td>
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

                                <tr>
                                    <td colspan="2">
                                        <button class="btn btn-success" title="Actualizar" data-toggle="modal" data-target="#Act_Cliente<%=cliVO.getIdCliente()%>" ><span class="glyphicon glyphicon-edit"></span></button>
                                        <button class="btn btn-danger" title="Borrar" onclick="eliminar(<%=cliVO.getIdCliente()%>)"><span class="glyphicon glyphicon-remove"></span></button>
                                    </td>

                                </tr>
                            </table>

                            <div id="Act_Cliente<%=cliVO.getIdCliente()%>" class="modal fade" role="dialog">
                                <div class="modal-dialog">

                                    <!-- Modal content-->
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            <h4 class="modal-title">Cliente Actualizar</h4>
                                        </div>
                                        <div class="modal-body">
                                            <div id="primero<%=cliVO.getIdCliente()%>" >
                                                <label class="label label-success">Perfil</label>
                                                <textarea class="form-control" id="aPerfil" title="Describa el perfil de su cliente"><%=cliVO.getPerfil()%></textarea><br>
                                                <label class="label label-success">Localización</label>
                                                <textarea class="form-control" id="aLocalizacion" title="Describa su localización"><%=cliVO.getLocalizacion()%></textarea><br>
                                                <label class="label label-success">Justificación</label>
                                                <textarea class="form-control" id="aJustificacion" title="Justifique las razones de su elección"><%=cliVO.getJustificacion()%></textarea><br>
                                                <label class="label label-success">Satisfacción</label>
                                                <textarea class="form-control" id="aSatisfaccion" title="¿Cuáles son las necesidades que usted
                                                          espera satisfacer de sus potenciales clintes?"><%=cliVO.getSatisfaccion()%></textarea><br>

                                                <button class="btn btn-info" onclick="siguiente<%=cliVO.getIdCliente()%>()">Siguiente <span class="glyphicon glyphicon-chevron-right"></span></button>
                                            </div>
                                            <div id="segundo<%=cliVO.getIdCliente()%>" class="panelsito">
                                                <label class="label label-success">Volumen Compra</label>
                                                <textarea class="form-control" id="aVolumen_compra" title="¿Cuáles son los volúmenes y su
                                                          frecuencuia de compra?"><%=cliVO.getVolumen_compra()%></textarea><br>
                                                <label class="label label-success">Características</label>
                                                <textarea class="form-control" id="aCaracteristicas" title="¿Qué características se exigen para la compra? 
                                                          (EJ: calidades, presentación - empaque)"><%=cliVO.getCaracteristicas()%></textarea><br>
                                                <label class="label label-success">Sitio compra</label>
                                                <textarea class="form-control" id="aSitio_compra" title=""><%=cliVO.getSitio_compra()%></textarea><br>
                                                <label class="label label-success">Forma de pago</label>
                                                <textarea class="form-control" id="aForma_pago" title=""><%=cliVO.getForma_pago()%></textarea><br>
                                                <label class="label label-success">Precio</label>
                                                <textarea class="form-control" id="aPrecio" title=""><%=cliVO.getPrecio()%></textarea><br>
                                                <label class="label label-success">Requisitos post-venta</label>
                                                <textarea class="form-control" id="aRequisitos_posventa" title=""><%=cliVO.getRequisitos_posventa()%></textarea><br>
                                                <label class="label label-success">Garantías</label>
                                                <textarea class="form-control" id="aGarantias" title=""><%=cliVO.getGarantias()%></textarea><br>
                                                <label class="label label-success">Margen de comercialización</label>
                                                <textarea class="form-control" id="aMargen_comercial" title=""><%=cliVO.getMargen_comercial()%></textarea><br>

                                                <button class="btn btn-info" onclick="atras<%=cliVO.getIdCliente()%>()"><span class="glyphicon glyphicon-chevron-left"></span> Atrás</button>
                                                <button class="btn btn-success" onclick="actualizar(<%=cliVO.getIdCliente()%>)">Actualizar</button>
                                            </div>
                                        </div>
                                        <div class="modal-footer">

                                            <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <script>
                                function siguiente<%=cliVO.getIdCliente()%>() {
                                    var pri = $('#primero<%=cliVO.getIdCliente()%>');
                                    var seg = $('#segundo<%=cliVO.getIdCliente()%>');

                                    pri.hide(1000);
                                    seg.show(1000);
                                }

                                function atras<%=cliVO.getIdCliente()%>() {
                                    var pri = $('#primero<%=cliVO.getIdCliente()%>');
                                    var seg = $('#segundo<%=cliVO.getIdCliente()%>');

                                    pri.show(1000);
                                    seg.hide(1000);
                                }
                            </script> 
                            <%}%>
                            
                            <%
                            ArrayList<ConsumidorVO> aconsumi = new ArrayList();
                            ConsumidorVO cVO;
                            ConsumidorDAO consumiDAO = new ConsumidorDAO();
                            aconsumi = consumiDAO.consultar_All(pv.getIdProducto());
                            
                            for(int g = 0;g < aconsumi.size(); g ++){
                                cVO = aconsumi.get(g);
                            
                                
                            %>
                            <table class="table table-bordered">
                                 <tr>
                                    <td colspan="2"><center><h3>Consumidor</h3></center></td>
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
                                
                                 <tr>
                                    <td colspan="2">
                                        <button class="btn btn-success" title="Actualizar" data-toggle="modal" data-target="#Act_Consumidor<%=cVO.getIdConsumidor()%>" ><span class="glyphicon glyphicon-edit"></span></button>
                                        <button class="btn btn-danger" title="Borrar" onclick="eliminarc(<%=cVO.getIdConsumidor()%>)"><span class="glyphicon glyphicon-remove"></span></button>
                                    </td>

                                </tr>
                            </table>
                                    <div id="Act_Consumidor<%=cVO.getIdConsumidor()%>" class="modal fade" role="dialog">
                                <div class="modal-dialog">

                                    <!-- Modal content-->
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            <h4 class="modal-title">Actualizar Consumidor</h4>
                                        </div>
                                        <div class="modal-body">
                                            <div id="primeroc<%=cVO.getIdConsumidor()%>" >
                                                <label class="label label-success">Perfil</label>
                                                <textarea class="form-control" id="aPerfilc" title="Describa el perfil de su consumidor"><%=cVO.getPerfil()%></textarea><br>
                                                <label class="label label-success">Localización</label>
                                                <textarea class="form-control" id="aLocalizacionc" title="Describa su localización"><%=cVO.getLocalizacion()%></textarea><br>
                                                <label class="label label-success">Justificación</label>
                                                <textarea class="form-control" id="aJustificacionc" title="Justifique las razones de su elección"><%=cVO.getJustificacion()%></textarea><br>
                                                <label class="label label-success">Satisfacción</label>
                                                <textarea class="form-control" id="aSatisfaccionc" title="¿Cuáles son las necesidades que usted
                                                          espera satisfacer de sus potenciales consumidores?"><%=cVO.getSatisfaccion()%></textarea><br>

                                                <button class="btn btn-info" onclick="siguientec<%=cVO.getIdConsumidor()%>()">Siguiente <span class="glyphicon glyphicon-chevron-right"></span></button>
                                            </div>
                                            <div id="segundoc<%=cVO.getIdConsumidor()%>" class="panelsito">
                                                <label class="label label-success">Donde compra</label>
                                                <textarea class="form-control" id="aDonde_comprac" title="Describa el perfil de su consumidor"><%=cVO.getDonde_compra()%></textarea><br>
                                                <label class="label label-success">Características</label>
                                                <textarea class="form-control" id="aCaracteristicasc" title="Describa el perfil de su consumidor"><%=cVO.getCaracteristicas()%></textarea><br>
                                                <label class="label label-success">Frecuencia</label>
                                                <textarea class="form-control" id="aFrecuenciac" title="Describa el perfil de su consumidor"><%=cVO.getFrecuencia()%></textarea><br>
                                                <label class="label label-success">Precio</label>
                                                <textarea class="form-control" id="aPrecioc" title="Describa el perfil de su consumidor"><%=cVO.getPrecio()%></textarea><br>
                                                
                                                <button class="btn btn-info" onclick="atrasc<%=cVO.getIdConsumidor()%>()"><span class="glyphicon glyphicon-chevron-left"></span> Atrás</button>
                                                <button class="btn btn-success" onclick="actualizarc(<%=cVO.getIdConsumidor()%>)">Actualizar</button>
                                            </div>
                                        </div>
                                        <div class="modal-footer">

                                            <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                                        </div>
                                    </div>

                                </div>
                            </div>
                                <script>
                                function siguientec<%=cVO.getIdConsumidor()%>() {
                                    var pri = $('#primeroc<%=cVO.getIdConsumidor()%>');
                                    var seg = $('#segundoc<%=cVO.getIdConsumidor()%>');

                                    pri.hide(1000);
                                    seg.show(1000);
                                }

                                function atrasc<%=cVO.getIdConsumidor()%>() {
                                    var pri = $('#primeroc<%=cVO.getIdConsumidor()%>');
                                    var seg = $('#segundoc<%=cVO.getIdConsumidor()%>');

                                    pri.show(1000);
                                    seg.hide(1000);
                                }
                            </script>
                            <%}%>
                        </div>
                    </div>
                </div>
                <%@include file="../WEB-INF/masterpage/footer.jspf"%>
            </div>
        </div>
        <script src="../js/jquery-ui.min.js" type="text/javascript"></script>
        <script src="../js/menu.js" type="text/javascript"></script>
        <script src="../js/sweetalert.min.js" type="text/javascript"></script> 
        <script src="../js/ajax/Consumidor.js" type="text/javascript"></script>
        <script src="../js/ajax/Cliente.js" type="text/javascript"></script>
        <script>
                                                $('textarea').tooltip();
        </script>
    </body>
</html>
