/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import DAO.CompetenciaDAO;
import VO.CompetenciaVO;
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
@WebServlet(name = "Competencia", urlPatterns = {"/Competencia", "/Competencia/consulta", "/Competencia/actualizar", "/Competencia/eliminar"})
public class Competencia extends HttpServlet {

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
                //consulta de datos provenientes del id de competencia
                case "consulta":
                    resp = this.consulta(request, response, hs);
                    break;
                    // insercion de los datos
                case "Competencia":
                    resp = this.insertar(request, response, hs);
                    break;
                    // actualización de los datos tabla competencia
                case "actualizar":
                    resp = this.actualizar(request, response, hs);
                    break;
                    // eliminacion con el id
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
        CompetenciaDAO c = new CompetenciaDAO();
        CompetenciaVO cv = c.read(request.getParameter("id"));
        if (cv != null) {
            r.setCodigo(1);
            r.setObjeto(cv);
        }else{
            r.setCodigo(0);
            r.setFrase("Error no se encontro estos datos");
        }
        

        return r;
    }

    private ResponseServlet insertar(HttpServletRequest request, HttpServletResponse response, HttpSession hs) {
        ResponseServlet r = new ResponseServlet();

        ProductoVO pv = (ProductoVO) hs.getAttribute("Productito");
        String nombre = request.getParameter("nombre");
        String analisis = request.getParameter("analisis");
        String Imagen = request.getParameter("imagen");
        String Frente = request.getParameter("frente");

        CompetenciaDAO c = new CompetenciaDAO();
        CompetenciaVO cv = new CompetenciaVO(0, nombre, analisis, Imagen, Frente, pv.getIdProducto());

        boolean si = c.create(cv);
        if (si) {
            r.setCodigo(1);
            r.setFrase("Datos guardados!");
        } else {
            r.setCodigo(0);
            r.setFrase("Error al guardar!");
        }

        return r;
    }

    private ResponseServlet actualizar(HttpServletRequest request, HttpServletResponse response, HttpSession hs) {
        ResponseServlet r = new ResponseServlet();

        String nombre = request.getParameter("nombre");
        String analisis = request.getParameter("analisis");
        String Imagen = request.getParameter("imagen");
        String Frente = request.getParameter("frente");
        int id = Integer.parseInt(request.getParameter("id"));

        CompetenciaDAO c = new CompetenciaDAO();
        CompetenciaVO cv = new CompetenciaVO(id, nombre, analisis, Imagen, Frente, 0);

        boolean si = c.update(cv);
        if (si) {
            r.setCodigo(1);
            r.setFrase("Datos Actualizados!");
        } else {
            r.setCodigo(0);
            r.setFrase("Error al actualizar los datos");
        }

        return r;
    }

    private ResponseServlet eliminar(HttpServletRequest request, HttpServletResponse response, HttpSession hs) {
        ResponseServlet r = new ResponseServlet();

        CompetenciaDAO c = new CompetenciaDAO();
        boolean si = c.delete(request.getParameter("id"));
        if (si) {
            r.setCodigo(1);
            r.setFrase("Datos eliminados!");
        } else {
            r.setCodigo(0);
            r.setFrase("Error al eliminar!");
        }

        return r;
    }

}
