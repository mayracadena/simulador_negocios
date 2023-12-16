/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import DAO.UnidadMedidaDAO;
import VO.UnidadMedidaVO;
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
@WebServlet(name = "UnidadMedida", urlPatterns = {"/UnidadMedida", "/UnidadMedida/eliminar"})
public class UnidadMedida extends HttpServlet {

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
                case "UnidadMedida":
                    resp = this.unidad_medida(request, response);
                    break;
                case "eliminar":
                    resp = this.eliminar(request, response);
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

    private ResponseServlet unidad_medida(HttpServletRequest request, HttpServletResponse response) {
        ResponseServlet r = new ResponseServlet();
        String uni = request.getParameter("unidadM");
         UnidadMedidaDAO uniDAO = new UnidadMedidaDAO();
        boolean si = uniDAO.create(new UnidadMedidaVO(0, uni));
         if (si) {
            r.setCodigo(1);
            r.setFrase("Unidad de medida guardada");
        }else{
            r.setCodigo(0);
            r.setFrase("Error al guardar unidad de medida");
        }
        return r;
    }

    private ResponseServlet eliminar(HttpServletRequest request, HttpServletResponse response) {
       ResponseServlet r = new ResponseServlet();
        int id = Integer.parseInt(request.getParameter("idu"));
        UnidadMedidaDAO uniDAO = new UnidadMedidaDAO();
        boolean si = uniDAO.delete(id);
        if (si) {
            r.setCodigo(1);
            r.setFrase("Unidad de medida eliminada");
        }else{
            r.setCodigo(0);
            r.setFrase("Error al eliminar unidad de medida");
        }
        
        return r;
    }

}
