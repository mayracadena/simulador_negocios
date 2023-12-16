/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Conexion.Conexion;
import Interfaces.Obligacion;
import VO.TipoInversionVO;
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
public class TipoInversionDAO implements Obligacion <TipoInversionVO>{

    public static final Conexion conexionop = Conexion.saberEstado();
    private static final String buscar = "select * from tipoinversion";
    
    @Override
    public boolean create(TipoInversionVO v) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean delete(Object key) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean update(TipoInversionVO v) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public TipoInversionVO read(Object key) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ArrayList<TipoInversionVO> readAll() {
        ArrayList<TipoInversionVO> ti = new ArrayList();
        ResultSet r;
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(buscar);
            r = p.executeQuery();
            while (r.next()) {
               ti.add(new TipoInversionVO (r.getInt(1), r.getString(2)));
            }
            return ti;
        } catch (SQLException ex) {
            Logger.getLogger(TipoInversionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            conexionop.cerrarConexion();
        }
        return ti;
    }
    
}
