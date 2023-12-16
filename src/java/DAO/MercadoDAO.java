/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Conexion.Conexion;
import Interfaces.Obligacion;
import VO.MercadoVO;
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
public class MercadoDAO implements Obligacion<MercadoVO>{
     public static final Conexion conexionop = Conexion.saberEstado();
     private static final String insertar = "INSERT INTO `mercado`(`Sector`, `Comportamiento`, `Evolucion`, `Diagnistico`, `Objetivo`, `Justificacion`, `EstiMerPoten`, `ConsumoAparente`, `ConsumoxHabitante`, `Magnitud`, `EstiSegMercado`, `perfilConsumidor`, `ProdSustituto`, `IdProyecto`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
     private static final String actualizar = "UPDATE `mercado` SET `Sector`= ? ,`Comportamiento`= ? ,`Evolucion`= ? ,`Diagnistico`= ? ,`Objetivo`= ? ,`Justificacion`= ? ,`EstiMerPoten`= ? ,`ConsumoAparente`= ? ,`ConsumoxHabitante`= ? ,`Magnitud`= ? ,`EstiSegMercado`= ? ,`perfilConsumidor`= ? ,`ProdSustituto`= ?  WHERE `IdMercado` = ?";
     private static final String buscar = "select * from mercado where IdProyecto = ?";
     
    @Override
    public boolean create(MercadoVO v) {
         try {
             PreparedStatement p = conexionop.getCnn().prepareStatement(insertar);
             p.setString(1, v.getSector());
             p.setString(2, v.getComportamiento());
             p.setString(3, v.getEvolucion());
             p.setString(4, v.getDiagnostico());
             p.setString(5, v.getObjetivos());
             p.setString(6, v.getJustificación());
             p.setString(7, v.getEstiMerPoten());
             p.setString(8, v.getConsumoAparente());
             p.setString(9, v.getConsumoxHabitante());
             p.setString(10, v.getMagnitud());
             p.setString(11, v.getEstiSegMercado());
             p.setString(12, v.getPerfilConsumidor());
             p.setString(13, v.getProdSustituto());
             p.setInt(14, v.getIdProyecto());
             
             if (p.executeUpdate() != 0) {
                 return true;
             }
         } catch (SQLException ex) {
             Logger.getLogger(MercadoDAO.class.getName()).log(Level.SEVERE, null, ex);
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
    public boolean update(MercadoVO v) {
         try {
             PreparedStatement p  = conexionop.getCnn().prepareStatement(actualizar);
             p.setString(1, v.getSector());
             p.setString(2, v.getComportamiento());
             p.setString(3, v.getEvolucion());
             p.setString(4, v.getDiagnostico());
             p.setString(5, v.getObjetivos());
             p.setString(6, v.getJustificación());
             p.setString(7, v.getEstiMerPoten());
             p.setString(8, v.getConsumoAparente());
             p.setString(9, v.getConsumoxHabitante());
             p.setString(10, v.getMagnitud());
             p.setString(11, v.getEstiSegMercado());
             p.setString(12, v.getPerfilConsumidor());
             p.setString(13, v.getProdSustituto());
             p.setInt(14, v.getIdMercado());
             if (p.executeUpdate() != 0) {
                 return true;
             }
             
         } catch (SQLException ex) {
             Logger.getLogger(MercadoDAO.class.getName()).log(Level.SEVERE, null, ex);
         }finally{
             conexionop.cerrarConexion();
         }
         return false;
    }

    @Override
    public MercadoVO read(Object key) {
        MercadoVO m = null;
         try {
             PreparedStatement p = conexionop.getCnn().prepareStatement(buscar);
             p.setInt(1, Integer.parseInt(key.toString()));
             ResultSet r = p.executeQuery();
             while(r.next()){
                 m = new MercadoVO(r.getInt(1), r.getString(2),  r.getString(3), r.getString(4), r.getString(5), r.getString(6), r.getString(7), r.getString(8), r.getString(9), r.getString(10), r.getString(11), r.getString(12), r.getString(13), r.getString(14),r.getInt(15));
             }
             return m;
         } catch (SQLException ex) {
             Logger.getLogger(MercadoDAO.class.getName()).log(Level.SEVERE, null, ex);
         }finally{
             conexionop.cerrarConexion();
         }
         return m;
    }

    @Override
    public ArrayList<MercadoVO> readAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
