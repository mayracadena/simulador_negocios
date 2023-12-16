/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Conexion.Conexion;
import Interfaces.Obligacion;
import VO.MacroeconomicoVO;
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
public class MacroeconomicoDAO implements Obligacion<MacroeconomicoVO>{
     public static final Conexion conexionop = Conexion.saberEstado();
     private static final String update= "UPDATE `macroeconomico` set `Valor`= ? WHERE `IdMacroeconomico`= ?";
     private static final String busqueda = "select * from macroeconomico where IdMacroeconomico = ?";
     private static final String todos = "select * from macroeconomico where IdConcepto = ?";

    @Override
    public boolean create(MacroeconomicoVO v) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean delete(Object key) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean update(MacroeconomicoVO v) {
         try {
             PreparedStatement p = conexionop.getCnn().prepareStatement(update);
             p.setDouble(1, v.getValor());
             p.setInt(2, v.getIdMacroeconomico());
             if (p.executeUpdate() != 0) {
                 return true;
             }
         } catch (SQLException ex) {
             Logger.getLogger(MacroeconomicoDAO.class.getName()).log(Level.SEVERE, null, ex);
         }finally{
             conexionop.cerrarConexion();
         }
         return false;
    }

    @Override
    public MacroeconomicoVO read(Object key) {
        MacroeconomicoVO m = null;
         try {
             PreparedStatement p = conexionop.getCnn().prepareStatement(busqueda);
             p.setInt(1, Integer.parseInt(key.toString()));
             ResultSet r = p.executeQuery();
             while(r.next()){
                 m = new MacroeconomicoVO (r.getInt(1), r.getInt(2), r.getInt(3), r.getDouble(4));
             }
             return m;
         } catch (SQLException ex) {
             Logger.getLogger(MacroeconomicoDAO.class.getName()).log(Level.SEVERE, null, ex);
         }finally{
             conexionop.cerrarConexion();
         }
         return m;
    }

    @Override
    public ArrayList<MacroeconomicoVO> readAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
     public ArrayList<MacroeconomicoVO> todito(int id) {
         ArrayList<MacroeconomicoVO> am = new ArrayList();
         try {
             PreparedStatement p = conexionop.getCnn().prepareStatement(todos);
             p.setInt(1, id);
             ResultSet r = p.executeQuery();
             while(r.next()){
                 am.add(new MacroeconomicoVO (r.getInt(1), r.getInt(2), r.getInt(3), r.getDouble(4)));
             }
             return am;
         } catch (SQLException ex) {
             Logger.getLogger(MacroeconomicoDAO.class.getName()).log(Level.SEVERE, null, ex);
         }finally{
             conexionop.cerrarConexion();
         }
         return am;
    }
    
}
