/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Conexion.Conexion;
import static DAO.NominaDAO.conexionop;
import Interfaces.Obligacion;
import VO.OrganizacionVO;
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
public class OrganizacionDAO implements Obligacion<OrganizacionVO>{
 public static final Conexion conexionop = Conexion.saberEstado();
 
 private static final String crear = "INSERT INTO `organizacion`(`Nor_empresarial`, `Nor_tributaria`, `Nor_tecnica`, `Nor_laboral`, `Nor_ambiental`, `Registro_marca`, `IdProyecto`) VALUES (?,?,?,?,?,?,?)";
 private static final String actualizar = "UPDATE `organizacion` SET `Nor_empresarial`= ?,`Nor_tributaria`= ?,`Nor_tecnica`= ?,`Nor_laboral`= ?,`Nor_ambiental`= ?,`Registro_marca`= ? where`IdProyecto`= ?";
 private static final String buscar = "SELECT * FROM `organizacion` WHERE `IdProyecto` = ?";
 
    @Override
    public boolean create(OrganizacionVO v) {
       int si = 0;
     try {
         PreparedStatement p = conexionop.getCnn().prepareStatement(crear);
         p.setString(1, v.getNor_empresarial());
         p.setString(2, v.getNor_tributaria());
         p.setString(3, v.getNor_tecnica());
         p.setString(4, v.getNor_laboral());
         p.setString(5, v.getNor_ambiental());
         p.setString(6, v.getRegistro_marca());
         p.setInt(7, v.getIdProyecto());
         si = p.executeUpdate();
         if (si != 0) {
             return true;
         }
     } catch (SQLException ex) {
         Logger.getLogger(OrganizacionDAO.class.getName()).log(Level.SEVERE, null, ex);
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
    public boolean update(OrganizacionVO v) {
         
     try {
         PreparedStatement p = conexionop.getCnn().prepareStatement(actualizar);
         p.setString(1, v.getNor_empresarial());
         p.setString(2, v.getNor_tributaria());
         p.setString(3, v.getNor_tecnica());
         p.setString(4, v.getNor_laboral());
         p.setString(5, v.getNor_ambiental());
         p.setString(6, v.getRegistro_marca());
         p.setInt(7, v.getIdProyecto());
        
         if (p.executeUpdate() != 0) {
             return true;
         }
     } catch (SQLException ex) {
         Logger.getLogger(OrganizacionDAO.class.getName()).log(Level.SEVERE, null, ex);
     }finally{
         conexionop.cerrarConexion();
     }
     return false;
    }

    @Override
    public OrganizacionVO read(Object key) {
        int id = Integer.parseInt(key.toString());
        OrganizacionVO or = null;
        ResultSet r;
     try {
         PreparedStatement p = conexionop.getCnn().prepareStatement(buscar);
         p.setInt(1, id);
         r = p.executeQuery();
         while(r.next()){
             or = new OrganizacionVO(r.getInt(1), r.getString(2), r.getString(3), r.getString(4), r.getString(5), r.getString(6), r.getString(7), r.getInt(8));
         }
         return or;
     } catch (SQLException ex) {
         Logger.getLogger(OrganizacionDAO.class.getName()).log(Level.SEVERE, null, ex);
     }finally{
         conexionop.cerrarConexion();
     }
     return or;
    }

    @Override
    public ArrayList<OrganizacionVO> readAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
