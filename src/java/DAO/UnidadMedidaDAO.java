/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Conexion.Conexion;
import Interfaces.Obligacion;
import VO.UnidadMedidaVO;
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
public class UnidadMedidaDAO implements Obligacion<UnidadMedidaVO> {

    public static final Conexion conexionop = Conexion.saberEstado();
    private static final String todo = "select * from unidadmedida";
    private static final String insert = "INSERT INTO `unidadmedida`( `UMedida`) VALUES (?)";
    private static final String borrar = "delete from unidadmedida where IdUnidadMedida = ?";
    
    @Override
    public boolean create(UnidadMedidaVO v) {
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(insert);
            p.setString(1, v.getUMedida());
            int si = p.executeUpdate();
            if (si != 0) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UnidadMedidaDAO.class.getName()).log(Level.SEVERE, null, ex);
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
            int si = p.executeUpdate();
            if (si != 0) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UnidadMedidaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            conexionop.cerrarConexion();
        }
        return false;
    }

    @Override
    public boolean update(UnidadMedidaVO v) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public UnidadMedidaVO read(Object key) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ArrayList<UnidadMedidaVO> readAll() {
        ArrayList<UnidadMedidaVO> u = new ArrayList();
        ResultSet r;
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(todo);
            r = p.executeQuery();
            while(r.next()){
                u.add(new UnidadMedidaVO(r.getInt(1), r.getString(2)));
            }
            return u;
        } catch (SQLException ex) {
            Logger.getLogger(UnidadMedidaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            conexionop.cerrarConexion();
        }
        return u;
    }

}
