/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Conexion.Conexion;
import Interfaces.Obligacion;
import VO.EPromocionVO;
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
public class EPromocionDAO implements Obligacion<EPromocionVO> {

    public static final Conexion conexionop = Conexion.saberEstado();
    private static final String insertar = "INSERT INTO `epromocion`(`Estrategia`, `ManejoClienteEspecial`, `ConceptoMotivacion`, `PromocionPublicidad`, `IdProyecto`) VALUES (?,?,?,?,?)";
    private static final String actualizar = "UPDATE `epromocion` SET `Estrategia`= ? ,`ManejoClienteEspecial`= ?,`ConceptoMotivacion`=?,`PromocionPublicidad`=? WHERE `IdPromocion`= ?";
    private static final String buscar = "select * from epromocion where IdProyecto = ?";

    @Override
    public boolean create(EPromocionVO v) {
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(insertar);
            p.setString(1, v.getEstrategia());
            p.setString(2, v.getManejoClienteEspecial());
            p.setString(3, v.getConceptoMotivacion());
          
            p.setString(4, v.getPromocionPublicidad());
            p.setInt(5, v.getIdProyecto());
            if (p.executeUpdate() != 0) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(EPromocionDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            conexionop.cerrarConexion();
        }
        return false;
    }

    @Override
    public boolean delete(Object key) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean update(EPromocionVO v) {
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(actualizar);
            p.setString(1, v.getEstrategia());
            p.setString(2, v.getManejoClienteEspecial());
            p.setString(3, v.getConceptoMotivacion());
          
            p.setString(4, v.getPromocionPublicidad());
            p.setInt(5, v.getIdPromocion());
            if (p.executeUpdate() != 0) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(EPromocionDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            conexionop.cerrarConexion();
        }
        return false;
    }

    @Override
    public EPromocionVO read(Object key) {
        EPromocionVO e = null;
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(buscar);
            p.setInt(1, Integer.parseInt(key.toString()));
            ResultSet r = p.executeQuery();
            while(r.next()){
                e = new EPromocionVO(r.getInt(1), r.getString(2),r.getString(3),r.getString(4),r.getString(5),r.getInt(6));
            }
            return e;
        } catch (SQLException ex) {
            Logger.getLogger(EPromocionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            conexionop.cerrarConexion();
        }
        return e;
    }

    @Override
    public ArrayList<EPromocionVO> readAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
