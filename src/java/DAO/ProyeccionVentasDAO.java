/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Conexion.Conexion;
import Interfaces.Obligacion;
import VO.ProyeccionVentasVO;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author mayracadena
 */
public class ProyeccionVentasDAO implements Obligacion<ProyeccionVentasVO>{
    
    public static final Conexion conexionop = Conexion.saberEstado();
    private static final String insert = "INSERT INTO `proyeccionventas`(`Proyeccion`, `Year`, `IdProducto`) VALUES (?,?,?)";
    private static final String borrar = "delete from proyeccionventas where IdProyeccionV = ?";
    private static final String actualizar = "update proyeccionventas set Proyeccion = ? , Year = ? where IdProyeccionV = ?";
    private static final String consulta = "select * from proyeccionventas where IdProyeccionV = ?";
    private static final String consulta2 = "select * from proyeccionventas where IdProducto = ? ";
    private static final String porcentaje = "SELECT `proyeccion` from proyeccionventas where year = 1 and IdProducto = ?";
    private static final String manoObra = "SELECT sum(proyeccion) as 'Total' from proyeccionventas INNER join producto on proyeccionventas.IdProducto = producto.IdProducto where producto.IdProyecto = ? and year = 1";
    
    @Override
    public boolean create(ProyeccionVentasVO v) {
        int si = 0;
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(insert);
            p.setDouble(1, v.getProyeccion());
            p.setInt(2, v.getYear());
            p.setInt(3, v.getIdProducto());
            si = p.executeUpdate();
            if (si != 0) {
                return true;
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(ProyeccionVentasDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            conexionop.cerrarConexion();
        }
        return false;
    }

    @Override
    public boolean delete(Object key) {
        int id = Integer.parseInt(key.toString());
        int si = 0;
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(borrar);
            p.setInt(1, id);
            si = p.executeUpdate();
            if (si != 0) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProyeccionVentasDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            conexionop.cerrarConexion();
        }
        return false;
    }

    @Override
    public boolean update(ProyeccionVentasVO v) {
        int si = 0;
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(actualizar);
            p.setDouble(1, v.getProyeccion());
            p.setInt(2, v.getYear());
            p.setInt(3, v.getIdProyeccionVO());
            si = p.executeUpdate();
            if (si != 0) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProyeccionVentasDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            conexionop.cerrarConexion();
        }
        return false;
    }

    @Override
    public ProyeccionVentasVO read(Object key) {
        int id = Integer.parseInt(key.toString());
        ProyeccionVentasVO pv = null;
        ResultSet r;
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(consulta);
            p.setInt(1, id);
            r = p.executeQuery();
            while (r.next()){
                pv = new ProyeccionVentasVO(r.getInt(1), r.getDouble(2), r.getInt(3), r.getInt(4));
            }
            return pv;
        } catch (SQLException ex) {
            Logger.getLogger(ProyeccionVentasDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            conexionop.cerrarConexion();
        }
       return pv;
    }

    @Override
    public ArrayList<ProyeccionVentasVO> readAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
     public ArrayList<ProyeccionVentasVO> todo(int id) {
         ArrayList<ProyeccionVentasVO> pv = new ArrayList();
         ResultSet r;
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(consulta2);
            p.setInt(1, id);
            r = p.executeQuery();
            while(r.next()){
                pv.add(new ProyeccionVentasVO (r.getInt(1), r.getDouble(2), r.getInt(3), r.getInt(4)));
            }
            return pv;
        } catch (SQLException ex) {
            Logger.getLogger(ProyeccionVentasDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            conexionop.cerrarConexion();
        }
        return pv;
    }
     
     public double Porcentaje(int idp){
         double total = 0;
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(porcentaje);
            p.setInt(1, idp);
            ResultSet r = p.executeQuery();
            while(r.next()){
                total = r.getDouble("proyeccion");
            }
            return total;
        } catch (SQLException ex) {
            Logger.getLogger(ProyeccionVentasDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            conexionop.cerrarConexion();
        }
        return total;
     }
     
     public double reporte (int idp){
         double total = 0;
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(manoObra);
            p.setInt(1, idp);
            ResultSet r = p.executeQuery();
            while(r.next()){
                total = r.getDouble("Total");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProyeccionVentasDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            conexionop.cerrarConexion();
        }
        return total;
     }
}
