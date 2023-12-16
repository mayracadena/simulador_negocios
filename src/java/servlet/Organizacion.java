/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import DAO.OrganizacionDAO;
import VO.OrganizacionVO;
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
@WebServlet(name = "Organizacion", urlPatterns = {"/Organizacion", "/Organizacion/actualizar"})
public class Organizacion extends HttpServlet {

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
                case "Organizacion":
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
        OrganizacionVO or;
        OrganizacionDAO orDAO = new OrganizacionDAO();
        Integer idp = (Integer) hs.getAttribute("idproyectito");
     
     String Nor_empresarial = request.getParameter("Nor_empresarial");
     String Nor_tributaria = request.getParameter("Nor_tributaria");
     String Nor_tecnica = request.getParameter("Nor_tecnica");
     String Nor_laboral = request.getParameter("Nor_laboral");
     String Nor_ambiental = request.getParameter("Nor_ambiental");
     String Registro_marca = request.getParameter("Registro_marca");
     
     or = new OrganizacionVO(0, Nor_empresarial, Nor_tributaria, Nor_tecnica, Nor_laboral, Nor_ambiental, Registro_marca, idp);
        boolean si = orDAO.create(or);
        
        if (si) {
            r.setCodigo(1);
            r.setFrase("Datos Guardados");
        }else{
            r.setCodigo(0);
            r.setFrase("Error al guardar la información");
        }
        return r;
    }

    private ResponseServlet actualizar(HttpServletRequest request, HttpServletResponse response, HttpSession hs) {
        ResponseServlet r = new ResponseServlet();
        OrganizacionVO or;
        OrganizacionDAO orDAO = new OrganizacionDAO();
        Integer idp = (Integer) hs.getAttribute("idproyectito");
           
     String Nor_empresarial = request.getParameter("Nor_empresarial");
     String Nor_tributaria = request.getParameter("Nor_tributaria");
     String Nor_tecnica = request.getParameter("Nor_tecnica");
     String Nor_laboral = request.getParameter("Nor_laboral");
     String Nor_ambiental = request.getParameter("Nor_ambiental");
     String Registro_marca = request.getParameter("Registro_marca");
     
     or = new OrganizacionVO(0, Nor_empresarial, Nor_tributaria, Nor_tecnica, Nor_laboral, Nor_ambiental, Registro_marca, idp);
     
     boolean si = orDAO.update(or);
         if (si) {
            r.setCodigo(1);
            r.setFrase("Datos Guardados");
        }else{
            r.setCodigo(0);
            r.setFrase("Error al actualizar la información");
        }
        return r;
    }

}
