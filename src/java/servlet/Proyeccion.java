/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import DAO.ProyeccionVentasDAO;
import VO.ProductoVO;
import VO.ProyeccionVentasVO;
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
@WebServlet(name = "Proyeccion", urlPatterns = {"/Proyeccion", "/Proyeccion/consulta", "/Proyeccion/actualizar", "/Proyeccion/eliminar"})
public class Proyeccion extends HttpServlet {

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
                case "consulta":
                    resp = this.consulta(request, response, hs);
                    break;

                case "Proyeccion":
                    resp = this.ProyeccionVentas(request, response, hs);
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

    private ResponseServlet consulta(HttpServletRequest request, HttpServletResponse response, HttpSession hs) {
      ResponseServlet r = new ResponseServlet();
      
      ProyeccionVentasDAO pv = new ProyeccionVentasDAO();
      ProyeccionVentasVO p = pv.read(request.getParameter("id"));
        if (p == null) {
          r.setCodigo(0);
          r.setFrase("No se encontro el registro");
        }else{
            r.setCodigo(1);
            r.setFrase("Shi :3");
            r.setObjeto(p);
        }
      return r;
    }

    private ResponseServlet actualizar(HttpServletRequest request, HttpServletResponse response, HttpSession hs) {
       ResponseServlet r = new ResponseServlet();
       ProyeccionVentasDAO pvd = new ProyeccionVentasDAO();
       int id = Integer.parseInt(request.getParameter("id"));
       double proy = Double.parseDouble(request.getParameter("proy"));
       int year = Integer.parseInt(request.getParameter("year"));
       ProyeccionVentasVO p = new ProyeccionVentasVO(id, proy, year, 0);
       boolean si = pvd.update(p);
        if (si) {
            r.setCodigo(1);
            r.setFrase("Datos actualizados");
        }else{
            r.setCodigo(0);
            r.setFrase("Error al actualizar");
        }
       
       return r;
    }

    private ResponseServlet eliminar(HttpServletRequest request, HttpServletResponse response, HttpSession hs) {
     ResponseServlet r = new ResponseServlet();
     ProyeccionVentasDAO pvd = new ProyeccionVentasDAO();
     boolean si = pvd.delete(request.getParameter("id"));
        if (si) {
            r.setCodigo(1);
            r.setFrase("Datos eliminados");
        }else{
            r.setCodigo(0);
            r.setFrase("Error al eliminar");
        }
     return r;
    }

    private ResponseServlet ProyeccionVentas(HttpServletRequest request, HttpServletResponse response, HttpSession hs) {
        ResponseServlet r = new ResponseServlet();
        ProductoVO p = (ProductoVO) hs.getAttribute("Productito");
        double proy = Double.parseDouble(request.getParameter("proy"));
        int year = Integer.parseInt(request.getParameter("year"));
        
        ProyeccionVentasVO pv = new ProyeccionVentasVO(0, proy, year, p.getIdProducto());
        ProyeccionVentasDAO pvd =  new ProyeccionVentasDAO();
        
        boolean si = pvd.create(pv);
        if (si) {
            r.setCodigo(1);
            r.setFrase("Datos Guardados");
        }else{
            r.setCodigo(0);
            r.setFrase("Error al guardar");
        }
        return r;
    }

}
