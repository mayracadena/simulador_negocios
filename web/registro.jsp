<%@page import="DAO.TipoDocumentoDAO"%>
<%@page import="VO.TipoDocumentoVO"%>
<%@page import="java.util.List"%>
<%@page import="DAO.FichaDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="VO.FichaVO"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : registro
    Created on : 12/11/2015, 11:15:49 AM
    Author     : Formacion02
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Conexion.Conexion" %>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>       



<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Registro</title>
        <link href="css/intento.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link rel="shortcut icon" type="image/x-icon" href="img/demostrarLogo3.ico">
        <link href="css/sweetalert.css" rel="stylesheet" type="text/css"/>
    </head>

    <body >
        <%@include file="WEB-INF/masterpage/header.jspf" %>  
        <div class="container">


            <h1 class="text-center">Regístrate</h1><br><br>
            ¿Ya tienes cuenta?   
            <a href="index.jsp">Ingresa aquí </a>

            <div class="row">
                <div class="col-md-6">
                    <div class="panel panel-success">
                        <div class="panel-heading"><h3 class="panel-title">Aprendiz</h3></div>
                        <div class=" panel-default">    <div class="panel-body">
                                <center>
                                    <img src="img/Mis_Iconos/aprendiz.png" alt="" class="pequena"/>
                                </center>
                                <br>
                                <label class="label label-success">* Primer Nombre: </label>
                                <input type="text" name="txtNombre1" id="txtNombre1" required  class="form-control">
                                <div class="alert alert-danger" hidden="" id="1nombre">Este campo es requerido</div>

                                <label class="label label-success">segundo Nombre:</label> 
                                <input type="text" name="txtNombre2" id="txtNombre2" class="form-control">

                                <label class="label label-success">* Primer Apellido: </label>
                                <input type="text" name="txtApellido1" id="txtApellido1" required  class="form-control">
                                <div class="alert alert-danger" hidden="" id="1apellido">Este campo es requerido</div>

                                <label class="label label-success">Segundo Apellido: </label>
                                <input type="text" name="txtApellido2" id="txtApellido2"  class="form-control">

                                <label class="label label-success">* Correo:</label>
                                <input type="text" class="form-control" placeholder="ejemplo@misena.edu.co" name="txtCorreo" id="txtCorreo" required id="txtCorreo">
                                <div class="panelsito alert alert-danger" id="m_correo"></div>
                                
                                <label class="label label-success">Etapa</label>  
                                <select id="etapa" name="etapa" class="form-control">

                                    <option value="1">Etapa Lectiva</option>
                                    <option value="2">Etapa Productiva</option>


                                </select>
                                <label class="label label-success">Especialidad</label>  
                                <select id="especialidad" name="especialidad" class="form-control">

                                    <option value="1">Auxiliar</option>
                                    <option value="2">Técnico</option>
                                    <option value="3">Tecnologo</option>
                                    <option value="4">Egresado</option>
                                </select>
                                
                                <label class="label label-success">Ficha</label>  
                                <select id="fichas" name="fichas" class="form-control">
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
                                <select name="td" id="td" class="form-control">
                                    <%
                                        TipoDocumentoVO td;
                                        TipoDocumentoDAO tdd = new TipoDocumentoDAO();
                                        ArrayList<TipoDocumentoVO> tido = new ArrayList();
                                        tido = tdd.readAll();
                                        for (int i = 0; i < tido.size(); i++) {
                                            td = tido.get(i);
                                    %>
                                    <option value="<%=td.getIdTipoDocumento()%>"><%=td.getTipo()%></option>
                                    <%}%>
                                </select>
                                <label class="label label-success">*No. Documento</label>
                                <input type="text" name="ndocumento" id="ndocumento" class="form-control" required>
                                <div class="alert alert-danger" hidden="" id="1documento">Este campo es requerido</div>
                                <label class="label label-success">Dirección</label>
                                <input type="text" name="direccion" id="direccion" class="form-control" >
                                <label class="label label-success">Telefono</label>
                                <input type="text" name="telefono" id="telefono" class="form-control" required>

                                <br>


                                <button id="enviar" class=" btn btn-success" >Registrarse</button>




                            </div>     </div></div></div>


                <div class="col-md-6">
                    <div class="panel panel-default">
                        <div class="panel-heading"><h3 class="panel-title">Instructor</h3></div>
                        <div class="panel-default">    <div class="panel-body">
                                <center>
                                    <img src="img/Mis_Iconos/profesor.png" alt="" class="pequena"/>
                                </center>
                                <br>
                                <label class="label label-default">* Primer Nombre: </label>
                                <input type="text" id="txtNombre1i" required  class="form-control">
                                <div class="alert alert-danger" hidden="" id="2nombre">Este campo es requerido</div>

                                <label class="label label-default">segundo Nombre:</label> 
                                <input type="text" id="txtNombre2i"  class="form-control">

                                <label class="label label-default">* Primer Apellido: </label>
                                <input type="text" id="txtApellido1i" required  class="form-control">
                                <div class="alert alert-danger" hidden="" id="2apellido">Este campo es requerido</div>

                                <label class="label label-default">Segundo Apellido: </label>
                                <input type="text" id="txtApellido2i"  class="form-control">

                                <label class="label label-default">* Correo:</label>
                               

                                    
                                <input type="text" class="form-control" placeholder="ejemplo@sena.edu.co" id="txtCorreoi" required id="txtCorreo">
                                   <div class="panelsito alert alert-danger" id="m_correo2"></div>
                                
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
                                <input type="text" id="ndocumentoi" class="form-control" required>
                                <div class="alert alert-danger" hidden="" id="2documento">Este campo es requerido</div>
                                <label class="label label-default">Dirección</label>
                                <input type="text" id="direccioni" class="form-control" >
                                <label class="label label-default">Telefono</label>
                                <input type="text" id="telefonoi" class="form-control" required>



                                <br>  <button id="enviari" style="background: #cccccc;" class="btn btn-default">Registrarse</button>

                            </div>

                        </div></div></div>
            </div>
            <script src="js/jquery.min.js" type="text/javascript"></script>
            <script src="js/ajax/Usuario.js" type="text/javascript"></script>
            <script src="js/sweetalert.min.js" type="text/javascript"></script>
            <%@include file="WEB-INF/masterpage/footer.jspf"%>
    </body>
</html>
