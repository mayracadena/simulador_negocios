/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Conexion.Conexion;
import Interfaces.Obligacion;
import VO.FichaVO;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author mayracadena
 */
public class FichaDAO implements Obligacion<FichaVO> {

    public static final Conexion conexionop = Conexion.saberEstado();
    private static final String buscarAll = "select * from ficha";
    private static final String registrar = "insert into ficha (Ficha) values (?)";
    private static final String borrar = "delete from ficha where IdFicha = ?";

    @Override
    public boolean create(FichaVO v) {
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(registrar);
            p.setLong(1, v.getFicha());
            if (p.executeUpdate() != 0) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(FichaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            conexionop.cerrarConexion();
        }
        return false;
    }

    @Override
    public boolean delete(Object key) {
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(borrar);
            p.setInt(1, Integer.parseInt(key.toString()));
            if (p.executeUpdate() != 0) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(FichaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            conexionop.cerrarConexion();
        }
        return false;
    }

    @Override
    public boolean update(FichaVO v) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public FichaVO read(Object key) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ArrayList<FichaVO> readAll() {
        ArrayList<FichaVO> ficha = new ArrayList();
        ResultSet r;
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(buscarAll);
            r = p.executeQuery();
            while (r.next()) {
               ficha.add(new FichaVO(r.getInt(1), r.getLong(2)));
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(FichaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            conexionop.cerrarConexion();
            
        }
        return ficha;
    }

}
