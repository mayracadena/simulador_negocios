/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Conexion.Conexion;
import Interfaces.Obligacion;
import VO.ActividadesVO;
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
public class ActividadesDAO implements Obligacion<ActividadesVO>{
    
     public static final Conexion conexionop = Conexion.saberEstado();
     private static final String guardar = "INSERT INTO `actividades`( `Actividad`, `Tiempo`, `Cargos`, `N_cargos`, `Equipos`, `IdProducto`) VALUES (?,?,?,?,?,?)";
     private static final String actualizar = "UPDATE `actividades` SET `Actividad`=?,`Tiempo`=?,`Cargos`=?,`N_cargos`=?,`Equipos`=? WHERE IdActividades = ?";
     private static final String eliminar = "DELETE FROM `actividades` WHERE `IdActividades` = ?";
     private static final String consultar = "SELECT * FROM `actividades` WHERE `IdActividades` = ?";
     private static final String All_consulta = "SELECT * FROM `actividades` WHERE `IdProducto` = ?";

    @Override
    public boolean create(ActividadesVO v) {
         try {
             PreparedStatement p = conexionop.getCnn().prepareStatement(guardar);
             p.setString(1, v.getActividad());
             p.setString(2, v.getTiempo());
             p.setString(3, v.getCargos());
             p.setString(4, v.getN_cargos());
             p.setString(5, v.getEquipos());
             p.setInt(6, v.getIdProducto());
             int si = p.executeUpdate();
             if (si != 0) {
                 return true;
             }
         } catch (SQLException ex) {
             Logger.getLogger(ActividadesDAO.class.getName()).log(Level.SEVERE, null, ex);
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
             Logger.getLogger(ActividadesDAO.class.getName()).log(Level.SEVERE, null, ex);
         }finally{
             conexionop.cerrarConexion();
         }
         return false;
    }

    @Override
    public boolean update(ActividadesVO v) {
         try {
             PreparedStatement p = conexionop.getCnn().prepareStatement(actualizar);
              p.setString(1, v.getActividad());
             p.setString(2, v.getTiempo());
             p.setString(3, v.getCargos());
             p.setString(4, v.getN_cargos());
             p.setString(5, v.getEquipos());
             p.setInt(6, v.getIdActividad());
             int si = p.executeUpdate();
             if (si != 0) {
                 return true;
             }
         } catch (SQLException ex) {
             Logger.getLogger(ActividadesDAO.class.getName()).log(Level.SEVERE, null, ex);
         }finally{
             conexionop.cerrarConexion();
         }
         return false;
    }

    @Override
    public ActividadesVO read(Object key) {
         try {
             ActividadesVO a = null;
             PreparedStatement p = conexionop.getCnn().prepareStatement(consultar);
             p.setInt(1, Integer.parseInt(key.toString()));
             ResultSet r = p.executeQuery();
             while(r.next()){
                 a = new ActividadesVO(r.getInt(1), r.getString(2), r.getString(3), r.getString(4), r.getString(5), r.getString(6), r.getInt(7));
             }
             return a;
         } catch (SQLException ex) {
             Logger.getLogger(ActividadesDAO.class.getName()).log(Level.SEVERE, null, ex);
         }finally{
             conexionop.cerrarConexion();
         }
         return null;
    }

    @Override
    public ArrayList<ActividadesVO> readAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
     public ArrayList<ActividadesVO> all_Actividades(int idp) {
        ArrayList<ActividadesVO> a = new ArrayList();
        
         try {
             PreparedStatement p =  conexionop.getCnn().prepareStatement(All_consulta);
             p.setInt(1, idp);
             ResultSet r = p.executeQuery();
             while(r.next()){
                 a.add(new ActividadesVO(r.getInt(1), r.getString(2), r.getString(3), r.getString(4), r.getString(5), r.getString(6), r.getInt(7)));
             }
             return a;
         } catch (SQLException ex) {
             Logger.getLogger(ActividadesDAO.class.getName()).log(Level.SEVERE, null, ex);
         }finally{
             conexionop.cerrarConexion();
         }
        
        return a;
     }
    
}
