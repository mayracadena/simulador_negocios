/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Conexion.Conexion;
import Interfaces.Obligacion;
import VO.EDistribuicionVO;
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
public class EDistribucionDAO implements Obligacion<EDistribuicionVO>{
    public static final Conexion conexionop = Conexion.saberEstado();
    private static final String insertar = "INSERT INTO `edistribuicion`(`Penetracion`, `Comercializacion`, `DistribuicionNI`, `Tactica`, `Canal`, `IdProyecto`) VALUES (?,?,?,?,?,?)";
    private static final String actualizar = ("UPDATE `edistribuicion` SET `Penetracion`= ? ,`Comercializacion`= ? ,`DistribuicionNI`= ? ,`Tactica`= ? ,`Canal`= ?   WHERE `IdDistribuicion` = ?");
    private static final String buscar = "select * from edistribuicion where IdProyecto = ?";    
    
    @Override
    public boolean create(EDistribuicionVO v) {
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(insertar);
            p.setString(1, v.getPenetracion());
            p.setString(2, v.getComercializacion());
            p.setString(3, v.getDistribuicionNI());
            p.setString(4, v.getTactica());
            p.setString(5, v.getCanal());
            p.setInt(6, v.getIdProyecto());
            if (p.executeUpdate() != 0) {
                return true;
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(EDistribucionDAO.class.getName()).log(Level.SEVERE, null, ex);
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
    public boolean update(EDistribuicionVO v) {
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(actualizar);
            p.setString(1, v.getPenetracion());
            p.setString(2, v.getComercializacion());
            p.setString(3, v.getDistribuicionNI());
            p.setString(4, v.getTactica());
            p.setString(5, v.getCanal());
            p.setInt(6, v.getIdDistribuicion());
            if (p.executeUpdate() != 0) {
                return true;
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(EDistribucionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            conexionop.cerrarConexion();
        }
        return false;
    }

    @Override
    public EDistribuicionVO read(Object key) {
        EDistribuicionVO e = null;
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(buscar);
            p.setInt(1, Integer.parseInt(key.toString()));
            ResultSet r = p.executeQuery();
            while(r.next()){
                e = new EDistribuicionVO(r.getInt(1), r.getString(2),r.getString(3), r.getString(4), r.getString(5), r.getString(6), r.getInt(7));
            }
            return e;
        } catch (SQLException ex) {
            Logger.getLogger(EDistribucionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            conexionop.cerrarConexion();
        }
        return e;
    }

    @Override
    public ArrayList<EDistribuicionVO> readAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
