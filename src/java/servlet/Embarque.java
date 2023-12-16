/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import DAO.EmbarqueDAO;
import VO.EmbarqueVO;
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
@WebServlet(name = "Embarque", urlPatterns = {"/Embarque" , "/Embarque/actualizar"})
public class Embarque extends HttpServlet {

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
                case "Embarque":
                    resp = this.insert(request, response, hs);
                    break;


                case "actualizar":
                    resp = this.actualizar(request, response, hs);
                    break;
//                case "eliminar":
//                    resp = this.eliminar(request, response, hs);
//                    break;
               
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
       String Origen = request.getParameter("origen");
       String Destino = request.getParameter("destino");
       double peso = Double.parseDouble(request.getParameter("peso"));
       int unidadMedida = Integer.parseInt(request.getParameter("unidadMedida"));
       String UnidadComercial = request.getParameter("unidades");
       String VolumenTotal = request.getParameter("volumen");
       String TerminoVenta = request.getParameter("termino");
       String valoruc = request.getParameter("valoruc");
       String FormaPago = request.getParameter("pago");
       double cambio = Double.parseDouble(request.getParameter("cambio"));
        
       EmbarqueVO ev = new EmbarqueVO(0, Origen, Destino, peso, unidadMedida, UnidadComercial, VolumenTotal, TerminoVenta, FormaPago, valoruc, cambio, pv.getIdProducto());
       EmbarqueDAO embarqueDAO = new EmbarqueDAO();
       boolean si = embarqueDAO.create(ev);
        if (si) {
            r.setCodigo(1);
            r.setFrase("Datos Guardados");
        }else{
            r.setCodigo(0);
            r.setFrase("Error al guardar");
        }
       
       return r;
    }


    private ResponseServlet actualizar(HttpServletRequest request, HttpServletResponse response, HttpSession hs) {
        ResponseServlet r = new ResponseServlet();
         ProductoVO pv = (ProductoVO) hs.getAttribute("Productito");
       int id = Integer.parseInt(request.getParameter("id"));  
       String Origen = request.getParameter("origen");
       String Destino = request.getParameter("destino");
       double peso = Double.parseDouble(request.getParameter("peso"));
       int unidadMedida = Integer.parseInt(request.getParameter("unidadMedida"));
       String UnidadComercial = request.getParameter("unidades");
       String VolumenTotal = request.getParameter("volumen");
       String TerminoVenta = request.getParameter("termino");
       String valoruc = request.getParameter("valoruc");
       String FormaPago = request.getParameter("pago");
       double cambio = Double.parseDouble(request.getParameter("cambio"));
       
        EmbarqueVO ev = new EmbarqueVO(id, Origen, Destino, peso, unidadMedida, UnidadComercial, VolumenTotal, TerminoVenta, FormaPago, valoruc, cambio, pv.getIdProducto());
       EmbarqueDAO embarqueDAO = new EmbarqueDAO();
       boolean si = embarqueDAO.update(ev);
       if (si) {
            r.setCodigo(1);
            r.setFrase("¡Datos Actualizados!");
        }else{
            r.setCodigo(0);
            r.setFrase("Error al actualizar");
        }
       return r;
    }

}
