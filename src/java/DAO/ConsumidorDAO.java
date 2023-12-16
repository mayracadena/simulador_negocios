/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Conexion.Conexion;
import Interfaces.Obligacion;
import VO.ConsumidorVO;
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
public class ConsumidorDAO implements Obligacion<ConsumidorVO>{
    public static final Conexion conexionop = Conexion.saberEstado();
    
    private static final String crear ="INSERT INTO `consumidor`( `Perfil`, `Localizacion`, `Justificacion`, `Satisfaccion`, `Donde_compra`, `Caracteristicas`, `Frecuencia`, `Precio`, `IdProducto`) VALUES (?,?,?,?,?,?,?,?,?)";
    private static final String actualizar ="UPDATE`consumidor`SET`Perfil`=?,`Localizacion`=?,`Justificacion`=?,`Satisfaccion`=?,`Donde_compra`=?,`Caracteristicas`=?,`Frecuencia`=?,`Precio`=? WHERE `IdConsumidor`=?";
    private static final String eliminar ="DELETE FROM `consumidor` WHERE `IdConsumidor` = ?";
    private static final String consultar ="SELECT * FROM `consumidor` WHERE `IdProducto` = ?";

    @Override
    public boolean create(ConsumidorVO v) {
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(crear);
            p.setString(1, v.getPerfil());
            p.setString(2, v.getLocalizacion());
            p.setString(3, v.getJustificacion());
            p.setString(4, v.getSatisfaccion());
            p.setString(5, v.getDonde_compra());
            p.setString(6, v.getCaracteristicas());
            p.setString(7, v.getFrecuencia());
            p.setString(8, v.getPrecio());
            p.setInt(9, v.getIdProducto());
            
            int si = p.executeUpdate();
            if (si != 0) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ConsumidorDAO.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ConsumidorDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            conexionop.cerrarConexion();
        }
        return false;
    }

    @Override
    public boolean update(ConsumidorVO v) {
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(actualizar);
            p.setString(1, v.getPerfil());
            p.setString(2, v.getLocalizacion());
            p.setString(3, v.getJustificacion());
            p.setString(4, v.getSatisfaccion());
            p.setString(5, v.getDonde_compra());
            p.setString(6, v.getCaracteristicas());
            p.setString(7, v.getFrecuencia());
            p.setString(8, v.getPrecio());
            p.setInt(9, v.getIdConsumidor());
            
            int si = p.executeUpdate();
            if (si != 0) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ConsumidorDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            conexionop.cerrarConexion();
        }
        return false;
    }

    @Override
    public ConsumidorVO read(Object key) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ArrayList<ConsumidorVO> readAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    public ArrayList<ConsumidorVO> consultar_All(int idc) {
        ArrayList<ConsumidorVO> acon = new ArrayList();
        ResultSet r;
        
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(consultar);
            p.setInt(1, idc);
            r = p.executeQuery();
            while(r.next()){
                acon.add(new ConsumidorVO(r.getInt(1),r.getString(2),r.getString(3), r.getString(4), r.getString(5),r.getString(6),r.getString(7),r.getString(8),r.getString(9), r.getInt(10)));
            }
            return acon;
        } catch (SQLException ex) {
            Logger.getLogger(ConsumidorDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            conexionop.cerrarConexion();
        }
        return acon;
    }
    
}
