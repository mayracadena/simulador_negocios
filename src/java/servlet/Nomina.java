/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import DAO.NominaDAO;
import VO.NominaVO;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
@WebServlet(name = "Nomina", urlPatterns = {"/Nomina", "/Nomina/actualizar", "/Nomina/consulta", "/Nomina/borrar"})
public class Nomina extends HttpServlet {

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
                case "Nomina":
                    resp = this.insertar(request, response, hs);
                    break;
                case "consulta":
                    resp = this.consulta(request, response, hs);
                    break;
                case "borrar":
                    resp = this.borrar(request, response, hs);
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
        NominaDAO nd = new NominaDAO();
        
        String cargo = request.getParameter("cargo");
        int meses = Integer.parseInt(request.getParameter("meses"));
        int cantidad = Integer.parseInt(request.getParameter("cantidad"));
        double salario = Double.parseDouble(request.getParameter("salario"));
        int id = Integer.parseInt(request.getParameter("id"));
        
        NominaVO nv = new NominaVO(id, cargo,meses,cantidad,salario,0,0);
        boolean  si = nd.update(nv);
              int idtn = Integer.parseInt(request.getParameter("idtn"));
            hs.setAttribute("opcionNomina", idtn);
        if (si) {
            r.setCodigo(1);
            r.setFrase("Datos actualizados");
        }else{
            r.setCodigo(0);
            r.setFrase("Error al actualizar");
        }
        
        return r;
    }

    private ResponseServlet insertar(HttpServletRequest request, HttpServletResponse response, HttpSession hs) {
        ResponseServlet r = new ResponseServlet();
        Integer idp = (Integer) hs.getAttribute("idproyectito");
        NominaDAO nd = new NominaDAO();
        
        String cargo = request.getParameter("cargo");
        int meses = Integer.parseInt(request.getParameter("meses"));
        int cantidad = Integer.parseInt(request.getParameter("cantidad"));
        double salario = Double.parseDouble(request.getParameter("salario"));
        int idtn = Integer.parseInt(request.getParameter("tiponomina"));
        
        NominaVO nv = new NominaVO(0, cargo, meses, cantidad, salario, idtn, idp);
       hs.setAttribute("opcionNomina", idtn);
        boolean si = nd.create(nv);
        if (si) {
            r.setCodigo(1);
            r.setFrase("Datos guardados");
        }else{
            r.setCodigo(0);
            r.setFrase("Error al guardar los datos");
        }
        return r;
    }

    private ResponseServlet consulta(HttpServletRequest request, HttpServletResponse response, HttpSession hs) {
     ResponseServlet r = new ResponseServlet();
     NominaDAO nd = new NominaDAO();
     NominaVO n = null;
     n = nd.read(request.getParameter("id"));
    
        if (n != null) {
            r.setCodigo(1);
            r.setObjeto(n);
        }else{
            r.setCodigo(0);
            r.setObjeto(null);
        }
        return r;
    }

    private ResponseServlet borrar(HttpServletRequest request, HttpServletResponse response, HttpSession hs) {
        ResponseServlet r = new ResponseServlet();
        NominaDAO nd = new NominaDAO();
        boolean si = nd.delete(request.getParameter("id"));
        if (si) {
            r.setCodigo(1);
            r.setFrase("Datos eliminados");
        }else{
            r.setCodigo(0);
            r.setFrase("Error al eliminar");
        }
        return r;
    }

}
