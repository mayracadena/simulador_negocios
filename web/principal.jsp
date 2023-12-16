<%-- 
    Document   : pass
    Created on : 20/09/2016, 01:23:17 PM
    Author     : mayracadena
--%>


<%@page import="VO.UsuarioVO"%>
<%@page import="DAO.ProyectoDAO"%>
<%@page import="VO.ProyectoVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Principal</title>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link rel="shortcut icon" type="image/x-icon" href="img/demostrarLogo3.ico">
        <link href="css/sweetalert.css" rel="stylesheet" type="text/css"/>
        <link href="css/intento.css" rel="stylesheet" type="text/css"/>
        <link href="css/jquery.dataTables.min.css" rel="stylesheet" type="text/css"/>
  
      
    </head>
    <body>
        <%
            HttpSession hs = request.getSession(true);

            UsuarioVO idu = (UsuarioVO) hs.getAttribute("usuarioAll");

            if (idu == null) {
                response.sendRedirect("index.jsp");
                return;
            } else {

                ArrayList<ProyectoVO> p = new ArrayList();
                ProyectoDAO pd = new ProyectoDAO();
                p = pd.readAlls(idu.getIdUsuario());
                ProyectoVO pv;

        %>
        <br>     <%@include file="WEB-INF/masterpage/header.jspf" %>


        <div class="container-fluid">

            <br><br>
            <ul class="nav nav-tabs">
                <li class="active"><a href="principal.jsp" id="salida">Home</a></li>
                    <%                    if (idu.getIdRol() == 2 || idu.getIdRol() == 1) {


                    %>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">Gestionar
                        <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="instructor/Fichas.jsp">Fichas</a></li>
                        <li><a href="instructor/Generalidades.jsp">Generalidades</a></li>
                        <li><a href="instructor/Macroeconomia.jsp">Variables Macroecnómicas</a></li>
                            <%                                if (idu.getIdRol() == 1) {
                            %>
                        <li><a href="instructor/Intructores.jsp">Instructores</a></li>
                            <%} %>
                        <li><a href="instructor/Aprendices.jsp">Aprendices</a></li> 
                        <li><a href="instructor/AllProyectos.jsp">Proyectos</a></li> 
                        <li><a href="instructor/Unidades_Medida.jsp">Unidades de Medida</a></li>
                        <li><a href="instructor/Inver_Diferida.jsp">Inversión Intangible</a></li>
                    </ul>
                </li>

                <% }%>
                <li>
                    <a href="ActualizarPerfil.jsp"><%=idu.getNombre1()%> <%=idu.getApellido1()%></a>
                </li>
                <li><a href="#" onclick="cerrarSesion2()">Salir</a></li>
            </ul>


            <br>



            <!--        <form method="post"   action="javascript:NombreProyecto()">
                        <table class="table">
                            <tr>
                                <td>
                                    <label class="label label-info">Nombre de proyecto:</label>
    
                                    <input type="text"  class="form-control "   id="nomProyecto" required placeholder="Escribe el nombre de tu proyecto...">
                                </td>
    
                                <td><br>
                                    <input type="submit"    value="Crear" class="btn btn-info" ></td>
                            </tr> 
    
                        </table>
                    </form>
            -->
            <center>
                <button id="Crear" class="botoncitos" data-toggle="modal" data-target="#crear_proyecto" >Crear Proyecto</button>
            </center>
            <div id="crear_proyecto" class="modal fade" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Tipo de Proyecto</h4>
                        </div>
                        <div class="modal-body">
                            <%
                                if (idu.getIdEtapa() == 1) {//lectiva

                                    if (idu.getIdEspecialidad() == 1) { //Auxiliar
                            %>
                            Crear Proyecto para Auxiliar<br>
                            <input hidden="" value="1" id="id_especialidad">
                            <label class="label label-success">Nombre Proyecto</label>
                            <input type="text" id="nomProyecto" class="form-control" placeholder="Escriba en nombre de su proyecto"/>
                            <br>
                            <button class="btn btn-success" onclick="NombreProyecto()">Crear</button>
                            <%}else
                                    if (idu.getIdEspecialidad() == 2) { //tecnico%>

                            <label>Escoger Tipo de Proyecto</label>
                            <select id="id_especialidad" class="form-control">
                                <option value="2">Técnico</option>
                                <option value="1">Auxiliar</option>
                            </select><br>

                            <label class="label label-success">Nombre Proyecto</label>
                            <input type="text" id="nomProyecto" class="form-control" placeholder="Escriba en nombre de su proyecto"/>
                            <br>
                            <button class="btn btn-success" onclick="NombreProyecto()">Crear</button>

                            <%}else if(idu.getIdEspecialidad() == 3){  //Tecnico%>
                            <label>Escoger Tipo de Proyecto</label>
                            <select id="id_especialidad" class="form-control">
                                <option value="3">Tecnologo</option>
                                <option value="2">Técnico</option>
                                <option value="1">Auxiliar</option>
                            </select><br>

                            <label class="label label-success">Nombre Proyecto</label>
                            <input type="text" id="nomProyecto" class="form-control" placeholder="Escriba en nombre de su proyecto"/>
                            <br>
                            <button class="btn btn-success" onclick="NombreProyecto()">Crear</button>
                            <%}else if(idu.getIdEspecialidad() == 4){  //profesional%>
                            <label>Escoger Tipo de Proyecto</label>
                            <select id="id_especialidad" class="form-control">
                                <option value="4">Egresado</option>
                                <option value="3">Tecnologo</option>
                                <option value="2">Técnico</option>
                                <option value="1">Auxiliar</option>
                            </select><br>

                            <label class="label label-success">Nombre Proyecto</label>
                            <input type="text" id="nomProyecto" class="form-control" placeholder="Escriba en nombre de su proyecto"/>
                            <br>
                            <%}%>
                      
                            <%}else if(idu.getIdEtapa() == 2){  //Productiva%>
                            <label>Escoger Tipo de Proyecto</label>
                            <select id="id_especialidad" class="form-control">
                                <option value="5">Fondo Emprender</option>
                                <option value="1">Auxiliar</option>
                                <option value="2">Técnico</option>
                                <option value="3">Tecnologo</option>
                                <option value="4">Egresado</option>
                            </select><br>

                            <label class="label label-success">Nombre Proyecto</label>
                            <input type="text" id="nomProyecto" class="form-control" placeholder="Escriba en nombre de su proyecto"/>
                            <br>
                            <button class="btn btn-success" onclick="NombreProyecto()">Crear</button>

                            <%}%>
                            

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                        </div>
                    </div>

                </div>
            </div>

            <br><br>
            <%if (p == null) {%>
            <h2>No haces parte de ningun proyecto...</h2>
            <%}%>
            <table class="table table-bordered table-hover" id="tablitaProyectos">
                <thead>
                    <th>Nombre Proyecto</th>
                    <th>opción</th>
            </thead>
            <tbody>
                <%  for (int i = 0; i < p.size(); i++) {
                    pv = p.get(i);%>
                <tr id="tr<%=pv.getIdProyecto()%>">
                    <td class="col-md-8 col-xs-8"><center><label><%=pv.getNombreP()%></label></center></td>
                <td><button id="llenar" class="btn btn-info" onclick="llenarP(<%=pv.getIdProyecto()%>)">Llenar</button>
                    <%
                        ProyectoDAO Pdao = new ProyectoDAO();
                        UsuarioVO usu = Pdao.lider(pv.getIdProyecto());
                        if (usu.getIdUsuario() == idu.getIdUsuario()) {
                    %>
                    <button class="btn btn-success" onclick="CambiarNombre(<%=pv.getIdProyecto()%>)" title="Editar"><span class="glyphicon glyphicon-edit"></span></button>
                    <button class="btn btn-danger" onclick="borrarP(<%=pv.getIdProyecto()%>)" title="Borrar"><span class="glyphicon glyphicon-remove"></span></button>

                    <% } else {%>
                    <button class="btn btn-warning" onclick="abandonar(<%=pv.getIdProyecto()%>, <%=idu.getIdUsuario()%>)" title="Abandonar"><span class="glyphicon glyphicon-remove-circle"></span></button>

                    <%}%>
                    <button class="btn btn-default" onclick="comentar(<%=pv.getIdProyecto()%>, <%=idu.getIdRol()%>)" title="Comentarios" data-toggle="modal" data-target="#comentarios"><span class="glyphicon glyphicon-list-alt"></span></button>
                    
                </td>
                </tr> 



                <%}%>
            </tbody>

            </table>


            <div id="comentarios" class="modal fade" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">COMENTARIOS</h4>
                        </div>
                        <div class="modal-body">

                            <%                    if (idu.getIdRol() == 2 || idu.getIdRol() == 1) {%>
                            <div id="Comentario_proyecto">
                                <textarea class="form-control" id="comentar_p"></textarea><br>
                                <div id="botonGuardar"></div>
                                <br>
                            </div>
                            <% } else { %>
                            <div id="Comentario_p" ></div> 

                            <%}%>
                        </div>
                        <div class="modal-footer"><br>
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                        </div>
                    </div>

                </div>
            </div>

            <br>






        </div>
        <script src="js/jquery.min.js" type="text/javascript"></script>
        <script src="js/jquery.dataTables.min.js" type="text/javascript"></script>
        <script src="js/datatablesLogistica.js" type="text/javascript"></script>
        <script src="js/sweetalert.min.js" type="text/javascript"></script>
        <script src="js/ajax/proyecto.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script src="js/menu.js" type="text/javascript"></script>
       
       
       
            
        <% }%>
        <%@include file="WEB-INF/masterpage/footer.jspf"%>
    </body>
</html>