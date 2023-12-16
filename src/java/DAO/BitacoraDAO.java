/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;


import Conexion.Conexion;
import Interfaces.Obligacion;
import VO.BitacoraVO;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author mayrayesenia
 */
public class BitacoraDAO implements Obligacion<BitacoraVO>{
    
     public static final Conexion conexionop = Conexion.saberEstado();
    private static final String insertar = "insert into bitacora(Fecha_entrada, Fecha_salida,IdUsuario) values (?,?,?)";
    private static final String consulta = "SELECT IdBitacora, Fecha_entrada, Fecha_salida, timediff(Fecha_salida, Fecha_entrada) as 'Duracion', IdUsuario FROM `bitacora` where IdUsuario =  ?";
    private static final String eliminar = "DELETE FROM bitacora WHERE IdUsuario = ?";
    
    @Override
    public boolean create(BitacoraVO v) {
            int si = 0;
        try {
            PreparedStatement ps = conexionop.getCnn().prepareStatement(insertar);
            ps.setString(1, v.getFecha_entrada());
            ps.setString(2, v.getFecha_salida());
           
            ps.setInt(3, v.getIdUsuario());
            
            si = ps.executeUpdate();

            if (si != 0) {
                return true;
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(BitacoraDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            conexionop.cerrarConexion();
        }
        return false;
    }

    @Override
    public boolean delete(Object key) {
       
        try {
            PreparedStatement ps = conexionop.getCnn().prepareStatement(eliminar);
            ps.setInt(1, Integer.parseInt(key.toString()));
            boolean si = ps.execute();
            if (si) {
                return true;
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(BitacoraDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            conexionop.cerrarConexion();
        }
        return false;
    }

    @Override
    public boolean update(BitacoraVO v) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public BitacoraVO read(Object key) {
     throw new UnsupportedOperationException("Not supported yet.");
    }

 
    public ArrayList<BitacoraVO> TodaBitacora(int id) {
       ArrayList<BitacoraVO> bi = new ArrayList();
       ResultSet r;
        try {
       
            PreparedStatement ps = conexionop.getCnn().prepareStatement(consulta);
            ps.setInt(1, id);
            r = ps.executeQuery();
            while(r.next()){
                bi.add( new BitacoraVO(r.getInt(1), r.getString(2), r.getString(3), r.getString(4),r.getInt(5)));
                
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(BitacoraDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            conexionop.cerrarConexion();
        }
       return bi;
    }

    @Override
    public ArrayList<BitacoraVO> readAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
