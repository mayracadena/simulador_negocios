<%-- 
    Document   : Insumo
    Created on : 21/10/2016, 10:27:38 AM
    Author     : mayracadena
--%>

<%@page import="DAO.ProyectoDAO"%>
<%@page import="VO.ProyectoVO"%>
<%@page import="VO.InfInsumoVO"%>
<%@page import="DAO.InfInsumoDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.InsumoDAO"%>
<%@page import="VO.InsumosVO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="VO.ProductoVO"%>
<%@page import="VO.UsuarioVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Insumo</title>
        <link href="../css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="../css/simple-sidebar.css" rel="stylesheet" type="text/css"/>
        <link href="../css/sweetalert.css" rel="stylesheet" type="text/css"/>
        <link rel="shortcut icon" type="image/x-icon" href="../img/demostrarLogo3.ico">
        <link href="../css/intento.css" rel="stylesheet" type="text/css"/>
    </head>
    <body >
        <%
            HttpSession hs = request.getSession();
            Integer idp = (Integer) hs.getAttribute("idproyectito");
            UsuarioVO idu = (UsuarioVO) hs.getAttribute("usuarioAll");

            DecimalFormat formato = new DecimalFormat("###,###,###.#");

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
                                 <center>
                                    <div >
                                        <br><img src="../img/Mis_Iconos/insumos.png" alt="" class="dos"/>
                                    </div>
                                    <div >
                                        <h1>Estrategias administrativas y financieras</h1>
                                        <h3 >(<%=pv.getNombreP()%>)</h3><br>
                                    </div>
                                 </center>
                                </div>
                           
                                 <div class="row">
                                <div class="col-md-4">
                                        <label class="label label-info">Tipo Insumo</label>
                                        <select class="form-control" id="TipoInsumo">
                                            <%
                                                Integer opcionInsumos = (Integer) hs.getAttribute("opcionInsumos");
                                                if (opcionInsumos == null) {
                                                    opcionInsumos = 0;
                                                }
                                                InsumosVO ivo;
                                                InsumoDAO idao = new InsumoDAO();
                                                ArrayList<InsumosVO> a = new ArrayList();

                                                a = idao.buscar();
                                                
                                                if (opcionInsumos == 0 || opcionInsumos == 1) {
                                                for (int i = 0; i < a.size(); i++) {
                                                    ivo = a.get(i);
                                            %>
                                            <option value="<%=ivo.getIdInsumo()%>"><%=ivo.getTipoInsumo()%></option>
                                            <%}}
                                            if (opcionInsumos == 2) { %>
                                                   
                                            
                                            <option value="2">Rotación Cartera Clientes</option>
                                            <option value="3">Provisión Cuentas por Cobrar</option>
                                            <option value="4">Invent. Prod. Final Rotación</option>
                                            <option value="5">Invent. Prod. en Proceso Rotación </option>
                                            <option value="6">Invent. Materia Prima Rotación </option>
                                            <option value="7">Anticipos y Otras Cuentas por Cobar</option>
                                            <option value="8">Cuentas por Pagar Proveedores</option>
                                            <option value="9">Acreedores Varios</option>
                                            <option value="10">Otros Pasivos</option>
                                            <option value="11">Capital Adicional Socios</option>
                                            <option value="12">Dividendos</option>
                                            <option value="13">Valor Ajustado</option>
                                            <option value="1">Rebaja</option>
                                            
                                       
                                               <% } if (opcionInsumos == 3) {%> 
                                            
                                            <option value="3">Provisión Cuentas por Cobrar</option>
                                            <option value="4">Invent. Prod. Final Rotación</option>
                                            <option value="5">Invent. Prod. en Proceso Rotación </option>
                                            <option value="6">Invent. Materia Prima Rotación </option>
                                            <option value="7">Anticipos y Otras Cuentas por Cobar</option>
                                            <option value="8">Cuentas por Pagar Proveedores</option>
                                            <option value="9">Acreedores Varios</option>
                                            <option value="10">Otros Pasivos</option>
                                            <option value="11">Capital Adicional Socios</option>
                                            <option value="12">Dividendos</option>
                                            <option value="13">Valor Ajustado</option>
                                            <option value="1">Rebaja</option>
                                            <option value="2">Rotación Cartera Clientes</option>
                                              
                                             <% } if (opcionInsumos == 4) {%> 
                                            
                                            <option value="4">Invent. Prod. Final Rotación</option>
                                            <option value="5">Invent. Prod. en Proceso Rotación </option>
                                            <option value="6">Invent. Materia Prima Rotación </option>
                                            <option value="7">Anticipos y Otras Cuentas por Cobar</option>
                                            <option value="8">Cuentas por Pagar Proveedores</option>
                                            <option value="9">Acreedores Varios</option>
                                            <option value="10">Otros Pasivos</option>
                                            <option value="11">Capital Adicional Socios</option>
                                            <option value="12">Dividendos</option>
                                            <option value="13">Valor Ajustado</option>
                                            <option value="1">Rebaja</option>
                                            <option value="2">Rotación Cartera Clientes</option>
                                            <option value="3">Provisión Cuentas por Cobrar</option>
                                               <%}%>
                                               <%  if (opcionInsumos == 5) {%> 
                                            
                                            <option value="5">Invent. Prod. en Proceso Rotación </option>
                                            <option value="6">Invent. Materia Prima Rotación </option>
                                            <option value="7">Anticipos y Otras Cuentas por Cobar</option>
                                            <option value="8">Cuentas por Pagar Proveedores</option>
                                            <option value="9">Acreedores Varios</option>
                                            <option value="10">Otros Pasivos</option>
                                            <option value="11">Capital Adicional Socios</option>
                                            <option value="12">Dividendos</option>
                                            <option value="13">Valor Ajustado</option>
                                            <option value="1">Rebaja</option>
                                            <option value="2">Rotación Cartera Clientes</option>
                                            <option value="3">Provisión Cuentas por Cobrar</option>
                                            <option value="4">Invent. Prod. Final Rotación</option>
                                               <%}%>
                                                <%  if (opcionInsumos == 6) {%> 
                                            
                                            <option value="6">Invent. Materia Prima Rotación </option>
                                            <option value="7">Anticipos y Otras Cuentas por Cobar</option>
                                            <option value="8">Cuentas por Pagar Proveedores</option>
                                            <option value="9">Acreedores Varios</option>
                                            <option value="10">Otros Pasivos</option>
                                            <option value="11">Capital Adicional Socios</option>
                                            <option value="12">Dividendos</option>
                                            <option value="13">Valor Ajustado</option>
                                            <option value="1">Rebaja</option>
                                            <option value="2">Rotación Cartera Clientes</option>
                                            <option value="3">Provisión Cuentas por Cobrar</option>
                                            <option value="4">Invent. Prod. Final Rotación</option>
                                            <option value="5">Invent. Prod. en Proceso Rotación </option>
                                               <%}%>
                                                <%  if (opcionInsumos == 7) {%> 
                                            
                                            <option value="7">Anticipos y Otras Cuentas por Cobar</option>
                                            <option value="8">Cuentas por Pagar Proveedores</option>
                                            <option value="9">Acreedores Varios</option>
                                            <option value="10">Otros Pasivos</option>
                                            <option value="11">Capital Adicional Socios</option>
                                            <option value="12">Dividendos</option>
                                            <option value="13">Valor Ajustado</option>
                                            <option value="1">Rebaja</option>
                                            <option value="2">Rotación Cartera Clientes</option>
                                            <option value="3">Provisión Cuentas por Cobrar</option>
                                            <option value="4">Invent. Prod. Final Rotación</option>
                                            <option value="5">Invent. Prod. en Proceso Rotación </option>
                                            <option value="6">Invent. Materia Prima Rotación </option>
                                               <%}%>
                                                <%  if (opcionInsumos == 8) {%> 
                                            
                                            <option value="8">Cuentas por Pagar Proveedores</option>
                                            <option value="9">Acreedores Varios</option>
                                            <option value="10">Otros Pasivos</option>
                                            <option value="11">Capital Adicional Socios</option>
                                            <option value="12">Dividendos</option>
                                            <option value="13">Valor Ajustado</option>
                                            <option value="1">Rebaja</option>
                                            <option value="2">Rotación Cartera Clientes</option>
                                            <option value="3">Provisión Cuentas por Cobrar</option>
                                            <option value="4">Invent. Prod. Final Rotación</option>
                                            <option value="5">Invent. Prod. en Proceso Rotación </option>
                                            <option value="6">Invent. Materia Prima Rotación </option>
                                            <option value="7">Anticipos y Otras Cuentas por Cobar</option>
                                               <%}%>
                                                <%  if (opcionInsumos == 9) {%> 
                                            
                                            <option value="9">Acreedores Varios</option>
                                            <option value="10">Otros Pasivos</option>
                                            <option value="11">Capital Adicional Socios</option>
                                            <option value="12">Dividendos</option>
                                            <option value="13">Valor Ajustado</option>
                                            <option value="1">Rebaja</option>
                                            <option value="2">Rotación Cartera Clientes</option>
                                            <option value="3">Provisión Cuentas por Cobrar</option>
                                            <option value="4">Invent. Prod. Final Rotación</option>
                                            <option value="5">Invent. Prod. en Proceso Rotación </option>
                                            <option value="6">Invent. Materia Prima Rotación </option>
                                            <option value="7">Anticipos y Otras Cuentas por Cobar</option>
                                            <option value="8">Cuentas por Pagar Proveedores</option>
                                               <%}%>
                                                <%  if (opcionInsumos == 10) {%> 
                                            
                                            <option value="10">Otros Pasivos</option>
                                            <option value="11">Capital Adicional Socios</option>
                                            <option value="12">Dividendos</option>
                                            <option value="13">Valor Ajustado</option>
                                            <option value="1">Rebaja</option>
                                            <option value="2">Rotación Cartera Clientes</option>
                                            <option value="3">Provisión Cuentas por Cobrar</option>
                                            <option value="4">Invent. Prod. Final Rotación</option>
                                            <option value="5">Invent. Prod. en Proceso Rotación </option>
                                            <option value="6">Invent. Materia Prima Rotación </option>
                                            <option value="7">Anticipos y Otras Cuentas por Cobar</option>
                                            <option value="8">Cuentas por Pagar Proveedores</option>
                                            <option value="9">Acreedores Varios</option>
                                               <%}%>
                                                <%  if (opcionInsumos == 11) {%> 
                                            
                                            <option value="11">Capital Adicional Socios</option>
                                            <option value="12">Dividendos</option>
                                            <option value="13">Valor Ajustado</option>
                                            <option value="1">Rebaja</option>
                                            <option value="2">Rotación Cartera Clientes</option>
                                            <option value="3">Provisión Cuentas por Cobrar</option>
                                            <option value="4">Invent. Prod. Final Rotación</option>
                                            <option value="5">Invent. Prod. en Proceso Rotación </option>
                                            <option value="6">Invent. Materia Prima Rotación </option>
                                            <option value="7">Anticipos y Otras Cuentas por Cobar</option>
                                            <option value="8">Cuentas por Pagar Proveedores</option>
                                            <option value="9">Acreedores Varios</option>
                                            <option value="10">Otros Pasivos</option>
                                               <%}%>
                                                <%  if (opcionInsumos == 12) {%> 
                                            
                                            <option value="12">Dividendos</option>
                                            <option value="13">Valor Ajustado</option>
                                            <option value="1">Rebaja</option>
                                            <option value="2">Rotación Cartera Clientes</option>
                                            <option value="3">Provisión Cuentas por Cobrar</option>
                                            <option value="4">Invent. Prod. Final Rotación</option>
                                            <option value="5">Invent. Prod. en Proceso Rotación </option>
                                            <option value="6">Invent. Materia Prima Rotación </option>
                                            <option value="7">Anticipos y Otras Cuentas por Cobar</option>
                                            <option value="8">Cuentas por Pagar Proveedores</option>
                                            <option value="9">Acreedores Varios</option>
                                            <option value="10">Otros Pasivos</option>
                                            <option value="11">Capital Adicional Socios</option>
                                               <%}%>
                                                <%  if (opcionInsumos == 13) {%> 
                                            
                                            <option value="13">Valor Ajustado</option>
                                            <option value="1">Rebaja</option>
                                            <option value="2">Rotación Cartera Clientes</option>
                                            <option value="3">Provisión Cuentas por Cobrar</option>
                                            <option value="4">Invent. Prod. Final Rotación</option>
                                            <option value="5">Invent. Prod. en Proceso Rotación </option>
                                            <option value="6">Invent. Materia Prima Rotación </option>
                                            <option value="7">Anticipos y Otras Cuentas por Cobar</option>
                                            <option value="8">Cuentas por Pagar Proveedores</option>
                                            <option value="9">Acreedores Varios</option>
                                            <option value="10">Otros Pasivos</option>
                                            <option value="11">Capital Adicional Socios</option>
                                            <option value="12">Dividendos</option>
                                               <%}%>
                                        </select>
                                    </div>
                                        <div>
                                            
                                        
                                        
                                    </div>
                                </div>
                                <br><br> 
                                
                                <div id="Mensaje_ayuda" class="alert alert-info ">
                                    
                                </div>
                                
                                        <%
                                            for (int i = 1; i <= 13; i++) {

                                                InfInsumoDAO iDao = new InfInsumoDAO();
                                                ArrayList<InfInsumoVO> inf = new ArrayList();
                                                InfInsumoVO ifivo;
                                                inf = iDao.Todo(idp, i);
                                               


                                        %>

                                        <table class="table table-bordered table-hover" id="tablita<%=i%>" hidden="">
                                            <thead>
                                            <th class="col-md-4 col-xs-4">Valor</th>
                                            <th class="col-md-4 col-xs-4">Año</th>
                                            <th class="col-md-1 col-xs-1"></th>
                                            </thead> 
                                            <%
                                                for (int y = 0; y < inf.size(); y++) {
                                                    ifivo = inf.get(y);

                                            %>
                                            <tr id="tr<%=ifivo.getIdInfInsumo()%>">
                                                <td><%=formato.format(ifivo.getValor())%></td>
                                                <td><div class="text-center"><%=ifivo.getYear()%></div></td>
                                                <td><button  class="btn btn-default" onclick="update(<%=ifivo.getIdInfInsumo()%>)" title="Editar"><span class="glyphicon glyphicon-edit"></span></button></td>
                                            </tr>
                                            <%}%>

                                        </table>    

                                        <%          
                                            }
                                        %>
                                    
                           
                        </div>
                    </div>  
                </div>
                <%@include file="../WEB-INF/masterpage/footer.jspf"%>
            </div>
        </div>
        <script src="../js/jquery.min.js" type="text/javascript"></script>
        <script src="../js/menu.js" type="text/javascript"></script>
        <script src="../js/sweetalert.min.js" type="text/javascript"></script>
        <script src="../js/ajax/Insumo.js" type="text/javascript"></script>
    </body>
</html>
