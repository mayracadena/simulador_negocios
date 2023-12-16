/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import DAO.UsuarioDAO;
import VO.UsuarioVO;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import util.ResponseServlet;
import util.contraAleatoria;
import util.Email;
import utils.UtilsMM;

/**
 *
 * @author mayracadena
 */
@WebServlet(name = "Usuario", urlPatterns = {"/Usuario", "/Usuario/actualizar", "/Usuario/Aprendiz", "/Usuario/Instructor", "/Usuario/buscar", "/Usuario/cambioRol", "/Usuario/cambiarContra", "/Usuario/correo", "/Usuario/validacionCorreo", "/Usuario/correo3"})
public class Usuario extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            ResponseServlet resp = new ResponseServlet();
            String rutaServlet = request.getRequestURI();
            HttpSession hs = request.getSession(true);
            String action = rutaServlet.substring(rutaServlet.lastIndexOf("/") + 1);
            switch (action) {
                case "actualizar":
                    resp = this.actualizar(request, response, hs);
                    break;
                case "Usuario":
                    resp = this.login(request, response, hs);
                    break;

                case "Aprendiz":
                    resp = this.registroa(request, response);
                    break;
                case "Instructor":
                    resp = this.registroi(request, response);
                    break;
                case "buscar":
                    resp = this.buscar(request, response, hs);
                    break;
                case "cambioRol":
                    resp = this.cambioRol(request, response, hs);
                    break;
                case "cambiarContra":
                    resp = this.cambiarContra(request, response, hs);
                    break;
                case "correo":
                    resp = this.correo(request, response, hs);
                    break;
                case "validacionCorreo":
                    resp = this.correo2(request, response, hs);
                    break;
                case "correo3":
                    resp = this.correo3(request, response, hs);
                    break;

            }

            String objJSON = new Gson().toJson(resp);
            out.println(objJSON);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private ResponseServlet login(HttpServletRequest request, HttpServletResponse response, HttpSession hs) {
        ResponseServlet r = new ResponseServlet();

        UsuarioVO usuVO;
        UsuarioDAO usuDAO = new UsuarioDAO();
        String correito = request.getParameter("correo");
        String contrasena = request.getParameter("contra");

        usuVO = (usuDAO.login(correito, UtilsMM.encriptar(contrasena)));
        if (usuVO != null) {
            int i = usuVO.getIdUsuario();
            hs.setAttribute("idusuario", i);
            hs.setAttribute("usuarioAll", usuVO);
            hs.getCreationTime();
            r.setCodigo(1);
            r.setFrase("logeo exitoso!");
            r.setObjeto(usuVO);
        } else {
            r.setCodigo(0);
            r.setFrase("mal logueo");
            r.setObjeto(null);
        }
        return r;
    }

    private ResponseServlet registroa(HttpServletRequest request, HttpServletResponse response) {
        ResponseServlet r = new ResponseServlet();

        UsuarioDAO usuDAO = new UsuarioDAO();
        String nombre1 = request.getParameter("txtNombre1");
        String nombre2 = request.getParameter("txtNombre2");
        String apellido1 = request.getParameter("txtApellido1");
        String apellido2 = request.getParameter("txtApellido2");
        String email = request.getParameter("txtCorreo");
        int Ficha = Integer.parseInt(request.getParameter("fichas"));
        int Td = Integer.parseInt(request.getParameter("td"));
        String ndoc = request.getParameter("ndocumento");
        String direccion = request.getParameter("direccion");
        String telefono = request.getParameter("telefono");
        int etapa = Integer.parseInt(request.getParameter("etapa"));
        int especialidad = Integer.parseInt(request.getParameter("especialidad"));
        String contrasena = contraAleatoria.contra(8);

        

        UsuarioVO usuVO = new UsuarioVO(0, nombre1, nombre2, apellido1, apellido2, email, contrasena, ndoc, Td, direccion, telefono, 3, Ficha, etapa, especialidad);
        boolean si = usuDAO.create(usuVO);
        if (si) {
            String mensaje = "Bienvenid@ " + nombre1 + "  " + apellido1 + " "
                    + "Te has registrado a nuestra pagina con este correo "
                    + " " + email + "  y esta "
                    + "contraseña: " + contrasena + " "
                    + "Te doy la bienvenida, y espero que sigas prefiriendonos";
            Email correo = new Email();
            String asunto = "Registro DeMostrar - SimProyect (Sena)";
            correo.enviarCorreo(email, mensaje, asunto);

            r.setCodigo(1);
            r.setFrase("Te has registrado con exito! "
                    + "Tu contraseña se a enviado a tu correo "+email+" revisa en spam, si no aparece "
                    + "en la bandeja de entrada");
            r.setObjeto("Exito");

        } else {
            r.setCodigo(0);
            r.setFrase("No se Pudo registrar");
            r.setObjeto("Error");
        }

        return r;
    }

    private ResponseServlet registroi(HttpServletRequest request, HttpServletResponse response) {
        ResponseServlet r = new ResponseServlet();

        UsuarioDAO usuDAO = new UsuarioDAO();
        String nombre1 = request.getParameter("txtNombre1");
        String nombre2 = request.getParameter("txtNombre2");
        String apellido1 = request.getParameter("txtApellido1");
        String apellido2 = request.getParameter("txtApellido2");
        String Emails = request.getParameter("txtCorreo");

        int td = Integer.parseInt(request.getParameter("tdi"));
        String ndoc = request.getParameter("ndocumento");
        String direccion = request.getParameter("direccion");
        String telefono = request.getParameter("telefono");
        String contrasena = contraAleatoria.contra(8);

        

        UsuarioVO usuVO = new UsuarioVO(0, nombre1, nombre2, apellido1, apellido2, Emails, contrasena, ndoc, td, direccion, telefono, 2, 0,2,5);
        boolean si = usuDAO.insertar(usuVO);
        if (si) {
            String mensaje = "Bienvenid@ " + nombre1 + "  " + apellido1 + " "
                    + "Te has registrado a nuestra pagina con este correo "
                    + "tu contraseña es: " + contrasena + " "
                    + "Te doy la bienvenida, y espero que sigas prefiriendonos";
            Email correo = new Email();
            String asunto = "Registro DeMostrar - SimProyect (Sena)";
            correo.enviarCorreo(Emails, mensaje, asunto);

            r.setCodigo(1);
            r.setFrase("Te has registrado con exito! "
                    + "Tu contraseña se a enviado a tu correo "+Emails+" revisa en spam, si no aparece "
                    + "en la bandeja de entrada");
            r.setObjeto("Exito");

        } else {
            r.setCodigo(0);
            r.setFrase("No se Pudo registrar, correo ya existente");
            r.setObjeto("Error");
        }

        return r;
    }

    private ResponseServlet actualizar(HttpServletRequest request, HttpServletResponse response, HttpSession hs) {
        ResponseServlet r = new ResponseServlet();

        String nombre1 = request.getParameter("txtNombre1");
        String nombre2 = request.getParameter("txtNombre2");
        String apellido1 = request.getParameter("txtApellido1");
        String apellido2 = request.getParameter("txtApellido2");
        int id = Integer.parseInt(request.getParameter("id"));
        int Td = Integer.parseInt(request.getParameter("td"));
        String ndoc = request.getParameter("ndocumento");
        String direccion = request.getParameter("direccion");
        String telefono = request.getParameter("telefono");
         int etapa = Integer.parseInt(request.getParameter("etapa"));
        int especialidad = Integer.parseInt(request.getParameter("especialidad"));

        UsuarioDAO usuDAO = new UsuarioDAO();
        UsuarioVO u;

        int rol = Integer.parseInt(request.getParameter("rol"));
        if (rol == 3) {
            int Ficha = Integer.parseInt(request.getParameter("fichas"));

            u = new UsuarioVO(id, nombre1, nombre2, apellido1, apellido2, "", "", ndoc, Td, direccion, telefono, 0, Ficha, etapa, especialidad);
            boolean si = usuDAO.update(u);
            if (si) {
                r.setCodigo(1);
                r.setFrase("Datos Actualizados!");
            } else {
                r.setCodigo(0);
                r.setFrase("Error al actualizar");
            }
        } else {
            u = new UsuarioVO(id, nombre1, nombre2, apellido1, apellido2, "", "", ndoc, Td, direccion, telefono, 0, 0,0,0);
            boolean si = usuDAO.updateI(u);
            if (si) {
                r.setCodigo(1);
                r.setFrase("Datos Actualizados!");
            } else {
                r.setCodigo(0);
                r.setFrase("Error al actualizar");
            }
        }

        return r;
    }

    private ResponseServlet buscar(HttpServletRequest request, HttpServletResponse response, HttpSession hs) {
        ResponseServlet r = new ResponseServlet();

        UsuarioVO idu = (UsuarioVO) hs.getAttribute("usuarioAll");

        ArrayList<UsuarioVO> u = new ArrayList();
        UsuarioDAO ud = new UsuarioDAO();
        String correo = request.getParameter("correo");
        // int id = request.getParameter("");
        u = ud.buscarEmail(correo, idu.getIdUsuario());

        if (u.isEmpty()) {
            r.setCodigo(0);
            r.setFrase("No hay resultados...");
        } else {
            r.setCodigo(1);
            r.setObjeto(u);
        }

        return r;
    }

    private ResponseServlet cambioRol(HttpServletRequest request, HttpServletResponse response, HttpSession hs) {
        ResponseServlet r = new ResponseServlet();
        UsuarioDAO u = new UsuarioDAO();
        boolean si = u.ccambioDeRol(Integer.parseInt(request.getParameter("idu")), Integer.parseInt(request.getParameter("idr")));
        if (si) {
            r.setCodigo(1);
            r.setFrase("El usuario a cambiado de rol, Datos Actualizados!");
        } else {
            r.setCodigo(0);
            r.setFrase("Error al cambiar rol de usuario");
        }

        return r;
    }

    private ResponseServlet cambiarContra(HttpServletRequest request, HttpServletResponse response, HttpSession hs) {
        ResponseServlet r = new ResponseServlet();

        String contraA = request.getParameter("contraA");
        String contraN1 = request.getParameter("contraN1");
        String contraN2 = request.getParameter("contraN2");

        UsuarioVO idu = (UsuarioVO) hs.getAttribute("usuarioAll");

        UsuarioDAO usuDAO = new UsuarioDAO();

        boolean si = usuDAO.contra(idu.getIdUsuario(), contraA);
        if (si) {
            if (contraN1.equals(contraN2)) {
                boolean yes = usuDAO.cambioDePass(idu.getIdUsuario(), contraN1);
                if (yes) {
                    r.setCodigo(1);

                }
            } else {
                r.setCodigo(-1);
                r.setFrase("Error claves diferentes");
            }
        } else {
            r.setCodigo(0);
            r.setFrase("Clave incorrecta");
        }

        return r;
    }

    private ResponseServlet correo(HttpServletRequest request, HttpServletResponse response, HttpSession hs) {
        ResponseServlet r = new ResponseServlet();
        String correo = request.getParameter("correo");

        UsuarioDAO usu = new UsuarioDAO();
        String pass = usu.buscarcorreo(correo);

        if (pass.equals("")) {
            r.setCodigo(0);
            r.setFrase("El correo es inexistente, por favor verifique el correo");
        } else {
            r.setCodigo(1);
            r.setFrase("¡El código a sido enviado a su correo!");
            String mensaje = "El código es: " + pass;
            String asunto = "Código de recuperación DeMostrar - SimProyect";
            Email correito = new Email();
            correito.enviarCorreo(correo, mensaje, asunto);
        }

        return r;
    }

    private ResponseServlet correo2(HttpServletRequest request, HttpServletResponse response, HttpSession hs) {
        ResponseServlet r = new ResponseServlet();

        String correo = request.getParameter("correo");
        String pass = request.getParameter("contra");
        UsuarioDAO usus = new UsuarioDAO();
        UsuarioVO usuVO;
        usuVO = usus.login(correo, pass);
        if (usuVO != null) {
            r.setCodigo(1);
            r.setFrase("Código correcto");
        } else {
            r.setCodigo(0);
            r.setFrase("El codigo es incorrecto");
        }

        return r;
    }

    private ResponseServlet correo3(HttpServletRequest request, HttpServletResponse response, HttpSession hs) {
        ResponseServlet r = new ResponseServlet();
        String correo = request.getParameter("correo");
        String pass = request.getParameter("contra");
        UsuarioDAO usus = new UsuarioDAO();

        boolean si = usus.cambiarpassword(correo, UtilsMM.encriptar(pass));
        if (si) {
            r.setCodigo(1);
            r.setFrase("Contraseña actualizada!");
            String mensaje = "Su Cambio de clave a sido exitoso, su calve a sido cambiada";
            String asunto = "Cambio de Clave DeMostrar - SimProyect (Sena)";
            Email corre = new Email();
            corre.enviarCorreo(correo, mensaje, asunto);
        } else {
            r.setCodigo(0);
            r.setFrase("Error al actualizar la contraseña");
        }
        return r;
    }

}
