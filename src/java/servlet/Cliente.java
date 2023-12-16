/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import DAO.ClienteDAO;
import VO.ClienteVO;
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
 * @author mayrayesenia
 */
@WebServlet(name = "Cliente", urlPatterns = {"/Cliente", "/Cliente/consulta", "/Cliente/actualizar", "/Cliente/eliminar"})
public class Cliente extends HttpServlet {

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
              

                case "Cliente":
                    resp = this.cliente(request, response, hs);
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

/*    private ResponseServlet consulta(HttpServletRequest request, HttpServletResponse response, HttpSession hs) {
     ResponseServlet r = new ResponseServlet();
        int idc = Integer.parseInt(request.getParameter("idc"));
         ClienteDAO cliDAO = new ClienteDAO();
        ClienteVO cliVO = null;
        cliVO = cliDAO.read(idc);
        
        if (cliVO != null) {
            r.setCodigo(1);
            r.setObjeto(cliVO);
        }else{
            r.setCodigo(0);
            r.setFrase("Error al consultar los datos");
        }
        
        return r;
    }
*/
    private ResponseServlet cliente(HttpServletRequest request, HttpServletResponse response, HttpSession hs) {
        ResponseServlet r = new ResponseServlet();
        ProductoVO p = (ProductoVO) hs.getAttribute("Productito");
        String Perfil = request.getParameter("Perfil");
        String Localizacion = request.getParameter("Localizacion");
        String Justificacion = request.getParameter("Justificacion");
        String Satisfaccion = request.getParameter("Satisfaccion");
        String Volumen_compra = request.getParameter("Volumen_compra");
        String Caracteristicas = request.getParameter("Caracteristicas");
        String Sitio_compra = request.getParameter("Sitio_compra");
        String Forma_pago = request.getParameter("Forma_pago");
        String Precio = request.getParameter("Precio");
        String Requisitos_posventa = request.getParameter("Requisitos_posventa");
        String Garantias = request.getParameter("Garantias");
        String Margen_comercial = request.getParameter("Margen_comercial");
        
        ClienteVO cliVO = new ClienteVO(0, Perfil, Localizacion, Justificacion, Satisfaccion, Volumen_compra, Caracteristicas, Sitio_compra, Forma_pago, Precio, Requisitos_posventa, Garantias, Margen_comercial, p.getIdProducto());
        ClienteDAO cliDAO = new ClienteDAO();
        boolean si = cliDAO.create(cliVO);
        
        if (si) {
            r.setCodigo(1);
            r.setFrase("Datos guardados");
        }else{
            r.setCodigo(0);
            r.setFrase("Error al guardar");
        }
        
        return r;
    }

    private ResponseServlet actualizar(HttpServletRequest request, HttpServletResponse response, HttpSession hs) {
         ResponseServlet r = new ResponseServlet();
        int idc = Integer.parseInt(request.getParameter("idc"));
        String Perfil = request.getParameter("Perfil");
        String Localizacion = request.getParameter("Localizacion");
        String Justificacion = request.getParameter("Justificacion");
        String Satisfaccion = request.getParameter("Satisfaccion");
        String Volumen_compra = request.getParameter("Volumen_compra");
        String Caracteristicas = request.getParameter("Caracteristicas");
        String Sitio_compra = request.getParameter("Sitio_compra");
        String Forma_pago = request.getParameter("Forma_pago");
        String Precio = request.getParameter("Precio");
        String Requisitos_posventa = request.getParameter("Requisitos_posventa");
        String Garantias = request.getParameter("Garantias");
        String Margen_comercial = request.getParameter("Margen_comercial");
        
        ClienteVO cliVO = new ClienteVO(idc, Perfil, Localizacion, Justificacion, Satisfaccion, Volumen_compra, Caracteristicas, Sitio_compra, Forma_pago, Precio, Requisitos_posventa, Garantias, Margen_comercial, 0);
        ClienteDAO cliDAO = new ClienteDAO();
        
        boolean si = cliDAO.update(cliVO);
          if (si) {
            r.setCodigo(1);
            r.setFrase("Datos actualizados");
        }else{
            r.setCodigo(0);
            r.setFrase("Error al actualizar");
        }
        
        return r;
    }

    private ResponseServlet eliminar(HttpServletRequest request, HttpServletResponse response, HttpSession hs) {
         ResponseServlet r = new ResponseServlet();
        int idc = Integer.parseInt(request.getParameter("idc"));
         ClienteDAO cliDAO = new ClienteDAO();
        
        boolean si = cliDAO.delete(idc);
        if (si) {
            r.setCodigo(1);
            r.setFrase("Cliente eliminado");
        }else{
            r.setCodigo(0);
            r.setFrase("Error al eliminar cliente");
        }
        
        return r;
    }

}
