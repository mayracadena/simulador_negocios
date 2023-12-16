/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import DAO.TemporalDAO;
import VO.TemporalVO;
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
@WebServlet(name = "Temporal", urlPatterns = {"/Temporal", "/Temporal/buscar"})
public class Temporal extends HttpServlet {

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
                case "Temporal":
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

    private ResponseServlet actualizar(HttpServletRequest request, HttpServletResponse response, HttpSession hs) {
        ResponseServlet r = new ResponseServlet();

        int opcion = Integer.parseInt(request.getParameter("op"));
        // int id = Integer.parseInt(request.getParameter("id"));
        Integer idp = (Integer) hs.getAttribute("idproyectito");
        TemporalVO t;

        TemporalDAO td = new TemporalDAO();
        if (td.read(idp) != null) {

            switch (opcion) {
                case 1:
                    double kit = Double.parseDouble(request.getParameter("kit"));
                    t = new TemporalVO(0, kit, 0, 0, 0, 0,0, idp);
                    boolean si = td.update(t);

                    if (si) {
                        r.setCodigo(1);
                        r.setFrase("Datos actualizados");
                    } else {
                        r.setCodigo(0);
                        r.setFrase("Error al actualizar datos :c");
                    }

                    break;

                case 2:
                    double CapitalTrabajo = Double.parseDouble(request.getParameter("Capital"));
                    float Year_credito = Float.parseFloat(request.getParameter("Year_credito"));
                    TemporalVO t2 = new TemporalVO(0, 0, CapitalTrabajo, 0, 0, 0, Year_credito,idp);
                    boolean sip = td.update2(t2);
                    if (sip) {
                        r.setCodigo(1);
                        r.setFrase("Datos actualizados");
                    } else {
                        r.setCodigo(0);
                        r.setFrase("Error al actualizar datos");
                    }
                    break;
                case 3:
                    double Impuestos = Double.parseDouble(request.getParameter("Impuestos"));
                    TemporalVO t3 = new TemporalVO(0, 0, 0, Impuestos, 0, 0,0, idp);
                    boolean si2 = td.update3(t3);
                    if (si2) {
                        r.setCodigo(1);
                        r.setFrase("Datos actualizados");
                    } else {
                        r.setCodigo(0);
                        r.setFrase("Error al actualizar datos");
                    }
                    break;
                case 4:
                    double Ajustes = Double.parseDouble(request.getParameter("Ajustes"));
                    TemporalVO t4 = new TemporalVO(0, 0, 0, 0, Ajustes, 0,0, idp);
                    boolean si4 = td.update4(t4);
                    if (si4) {
                        r.setCodigo(1);
                        r.setFrase("Datos actualizados");
                    } else {
                        r.setCodigo(0);
                        r.setFrase("Error al actualizar datos");
                    }

                    break;
                    
                    case 5:
                    double tasao = Double.parseDouble(request.getParameter("Tasa_o"));
                    TemporalVO t5 = new TemporalVO(0, 0, 0, 0, 0,tasao,0, idp); 
                    boolean si5 = td.update5(t5);
                    if (si5) {
                        r.setCodigo(1);
                        r.setFrase("Datos actualizados");
                    } else {
                        r.setCodigo(0);
                        r.setFrase("Error al actualizar datos");
                    }

                    break;
            }
        } else {

            switch (opcion) {
                case 1:

                    double kit = Double.parseDouble(request.getParameter("kit"));
                    // float Imprevistos = Float.parseFloat(request.getParameter("Imprevistos"));

                    t = new TemporalVO(0, kit, 0, 0, 0, 0,0, idp);

                    boolean si = td.create(t);
                    if (si) {
                        r.setCodigo(1);
                        r.setFrase("Datos guardados");
                    } else {
                        r.setCodigo(0);
                        r.setFrase("Error al guardar ");
                    }
                    break;
                case 2:
                    double CapitalTrabajo = Double.parseDouble(request.getParameter("Capital"));
                    float Year_credito = Float.parseFloat(request.getParameter("Year_credito"));
                    t = new TemporalVO(0, 0, CapitalTrabajo, 0, 0, 0,Year_credito, idp);
                    boolean si02 = td.create(t);
                    if (si02) {
                        r.setCodigo(1);
                        r.setFrase("Datos guardados");
                    } else {
                        r.setCodigo(0);
                        r.setFrase("Error al guardar");
                    }
                    break;
                case 3:
                    float Impuestos = Float.parseFloat(request.getParameter("Impuestos"));
                    t = new TemporalVO(0, 0, 0, Impuestos, 0, 0, 0,idp);
                    boolean si3 = td.create(t);
                    if (si3) {
                        r.setCodigo(1);
                        r.setFrase("Datos guardados");
                    } else {
                        r.setCodigo(0);
                        r.setFrase("Error al guardar");
                    }
                    break;

                case 4:
                    double Ajustes = Double.parseDouble(request.getParameter("Ajustes"));
                    t = new TemporalVO(0, 0, 0, 0, Ajustes, 0,0, idp);
                    boolean si04 = td.create(t);
                    if (si04) {
                        r.setCodigo(1);
                        r.setFrase("Datos guardados");
                    } else {
                        r.setCodigo(0);
                        r.setFrase("Error al guardar");
                    }
                    break;
                case 5:
                    double tasao = Double.parseDouble(request.getParameter("Tasa_o"));
                    t = new TemporalVO(0, 0, 0, 0, 0, tasao,0, idp);
                    boolean si05 = td.create(t);
                    if (si05) {
                        r.setCodigo(1);
                        r.setFrase("Datos guardados");
                    } else {
                        r.setCodigo(0);
                        r.setFrase("Error al guardar");
                    }
                    break;
            }
        }

        return r;
    }

    private ResponseServlet buscar(HttpServletRequest request, HttpServletResponse response, HttpSession hs) {
        ResponseServlet r = new ResponseServlet();

        Integer idp = (Integer) hs.getAttribute("idproyectito");

        TemporalDAO td = new TemporalDAO();
        TemporalVO t = td.read(idp);

        if (t != null) {
            r.setCodigo(1);
            r.setObjeto(t);
        } else {
            r.setCodigo(0);
            r.setFrase("Error al buscar");
        }

        return r;
    }

}
