/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Conexion.Conexion;
import Interfaces.Obligacion;
import VO.InfInsumoVO;
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
public class InfInsumoDAO implements Obligacion<InfInsumoVO>{
    
     public static final Conexion conexionop = Conexion.saberEstado();
     private static final String Insert = "INSERT INTO `infinsumo`(IdInsumo, `year`, Valor ,`Id`) VALUES (?,?,?,?)";
     private static final String update = "UPDATE `infinsumo` SET `Valor`= ? WHERE `Idinfinsumo`= ?";
     private static final String todo = "SELECT * FROM `infinsumo` WHERE `Id` = ? and IdInsumo = ?";
     private static final String buscar = "SELECT * FROM `infinsumo` WHERE `Idinfinsumo` = ?";

    @Override
    public boolean create(InfInsumoVO v) {
         try {
             PreparedStatement p = conexionop.getCnn().prepareStatement(Insert);
             p.setInt(1, v.getIdInsumo());
             p.setInt(2, v.getYear());
             p.setDouble(3, v.getValor());
             p.setInt(4, v.getId());
             if (p.executeUpdate()!= 0) {
                 return true;
             }
         } catch (SQLException ex) {
             Logger.getLogger(InfInsumoDAO.class.getName()).log(Level.SEVERE, null, ex);
         }finally{
             conexionop.cerrarConexion();
         }
         return false;
    }

    @Override
    public boolean delete(Object key) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean update(InfInsumoVO v) {
         try {
             PreparedStatement p = conexionop.getCnn().prepareStatement(update);
             p.setDouble(1, v.getValor());
             p.setInt(2, v.getIdInfInsumo());
             if (p.executeUpdate() != 0) {
                 return true;
             }
         } catch (SQLException ex) {
             Logger.getLogger(InfInsumoDAO.class.getName()).log(Level.SEVERE, null, ex);
         }finally{
             conexionop.cerrarConexion();
         }
         return false;
    }

    @Override
    public InfInsumoVO read(Object key) {
        InfInsumoVO i = null;
         try {
             PreparedStatement p = conexionop.getCnn().prepareStatement(buscar);
             p.setInt(1, Integer.parseInt(key.toString()));
             ResultSet r = p.executeQuery();
             while(r.next()){
                 i = new InfInsumoVO(r.getInt(1), r.getInt(2), r.getInt(3), r.getDouble(4), r.getInt(5));
             }
             return i;
         } catch (SQLException ex) {
             Logger.getLogger(InfInsumoDAO.class.getName()).log(Level.SEVERE, null, ex);
         }finally{
             conexionop.cerrarConexion();
         }
         return i;
    }

    @Override
    public ArrayList<InfInsumoVO> readAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    
    public boolean prellenado(int idp){
        
        for (int i = 1; i <= 13; i++) {
            
            
            for (int j =1; j <= 5; j++) {
                try {
                    PreparedStatement p = conexionop.getCnn().prepareStatement(Insert);
                    p.setInt(1, i);
                    p.setInt(2, j);
                    p.setDouble(3, 0);
                     p.setInt(4, idp);
                    
                    p.executeUpdate();
                    
                } catch (SQLException ex) {
                    Logger.getLogger(InfInsumoDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
                
                
            }
        }
        
        
        return true;
    }
    
    
    public ArrayList<InfInsumoVO> Todo(int id, int idi) {
        ArrayList<InfInsumoVO> a = new ArrayList();
         try {
             PreparedStatement p = conexionop.getCnn().prepareStatement(todo);
             p.setInt(1, id);
             p.setInt(2, idi);
             ResultSet r = p.executeQuery();
             while(r.next()){
                 a.add(new InfInsumoVO(r.getInt(1), r.getInt(2), r.getInt(3), r.getDouble(4), r.getInt(5)));
             }
             return a;
         } catch (SQLException ex) {
             Logger.getLogger(InfInsumoDAO.class.getName()).log(Level.SEVERE, null, ex);
         }finally{
             conexionop.cerrarConexion();
         }
         return a;
    }
    
}
