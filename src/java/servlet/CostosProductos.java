/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import DAO.CostosProductosDAO;
import DAO.UnidadMedidaDAO;
import VO.CostosProductosVO;
import VO.ProductoVO;
import VO.UnidadMedidaVO;
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
 * @author mayrayesenia
 */
@WebServlet(name = "CostosProductos", urlPatterns = {"/CostosProductos", "/CostosProductos/actualizar", "/CostosProductos/eliminar", "/CostosProductos/consulta"})
public class CostosProductos extends HttpServlet {

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
                // insert CostosProductos
                case "CostosProductos":
                    resp = this.crear(request, response, hs);
                    break;
                // consulta por id de CostosProductos
                case "consulta":
                    resp = this.consulta(request, response, hs);
                break;
                // update de CostosProductos
                case "actualizar":
                     resp = this.actualizar(request, response, hs);
                    break;
                //delete por el id de CostosProductos    
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

    private ResponseServlet crear(HttpServletRequest request, HttpServletResponse response, HttpSession hs) {
       ResponseServlet r = new ResponseServlet();
        CostosProductosDAO cpd = new CostosProductosDAO();
        // cesión del producto
        ProductoVO   pv = (ProductoVO) hs.getAttribute("Productito");
       //parametros para insertar 
        String detalle = request.getParameter("detalle");
        float iva = Float.parseFloat(request.getParameter("iva"));
        int cantidad = Integer.parseInt(request.getParameter("cantidad"));
        int unidadMedida = Integer.parseInt(request.getParameter("unidadMedida"));
        double precio = Double.parseDouble(request.getParameter("precio"));
        int idtc = Integer.parseInt(request.getParameter("idt"));
        
        
        //objeto CostosProducto
       CostosProductosVO cp = new CostosProductosVO(0, detalle, iva, cantidad, unidadMedida, precio, idtc, pv.getIdProducto());
       //cesion para quedar en la misma opcion de costos
       hs.setAttribute("opcionCostosP", idtc);
       boolean si = cpd.create(cp);
        if (si) {
            r.setCodigo(1);
            r.setFrase("Datos Guardados!");
        }else{
            r.setCodigo(0);
            r.setFrase("Error al guardar");
        }
       
       return r;
    }

    private ResponseServlet consulta(HttpServletRequest request, HttpServletResponse response, HttpSession hs) {
        ResponseServlet r = new ResponseServlet();
        CostosProductosDAO cp = new CostosProductosDAO();
        
        CostosProductosVO c;
        c = cp.read(request.getParameter("id"));
        
        ArrayList<UnidadMedidaVO> u = new ArrayList();
        UnidadMedidaDAO un = new UnidadMedidaDAO();
        u = un.readAll();
        
        if (c == null) {
            r.setCodigo(0);
            
        }else{
            r.setCodigo(1);
            r.setObjeto(c);
            r.setObjeto2(u);
        }
        return r;
    }

    private ResponseServlet actualizar(HttpServletRequest request, HttpServletResponse response, HttpSession hs) {
        ResponseServlet r = new ResponseServlet();
         String detalle = request.getParameter("detalle");
        float iva = Float.parseFloat(request.getParameter("iva"));
        int cantidad = Integer.parseInt(request.getParameter("cantidad"));
        int unidadMedida = Integer.parseInt(request.getParameter("unidadMedida"));
        double precio = Double.parseDouble(request.getParameter("precio"));
        int id = Integer.parseInt(request.getParameter("id"));
        
        CostosProductosDAO cpd = new CostosProductosDAO();
        CostosProductosVO cp = new CostosProductosVO(id, detalle, iva, cantidad, unidadMedida, precio, 0, 0);
        
        boolean si = cpd.update(cp);
        if (si) {
            r.setCodigo(1);
            r.setFrase("Datos Actualizados!");
        }else{
            r.setCodigo(0);
            r.setFrase("Error al actualizar");
        }
        
        return r;
    }

    private ResponseServlet eliminar(HttpServletRequest request, HttpServletResponse response, HttpSession hs) {
      ResponseServlet r = new ResponseServlet();
      CostosProductosDAO c = new CostosProductosDAO();
      boolean si = c.delete(request.getParameter("id"));
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
