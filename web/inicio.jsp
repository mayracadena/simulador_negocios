<%-- 
    Document   : inicio
    Created on : 18/08/2016, 03:27:33 PM
    Author     : mayracadena
--%>

<%@page import="DAO.ProyectoDAO"%>
<%@page import="VO.ProyectoVO"%>
<%@page import="VO.UsuarioVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type"  charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Inicio</title>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="css/intento.css" rel="stylesheet" type="text/css"/>
        <link href="css/sweetalert.css" rel="stylesheet" type="text/css"/>
        <link rel="shortcut icon" type="image/x-icon" href="img/demostrarLogo3.ico">
    </head>
    <body>
        <%
            HttpSession hs = request.getSession();
            Integer idp = null;
            UsuarioVO idu = null;

            try {

                idu = (UsuarioVO) hs.getAttribute("usuarioAll");
                idp = (Integer) hs.getAttribute("idproyectito");

                ProyectoVO pv = null;
                ProyectoDAO pd = new ProyectoDAO();
                pv = pd.read(idp);


        %>


        <br>
        <%@include file="WEB-INF/masterpage/header.jspf" %>
        <div class="container-fluid">


            <br>
            <h1 class="text-center">¡Mi Plan De Negocios!</h1>
            <h3 class="text-center">(<%=pv.getNombreP()%>)</h3><br>

            <% if(pv.getIdEtapa() == 1){
                
                if (pv.getIdEspecialidad() == 1) {  %>
            <center>
                <a href="aprendiz/Instrucciones.jsp" class="btn btn-default"><img src="img/Mis_Iconos/Instrucciones.png" alt="" class="pequena " /><br><label>Instrucciones</label></a>
                <a href="aprendiz/Proyecto.jsp" class="btn btn-default"><img src="img/Mis_Iconos/Mi_Proyecto.png" alt="" class="pequena " /><br><label>1. Mi Proyecto</label></a>
                <a href="aprendiz/Mercado.jsp" class="btn btn-default"><img src="img/Mis_Iconos/mercado.png" alt="" class="pequena"/><br><label>2. Mercado</label></a>
                <a href="aprendiz/eOrganizacional.jsp" class="btn btn-default"><img src="img/Mis_Iconos/Dofa.png" alt="" class="pequena"/><br><label>3. E. Organizacional</label></a>
                <a href="aprendiz/Producto.jsp" class="btn btn-default"><img src="img/Mis_Iconos/productos.png" alt="" class="pequena"/><br><label>4. Productos</label></a>
                <a href="aprendiz/Inversion.jsp" class="btn btn-default"><img src="img/Mis_Iconos/inversion.png" alt="" class="pequena"/><br><label>5. Inversión</label></a>
                <a href="aprendiz/InversionDiferida.jsp" class="btn btn-default"><img src="img/Mis_Iconos/Inversion_diferida.png" alt="" class="pequena"/><br><label>6. Inversión Diferida</label></a>
                <a href="aprendiz/Nomina.jsp" class="btn btn-default"><img src="img/Mis_Iconos/nomina.png" alt="" class="pequena"/><br><label>7. Nómina</label></a>
                <a href="aprendiz/GastosCostos.jsp" class="btn btn-default"><img src="img/Mis_Iconos/Gasto_Costo.png" alt="" class="pequena"/><br><label>8. Gastos y Costos</label></a>
                <a href="aprendiz/Financiacion.jsp" class="btn btn-default"><img src="img/Mis_Iconos/financiacion.png" alt="" class="pequena"/><br><label>9. Financiación</label></a>
                <a href="aprendiz/Resultados.jsp" class="btn btn-default"><img src="img/Mis_Iconos/resultados.png" alt="" class="pequena"/><br><label>10. Resultados</label></a>
                <a href="aprendiz/PyG.jsp" class="btn btn-default"><img src="img/Mis_Iconos/pyg.png" alt="" class="pequena"/><br><label>11. P&G</label></a>
                <a href="aprendiz/Balance.jsp" class="btn btn-default"><img src="img/Mis_Iconos/Balance.png" alt="" class="pequena"/><br><label>12. Balance</label></a>
                <a href="aprendiz/Admin.jsp" class="btn btn-default"><img src="img/Mis_Iconos/admin.png" alt="" class="pequena"/><br><label>Admin Proyecto</label></a>

            </center>
            <%     } else if (pv.getIdEspecialidad() == 2) { %>
            <center>
                <a href="aprendiz/Instrucciones.jsp" class="btn btn-default"><img src="img/Mis_Iconos/Instrucciones.png" alt="" class="pequena " /><br><label>Instrucciones</label></a>
                <a href="aprendiz/Proyecto.jsp" class="btn btn-default"><img src="img/Mis_Iconos/Mi_Proyecto.png" alt="" class="pequena " /><br><label>1. Mi Proyecto</label></a>
                <a href="aprendiz/Mercado.jsp" class="btn btn-default"><img src="img/Mis_Iconos/mercado.png" alt="" class="pequena"/><br><label>2. Mercado</label></a>
                <a href="aprendiz/eOrganizacional.jsp" class="btn btn-default"><img src="img/Mis_Iconos/Dofa.png" alt="" class="pequena"/><br><label>3. E. Organizacional</label></a>
                <a href="aprendiz/ePromocion.jsp" class="btn btn-default"><img src="img/Mis_Iconos/promocion.png" alt="" class="pequena"/><br><label>4. E. Promoción</label></a>
                

                <a href="aprendiz/Producto.jsp" class="btn btn-default"><img src="img/Mis_Iconos/productos.png" alt="" class="pequena"/><br><label>5. Productos</label></a>
                <a href="aprendiz/Inversion.jsp" class="btn btn-default"><img src="img/Mis_Iconos/inversion.png" alt="" class="pequena"/><br><label>6. Inversión</label></a>
                <a href="aprendiz/InversionDiferida.jsp" class="btn btn-default"><img src="img/Mis_Iconos/Inversion_diferida.png" alt="" class="pequena"/><br><label>7. Inversión Diferida</label></a>
                <a href="aprendiz/Nomina.jsp" class="btn btn-default"><img src="img/Mis_Iconos/nomina.png" alt="" class="pequena"/><br><label>8. Nómina</label></a>
                <a href="aprendiz/GastosCostos.jsp" class="btn btn-default"><img src="img/Mis_Iconos/Gasto_Costo.png" alt="" class="pequena"/><br><label>9. Gastos y Costos</label></a>
                <!--    <a href="aprendiz/KC.jsp" class="btn btn-default"><img src="img/iconos/bank.png" alt="" class="pequena"/><br><label>7. Capitál de Credito</label></a> 
                --> 
                <a href="aprendiz/Financiacion.jsp" class="btn btn-default"><img src="img/Mis_Iconos/financiacion.png" alt="" class="pequena"/><br><label>10. Financiación</label></a>
                <a href="aprendiz/Insumo.jsp" class="btn btn-default"><img src="img/Mis_Iconos/insumos.png" alt="" class="pequena"/><br><label>11. Insumos</label></a>

                <a href="aprendiz/Resultados.jsp" class="btn btn-default"><img src="img/Mis_Iconos/resultados.png" alt="" class="pequena"/><br><label>12. Resultados</label></a>
                <a href="aprendiz/InfInsumo.jsp" class="btn btn-default"><img src="img/Mis_Iconos/inf_insumos.png" alt="" class="pequena"/><br><label>13. Inf. Insumos</label></a>
                <a href="aprendiz/PyG.jsp" class="btn btn-default"><img src="img/Mis_Iconos/pyg.png" alt="" class="pequena"/><br><label>14. P&G</label></a>
                <a href="aprendiz/Balance.jsp" class="btn btn-default"><img src="img/Mis_Iconos/Balance.png" alt="" class="pequena"/><br><label>15. Balance</label></a>
                <a href="aprendiz/FlujoCaja.jsp" class="btn btn-default"><img src="img/Mis_Iconos/flujo_caja.png" alt="" class="pequena"/><br><label>16. Flujo de Caja</label></a>
                <a href="aprendiz/ResultadosFinales.jsp" class="btn btn-default"><img src="img/Mis_Iconos/resultados_finales.png" alt="" class="pequena"/><br><label>17. Resultados Finales</label></a>

                <a href="aprendiz/Admin.jsp" class="btn btn-default"><img src="img/Mis_Iconos/admin.png" alt="" class="pequena"/><br><label>Admin Proyecto</label></a>

            </center>
            <%      } else if (pv.getIdEspecialidad() == 3) { %>
            <center>
                <a href="aprendiz/Instrucciones.jsp" class="btn btn-default"><img src="img/Mis_Iconos/Instrucciones.png" alt="" class="pequena " /><br><label>Instrucciones</label></a>
                <a href="aprendiz/Proyecto.jsp" class="btn btn-default"><img src="img/Mis_Iconos/Mi_Proyecto.png" alt="" class="pequena " /><br><label>1. Mi Proyecto</label></a>
                <a href="aprendiz/Mercado.jsp" class="btn btn-default"><img src="img/Mis_Iconos/mercado.png" alt="" class="pequena"/><br><label>2. Mercado</label></a>
                <a href="aprendiz/eOrganizacional.jsp" class="btn btn-default"><img src="img/Mis_Iconos/Dofa.png" alt="" class="pequena"/><br><label>3. E. Organizacional</label></a>
                <a href="aprendiz/ePromocion.jsp" class="btn btn-default"><img src="img/Mis_Iconos/promocion.png" alt="" class="pequena"/><br><label>4. E. Promoción</label></a>
                <a href="aprendiz/eDistribucion.jsp" class="btn btn-default"><img src="img/Mis_Iconos/Distribucion.png" alt="" class="pequena"/><br><label>5.E. Distribuición</label></a>

                <a href="aprendiz/Producto.jsp" class="btn btn-default"><img src="img/Mis_Iconos/productos.png" alt="" class="pequena"/><br><label>6. Productos</label></a>
                <a href="aprendiz/Inversion.jsp" class="btn btn-default"><img src="img/Mis_Iconos/inversion.png" alt="" class="pequena"/><br><label>7. Inversión</label></a>
                <a href="aprendiz/InversionDiferida.jsp" class="btn btn-default"><img src="img/Mis_Iconos/Inversion_diferida.png" alt="" class="pequena"/><br><label>8. Inversión Diferida</label></a>
                <a href="aprendiz/Nomina.jsp" class="btn btn-default"><img src="img/Mis_Iconos/nomina.png" alt="" class="pequena"/><br><label>9. Nómina</label></a>
                <a href="aprendiz/GastosCostos.jsp" class="btn btn-default"><img src="img/Mis_Iconos/Gasto_Costo.png" alt="" class="pequena"/><br><label>10. Gastos y Costos</label></a>
                <!--    <a href="aprendiz/KC.jsp" class="btn btn-default"><img src="img/iconos/bank.png" alt="" class="pequena"/><br><label>7. Capitál de Credito</label></a> 
                --> 
                <a href="aprendiz/Financiacion.jsp" class="btn btn-default"><img src="img/Mis_Iconos/financiacion.png" alt="" class="pequena"/><br><label>11. Financiación</label></a>
                <a href="aprendiz/Insumo.jsp" class="btn btn-default"><img src="img/Mis_Iconos/insumos.png" alt="" class="pequena"/><br><label>12. Insumos</label></a>

                <a href="aprendiz/Resultados.jsp" class="btn btn-default"><img src="img/Mis_Iconos/resultados.png" alt="" class="pequena"/><br><label>13. Resultados</label></a>
                <a href="aprendiz/InfInsumo.jsp" class="btn btn-default"><img src="img/Mis_Iconos/inf_insumos.png" alt="" class="pequena"/><br><label>14. Inf. Insumos</label></a>
                <a href="aprendiz/PyG.jsp" class="btn btn-default"><img src="img/Mis_Iconos/pyg.png" alt="" class="pequena"/><br><label>15. P&G</label></a>
                <a href="aprendiz/Balance.jsp" class="btn btn-default"><img src="img/Mis_Iconos/Balance.png" alt="" class="pequena"/><br><label>16. Balance</label></a>
                <a href="aprendiz/FlujoCaja.jsp" class="btn btn-default"><img src="img/Mis_Iconos/flujo_caja.png" alt="" class="pequena"/><br><label>17. Flujo de Caja</label></a>
                <a href="aprendiz/ResultadosFinales.jsp" class="btn btn-default"><img src="img/Mis_Iconos/resultados_finales.png" alt="" class="pequena"/><br><label>18. Resultados Finales</label></a>

                <a href="aprendiz/Admin.jsp" class="btn btn-default"><img src="img/Mis_Iconos/admin.png" alt="" class="pequena"/><br><label>Admin Proyecto</label></a>

            </center>
            <%      } else if (pv.getIdEspecialidad() == 4) {%>
            <center>
                <a href="aprendiz/Instrucciones.jsp" class="btn btn-default"><img src="img/Mis_Iconos/Instrucciones.png" alt="" class="pequena " /><br><label>Instrucciones</label></a>
                <a href="aprendiz/Proyecto.jsp" class="btn btn-default"><img src="img/Mis_Iconos/Mi_Proyecto.png" alt="" class="pequena " /><br><label>1. Mi Proyecto</label></a>
                <a href="aprendiz/Mercado.jsp" class="btn btn-default"><img src="img/Mis_Iconos/mercado.png" alt="" class="pequena"/><br><label>2. Mercado</label></a>
                <a href="aprendiz/eOrganizacional.jsp" class="btn btn-default"><img src="img/Mis_Iconos/Dofa.png" alt="" class="pequena"/><br><label>3. E. Organizacional</label></a>
                <a href="aprendiz/Organizacion.jsp" class="btn btn-default"><img src="img/Mis_Iconos/Normativa.png" alt="" class="pequena"/><br><label>4. Organización</label></a>
                <a href="aprendiz/ePromocion.jsp" class="btn btn-default"><img src="img/Mis_Iconos/promocion.png" alt="" class="pequena"/><br><label>5. E. Promoción</label></a>
                <a href="aprendiz/eDistribucion.jsp" class="btn btn-default"><img src="img/Mis_Iconos/Distribucion.png" alt="" class="pequena"/><br><label>6.E. Distribuición</label></a>

                <a href="aprendiz/Producto.jsp" class="btn btn-default"><img src="img/Mis_Iconos/productos.png" alt="" class="pequena"/><br><label>7. Productos</label></a>
                <a href="aprendiz/Inversion.jsp" class="btn btn-default"><img src="img/Mis_Iconos/inversion.png" alt="" class="pequena"/><br><label>8. Inversión</label></a>
                <a href="aprendiz/InversionDiferida.jsp" class="btn btn-default"><img src="img/Mis_Iconos/Inversion_diferida.png" alt="" class="pequena"/><br><label>9. Inversión Diferida</label></a>
                <a href="aprendiz/Nomina.jsp" class="btn btn-default"><img src="img/Mis_Iconos/nomina.png" alt="" class="pequena"/><br><label>10. Nómina</label></a>
                <a href="aprendiz/GastosCostos.jsp" class="btn btn-default"><img src="img/Mis_Iconos/Gasto_Costo.png" alt="" class="pequena"/><br><label>11. Gastos y Costos</label></a>
                <!--    <a href="aprendiz/KC.jsp" class="btn btn-default"><img src="img/iconos/bank.png" alt="" class="pequena"/><br><label>7. Capitál de Credito</label></a> 
                --> 
                <a href="aprendiz/Financiacion.jsp" class="btn btn-default"><img src="img/Mis_Iconos/financiacion.png" alt="" class="pequena"/><br><label>12. Financiación</label></a>
                <a href="aprendiz/Insumo.jsp" class="btn btn-default"><img src="img/Mis_Iconos/insumos.png" alt="" class="pequena"/><br><label>13. Insumos</label></a>

                <a href="aprendiz/Resultados.jsp" class="btn btn-default"><img src="img/Mis_Iconos/resultados.png" alt="" class="pequena"/><br><label>14. Resultados</label></a>
                <a href="aprendiz/InfInsumo.jsp" class="btn btn-default"><img src="img/Mis_Iconos/inf_insumos.png" alt="" class="pequena"/><br><label>15. Inf. Insumos</label></a>
                <a href="aprendiz/PyG.jsp" class="btn btn-default"><img src="img/Mis_Iconos/pyg.png" alt="" class="pequena"/><br><label>16. P&G</label></a>
                <a href="aprendiz/Balance.jsp" class="btn btn-default"><img src="img/Mis_Iconos/Balance.png" alt="" class="pequena"/><br><label>17. Balance</label></a>
                <a href="aprendiz/FlujoCaja.jsp" class="btn btn-default"><img src="img/Mis_Iconos/flujo_caja.png" alt="" class="pequena"/><br><label>18. Flujo de Caja</label></a>
                <a href="aprendiz/ResultadosFinales.jsp" class="btn btn-default"><img src="img/Mis_Iconos/resultados_finales.png" alt="" class="pequena"/><br><label>19. Resultados Finales</label></a>

                <a href="aprendiz/Admin.jsp" class="btn btn-default"><img src="img/Mis_Iconos/admin.png" alt="" class="pequena"/><br><label>Admin Proyecto</label></a>

            </center>
            <% } else { %>

            <center>
                <a href="aprendiz/Instrucciones.jsp" class="btn btn-default"><img src="img/Mis_Iconos/Instrucciones.png" alt="" class="pequena " /><br><label>Instrucciones</label></a>
                <a href="aprendiz/Proyecto.jsp" class="btn btn-default"><img src="img/Mis_Iconos/Mi_Proyecto.png" alt="" class="pequena " /><br><label>1. Mi Proyecto</label></a>
                <a href="aprendiz/Mercado.jsp" class="btn btn-default"><img src="img/Mis_Iconos/mercado.png" alt="" class="pequena"/><br><label>2. Mercado</label></a>
                <a href="aprendiz/eOrganizacional.jsp" class="btn btn-default"><img src="img/Mis_Iconos/Dofa.png" alt="" class="pequena"/><br><label>3. E. Organizacional</label></a>
                <a href="aprendiz/ePromocion.jsp" class="btn btn-default"><img src="img/Mis_Iconos/promocion.png" alt="" class="pequena"/><br><label>4. E. Promoción</label></a>
                <a href="aprendiz/eDistribucion.jsp" class="btn btn-default"><img src="img/Mis_Iconos/Distribucion.png" alt="" class="pequena"/><br><label>5.E. Distribuición</label></a>

                <a href="aprendiz/Producto.jsp" class="btn btn-default"><img src="img/Mis_Iconos/productos.png" alt="" class="pequena"/><br><label>6. Productos</label></a>
                <a href="aprendiz/Inversion.jsp" class="btn btn-default"><img src="img/Mis_Iconos/inversion.png" alt="" class="pequena"/><br><label>7. Inversión</label></a>
                <a href="aprendiz/InversionDiferida.jsp" class="btn btn-default"><img src="img/Mis_Iconos/Inversion_diferida.png" alt="" class="pequena"/><br><label>8. Inversión Diferida</label></a>
                <a href="aprendiz/Nomina.jsp" class="btn btn-default"><img src="img/Mis_Iconos/nomina.png" alt="" class="pequena"/><br><label>9. Nómina</label></a>
                <a href="aprendiz/GastosCostos.jsp" class="btn btn-default"><img src="img/Mis_Iconos/Gasto_Costo.png" alt="" class="pequena"/><br><label>10. Gastos y Costos</label></a>
                <!--    <a href="aprendiz/KC.jsp" class="btn btn-default"><img src="img/iconos/bank.png" alt="" class="pequena"/><br><label>7. Capitál de Credito</label></a> 
                --> 
                <a href="aprendiz/Financiacion.jsp" class="btn btn-default"><img src="img/Mis_Iconos/financiacion.png" alt="" class="pequena"/><br><label>11. Financiación</label></a>
                <a href="aprendiz/Insumo.jsp" class="btn btn-default"><img src="img/Mis_Iconos/insumos.png" alt="" class="pequena"/><br><label>12. Insumos</label></a>

                <a href="aprendiz/Resultados.jsp" class="btn btn-default"><img src="img/Mis_Iconos/resultados.png" alt="" class="pequena"/><br><label>13. Resultados</label></a>
                <a href="aprendiz/InfInsumo.jsp" class="btn btn-default"><img src="img/Mis_Iconos/inf_insumos.png" alt="" class="pequena"/><br><label>14. Inf. Insumos</label></a>
                <a href="aprendiz/PyG.jsp" class="btn btn-default"><img src="img/Mis_Iconos/pyg.png" alt="" class="pequena"/><br><label>15. P&G</label></a>
                <a href="aprendiz/Balance.jsp" class="btn btn-default"><img src="img/Mis_Iconos/Balance.png" alt="" class="pequena"/><br><label>16. Balance</label></a>
                <a href="aprendiz/FlujoCaja.jsp" class="btn btn-default"><img src="img/Mis_Iconos/flujo_caja.png" alt="" class="pequena"/><br><label>17. Flujo de Caja</label></a>
                <a href="aprendiz/ResultadosFinales.jsp" class="btn btn-default"><img src="img/Mis_Iconos/resultados_finales.png" alt="" class="pequena"/><br><label>18. Resultados Finales</label></a>

                <a href="aprendiz/Admin.jsp" class="btn btn-default"><img src="img/Mis_Iconos/admin.png" alt="" class="pequena"/><br><label>Admin Proyecto</label></a>

            </center>
            <% }}else{ %>
            
            <center>
                <a href="aprendiz/Instrucciones.jsp" class="btn btn-default"><img src="img/Mis_Iconos/Instrucciones.png" alt="" class="pequena " /><br><label>Instrucciones</label></a>
                <a href="aprendiz/Proyecto.jsp" class="btn btn-default"><img src="img/Mis_Iconos/Mi_Proyecto.png" alt="" class="pequena " /><br><label>1. Mi Proyecto</label></a>
                <a href="aprendiz/Mercado.jsp" class="btn btn-default"><img src="img/Mis_Iconos/mercado.png" alt="" class="pequena"/><br><label>2. Mercado</label></a>
                <a href="aprendiz/eOrganizacional.jsp" class="btn btn-default"><img src="img/Mis_Iconos/Dofa.png" alt="" class="pequena"/><br><label>3. E. Organizacional</label></a>
                <a href="aprendiz/Organizacion.jsp" class="btn btn-default"><img src="img/Mis_Iconos/Normativa.png" alt="" class="pequena"/><br><label>4. Organización</label></a>
                <a href="aprendiz/ePromocion.jsp" class="btn btn-default"><img src="img/Mis_Iconos/promocion.png" alt="" class="pequena"/><br><label>5. E. Promoción</label></a>
                <a href="aprendiz/eDistribucion.jsp" class="btn btn-default"><img src="img/Mis_Iconos/Distribucion.png" alt="" class="pequena"/><br><label>6.E. Distribuición</label></a>

                <a href="aprendiz/Producto.jsp" class="btn btn-default"><img src="img/Mis_Iconos/productos.png" alt="" class="pequena"/><br><label>7. Productos</label></a>
                <a href="aprendiz/Inversion.jsp" class="btn btn-default"><img src="img/Mis_Iconos/inversion.png" alt="" class="pequena"/><br><label>8. Inversión</label></a>
                <a href="aprendiz/InversionDiferida.jsp" class="btn btn-default"><img src="img/Mis_Iconos/Inversion_diferida.png" alt="" class="pequena"/><br><label>9. Inversión Diferida</label></a>
                <a href="aprendiz/Nomina.jsp" class="btn btn-default"><img src="img/Mis_Iconos/nomina.png" alt="" class="pequena"/><br><label>10. Nómina</label></a>
                <a href="aprendiz/GastosCostos.jsp" class="btn btn-default"><img src="img/Mis_Iconos/Gasto_Costo.png" alt="" class="pequena"/><br><label>11. Gastos y Costos</label></a>
                <!--    <a href="aprendiz/KC.jsp" class="btn btn-default"><img src="img/iconos/bank.png" alt="" class="pequena"/><br><label>7. Capitál de Credito</label></a> 
                --> 
                <a href="aprendiz/Financiacion.jsp" class="btn btn-default"><img src="img/Mis_Iconos/financiacion.png" alt="" class="pequena"/><br><label>12. Financiación</label></a>
                <a href="aprendiz/Insumo.jsp" class="btn btn-default"><img src="img/Mis_Iconos/insumos.png" alt="" class="pequena"/><br><label>13. Insumos</label></a>

                <a href="aprendiz/Resultados.jsp" class="btn btn-default"><img src="img/Mis_Iconos/resultados.png" alt="" class="pequena"/><br><label>14. Resultados</label></a>
                <a href="aprendiz/InfInsumo.jsp" class="btn btn-default"><img src="img/Mis_Iconos/inf_insumos.png" alt="" class="pequena"/><br><label>15. Inf. Insumos</label></a>
                <a href="aprendiz/PyG.jsp" class="btn btn-default"><img src="img/Mis_Iconos/pyg.png" alt="" class="pequena"/><br><label>16. P&G</label></a>
                <a href="aprendiz/Balance.jsp" class="btn btn-default"><img src="img/Mis_Iconos/Balance.png" alt="" class="pequena"/><br><label>17. Balance</label></a>
                <a href="aprendiz/FlujoCaja.jsp" class="btn btn-default"><img src="img/Mis_Iconos/flujo_caja.png" alt="" class="pequena"/><br><label>18. Flujo de Caja</label></a>
                <a href="aprendiz/ResultadosFinales.jsp" class="btn btn-default"><img src="img/Mis_Iconos/resultados_finales.png" alt="" class="pequena"/><br><label>19. Resultados Finales</label></a>

                <a href="aprendiz/Admin.jsp" class="btn btn-default"><img src="img/Mis_Iconos/admin.png" alt="" class="pequena"/><br><label>Admin Proyecto</label></a>

            </center>
            
            <%}%>

            <%@include file="WEB-INF/masterpage/footer.jspf"%>
        </div>
    </body>
    <%  } catch (NullPointerException e) {
            response.sendRedirect("index.jsp");

        }%>
</html>
