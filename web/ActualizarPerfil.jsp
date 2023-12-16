<%-- 
    Document   : ActualizarPerfil
    Created on : 16/09/2016, 12:43:19 PM
    Author     : mayracadena
--%>

<%@page import="DAO.TipoDocumentoDAO"%>
<%@page import="VO.TipoDocumentoVO"%>
<%@page import="DAO.FichaDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="VO.FichaVO"%>
<%@page import="VO.UsuarioVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Actualizar Perfil</title>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/> <link href="css/intento.css" rel="stylesheet" type="text/css"/>
        <link href="css/simple-sidebar.css" rel="stylesheet" type="text/css"/>
        <link href="css/sweetalert.css" rel="stylesheet" type="text/css"/>
      
        <link rel="shortcut icon" type="image/x-icon" href="img/demostrarLogo3.ico">
    </head>
    <body>
        <%
            HttpSession hs = request.getSession(true);

            UsuarioVO idu = (UsuarioVO) hs.getAttribute("usuarioAll");

            if (idu == null) {
                response.sendRedirect("index.jsp");
                return;
            }

            TipoDocumentoVO td;
            TipoDocumentoDAO tdd = new TipoDocumentoDAO();
            ArrayList<TipoDocumentoVO> tido = new ArrayList();
            tido = tdd.readAll();
        %>
        <div id="wrapper">

            <!-- Sidebar -->
            <div id="sidebar-wrapper">
                <ul class="sidebar-nav">
                    <li class="sidebar-brand">
                        <a href="ActualizarPerfil.jsp">
                            <%=idu.getNombre1() + " " + idu.getApellido1()%>
                        </a>
                    </li>
                    <li>
                        <a href="pass.jsp">Actualizar Contraseña</a>
                    </li>
                    <li>
                        <a href="principal.jsp">Inicio</a>
                    </li>
                    <li>
                        <a href="#" onclick="cerrarSesion2()">Salir</a>
                    </li>
                </ul>
            </div>
            <!-- /#sidebar-wrapper -->

            <!-- Page Content -->
            <div id="page-content-wrapper">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">

                            <header> 
                                <div class = "container-fluid" >
                                    <div class="row">
                                        <!--     <div class="col-lg-12 col-md-12 col-xs-12"> -->
                                        <div class="col-md-4">
                                            <img src="img/demostrarLogo3.jpg" alt="Imagen No Disponible">
                                        </div>
                                        <div class="col-md-offset-10 col-xs-offset-12">
                                            <!--      <img src="../img/2_Losimbolo-SENA-01.jpg" alt="" class=""/> -->
                                        </div>
                                        <img src="img/LineaAbajo.jpg" alt="" class=""/>
                                    </div>
                                </div>
                            </header>
                            <br><br>
                            <button class="btn btn-default" id="menusito" ><span class="glyphicon glyphicon-align-justify"></span></button> 
                            <br><br>
                            <h1 class="text-center">Actualizar perfil </h1>
                            <br>


                            <% if (idu.getIdRol() == 3) {%>

                            <div class="panel panel-success">
                                <div class="panel-heading"><h3 class="panel-title">Aprendiz</h3></div>
                                <div class=" panel-default">    <div class="panel-body">



                                        <label class="label label-success">* Primer Nombre: </label>
                                        <input type="text" name="txtNombre1" id="txtNombre1" required  class="form-control" value="<%=idu.getNombre1()%>">
                                        <div  id="txtNombre1a" hidden=""><label class="label label-danger">Dato requerido!</label></div>

                                        <label class="label label-success">segundo Nombre:</label> 
                                        <input type="text" name="txtNombre2" id="txtNombre2" class="form-control" value="<%=idu.getNombre2()%>">

                                        <label class="label label-success">* Primer Apellido: </label>
                                        <input type="text" name="txtApellido1" id="txtApellido1" required  class="form-control" value="<%=idu.getApellido1()%>">
                                        <div  id="txtApellido1a" hidden=""><label class="label label-danger">Dato requerido!</label></div>

                                        <label class="label label-success">Segundo Apellido: </label>
                                        <input type="text" name="txtApellido2" id="txtApellido2"  class="form-control" value="<%=idu.getApellido2()%>">

                                        <label class="label label-success">Etapa</label>  
                                        <select id="etapa" name="etapa"  class="form-control selectpicker"  data-live-search="true">
                                            <% if (idu.getIdEtapa() == 1) { %>

                                            <option value="1">Etapa Lectiva</option>
                                            <option value="2">Etapa Productiva</option>   
                                            <%} else if (idu.getIdEtapa() == 2) { %>

                                            <option value="2">Etapa Productiva</option>
                                            <option value="1">Etapa Lectiva</option>
                                            <%}  %>



                                        </select>
                                        <label class="label label-success">Especialidad</label>  
                                        <select id="especialidad" name="especialidad"  class="form-control"  data-live-search="true">
                                            <% if (idu.getIdEspecialidad() == 1) {%>
                                            <option value="1">Auxiliar</option>
                                            <option value="2">Técnico</option>
                                            <option value="3">Tecnologo</option>
                                            <option value="4">Profesional</option>
                                            <%} else if (idu.getIdEspecialidad() == 2) {%>
                                            <option value="2">Técnico</option>
                                            <option value="3">Tecnologo</option>
                                            <option value="4">Profesional</option>
                                            <option value="1">Auxiliar</option>
                                            <%} else if (idu.getIdEspecialidad() == 3) {%>
                                            <option value="3">Tecnologo</option>
                                            <option value="4">Profesional</option>
                                            <option value="1">Auxiliar</option>
                                            <option value="2">Técnico</option>
                                            <%} else if (idu.getIdEspecialidad() == 4) { %>
                                            <option value="4">Profesional</option>
                                            <option value="1">Auxiliar</option>
                                            <option value="2">Técnico</option>
                                            <option value="3">Tecnologo</option>

                                            <%}%>
                                        </select>

                                        
                                        <label class="label label-success">Ficha</label>  
                                        <select id="fichas" name="fichas" class="form-control"  data-live-search="true">
                                            
                                            <%
                                                FichaVO f;
                                                ArrayList<FichaVO> fichas = new ArrayList();
                                                FichaDAO fd = new FichaDAO();
                                                fichas = fd.readAll();

                                                for (int i = 0; i < fichas.size(); i++) {
                                                    f = fichas.get(i);
                                                 
                                                            
                                                         
                                            %>
                                            
                                          
                                           <option value="<%=f.getIdFicha()%>"><%=f.getFicha()%></option>
                                            <%
                                                }
                                            %>

                                        </select>
                                        <label class="label label-success">* Tipo Documento</label>
                                        <select name="td" id="td"  class="form-control"  data-live-search="true">
                                            <%
                                                for (int i = 0; i < tido.size(); i++) {
                                                    td = tido.get(i);
                                            %>
                                            <option value="<%=td.getIdTipoDocumento()%>"><%=td.getTipo()%></option>
                                            <%}%>
                                        </select>
                                        <label class="label label-success">*No. Documento</label>
                                        <input type="text" name="ndocumento" id="ndocumento" class="form-control" required value="<%=idu.getDocumento()%>"> 
                                        <label class="label label-success">Dirección</label>
                                        <input type="text" name="direccion" id="direccion" class="form-control" value="<%=idu.getDireccion()%>">
                                        <label class="label label-success">Telefono</label>
                                        <input type="text" name="telefono" id="telefono" class="form-control" required value="<%=idu.getTelefono()%>">


                                        <br>


                                        <button id="Actualizar" class=" btn btn-success" onclick="actualizar(<%=idu.getIdUsuario()%>)">Actualizar</button>




                                    </div>     
                                </div>
                            </div>
                        </div>
                        <%} else {%>
                        <div class="col-md-8">
                            <div class="panel panel-default">
                                <div class="panel-heading"><h3 class="panel-title">Instructor</h3></div>
                                <div class="panel-default">    <div class="panel-body">

                                        <label class="label label-default">* Primer Nombre: </label>
                                        <input type="text" id="txtNombre1i" required  class="form-control" value="<%=idu.getNombre1()%>">
                                        <div  id="txtNombre1ia" hidden=""><label class="label label-danger">Dato requerido!</label></div>

                                        <label class="label label-default">segundo Nombre:</label> 
                                        <input type="text" id="txtNombre2i"  class="form-control" value="<%=idu.getNombre2()%>">

                                        <label class="label label-default">* Primer Apellido: </label>
                                        <input type="text" id="txtApellido1i" required  class="form-control" value="<%=idu.getApellido1()%>">
                                        <div  id="txtApellido1ia" hidden=""><label class="label label-danger">Dato requerido!</label></div>
                                        <label class="label label-default">Segundo Apellido: </label>
                                        <input type="text" id="txtApellido2i"  class="form-control" value="<%=idu.getApellido2()%>">


                                        <label class="label label-default">*Tipo Documento</label>
                                        <select  id="tdi" class="form-control">
                                            <%

                                                for (int i = 0; i < tido.size(); i++) {
                                                    td = tido.get(i);
                                            %>
                                            <option value="<%=td.getIdTipoDocumento()%>"><%=td.getTipo()%></option>
                                            <%}%>
                                        </select>
                                        <label class="label label-default">*No. Documento</label>
                                        <input type="text" id="ndocumentoi" class="form-control" required value="<%=idu.getDocumento()%>">
                                        <label class="label label-default">Dirección</label>
                                        <input type="text" id="direccioni" class="form-control" value="<%=idu.getDireccion()%>">
                                        <label class="label label-default">Telefono</label>
                                        <input type="text" id="telefonoi" class="form-control" required value="<%=idu.getTelefono()%>">



                                        <br>  <button  style="background: #cccccc;" class="btn btn-default" onclick="actualizari(<%=idu.getIdUsuario()%>)">Actualizar</button>

                                    </div>

                                </div></div>
                        </div>
                        <%}%>

                    </div>
                </div>
                <%@include file="WEB-INF/masterpage/footer.jspf"%>
            </div>
        </div>


        <script src="js/jquery.min.js" type="text/javascript"></script>
        <script src="js/sweetalert.min.js" type="text/javascript"></script>
        <script src="js/menu.js" type="text/javascript"></script>
        <script src="js/ajax/Usuario.js" type="text/javascript"></script>
        
    </body>
</html>
