/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import DAO.ProductoDAO;
import VO.ProductoVO;
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
@WebServlet(name = "Producto", urlPatterns = {"/Producto", "/Producto/consulta", "/Producto/actualizar", "/Producto/eliminar", "/Producto/consultita"})
public class Producto extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            ResponseServlet resp = new ResponseServlet();
            String rutaServlet = request.getRequestURI();
            HttpSession hs = request.getSession(true);

            String action = rutaServlet.substring(rutaServlet.lastIndexOf("/") + 1);
            switch (action) {
                case "Producto":
                    resp = this.insert(request, response, hs);
                    break;

                case "consulta":
                    resp = this.consulta(request, response, hs);
                    break;

                case "actualizar":
                    resp = this.actualizar(request, response, hs);
                    break;
                case "eliminar":
                    resp = this.eliminar(request, response, hs);
                    break;
                case "consultita":
                    resp = this.consultita(request, response, hs);
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

    private ResponseServlet insert(HttpServletRequest request, HttpServletResponse response, HttpSession hs) {
        ResponseServlet r = new ResponseServlet();
        Integer idp = (Integer) hs.getAttribute("idproyectito");
        ProductoDAO pd = new ProductoDAO();

        String nombre = request.getParameter("nombre");
        String produ_especifico = request.getParameter("produ_especifico");
        String descripcion_general = request.getParameter("descripcion_general");
        int IdUnidadVenta = Integer.parseInt(request.getParameter("unidadMedida"));
        
      //  System.out.println("Hola :DDD   "+IdUnidadVenta);
        
        String condiciones_especiales = request.getParameter("condiciones_especiales");
        String otro = request.getParameter("otro");
       

        ProductoVO pv = new ProductoVO(0, nombre, produ_especifico, descripcion_general, IdUnidadVenta, condiciones_especiales, otro, idp);
        boolean si = pd.create(pv);
        if (si) {
            r.setCodigo(1);
            r.setFrase("Datos guardados!");
        } else {
            r.setCodigo(0);
            r.setFrase("Error al guardar");
        }

        return r;
    }

    private ResponseServlet consulta(HttpServletRequest request, HttpServletResponse response, HttpSession hs) {
        ResponseServlet r = new ResponseServlet();
        ProductoDAO pd = new ProductoDAO();
        ProductoVO pv = null;
        pv = pd.read(request.getParameter("id"));
        if (pv == null) {
            r.setCodigo(0);
            r.setFrase("Error al encontrar producto");
        } else {
            r.setCodigo(1);
            r.setFrase("Exito");
        }
        return r;
    }

    private ResponseServlet actualizar(HttpServletRequest request, HttpServletResponse response, HttpSession hs) {
        ResponseServlet r = new ResponseServlet();
        ProductoDAO pd = new ProductoDAO();
        Integer idp = (Integer) hs.getAttribute("idproyectito");
        int id = Integer.parseInt(request.getParameter("id"));
        String nombre = request.getParameter("nombre");
        String produ_especifico = request.getParameter("produ_especifico");
        String descripcion_general = request.getParameter("descripcion_general");
        int IdUnidadVenta = Integer.parseInt(request.getParameter("unidadMedida"));
        String condiciones_especiales = request.getParameter("condiciones_especiales");
        String otro = request.getParameter("otro");
    

        ProductoVO pv = new ProductoVO(id, nombre, produ_especifico, descripcion_general, IdUnidadVenta, condiciones_especiales, otro, idp);
        boolean si = pd.update(pv);
        if (si) {
            r.setCodigo(1);
            r.setFrase("Datos actualizados");
        } else {
            r.setCodigo(0);
            r.setFrase("Error al actualizar");
        }

        return r;
    }

    private ResponseServlet eliminar(HttpServletRequest request, HttpServletResponse response, HttpSession hs) {
        ResponseServlet r = new ResponseServlet();
        ProductoDAO pd = new ProductoDAO();

        boolean si = pd.delete(request.getParameter("id"));
        if (si) {
            r.setCodigo(1);
            r.setFrase("Datos eliminados");
        } else {
            r.setCodigo(0);
            r.setFrase("Error al eliminar");
        }
        return r;
    }

    private ResponseServlet consultita(HttpServletRequest request, HttpServletResponse response, HttpSession hs) {
         ResponseServlet r = new ResponseServlet();
        
         ProductoDAO p = new ProductoDAO();
         ProductoVO pv = null;
         pv = p.read(request.getParameter("id"));
         if (pv == null) {
            r.setCodigo(0);
            r.setFrase("No se encontro este producto");
        }else{
             r.setCodigo(1);
             r.setObjeto(pv);
             hs.setAttribute("Productito", pv);
         }
         
         return r;
    }

    

    

}
