/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Conexion.Conexion;
import VO.InsumosVO;
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
public class InsumoDAO {
     public static final Conexion conexionop = Conexion.saberEstado();
     private static final String buscarI = "select * from insumos";

    
    public ArrayList<InsumosVO> buscar(){
        ArrayList<InsumosVO> i = new ArrayList();
        ResultSet r;
         try {
             PreparedStatement p = conexionop.getCnn().prepareStatement(buscarI);
         
             r = p.executeQuery();
             while(r.next()){
                 i.add(new InsumosVO (r.getInt(1), r.getString(2)));
             }
             return i;
         } catch (SQLException ex) {
             Logger.getLogger(ItemExportacionDAO.class.getName()).log(Level.SEVERE, null, ex);
         }finally{
             conexionop.cerrarConexion();
         }
         return i;
    }
}
