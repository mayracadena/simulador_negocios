/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import DAO.EPromocionDAO;
import VO.EPromocionVO;
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
@WebServlet(name = "EPromocion", urlPatterns = {"/EPromocion", "/EPromocion/actualizar"})
public class EPromocion extends HttpServlet {

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
                case "EPromocion":
                    resp = this.insertar(request, response, hs);
                    break;
                case "actualizar":
                    resp = this.actualizar(request, response, hs);
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

    private ResponseServlet insertar(HttpServletRequest request, HttpServletResponse response, HttpSession hs) {
        ResponseServlet r = new ResponseServlet();
        Integer idp = (Integer) hs.getAttribute("idproyectito");
        String estrategia = request.getParameter("estrategia");
        String manejo = request.getParameter("manejo");
        String concepto = request.getParameter("concepto");
        //String presupuesto = request.getParameter("presupuesto");
        String promocion = request.getParameter("promocion");

        EPromocionDAO ed = new EPromocionDAO();
        EPromocionVO e = new EPromocionVO(0, estrategia, manejo, concepto, promocion, idp);
        boolean si = ed.create(e);
        if (si) {
            r.setCodigo(1);
            r.setFrase("Datos Guardados!");
        } else {
            r.setCodigo(0);
            r.setFrase("Error al guardar los datos");
        }

        return r;
    }

    private ResponseServlet actualizar(HttpServletRequest request, HttpServletResponse response, HttpSession hs) {
        ResponseServlet r = new ResponseServlet();
        String estrategia = request.getParameter("estrategia");
        String manejo = request.getParameter("manejo");
        String concepto = request.getParameter("concepto");
        //  String presupuesto = request.getParameter("presupuesto");
        String promocion = request.getParameter("promocion");
        int id = Integer.parseInt(request.getParameter("id"));

        EPromocionDAO ed = new EPromocionDAO();
        EPromocionVO e = new EPromocionVO(id, estrategia, manejo, concepto, promocion, 0);
        boolean si = ed.update(e);
        if (si) {
            r.setCodigo(1);
            r.setFrase("Datos Guardados!");
        } else {
            r.setCodigo(0);
            r.setFrase("Error al guardar los datos");
        }
        return r;
    }

}
