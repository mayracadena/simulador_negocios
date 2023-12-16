/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import DAO.ExportacionDAO;
import VO.ExportacionVO;
import VO.ProductoVO;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonParser;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.TypeVariable;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import util.ResponseServlet;


/**
 *
 * @author mayracadena
 */
@WebServlet(name = "Exportacion", urlPatterns = {"/Exportacion/Exportacion", "/Exportacion/actualizar"})
public class Exportacion extends HttpServlet {

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
                case "Exportacion":
                    resp = this.insert(request, response, hs);
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

    private ResponseServlet insert(HttpServletRequest request, HttpServletResponse response, HttpSession hs) {
        ResponseServlet r = new ResponseServlet();
        ProductoVO pv = (ProductoVO) hs.getAttribute("Productito");
        ExportacionDAO exd = new ExportacionDAO();
        ExportacionVO exv;
        boolean si;
        int cont = 0;
        JsonArray ja = new JsonParser().parse(request.getParameter("costo")).getAsJsonArray();
        JsonArray ja2 = new JsonParser().parse(request.getParameter("dias")).getAsJsonArray();
        int tipoEnvio = Integer.parseInt(request.getParameter("tipoEnvio"));
        
        for (int i = 1; i < 18; i++) {
         //   System.out.println("no pinta -.- "+ja2.getAsJsonArray().get(i));
            exv = new ExportacionVO(0, Double.parseDouble(ja.getAsJsonArray().get(i).toString()),Float.parseFloat(ja2.getAsJsonArray().get(i).toString()),i,tipoEnvio,pv.getIdProducto() );
          si =  exd.create(exv);
            if (si == false) {
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
        
        double costo = Double.parseDouble(request.getParameter("costo"));
        float dias = Float.parseFloat(request.getParameter("dias"));
        int id = Integer.parseInt(request.getParameter("id"));
        
        ExportacionVO ec = new ExportacionVO(id,  costo, dias, 0, 0, 0);
        ExportacionDAO exd = new ExportacionDAO();
        boolean si = exd.update(ec);
        if (si) {
            r.setCodigo(1);
            r.setFrase("Datos actualizados!");
        }else{
            r.setCodigo(0);
            r.setFrase("Error al actualuizar datos");
        }
        
        return r;
    }

}
