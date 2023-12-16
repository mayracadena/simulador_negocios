/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import DAO.InfInsumoDAO;
import VO.InfInsumoVO;
import VO.ProductoVO;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonParser;
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
@WebServlet(name = "Insumo", urlPatterns = {"/Insumo", "/Insumo/actualizar", "/Insumo/buscar"})
public class Insumo extends HttpServlet {

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
                case "Insumo":
                    resp = this.insertar(request, response, hs);
                    break;
                case "actualizar":
                    resp = this.actualizar(request, response, hs);
                    break;
                
                case "buscar":
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

    private ResponseServlet insertar(HttpServletRequest request, HttpServletResponse response, HttpSession hs) {
        ResponseServlet r = new ResponseServlet();
        
         Integer idp = (Integer) hs.getAttribute("idproyectito");
         JsonArray ja = new JsonParser().parse(request.getParameter("valor")).getAsJsonArray();
         int id = Integer.parseInt(request.getParameter("id"));
         hs.setAttribute("opcionInsumos", id);
         InfInsumoDAO idao = new InfInsumoDAO();
         InfInsumoVO iivo;
         boolean si;
         int cont = 0;
         for (int i = 1; i <= 5; i++) {
             
            iivo = new InfInsumoVO(0, id, i, Double.parseDouble(ja.getAsJsonArray().get(i).toString()), idp);
            si = idao.create(iivo);
             if (si==false) {
                 cont = cont + 1;
             }
         }
        
         if (cont == 0) {
            r.setCodigo(1);
            r.setFrase("Datos Guardados");
        }else{
             r.setCodigo(0);
             r.setFrase("Error al guardar los datos");
         }
        return r;
    }

    private ResponseServlet actualizar(HttpServletRequest request, HttpServletResponse response, HttpSession hs) {
        ResponseServlet r = new ResponseServlet();
        
        double valor = Double.parseDouble(request.getParameter("valor"));
        int id = Integer.parseInt(request.getParameter("id"));
        InfInsumoDAO idao = new InfInsumoDAO();
        InfInsumoVO iivo = new InfInsumoVO(id, 0, 0, valor, 0);
        int idti = Integer.parseInt(request.getParameter("idti"));
        boolean si = idao.update(iivo);
        if (si) {
            hs.setAttribute("opcionInsumos", idti);
            r.setCodigo(1);
            r.setFrase("Datos actualizados");
        }else{
            r.setCodigo(0);
            r.setFrase("Error al actualizar los datos");
        }
        
        return r;
    }



    private ResponseServlet buscar(HttpServletRequest request, HttpServletResponse response, HttpSession hs) {
        ResponseServlet r = new ResponseServlet();
       
        int idi = Integer.parseInt(request.getParameter("id"));
        InfInsumoDAO idao = new InfInsumoDAO();
        InfInsumoVO inf = null;
        
        inf =  idao.read(idi);
        if (inf == null) {
            r.setCodigo(0);
            r.setFrase("nada nadita :D");
            r.setObjeto(null);
        }else{
            r.setCodigo(1);
            r.setObjeto(inf);
        }
 
        
        return r;
    }

}
