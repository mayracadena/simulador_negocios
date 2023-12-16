/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import DAO.InversionDiferidaDAO;
import DAO.TipoInversionDiferidaDAO;
import VO.InversionDiferidaVO;
import VO.TipoInversionDiferidaVO;
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
@WebServlet(name = "InversionDiferida", urlPatterns = {"/InversionDiferida", "/InversionDiferida/consulta", "/InversionDiferida/actualizar", "/InversionDiferida/eliminar", "/InversionDiferida/create", "/InversionDiferida/nuevaI_D", "/InversionDiferida/eliminarI_D"})
public class InversionDiferida extends HttpServlet {

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
                case "consulta":
                    resp = this.consulta(request, response, hs);
                    break;

                case "InversionDiferida":
                    resp = this.consulta2(request, response, hs);
                    break;

                case "actualizar":
                    resp = this.actualizar(request, response, hs);
                    break;
                case "eliminar":
                    resp = this.eliminar(request, response, hs);
                    break;
                case "create":
                    resp = this.create(request, response, hs);
                    break;
                    
                case "nuevaI_D":
                    resp = this.createnuevo(request, response, hs);
                    break;
                    
                     case "eliminarI_D":
                    resp = this.eliminar_tipoI_D(request, response, hs);
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
        Integer idp = (Integer) hs.getAttribute("idproyectito");

        InversionDiferidaDAO invd = new InversionDiferidaDAO();
        ArrayList<InversionDiferidaVO> aiv = new ArrayList();
        aiv = invd.todo(idp);

        if (aiv.isEmpty()) {
            r.setCodigo(0);
            r.setFrase("No tienes datos");
            r.setObjeto(null);
            return r;
        } else {
            r.setCodigo(1);
            r.setFrase("Bien nwn");
            r.setObjeto(aiv);
            return r;
        }

    }

    private ResponseServlet consulta2(HttpServletRequest request, HttpServletResponse response, HttpSession hs) {
        ResponseServlet r = new ResponseServlet();
        InversionDiferidaDAO invd = new InversionDiferidaDAO();
        InversionDiferidaVO aiv;
        String id = request.getParameter("id");
        aiv = invd.read(id);
        ArrayList<TipoInversionDiferidaVO> tid = new ArrayList();
        TipoInversionDiferidaDAO tiddao = new TipoInversionDiferidaDAO();

        tid = tiddao.readAll();

        if (aiv != null) {

            r.setCodigo(1);
            r.setFrase("si");
            r.setObjeto(aiv);
            r.setObjeto2(tid);
            return r;
        } else {
            r.setCodigo(0);
            r.setFrase("no");
            r.setObjeto(null);
            return r;
        }

    }

    private ResponseServlet actualizar(HttpServletRequest request, HttpServletResponse response, HttpSession hs) {
        ResponseServlet r = new ResponseServlet();
        InversionDiferidaDAO invd = new InversionDiferidaDAO();

        Integer idp = (Integer) hs.getAttribute("idproyectito");
        int detalleu = Integer.parseInt(request.getParameter("detalleu"));
        double totalu = Double.parseDouble(request.getParameter("totalu"));
        int id = Integer.parseInt(request.getParameter("id"));
        InversionDiferidaVO aiv = new InversionDiferidaVO(id, detalleu, totalu, idp);

        boolean si = invd.update(aiv);
        if (si) {
            r.setCodigo(1);
            r.setFrase("Datos Actualizados");

        } else {
            r.setCodigo(0);
            r.setFrase("Error al alcualizar los datos");
        }

        return r;
    }

    private ResponseServlet eliminar(HttpServletRequest request, HttpServletResponse response, HttpSession hs) {
        ResponseServlet r = new ResponseServlet();
        InversionDiferidaDAO invd = new InversionDiferidaDAO();
        boolean si = invd.delete(request.getParameter("id"));
        if (si) {
            r.setCodigo(1);
            r.setFrase("Datos eliminados");
        } else {
            r.setCodigo(0);
            r.setFrase("Error al eliminar");
        }
        return r;
    }

    private ResponseServlet create(HttpServletRequest request, HttpServletResponse response, HttpSession hs) {
        ResponseServlet r = new ResponseServlet();
        Integer idp = (Integer) hs.getAttribute("idproyectito");
        InversionDiferidaDAO invd = new InversionDiferidaDAO();
        int idtipo = Integer.parseInt(request.getParameter("detalle"));
        double total = Double.parseDouble(request.getParameter("total"));
        InversionDiferidaVO aiv = new InversionDiferidaVO(1, idtipo, total, idp);
        boolean si = invd.create(aiv);
        if (si) {
            r.setCodigo(1);
            r.setFrase("Datos Guardados!");
        }else{
            r.setCodigo(0);
            r.setFrase("Error al guardar los datos");
        }
        
        return r;
    }

    private ResponseServlet createnuevo(HttpServletRequest request, HttpServletResponse response, HttpSession hs) {
        ResponseServlet r = new ResponseServlet();
        String inverdife = request.getParameter("Inver_dife");
        TipoInversionDiferidaVO t = new TipoInversionDiferidaVO(0, inverdife);
        TipoInversionDiferidaDAO tid = new TipoInversionDiferidaDAO();
        boolean si = tid.create(t);
        if (si) {
            r.setCodigo(1);
            r.setFrase("Inversión intangible guardada");
        }else{
            r.setCodigo(0);
            r.setFrase("Error al guardar");
        }
        
        
        return r;
    }

    private ResponseServlet eliminar_tipoI_D(HttpServletRequest request, HttpServletResponse response, HttpSession hs) {
    ResponseServlet r = new ResponseServlet();
    int id = Integer.parseInt(request.getParameter("id"));
    
    TipoInversionDiferidaDAO ivDAO =  new TipoInversionDiferidaDAO();
    boolean si = ivDAO.delete(id);
    if (si) {
            r.setCodigo(1);
            r.setFrase("Inversión intangible eliminada");
        }else{
            r.setCodigo(0);
            r.setFrase("Error al eliminar");
        }
    
    
    
    return r;
    }

}
