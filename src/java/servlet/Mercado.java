/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import DAO.MercadoDAO;
import VO.MercadoVO;
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
@WebServlet(name = "Mercado", urlPatterns = {"/Mercado", "/Mercado/actualizar"})
public class Mercado extends HttpServlet {

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
                case "Mercado":
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
        String sector = request.getParameter("sector");
        String comportamiento = request.getParameter("comportamiento");
        String evolucion = request.getParameter("evolucion");
        String dignostico = request.getParameter("dignostico");
        String objetivo = request.getParameter("objetivo");
        String justificacion = request.getParameter("justificacion");
        String estimacion = request.getParameter("estimacion");
        String consumoa = request.getParameter("consumoa");
        String consumoh = request.getParameter("consumoh");
        String magnitud = request.getParameter("magnitud");
        String estigmacionM = request.getParameter("estigmacionM");
        String perfil = request.getParameter("perfil");
        String productoSustituto = request.getParameter("productoSustituto");

        Integer idp = (Integer) hs.getAttribute("idproyectito");
        
        MercadoVO m = new MercadoVO(0, sector, comportamiento, evolucion, dignostico, objetivo, justificacion, estimacion, consumoa, consumoh, magnitud, estigmacionM, perfil, productoSustituto, idp);
        MercadoDAO md = new MercadoDAO();
        
        boolean si = md.create(m);
        if (si) {
            r.setCodigo(1);
            r.setFrase("Datos Guardados!");
        }else{
            r.setCodigo(0);
            r.setFrase("Error al Guardar los datos");
        }
        return r;
    }

    private ResponseServlet actualizar(HttpServletRequest request, HttpServletResponse response, HttpSession hs) {
         ResponseServlet r = new ResponseServlet();
        String sector = request.getParameter("sector");
        String comportamiento = request.getParameter("comportamiento");
        String evolucion = request.getParameter("evolucion");
        String dignostico = request.getParameter("dignostico");
        String objetivo = request.getParameter("objetivo");
        String justificacion = request.getParameter("justificacion");
        String estimacion = request.getParameter("estimacion");
        String consumoa = request.getParameter("consumoa");
        String consumoh = request.getParameter("consumoh");
        String magnitud = request.getParameter("magnitud");
        String estigmacionM = request.getParameter("estigmacionM");
        String perfil = request.getParameter("perfil");
        String productoSustituto = request.getParameter("productoSustituto");
        int id = Integer.parseInt(request.getParameter("id"));
     
        
        MercadoVO mer = new MercadoVO(id, sector, comportamiento, evolucion, dignostico, objetivo, justificacion, estimacion, consumoa, consumoh, magnitud, estigmacionM, perfil, productoSustituto, id);
        MercadoDAO mercado = new MercadoDAO();
        boolean si = mercado.update(mer);
        if (si) {
            r.setCodigo(1);
            r.setFrase("Datos Actualizados");
        }else{
            r.setCodigo(0);
            r.setFrase("Error al actualizar");
        }
        
        return r;
    }

}
