/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import DAO.EPreciosDAO;
import VO.EPreciosVO;
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
 * @author mayracadena
 */
@WebServlet(name = "EPrecios", urlPatterns = {"/EPrecios", "/EPrecios/actualizar"})
public class EPrecios extends HttpServlet {

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
                case "EPrecios":
                    resp = this.create(request, response, hs);
                    break;
                case "actualizar":
                    resp = this.update(request, response, hs);
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

    private ResponseServlet create(HttpServletRequest request, HttpServletResponse response, HttpSession hs) {
        ResponseServlet r = new ResponseServlet();
        ProductoVO pv = (ProductoVO) hs.getAttribute("Productito");
        
        String Lanzamiento = request.getParameter("lanzamiento");
        String equilibrio = request.getParameter("equilibrio");
        String condicion = request.getParameter("condicion");
        String seguro = request.getParameter("seguro");
        String impuestos = request.getParameter("impuestos");
        String riesgo = request.getParameter("riesgo");
        String preferencia = request.getParameter("preferencia");
        String tactica = request.getParameter("tactica");
        String guerra = request.getParameter("guerra");
        String analisis = request.getParameter("analisis");
        String comportamiento = request.getParameter("comportamiento");
        
        EPreciosDAO e = new EPreciosDAO();
        EPreciosVO ev = new EPreciosVO(0, Lanzamiento, equilibrio, condicion, seguro, impuestos, riesgo, preferencia, tactica, guerra, analisis, comportamiento, pv.getIdProducto());
        
        boolean si = e.create(ev);
        if (si) {
            r.setCodigo(1);
            r.setFrase("Datos guardados!");
        }else{
            r.setCodigo(0);
            r.setFrase("Error al guardar");
        }
        
        return r;
    }

    private ResponseServlet update(HttpServletRequest request, HttpServletResponse response, HttpSession hs) {
         ResponseServlet r = new ResponseServlet();
        
        String Lanzamiento = request.getParameter("lanzamiento");
        String equilibrio = request.getParameter("equilibrio");
        String condicion = request.getParameter("condicion");
        String seguro = request.getParameter("seguro");
        String impuestos = request.getParameter("impuestos");
        String riesgo = request.getParameter("riesgo");
        String preferencia = request.getParameter("preferencia");
        String tactica = request.getParameter("tactica");
        String guerra = request.getParameter("guerra");
        String analisis = request.getParameter("analisis");
        String comportamiento = request.getParameter("comportamiento");
        int id = Integer.parseInt(request.getParameter("id"));
        
        EPreciosDAO e = new EPreciosDAO();
        EPreciosVO ev = new EPreciosVO(id, Lanzamiento, equilibrio, condicion, seguro, impuestos, riesgo, preferencia, tactica, guerra, analisis, comportamiento,0);
        boolean si = e.update(ev);
        if (si) {
            r.setCodigo(1);
            r.setFrase("Datos Actualizados!");
        }else{
            r.setCodigo(0);
            r.setFrase("Error al actualizar");
        }
        return r;
    }

}
