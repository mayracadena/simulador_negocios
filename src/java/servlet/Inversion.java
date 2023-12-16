/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import DAO.InversionDAO;
import DAO.TipoInversionDAO;
import VO.InversionVO;
import VO.TipoInversionVO;
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
@WebServlet(name = "Inversion", urlPatterns = {"/Inversion", "/Inversion/actualizar", "/Inversion/consulta", "/Inversion/eliminar"})
public class Inversion extends HttpServlet {

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
                case "Inversion":
                    resp = this.insertar(request, response, hs);
                    break;
                case "consulta":
                    resp = this.consulta(request, response, hs);
                    break;
                case "eliminar":
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
       InversionDAO ind = new InversionDAO();
       
       Integer idp = (Integer) hs.getAttribute("idproyectito");
       String detalle = request.getParameter("detalle");
       int cantidad = Integer.parseInt(request.getParameter("cantidad"));
       double valorUnitario = Double.parseDouble(request.getParameter("valorUnitario"));
       int vidaUtil = Integer.parseInt(request.getParameter("vidaUtil"));
       int id = Integer.parseInt(request.getParameter("id"));
       
       
       InversionVO iv = new InversionVO(id, detalle, cantidad, valorUnitario, vidaUtil, 0, idp);
       boolean si = ind.update(iv);
        if (si) {
            r.setCodigo(1);
            r.setFrase("Datos Actualizados");
        }else{
            r.setCodigo(0);
            r.setFrase("Error al Actualizar!");
        }
       
       return r;
    }

    private ResponseServlet insertar(HttpServletRequest request, HttpServletResponse response, HttpSession hs) {
       ResponseServlet r = new ResponseServlet();
       InversionDAO ind = new InversionDAO();
       
       Integer idp = (Integer) hs.getAttribute("idproyectito");
       String detalle = request.getParameter("detalle");
       int cantidad = Integer.parseInt(request.getParameter("cantidad"));
       double valorUnitario = Double.parseDouble(request.getParameter("valorUnitario"));
       int vidaUtil = Integer.parseInt(request.getParameter("vidaUtil"));
       int idti  = Integer.parseInt(request.getParameter("idti"));
       
       InversionVO iv = new InversionVO(0, detalle, cantidad, valorUnitario, vidaUtil, idti, idp);
       hs.setAttribute("opcionInversion", idti);
       boolean si = ind.create(iv);
        if (si) {
            r.setCodigo(1);
            r.setFrase("Datos Guardados");
        }else{
            r.setCodigo(0);
            r.setFrase("Error al guardar!");
        }
       
       return r;
    }

    private ResponseServlet consulta(HttpServletRequest request, HttpServletResponse response, HttpSession hs) {
       ResponseServlet r = new ResponseServlet();
       
       InversionDAO i = new InversionDAO();
       InversionVO iv = i.read(request.getParameter("id"));
       
       ArrayList<TipoInversionVO> ti = new ArrayList();
       TipoInversionDAO tid = new TipoInversionDAO();
       ti = tid.readAll();
        if (iv != null) {
            r.setCodigo(1);
            r.setObjeto(iv);
            r.setObjeto2(tid);
        }else{
            r.setCodigo(0);
        }
       return r;
    }

    private ResponseServlet borrar(HttpServletRequest request, HttpServletResponse response, HttpSession hs) {
        ResponseServlet r = new ResponseServlet();
         InversionDAO i = new InversionDAO();
         
         boolean si = i.delete(request.getParameter("id"));
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
