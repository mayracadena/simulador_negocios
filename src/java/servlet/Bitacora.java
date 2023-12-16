/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import DAO.BitacoraDAO;
import VO.BitacoraVO;
import VO.UsuarioVO;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
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
@WebServlet(name = "Bitacora", urlPatterns = {"/Bitacora", "/Bitacora/duracion", "/Bitacora/limpiar"})
public class Bitacora extends HttpServlet {

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
                case "Bitacora":
                    resp = this.cerrarSesion(request, response, hs);
                    break;
                case "duracion":
                    resp = this.duracion(request, response, hs);

                    break;
                    
                case "limpiar":
                    resp = this.limpiar(request, response, hs);
                    break;
            }

            String objJSON = new Gson().toJson(resp);
            out.println(objJSON);
        }
    }

    private ResponseServlet cerrarSesion(HttpServletRequest request, HttpServletResponse response, HttpSession hs) {
        ResponseServlet r = new ResponseServlet();

        UsuarioVO idu = (UsuarioVO) hs.getAttribute("usuarioAll");

        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        DateFormat dateFormat2 = new SimpleDateFormat("hh:mm:ss");

        Date Fecha_entrada = new Date(hs.getCreationTime());
        Date Fecha_salida = new Date(hs.getLastAccessedTime());
        
        boolean si = false;
        
        if (idu.getIdRol() == 3) {
            
        BitacoraDAO usu = new BitacoraDAO();
        BitacoraVO v = new BitacoraVO(0, dateFormat.format(Fecha_entrada), dateFormat.format(Fecha_salida), "", idu.getIdUsuario());
        si = usu.create(v);
        }else{
            si = true;
        }
  


        if (si) {
            r.setCodigo(1);
            r.setFrase("sesión cerrada");
            hs.invalidate();
        } else {
            r.setCodigo(0);
            r.setFrase("Error en cerrar sesión");
        }

        return r;
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

    private ResponseServlet duracion(HttpServletRequest request, HttpServletResponse response, HttpSession hs) {
        ResponseServlet r = new ResponseServlet();

        int idUsu = Integer.parseInt(request.getParameter("id"));
      

        BitacoraDAO biDAO = new BitacoraDAO();
        ArrayList<BitacoraVO> vi = new ArrayList();
        vi = biDAO.TodaBitacora(idUsu);

        if (!vi.isEmpty()) {
            r.setCodigo(1);
            r.setFrase("Bitacora de Ingreso al sistema");
            r.setObjeto(vi);
        } else {
            r.setCodigo(0);
            r.setFrase("no tiene ningun ingreso");
        }

        return r;
    }

    private ResponseServlet limpiar(HttpServletRequest request, HttpServletResponse response, HttpSession hs) {
        ResponseServlet r = new ResponseServlet();
        
        String id = request.getParameter("id");
        BitacoraDAO bit = new BitacoraDAO();
        boolean si = bit.delete(id);
        
        if (si) {
            r.setCodigo(1);
            r.setFrase("Bitacora limpiada");
        }else{
            r.setCodigo(0);
            r.setFrase("Error al limpiar la bitacora");
        }
        
        return r;
    }

}
