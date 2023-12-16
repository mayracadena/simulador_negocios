/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import DAO.ActividadesDAO;
import VO.ActividadesVO;
import VO.ProductoVO;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "Actividades", urlPatterns = {"/Actividades", "/Actividades/consulta", "/Actividades/actualizar", "/Actividades/eliminar"})
public class Actividades extends HttpServlet {

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
            ResponseServlet resp =  new ResponseServlet();
              String rutaServlet = request.getRequestURI();
            HttpSession hs = request.getSession(true);
            String action = rutaServlet.substring(rutaServlet.lastIndexOf("/") + 1);
            
            
            switch (action) {
                case "Actividades":
                    resp = guardar(request, response, hs);
                    break;
                case "consulta":
                     resp = consulta(request, response, hs);
                    break;
                    case "actualizar":
                     resp = actualizar(request, response, hs);
                    break;
                    case "eliminar":
                     resp = eliminar(request, response, hs);
                    break;
            }
            String obj_devolver = new Gson().toJson(resp);
            out.println(obj_devolver);
            
            
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

    private ResponseServlet guardar(HttpServletRequest request, HttpServletResponse response, HttpSession hs) {
     ResponseServlet r = new ResponseServlet();
        ProductoVO p = (ProductoVO) hs.getAttribute("Productito");
       
        String Actividad = request.getParameter("Actividad");
     String Tiempo = request.getParameter("Tiempo");
     String Cargos = request.getParameter("Cargos");
     String N_cargos = request.getParameter("N_cargos");
     String Equipos = request.getParameter("Equipos");  
     
     ActividadesVO aVO = new ActividadesVO(0, Actividad, Tiempo, Cargos, N_cargos, Equipos, p.getIdProducto());
     ActividadesDAO aDAO = new ActividadesDAO();
     
     boolean si = aDAO.create(aVO);
        if (si) {
            r.setCodigo(1);
            r.setFrase("Actividad guardada");
        }else{
            r.setCodigo(0);
            r.setFrase("Error al guardar Actividad");
        }
     
     return r;
    }

    private ResponseServlet consulta(HttpServletRequest request, HttpServletResponse response, HttpSession hs) {
    ResponseServlet r = new ResponseServlet();
    ActividadesDAO aDAO = new ActividadesDAO();
    int id = Integer.parseInt(request.getParameter("id"));
     ActividadesVO aVO = aDAO.read(id);
     
        if (aVO != null) {
            r.setCodigo(1);
            r.setObjeto(aVO);
        }else{
            r.setCodigo(0);
            r.setFrase("Error al buscar Actividad");
        }
    
    
    return r;
    }

    private ResponseServlet actualizar(HttpServletRequest request, HttpServletResponse response, HttpSession hs) {
         ResponseServlet r = new ResponseServlet();
        
       
        String Actividad = request.getParameter("Actividad");
     String Tiempo = request.getParameter("Tiempo");
     String Cargos = request.getParameter("Cargos");
     String N_cargos = request.getParameter("N_cargos");
     String Equipos = request.getParameter("Equipos");  
     int id = Integer.parseInt(request.getParameter("id"));
     ActividadesVO aVO = new ActividadesVO(id, Actividad, Tiempo, Cargos, N_cargos, Equipos, 0);
     ActividadesDAO aDAO = new ActividadesDAO();
     
     boolean si = aDAO.update(aVO);
        if (si) {
            r.setCodigo(1);
            r.setFrase("Actividad actualizada");
        }else{
            r.setCodigo(0);
            r.setFrase("Error al actualizar Actividad");
        }
     
     return r;
    }

    private ResponseServlet eliminar(HttpServletRequest request, HttpServletResponse response, HttpSession hs) {
    ResponseServlet r = new ResponseServlet();
    ActividadesDAO aDAO = new ActividadesDAO();
     boolean si = aDAO.delete(request.getParameter("id"));
     
        if (si) {
            r.setCodigo(1);
            r.setFrase("Actividad eliminada");
        }else{
            r.setCodigo(0);
            r.setFrase("Error al eliminar Actividad");
        }
    
    
    return r;     
    }

}
