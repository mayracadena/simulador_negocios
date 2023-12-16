/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import DAO.KCDAO;
import VO.KCVO;
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
@WebServlet(name = "Kc", urlPatterns = {"/Kc", "/kc/actualizar", "/Kc/eliminar", "/Kc/consulta"})
public class Kc extends HttpServlet {

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
                case "Kc":
                    resp = this.crear(request, response, hs);
                    break;
                case "actualizar":
                    resp = this.editar(request, response, hs);
                    break;
                case "eliminar":
                    resp = this.borrar(request, response, hs);
                    break;
                case "consulta":
                    resp = this.buscar(request, response, hs);
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

    private ResponseServlet crear(HttpServletRequest request, HttpServletResponse response, HttpSession hs) {
        ResponseServlet r = new ResponseServlet();
        Integer idp = (Integer) hs.getAttribute("idproyectito");

        String concepto = request.getParameter("concepto");
        double monto = Double.parseDouble(request.getParameter("monto"));
        double tasa = Double.parseDouble(request.getParameter("tasa"));

        KCVO kv = new KCVO(0, concepto, monto, tasa, idp);
        KCDAO k = new KCDAO();

        boolean si = k.create(kv);

        if (si) {
            r.setCodigo(1);
            r.setFrase("Datos guardados!");
        } else {
            r.setCodigo(0);
            r.setFrase("¡Error al guardar!");
        }
        return r;
    }

    private ResponseServlet editar(HttpServletRequest request, HttpServletResponse response, HttpSession hs) {
        ResponseServlet r = new ResponseServlet();

        String concepto = request.getParameter("concepto");
        double monto = Double.parseDouble(request.getParameter("monto"));
        double tasa = Double.parseDouble(request.getParameter("tasa"));
        int id = Integer.parseInt(request.getParameter("id"));
        KCDAO k = new KCDAO();
        KCVO kv = new KCVO(id, concepto, monto, tasa, 0);
        boolean si = k.update(kv);
        if (si) {
            r.setCodigo(1);
            r.setFrase("¡Datos Actualizados!");
        } else {
            r.setCodigo(0);
            r.setFrase("¡Error al actualizar!");
        }
        return r;
    }

    private ResponseServlet borrar(HttpServletRequest request, HttpServletResponse response, HttpSession hs) {
        ResponseServlet r = new ResponseServlet();
        KCDAO k = new KCDAO();
        boolean si = k.delete(request.getParameter("id"));
        if (si) {
            r.setCodigo(1);
            r.setFrase("¡Datos eliminados!");
        }else{
            r.setCodigo(0);
            r.setFrase("Error al eliminar");
        }
        return r;
    }

    private ResponseServlet buscar(HttpServletRequest request, HttpServletResponse response, HttpSession hs) {
        ResponseServlet r = new ResponseServlet();
        KCDAO k = new KCDAO();
        KCVO kv = k.read(request.getParameter("id"));
        if (kv != null) {
            r.setCodigo(1);
            r.setObjeto(kv);
        } else {
            r.setCodigo(0);
            r.setFrase("Ha ocurrido un error D':<");
        }

        return r;
    }
}
