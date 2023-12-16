/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import DAO.ComentarioDAO;
import VO.ComentarioVO;
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
@WebServlet(name = "Comentario", urlPatterns = {"/Comentario", "/Comentario/actualizar"})
public class Comentario extends HttpServlet {

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
                case "Comentario":
                    resp = this.consulta(request, response, hs);
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

    private ResponseServlet consulta(HttpServletRequest request, HttpServletResponse response, HttpSession hs) {
        ResponseServlet r = new ResponseServlet();
        ComentarioDAO coDAO = new ComentarioDAO();
        ComentarioVO coVO = null;
        coVO = coDAO.read(request.getParameter("id"));
        
        if (coVO != null) {
            r.setCodigo(1);
            r.setObjeto(coVO);
        }else{
            r.setCodigo(0);
            r.setFrase("No hay comentarios");
        }
        

        return r;
    }

    private ResponseServlet create(HttpServletRequest request, HttpServletResponse response, HttpSession hs) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    private ResponseServlet actualizar(HttpServletRequest request, HttpServletResponse response, HttpSession hs) {
        ResponseServlet r = new ResponseServlet();
        ComentarioDAO coDAO = new ComentarioDAO();
        int id = Integer.parseInt(request.getParameter("id"));
        String Comentario = request.getParameter("comentario");
        ComentarioVO coVO = new ComentarioVO(0, Comentario, id);

        boolean si = coDAO.update(coVO);

        if (si) {
            r.setCodigo(1);
            r.setFrase("Comentario guardado");
        } else {
            r.setCodigo(0);
            r.setFrase("Error al guardar comentario");
        }

        return r;
    }

}
