/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Conexion.Conexion;
import Interfaces.Obligacion;
import VO.TipoInversionDiferidaVO;
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
public class TipoInversionDiferidaDAO implements Obligacion <TipoInversionDiferidaVO>{

     public static final Conexion conexionop = Conexion.saberEstado();
     private static final String buscarAll = "SELECT * FROM tipoinversiondiferida";
     private static final String crear = "insert into tipoinversiondiferida (TinversionD) values (?)";
     private static final String eliminar = "delete from tipoinversiondiferida where IdTipoInversionDiferida = ?";
    
    
    @Override
    public boolean create(TipoInversionDiferidaVO v) {
         try {
             PreparedStatement p = conexionop.getCnn().prepareStatement(crear);
             p.setString(1, v.getTinversionD());
             int si = p.executeUpdate();
             if (si != 0) {
                 return true;
             }
         } catch (SQLException ex) {
             Logger.getLogger(TipoInversionDiferidaDAO.class.getName()).log(Level.SEVERE, null, ex);
         }finally{
             conexionop.cerrarConexion();
         }
         return false;
    }

    @Override
    public boolean delete(Object key) {
         try {
             PreparedStatement p = conexionop.getCnn().prepareStatement(eliminar);
             p.setInt(1, Integer.parseInt(key.toString()));
             int si = p.executeUpdate();
             if (si != 0) {
                 return true;
             }
         } catch (SQLException ex) {
             Logger.getLogger(TipoInversionDiferidaDAO.class.getName()).log(Level.SEVERE, null, ex);
         }finally{
             conexionop.cerrarConexion();
         }
         return false;
    }

    @Override
    public boolean update(TipoInversionDiferidaVO v) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public TipoInversionDiferidaVO read(Object key) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ArrayList<TipoInversionDiferidaVO> readAll() {
             ArrayList<TipoInversionDiferidaVO> tid = new ArrayList();
             ResultSet r;
         try {
             
             PreparedStatement p = conexionop.getCnn().prepareStatement(buscarAll);
             r = p.executeQuery();
             while(r.next()){
                 tid.add(new TipoInversionDiferidaVO(r.getInt(1), r.getString(2)));
             }
              return tid;
         } catch (SQLException ex) {
             Logger.getLogger(TipoInversionDiferidaDAO.class.getName()).log(Level.SEVERE, null, ex);
         }finally{
             conexionop.cerrarConexion();
         }
             return tid;
    }
    
}
