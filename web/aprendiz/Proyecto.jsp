<%-- 
    Document   : Proyecto
    Created on : 3/08/2016, 01:26:51 PM
    Author     : mayracadena
--%>

<%@page import="VO.UsuarioVO"%>
<%@page import="DAO.ProyectoDAO"%>
<%@page import="VO.ProyectoVO"%>
<%@page import="DAO.TipoSociedadDAO"%>
<%@page import="VO.TipoSociedadVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns:h="http://xmlns.jcp.org/jsf/html" xmlns:f="http://xmlns.jcp.org/jsf/core">
    <head>
        <%
            HttpSession hs = request.getSession(true);
            Integer idp = (Integer) hs.getAttribute("idproyectito");
            UsuarioVO idu = (UsuarioVO) hs.getAttribute("usuarioAll");

            if (idu == null && idp == null) {
                response.sendRedirect("../index.jsp");
                return;
            }
            if (idu == null) {
                response.sendRedirect("../index.jsp");
                return;
            }
            if (idp == null) {
                response.sendRedirect("../principal.jsp");
                return;
            } else {

        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Proyecto</title>
        <link href="../css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="../css/sweetalert.css" rel="stylesheet" type="text/css"/>
        <link href="../css/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <link href="../css/simple-sidebar.css" rel="stylesheet" type="text/css"/>
        <link href="../css/intento.css" rel="stylesheet" type="text/css"/>
        <link rel="shortcut icon" type="image/x-icon" href="../img/demostrarLogo3.ico">
    </head>
    <body>



        <%    ProyectoVO pv;
            ProyectoDAO pd = new ProyectoDAO();
            pv = pd.read(idp);

            TipoSociedadDAO tsd = new TipoSociedadDAO();
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
                                    <img src="../img/Mis_Iconos/Mi_Proyecto.png" alt="" class="dos"/>
                                </div>
                                <div class="col-md-5 col-xs-6" align="left">
                                    <h1 ><%=pv.getNombreP()%></h1><br>
                                </div>
                            </div>
                            <a href="ARBOLD~1.ZIP" class="btn btn-default">Árbol del problema</a><br><br>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="panel panel-success">

                                        <div class="panel-body">
                                            <label class="label label-success">Descripción del proyecto</label>
                                            <textarea id="descripcion" class=" form-control" title="Haga una breve descripción de su proyecto
                                                      de que trata, en donde se localizará, entre otros"><%=pv.getDescripcion()%></textarea><br>


                                            <label class="label label-success">Objetivo General</label>
                                            <textarea id="OGeneral" class=" form-control " 
                                                      title=" Defina los objetivos a lograr con el desarrollo de su proyecto, teniendo en cuenta aspectos sociales, económicos, ambientales y los demás que usted considere relevantes.

                                                      Redacte los objetivos en las conjugaciones  AR, ER, IR, deben ser medibles y alcanzables
                                                      Al describir los objetivos (Inicie su redacción con una acción, precedido por el  Qué, Como, Cuando, Donde  y en qué Tiempo  de forma concreta, Basados en la metodología del árbol de problema, matriz de vester entre otras.)
                                                      EJEMPLO: ACCIÓN + QUÉ…
                                                      Contribuir + al mejoramiento del nivel de vida…
                                                      Posicionar + el producto…
                                                      Siguiendo ésta estructura gramatical, tenga en cuenta que los objetivos arrancan siempre por el fin del negocio."><%=pv.getOGeneral()%></textarea><br>


                                            <label class="label label-success">Objetivos Especificos</label>
                                            <textarea id="OEspecificos" class="form-control"
                                                      title="Describa los objetivos específicos,
                                                      son todas las acciones requeridas para cumplir el objetivo general"><%=pv.getOEspecificos()%></textarea><br>



                                            <label class="label label-success">Justificiación</label>
                                            <textarea id="Justificacion" class="form-control"
                                                      title=" Justifique las razones para el desarrollo del proyecto teniendo en cuenta aspectos  sociales,
                                                      económicos, ambientales 
                                                      y las demás que usted considere relevantes para la justificación de su proyecto.
                                                      EXPLICACIÓN: 
                                                      Por que es importante a quien beneficia y como lo beneficia, recuerde que en este ítem usted vende su empresa
                                                      para ello se debe valer de cifras que le refuercen la importancia de su plan,
                                                      además es la defensa a su proyecto siempre redáctelo en POSITIVO, nunca en forma de problema.
                                                      Básese en los problemas consecuencia del árbol de problemas"><%=pv.getJustificacion()%></textarea><br>



                                            <label class="label label-success">Problema</label>
                                            <textarea id="Problema" class="form-control"
                                                      title=" Describa la necesidad – problema central o critico u/o oportunidad basado en los problemas, 
                                                      causa que lo generan y sus problemas, consecuencia que el problema central origina, lo cual da origen a su plan de negocios,
                                                      no olvide que la redacción debe estar en forma  NEGATIVA"><%=pv.getProblema()%></textarea><br>


                                        </div>
                                    </div>
                                </div>
                                <!-- fin primer panel -->
                                <div class="col-md-6">
                                    <div class="panel panel-success">

                                        <div class="panel-body">
                                            <label class="label label-success">Historia</label>
                                            <textarea id="Historia" class="form-control"><%=pv.getHistoria()%></textarea><br>
                                            <label class="label label-success">Avances</label>
                                            <textarea id="Avances" class="form-control" title="Describa el avance logrado a la fecha para la puesta en marcha de su proyecto, en los
                                                      aspectos: técnico - productivo, comercial y legal.
                                                      Nota: En caso de haber realizado ventas, relacione las cantidades e ingresos generados. Si cuenta actualmente con un producto
                                                      mínimo viable o infraestructura, realice una descripción de los mismos"><%=pv.getAvances()%></textarea><br>
                                            <label class="label label-success">Meses Improductivos</label>
                                            <input type="number" id="mi" class="form-control" value="<%=pv.getMesesImproductivos()%>"><br>
                                            <label class="label label-success">Razon Social</label>
                                            <textarea id="RSocial" class="form-control"><%=pv.getRazonSocial()%></textarea><br>

                                            <label class="label label-success">Tipo Sociedad</label>
                                            <%if (pv.getIdTipoSociedad() == 0) {
                                            %>

                                            <select id="TipoSociedad" class="form-control">
                                                <%
                                                    List<TipoSociedadVO> ts = new ArrayList();
                                                    ts = tsd.readAll();
                                                    TipoSociedadVO tsv;
                                                    for (int i = 0; i < ts.size(); i++) {
                                                        tsv = ts.get(i);
                                                %>
                                                <option value="<%=tsv.getIdTipoSociedad()%>"><%=tsv.getTSociedad()%></option>
                                                <%}%>
                                            </select><br>
                                            <%} else {

                                                TipoSociedadVO t;
                                                t = tsd.read(pv.getIdTipoSociedad());

                                                List<TipoSociedadVO> ts = new ArrayList();
                                                ts = tsd.readAll();
                                                TipoSociedadVO tsv;

                                            %>


                                            <select id="TipoSociedad" class="form-control" >
                                                <option value="<%=t.getIdTipoSociedad()%>"><%=t.getTSociedad()%></option>
                                                <% for (int i = 0; i < ts.size(); i++) {
                                                        tsv = ts.get(i);
                                                        if (tsv.getIdTipoSociedad() != t.getIdTipoSociedad()) {

                                                %>
                                                <option value="<%=tsv.getIdTipoSociedad()%>"><%=tsv.getTSociedad()%></option>

                                                <%}
                                                    }%>
                                            </select>
                                            <br>

                                            <%}%>
                                            <button  class="btn btn-success btn-lg" onclick="guardarP(<%=idp%>)">Guardar</button>
                                        </div>
                                    </div>
                                </div>
                                <!-- fin segundo panel -->

                            </div>

                        </div>
                    </div>
                </div>
                <%@include file="../WEB-INF/masterpage/footer.jspf"%>
            </div>
        </div>


        <script src="../js/jquery.min.js" type="text/javascript"></script>
        <script src="../js/jquery-ui.min.js" type="text/javascript"></script>
        <script src="../js/sweetalert.min.js" type="text/javascript"></script>
        <script src="../js/ajax/proyecto.js" type="text/javascript"></script>
        <script src="../js/menu.js" type="text/javascript"></script>
        <script src="../js/expanding.jquery.js" type="text/javascript"></script>
        <script src="../js/expanding.js" type="text/javascript"></script>
        <script>
                                                $('textarea').expanding();
                                                $('textarea').tooltip({
                                                    hide: {
                                                        effect: 'explode'
                                                    }
                                                });
        </script>

    </body>
    <% }%>
</html>
