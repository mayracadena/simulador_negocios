/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import DAO.GastoCostoDAO;
import VO.GastoCostoVO;
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
@WebServlet(name = "GastoCosto", urlPatterns = {"/GastoCosto", "/GastoCosto/consulta", "/GastoCosto/actualizar", "/GastoCosto/eliminar"})
public class GastoCosto extends HttpServlet {

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

                case "GastoCosto":
                    resp = this.crear(request, response, hs);
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
        GastoCostoDAO gcd = new GastoCostoDAO();
        GastoCostoVO gc = null;
        gc = gcd.read(request.getParameter("id"));
        if (gc != null) {
            r.setCodigo(1);
            r.setObjeto(gc);
        } else {
            r.setCodigo(0);
            r.setFrase("No se encontro los datos");
        }
        return r;
    }

    private ResponseServlet crear(HttpServletRequest request, HttpServletResponse response, HttpSession hs) {
        ResponseServlet r = new ResponseServlet();
        GastoCostoDAO gcd = new GastoCostoDAO();
        Integer idp = (Integer) hs.getAttribute("idproyectito");
        String detalle = request.getParameter("detalle");
        int meses = Integer.parseInt(request.getParameter("meses"));
        int cantidadM = Integer.parseInt(request.getParameter("cantidad"));
        double valorMoA = Double.parseDouble(request.getParameter("valor"));
        int itgc = Integer.parseInt(request.getParameter("idtgc"));
        GastoCostoVO gc = new GastoCostoVO(0, detalle, meses, cantidadM, valorMoA, itgc, idp);
        hs.setAttribute("opcionGastoCosto", itgc);
        boolean si = gcd.create(gc);
        if (si) {
            r.setCodigo(1);
            r.setFrase("Datos guardados!");

        } else {
            r.setCodigo(0);
            r.setFrase("Error al guardar datos");
        }
        return r;
    }

    private ResponseServlet actualizar(HttpServletRequest request, HttpServletResponse response, HttpSession hs) {
        ResponseServlet r = new ResponseServlet();
        GastoCostoDAO gcd = new GastoCostoDAO();
        Integer idp = (Integer) hs.getAttribute("idproyectito");
        String detalle = request.getParameter("detalle");
        int meses = Integer.parseInt(request.getParameter("meses"));
        int cantidadM = Integer.parseInt(request.getParameter("cantidad"));
        double valorMoA = Double.parseDouble(request.getParameter("valor"));
        int id = Integer.parseInt(request.getParameter("id"));
        GastoCostoVO gc = new GastoCostoVO(id, detalle, meses, cantidadM, valorMoA, 0, idp);
        int itgc = Integer.parseInt(request.getParameter("idtgc"));
        hs.setAttribute("opcionGastoCosto", itgc);
        boolean si = gcd.update(gc);
        if (si) {
            r.setCodigo(1);
            r.setFrase("Datos Actualizados!");

        } else {
            r.setCodigo(0);
            r.setFrase("Error al actualizar datos");
        }
        return r;
    }

    private ResponseServlet eliminar(HttpServletRequest request, HttpServletResponse response, HttpSession hs) {
        ResponseServlet r = new ResponseServlet();
        GastoCostoDAO gcd = new GastoCostoDAO();
        
        boolean si = gcd.delete(request.getParameter("id"));
        if (si) {
            r.setCodigo(1);
            r.setFrase("Datos Eliminados");
        }else{
            r.setCodigo(0);
            r.setFrase("Error al eliminar");
        }
        return r;
    }

}
