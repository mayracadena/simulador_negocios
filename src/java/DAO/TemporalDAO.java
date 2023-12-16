/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Conexion.Conexion;
import Interfaces.Obligacion;
import VO.TemporalVO;
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
public class TemporalDAO implements Obligacion<TemporalVO> {

    public static final Conexion conexionop = Conexion.saberEstado();
    private static final String insert1 = "insert into temporal (Kit, `CapitalTrabajo`, `Impuestos`,Ajustes, Tasa_Oportunidad, Year_credito,IdProyecto) values (?,?,?,?,?,?,?)";
    private static final String update1 = "update temporal set Kit = ? where IdProyecto = ?";
    private static final String update2 = "update temporal set CapitalTrabajo = ?, Year_credito = ? where IdProyecto = ?";
    private static final String update3 = "update temporal set Impuestos = ? where IdProyecto = ?";
    private static final String update4 = "update temporal set Ajustes = ? where IdProyecto = ?";
    private static final String update5 = "update temporal set Tasa_Oportunidad = ? where IdProyecto = ?";
    private static final String busqueda = "select * from temporal where IdProyecto = ?";

    @Override
    public boolean create(TemporalVO v) {
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(insert1);
            p.setDouble(1, v.getKit());
            p.setDouble(2, v.getCapitalTrabajo());
            p.setDouble(3, v.getImpuestos());
            p.setDouble(4, v.getAjustes());
            p.setDouble(5, v.getTasa_Oportunidad());
            p.setFloat(6, v.getYear_credito());
            p.setInt(7, v.getIdProyecto());
            if (p.executeUpdate() != 0) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(TemporalDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            conexionop.cerrarConexion();
        }
        return false;
    }

     public boolean crear(int v) {
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(insert1);
            p.setDouble(1, 0);
            p.setDouble(2, 0);
            p.setDouble(3, 0);
            p.setDouble(4, 0);
            p.setDouble(5, 0);
            p.setFloat(6, 0);
            p.setInt(7, v);
            if (p.executeUpdate() != 0) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(TemporalDAO.class.getName()).log(Level.SEVERE, null, ex);
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
    public boolean update(TemporalVO v) {

        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(update1);
            p.setDouble(1, v.getKit());
            p.setInt(2, v.getIdProyecto());
            if (p.executeUpdate() != 0) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(TemporalDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            conexionop.cerrarConexion();
        }
        return false;
    }

    public boolean update2(TemporalVO v) {

        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(update2);
            p.setDouble(1, v.getCapitalTrabajo());
            p.setFloat(2, v.getYear_credito());
            p.setInt(3, v.getIdProyecto());
            if (p.executeUpdate() != 0) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(TemporalDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            conexionop.cerrarConexion();
        }
        return false;
    }

    public boolean update3(TemporalVO v) {

        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(update3);
            p.setDouble(1, v.getImpuestos());
            p.setInt(2, v.getIdProyecto());
            if (p.executeUpdate() != 0) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(TemporalDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            conexionop.cerrarConexion();
        }
        return false;
    }

    public boolean update4(TemporalVO v) {

        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(update4);
            p.setDouble(1, v.getAjustes());
            p.setInt(2, v.getIdProyecto());
            if (p.executeUpdate() != 0) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(TemporalDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            conexionop.cerrarConexion();
        }
        return false;
    }

    public boolean update5(TemporalVO v) {

        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(update5);
            p.setDouble(1, v.getTasa_Oportunidad());
            p.setInt(2, v.getIdProyecto());
            if (p.executeUpdate() != 0) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(TemporalDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            conexionop.cerrarConexion();
        }
        return false;
    }

    @Override
    public TemporalVO read(Object key) {
        TemporalVO t = null;
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(busqueda);
            p.setInt(1, Integer.parseInt(key.toString()));
            ResultSet r = p.executeQuery();
            while (r.next()) {
                t = new TemporalVO(r.getInt(1), r.getDouble(2), r.getDouble(3), r.getDouble(4), r.getDouble(5), r.getDouble(6),r.getFloat(7) ,r.getInt(8));
            }
            return t;
        } catch (SQLException ex) {
            Logger.getLogger(TemporalDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            conexionop.cerrarConexion();
        }
        return t;
    }

    @Override
    public ArrayList<TemporalVO> readAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
