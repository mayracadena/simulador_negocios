/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Conexion.Conexion;
import Interfaces.Obligacion;
import VO.TipoNominaVO;
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
public class TipoNominaDAO implements Obligacion<TipoNominaVO>{
 public static final Conexion conexionop = Conexion.saberEstado();
 private static final String buscarAll = "select * from TipoNomina";
    
    
    @Override
    public boolean create(TipoNominaVO v) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean delete(Object key) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean update(TipoNominaVO v) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public TipoNominaVO read(Object key) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ArrayList<TipoNominaVO> readAll() {
        ArrayList<TipoNominaVO> tn = new ArrayList();
        ResultSet r;
        
     try {
         PreparedStatement p = conexionop.getCnn().prepareStatement(buscarAll);
         r = p.executeQuery();
         while(r.next()){
             tn.add(new TipoNominaVO(r.getInt(1), r.getString(2)));
         }
         return tn;
     } catch (SQLException ex) {
         Logger.getLogger(TipoNominaDAO.class.getName()).log(Level.SEVERE, null, ex);
     }finally{
         conexionop.cerrarConexion();
     }
     return tn;
    }
    
}
