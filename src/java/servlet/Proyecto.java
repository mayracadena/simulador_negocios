/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import DAO.ProyectoDAO;
import VO.ProyectoVO;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import util.ResponseServlet;

/**
 *
 * @author mayrayesenia
 */
@WebServlet(name = "Proyecto", urlPatterns = {"/Proyecto", "/Proyecto/consulta", "/Proyecto/nombre", "/Proyecto/agregar", "/Proyecto/borrar", "/Proyecto/borrarP", "/Proyecto/cambiarNombre", "/Proyecto/ActualizarNombre", "/Proyecto/ConsultaDetalles", "/Proyecto/abandonar"})
public class Proyecto extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            ResponseServlet resp = new ResponseServlet();
            String rutaServlet = request.getRequestURI();
            HttpSession hs = request.getSession(true);

            String action = rutaServlet.substring(rutaServlet.lastIndexOf("/") + 1);
            switch (action) {
                case "nombre":
                    resp = this.nombre(request, response, hs);
                    break;
                case "consulta":
                    resp = this.consulta(request, response, hs);
                    break;

                case "Proyecto":
                    resp = this.insert(request, response, hs);
                    break;

                case "agregar":
                    resp = this.agregar(request, response, hs);
                    break;
                case "borrar":
                    resp = this.borrar(request, response, hs);
                    break;
                case "borrarP":
                    resp = this.borrarP(request, response, hs);
                    break;
                case "cambiarNombre":
                    resp = this.cambiarNombre(request, response, hs);
                    break;
                    
                case "ActualizarNombre":
                    resp = this.UNombre(request, response, hs);
                    break;
                    
                case "ConsultaDetalles":
                        resp = this.consultaDetalles(request, response, hs);
                        
                        break;
                        
                case "abandonar":
                    resp = this.abandonar(request, response, hs);
                    break;
            }

            String objJSON = new Gson().toJson(resp);
            out.println(objJSON);
        }
    }

    private ResponseServlet nombre(HttpServletRequest request, HttpServletResponse response, HttpSession hs) {
        ResponseServlet r = new ResponseServlet();

        Integer idu = (Integer) hs.getAttribute("idusuario");
        String nombre = request.getParameter("nombreP");
        int etapa = Integer.parseInt(request.getParameter("etapa"));
        int especialidad = Integer.parseInt(request.getParameter("especialidad"));
        ProyectoDAO pd = new ProyectoDAO();
        boolean si = pd.creacion(nombre, idu,especialidad, etapa);

        if (si == true) {
            r.setCodigo(1);
            r.setFrase("Proyecto creado");
            r.setObjeto(null);
        } else {
            r.setCodigo(0);
            r.setFrase("El proyecto no se a podido crear.");
            r.setObjeto(null);
        }

        return r;
    }

    private ResponseServlet consulta(HttpServletRequest request, HttpServletResponse response, HttpSession hs) {
        ResponseServlet r = new ResponseServlet();
        try {
            int id = Integer.parseInt(request.getParameter("idproyecto"));

            hs.setAttribute("idproyectito", id);
            r.setCodigo(1);

        } catch (Exception e) {
            r.setCodigo(0);
            r.setFrase("Error proyecto no encontrado");
        }

        return r;
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

    private ResponseServlet insert(HttpServletRequest request, HttpServletResponse response, HttpSession hs) {
        ResponseServlet r = new ResponseServlet();

        String descripcion = request.getParameter("descripcion");
        String OGeneral = request.getParameter("OGeneral");
        String OEspecificos = request.getParameter("OEspecificos");
        String Justificacion = request.getParameter("Justificacion");
        String Problema = request.getParameter("Problema");
        String Historia = request.getParameter("Historia");
        String Avances = request.getParameter("Avances");
        String Rsocial = request.getParameter("Rsocial");
        int TipoSociedad = Integer.parseInt(request.getParameter("TipoSociedad"));
        int mi = Integer.parseInt(request.getParameter("mi"));
        int id = Integer.parseInt(request.getParameter("id"));

        ProyectoDAO pd = new ProyectoDAO();
        ProyectoVO pv = new ProyectoVO(id, "", 0, descripcion, OGeneral, OEspecificos, Justificacion, Problema, Historia, Avances, mi, Rsocial, TipoSociedad);
        boolean si = pd.create(pv);
        if (si) {
            r.setCodigo(1);
            r.setFrase("Datos guardados!");

        } else {
            r.setCodigo(0);
            r.setFrase("Error al actualizar");
        }

        return r;
    }

    private ResponseServlet agregar(HttpServletRequest request, HttpServletResponse response, HttpSession hs) {
        ResponseServlet r = new ResponseServlet();

        ProyectoDAO p = new ProyectoDAO();
        Integer idp = (Integer) hs.getAttribute("idproyectito");
        int id = Integer.parseInt(request.getParameter("id"));

        boolean si = p.agregar(id, idp);
        if (si) {
            r.setCodigo(1);
            r.setFrase("El usuario ahora hace parte de tu proyecto!");
        } else {
            r.setCodigo(0);
            r.setFrase("¡Error al agregar el usuario a tu proyecto!");
        }

        return r;
    }

    private ResponseServlet borrar(HttpServletRequest request, HttpServletResponse response, HttpSession hs) {
        //borrar un usuario del proyecto nwn
        ResponseServlet r = new ResponseServlet();

        ProyectoDAO p = new ProyectoDAO();
        Integer idp = (Integer) hs.getAttribute("idproyectito");
        int id = Integer.parseInt(request.getParameter("id"));

        boolean si = p.borrar(id, idp);
        if (si) {
            r.setCodigo(1);
            r.setFrase("¡El usuario ya no hace parte tu proyecto!");
        } else {
            r.setCodigo(0);
            r.setFrase("¡Error al eliminar usuario del proyecto!");
        }

        return r;
    }

    private ResponseServlet borrarP(HttpServletRequest request, HttpServletResponse response, HttpSession hs) {
        ResponseServlet r = new ResponseServlet();
        ProyectoDAO p = new ProyectoDAO();
        boolean si = p.delete(request.getParameter("id"));
        if (si) {
            r.setCodigo(1);
            r.setFrase("Proyecto Eliminado");

        } else {
            r.setCodigo(0);
            r.setFrase("Error al eliminar el Proyecto");
        }
        return r;
    }

    private ResponseServlet cambiarNombre(HttpServletRequest request, HttpServletResponse response, HttpSession hs) {
       ResponseServlet r = new ResponseServlet();
        ProyectoDAO p = new ProyectoDAO();
        ProyectoVO pv = p.cambiar(Integer.parseInt(request.getParameter("id")));
        if (pv == null) {
            r.setCodigo(0);
            r.setFrase("No se encontro el proyecto");
        }else{
            r.setCodigo(1);
            r.setObjeto(pv);
        }
       
       return r;
    }

    private ResponseServlet UNombre(HttpServletRequest request, HttpServletResponse response, HttpSession hs) {
       ResponseServlet r = new ResponseServlet();
        ProyectoDAO p = new ProyectoDAO();
        String nombre = request.getParameter("nombre");
        ProyectoVO pv = new ProyectoVO(Integer.parseInt(request.getParameter("id")),nombre , 0, "", "", "", "", "", "", "", 0, "", 0); 
       
        boolean si = p.update(pv);
        if (si) {
            r.setCodigo(1);
            r.setFrase("Nombre del Proyecto actualizado!");
        }else{
            r.setCodigo(0);
            r.setFrase("Error al actualizar el nombre del proyecto     ");
        }
       return r;
    }

    private ResponseServlet consultaDetalles(HttpServletRequest request, HttpServletResponse response, HttpSession hs) {
        ResponseServlet r = new ResponseServlet();
        
        int id = Integer.parseInt(request.getParameter("id"));
         ProyectoDAO p = new ProyectoDAO();
         ProyectoVO pv = null;
        pv =  p.read(id);
        
        if (pv != null) {
            r.setCodigo(1);
            r.setObjeto(pv);
        }else{
            r.setCodigo(0);
            r.setFrase("Error al encontrar los datos");
        }
        
        
        return r;
    }

    private ResponseServlet abandonar(HttpServletRequest request, HttpServletResponse response, HttpSession hs) {
        ResponseServlet r = new ResponseServlet();
        int id = Integer.parseInt(request.getParameter("id"));
        int idu = Integer.parseInt(request.getParameter("idu"));
        ProyectoDAO p = new ProyectoDAO();
        boolean si = p.borrar(idu, id);
        if (si) {
            r.setCodigo(1);
            r.setFrase("Haz abandonado el Proyecto");
        }else{
            r.setCodigo(0);
            r.setFrase("Error al abandonar el Proyecto ");
        }
       return r;
    }

}
