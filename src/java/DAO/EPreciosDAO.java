/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Conexion.Conexion;
import VO.EPreciosVO;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author mayracadena
 */
public class EPreciosDAO {
    
     public static final Conexion conexionop = Conexion.saberEstado();
     private static final String insert = "INSERT INTO `eprecios`(`Lanzamiento`, `PuntoEquilibrio`, `CondicionPago`, `SeguroCredito`, `Impuestos`, `RiesgoCambiario`, `PreferenciaArancelaria`, `Tactica`, `GuerraVariacionP`, `AnaDefinicionP`, `comportamientoEsperado`, `IdProducto`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";
     private static final String actualizar = "UPDATE `eprecios` SET `Lanzamiento`=?,`PuntoEquilibrio`=?,`CondicionPago`=?,`SeguroCredito`=?,`Impuestos`=?,`RiesgoCambiario`=?,`PreferenciaArancelaria`=?,`Tactica`=?,`GuerraVariacionP`=?,`AnaDefinicionP`=?,`comportamientoEsperado`=? WHERE IdPrecios = ?";
     private static final String consulta = "select * from eprecios where IdProducto = ?";
     
     
     public boolean create (EPreciosVO e){
         try {
             PreparedStatement p = conexionop.getCnn().prepareStatement(insert);
             p.setString(1, e.getLanzamiento());
             p.setString(2, e.getPuntoEquilibrio());
             p.setString(3, e.getCondicionPago());
             p.setString(4, e.getSeguroCredito());
             p.setString(5, e.getImpuestos());
             p.setString(6, e.getRiesgoCambiario());
             p.setString(7, e.getPreferenciaArancelaria());
             p.setString(8, e.getTactica());
             p.setString(9, e.getGuerraVariacionP());
             p.setString(10, e.getAnaDefinicionP());
             p.setString(11, e.getComportamientoEsperado());
             p.setInt(12, e.getIdProducto());
             if (p.executeUpdate() != 0) {
                 return true;
             }
             
         } catch (SQLException ex) {
             Logger.getLogger(EPreciosDAO.class.getName()).log(Level.SEVERE, null, ex);
         }finally{
             conexionop.cerrarConexion();
         }
         return false;
     }
     
      public boolean update (EPreciosVO e){
         try {
             PreparedStatement p = conexionop.getCnn().prepareStatement(actualizar);
             p.setString(1, e.getLanzamiento());
             p.setString(2, e.getPuntoEquilibrio());
             p.setString(3, e.getCondicionPago());
             p.setString(4, e.getSeguroCredito());
             p.setString(5, e.getImpuestos());
             p.setString(6, e.getRiesgoCambiario());
             p.setString(7, e.getPreferenciaArancelaria());
             p.setString(8, e.getTactica());
             p.setString(9, e.getGuerraVariacionP());
             p.setString(10, e.getAnaDefinicionP());
             p.setString(11, e.getComportamientoEsperado());
             p.setInt(12, e.getIdPrecios());
             if (p.executeUpdate() != 0) {
                 return true;
             }
             
         } catch (SQLException ex) {
             Logger.getLogger(EPreciosDAO.class.getName()).log(Level.SEVERE, null, ex);
         }finally{
             conexionop.cerrarConexion();
         }
         return false;
     }
      
      public EPreciosVO consulta (int id){
          EPreciosVO e = null;
         try {
             PreparedStatement p = conexionop.getCnn().prepareStatement(consulta);
             p.setInt(1, id);
             ResultSet r = p.executeQuery();
             while (r.next()) {                 
                 e = new EPreciosVO(r.getInt(1), r.getString(2), r.getString(3), r.getString(4), r.getString(5), r.getString(6), r.getString(7), r.getString(8), r.getString(9), r.getString(10), r.getString(11), r.getString(12), r.getInt(13));
              }
             return e;
         } catch (SQLException ex) {
             Logger.getLogger(EPreciosDAO.class.getName()).log(Level.SEVERE, null, ex);
         }finally{
             conexionop.cerrarConexion();
         }
         return e;
      }
}
