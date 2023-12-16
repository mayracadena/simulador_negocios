/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import DAO.ConsumidorDAO;
import VO.ConsumidorVO;
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
@WebServlet(name = "Consumidor", urlPatterns = {"/Consumidor", "/Consumidor/actualizar", "/Consumidor/eliminar"})
public class Consumidor extends HttpServlet {

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

                case "Consumidor":
                    resp = this.consumidor(request, response, hs);
                    break;

                case "actualizar":
                    resp = this.actualizar(request, response, hs);
                    break;
                case "eliminar":
                    resp = this.eliminar(request, response, hs);
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

    private ResponseServlet actualizar(HttpServletRequest request, HttpServletResponse response, HttpSession hs) {
        ResponseServlet r = new ResponseServlet();
        
        String Perfil = request.getParameter("Perfil");
        String Localizacion = request.getParameter("Localizacion");
        String Justificacion = request.getParameter("Justificacion");
        String Satisfaccion = request.getParameter("Satisfaccion");
        String Donde_compra = request.getParameter("Donde_compra");
        String Caracteristicas = request.getParameter("Caracteristicas");
        String Frecuencia = request.getParameter("Frecuencia");
        String Precio = request.getParameter("Precio");
        int id = Integer.parseInt(request.getParameter("idc"));
        
        
        
        ConsumidorVO conVO = new ConsumidorVO(id, Perfil, Localizacion, Justificacion, Satisfaccion, Donde_compra, Caracteristicas, Frecuencia, Precio, 0);
        ConsumidorDAO conDAO = new ConsumidorDAO();
        
        boolean si = conDAO.update(conVO);
        
        if (si) {
            r.setCodigo(1);
            r.setFrase("Consumidor Guardado");
        }else{
            r.setCodigo(0);
            r.setFrase("Error al guardar consumidor");
        }
        
        return r;
    }

    private ResponseServlet eliminar(HttpServletRequest request, HttpServletResponse response, HttpSession hs) {
        ResponseServlet r = new ResponseServlet();
        
        int id = Integer.parseInt(request.getParameter("idc"));
        
        ConsumidorDAO consu = new ConsumidorDAO();
        boolean si = consu.delete(id);
        if (si) {
            r.setCodigo(1);
            r.setFrase("Consumidor eliminado");
        }else{
            r.setCodigo(0);
            r.setFrase("Error al eliminar");
        }
        
        return r;
    }

    private ResponseServlet consumidor(HttpServletRequest request, HttpServletResponse response, HttpSession hs) {
        ResponseServlet r = new ResponseServlet();
         ProductoVO p = (ProductoVO) hs.getAttribute("Productito");
        String Perfil = request.getParameter("Perfil");
        String Localizacion = request.getParameter("Localizacion");
        String Justificacion = request.getParameter("Justificacion");
        String Satisfaccion = request.getParameter("Satisfaccion");
        String Donde_compra = request.getParameter("Donde_compra");
        String Caracteristicas = request.getParameter("Caracteristicas");
        String Frecuencia = request.getParameter("Frecuencia");
        String Precio = request.getParameter("Precio");
        
        ConsumidorVO conVO = new ConsumidorVO(0, Perfil, Localizacion, Justificacion, Satisfaccion, Donde_compra, Caracteristicas, Frecuencia, Precio, p.getIdProducto());
        ConsumidorDAO conDAO = new ConsumidorDAO();
        
        boolean si = conDAO.create(conVO);
        
        if (si) {
            r.setCodigo(1);
            r.setFrase("Consumidor Guardado");
        }else{
            r.setCodigo(0);
            r.setFrase("Error al guardar consumidor");
        }
        return r;
    }

}
