/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Conexion.Conexion;
import Interfaces.Obligacion;
import VO.ExportacionVO;
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
public class ExportacionDAO implements Obligacion<ExportacionVO>{

     public static final Conexion conexionop = Conexion.saberEstado();
     private static final String insertar = "INSERT INTO `exportacion`(`CostoTotal`, `dias`, `IdItemExportador`, `IdTipoEnvio`, `IdProducto`) VALUES (?,?,?,?,?)";
     private static final String borrar = "delete from exportacion where IdExportacion = ?";
     private static final String actualizar = "UPDATE `exportacion` set `CostoTotal`=?,`dias`=?  WHERE IdExportacion =?";
     private static final String buscar = "SELECT `IdExportacion`, `CostoTotal`, `dias`, `IdItemExportador` FROM `exportacion` WHERE `IdItemExportador` = ? and `IdProducto` = ? and `IdTipoEnvio` = ?";
     private static final String consulta = "select * from exportacion where IdProducto = ? and IdTipoEnvio = ?";
    
    @Override
    public boolean create(ExportacionVO v) {
         try {
             PreparedStatement p  = conexionop.getCnn().prepareStatement(insertar);
             p.setDouble(1, v.getCostoTotal());
             p.setFloat(2, v.getDias());
             p.setInt(3, v.getIdItemExportador());
             p.setInt(4, v.getIdTipoEnvio());
             p.setInt(5, v.getIdProducto());
             if (p.executeUpdate() != 0) {
                 return true;
             }
         } catch (SQLException ex) {
             Logger.getLogger(ExportacionDAO.class.getName()).log(Level.SEVERE, null, ex);
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
    public boolean update(ExportacionVO v) {
         try {
             PreparedStatement p = conexionop.getCnn().prepareStatement(actualizar);
             p.setDouble(1, v.getCostoTotal());
             p.setFloat(2, v.getDias());
             p.setInt(3, v.getIdExportacion());
             if (p.executeUpdate() != 0) {
                 return true;
             }
         } catch (SQLException ex) {
             Logger.getLogger(ExportacionDAO.class.getName()).log(Level.SEVERE, null, ex);
         }finally{
             conexionop.cerrarConexion();
         }
         return false;
    }

    @Override
    public ExportacionVO read(Object key) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ArrayList<ExportacionVO> readAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    public ExportacionVO todo(int ide, int idp, int idt) {
        ExportacionVO a = null;
         try {
             PreparedStatement p = conexionop.getCnn().prepareStatement(buscar);
             p.setInt(1, ide);
             p.setInt(2, idp);
             p.setInt(3, idt);
             ResultSet r = p.executeQuery();
             while(r.next()){
                 a = new ExportacionVO(r.getInt(1), r.getDouble(2), r.getFloat(3), r.getInt(4), 0, 0);
             }
             return a;
         } catch (SQLException ex) {
             Logger.getLogger(ExportacionDAO.class.getName()).log(Level.SEVERE, null, ex);
         }
         return a;
    }
}
