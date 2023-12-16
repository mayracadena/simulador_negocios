/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;


import DAO.PrecioProductosDAO;
import VO.PrecioProductosVO;
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
@WebServlet(name = "PrecioProductos", urlPatterns = {"/PrecioProductos", "/PrecioProductos/consulta", "/PrecioProductos/actualizar", "/PrecioProductos/eliminar"})
public class PrecioProductos extends HttpServlet {

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

                case "PrecioProductos":
                    resp = this.precio(request, response, hs);
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
      
      PrecioProductosDAO pv = new PrecioProductosDAO();
      PrecioProductosVO p = pv.read(request.getParameter("id"));
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
       PrecioProductosDAO pvd = new PrecioProductosDAO();
       int id = Integer.parseInt(request.getParameter("id"));
       double proy = Double.parseDouble(request.getParameter("proy"));
       int year = Integer.parseInt(request.getParameter("year"));
       PrecioProductosVO p = new PrecioProductosVO(id, proy, year, 0);
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
     PrecioProductosDAO pvd = new PrecioProductosDAO();
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

    private ResponseServlet precio(HttpServletRequest request, HttpServletResponse response, HttpSession hs) {
        ResponseServlet r = new ResponseServlet();
        ProductoVO p = (ProductoVO) hs.getAttribute("Productito");
        double proy = Double.parseDouble(request.getParameter("proy"));
        int year = Integer.parseInt(request.getParameter("year"));
        
        PrecioProductosVO pv = new PrecioProductosVO(0, proy, year, p.getIdProducto());
        PrecioProductosDAO pvd =  new PrecioProductosDAO();
        
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
