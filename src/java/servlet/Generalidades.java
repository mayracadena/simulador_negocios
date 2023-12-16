/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import DAO.GeneralDAO;
import VO.GeneralVO;
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
@WebServlet(name = "Generalidades", urlPatterns = {"/Generalidades", "/Generalidades/Actualizar"})
public class Generalidades extends HttpServlet {

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
                case "Generalidades":
                    resp = this.buscar(request, response);
                    break;
                case "Actualizar":
                    resp = this.actualizar(request, response);
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

    private ResponseServlet buscar(HttpServletRequest request, HttpServletResponse response) {
        ResponseServlet r = new ResponseServlet();
        GeneralVO gv;
        GeneralDAO gd = new GeneralDAO();
        gv = gd.read(1);

        r.setObjeto(gv);
        return r;
    }

    private ResponseServlet actualizar(HttpServletRequest request, HttpServletResponse response) {
        ResponseServlet r = new ResponseServlet();
        double salarioM = Double.parseDouble(request.getParameter("salarioM"));
        double subsidioT = Double.parseDouble(request.getParameter("subsidioT"));
        double TazaImpuestos = Double.parseDouble(request.getParameter("TazaImpuestos"));
     //   double TazaOportunidad = Double.parseDouble(request.getParameter("TazaOportunidad"));
        float Cesantias = Float.parseFloat(request.getParameter("Cesantias"));
        float InteresesCesantias = Float.parseFloat(request.getParameter("InteresesCesantias"));
        float PrimaServicios = Float.parseFloat(request.getParameter("PrimaServicios"));
        float Vacaciones = Float.parseFloat(request.getParameter("Vacaciones"));
        float CajaCompensacion = Float.parseFloat(request.getParameter("CajaCompensacion"));
        float EPSalud = Float.parseFloat(request.getParameter("EPSalud"));
        float Pension = Float.parseFloat(request.getParameter("Pension"));
        float Riesgos = Float.parseFloat(request.getParameter("Riesgos"));
        
        GeneralVO gv = new GeneralVO(1, salarioM, subsidioT, TazaImpuestos, 0, Cesantias, InteresesCesantias, PrimaServicios, Vacaciones, CajaCompensacion, EPSalud, Pension, Riesgos);
        GeneralDAO gd = new GeneralDAO();
        
        boolean si = gd.update(gv);
        if (si) {
            r.setCodigo(1);
            r.setFrase("Datos Actualizados!");
        }else{
            r.setCodigo(0);
            r.setFrase("Error al actualizar los datos");
        }
        
        return r;
    }

}
