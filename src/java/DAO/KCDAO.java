/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Conexion.Conexion;
import Interfaces.Obligacion;
import VO.KCVO;
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
public class KCDAO implements Obligacion<KCVO> {

    public static final Conexion conexionop = Conexion.saberEstado();
    private static final String crear = "INSERT INTO `kc`(`Conceptos`, `Monto`, `Tasa`, `IdProyecto`) VALUES (?,?,?,?)";
    private static final String eliminar = "DELETE FROM `kc` WHERE `IdKc` = ?";
    private static final String actualizar = "UPDATE `kc` SET `Conceptos`= ?,`Monto`=?,`Tasa`=? WHERE `IdKc` = ?";
    private static final String consulta = "SELECT * FROM `kc` WHERE `IdProyecto` = ?";
    private static final String consulta2 = "SELECT * FROM `kc` WHERE `IdKc` = ?";
    private static final String reporte = "select sum(Monto) as 'Total' from kc where IdProyecto = ?";

    @Override
    public boolean create(KCVO v) {
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(crear);
            p.setString(1, v.getConceptos());
            p.setDouble(2, v.getMonto());
            p.setDouble(3, v.getTasa());
            p.setInt(4, v.getIdProyecto());
            if (p.executeUpdate() != 0) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(KCDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            conexionop.cerrarConexion();
        }
        return false;
    }

    @Override
    public boolean delete(Object key) {
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(eliminar);
            p.setInt(1, Integer.parseInt(key.toString()));
            if (p.executeUpdate() != 0) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(KCDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            conexionop.cerrarConexion();
        }
        return true;
    }

    @Override
    public boolean update(KCVO v) {
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(actualizar);
            p.setString(1, v.getConceptos());
            p.setDouble(2, v.getMonto());
            p.setDouble(3, v.getTasa());
            p.setInt(4, v.getIdKc());
            if (p.executeUpdate() != 0) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(KCDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            conexionop.cerrarConexion();
        }
        return false;
    }

    @Override
    public KCVO read(Object key) {
       KCVO k = null;
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(consulta2);
            p.setInt(1, Integer.parseInt(key.toString()));
            ResultSet r = p.executeQuery();
            while(r.next()){
                k = new KCVO(r.getInt(1), r.getString(2), r.getDouble(3), r.getDouble(4), r.getInt(5));
            }
            return k;
        } catch (SQLException ex) {
            Logger.getLogger(KCDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            conexionop.cerrarConexion();
        }
        return k;
    }

    @Override
    public ArrayList<KCVO> readAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    public ArrayList<KCVO> todo (int id){
        ArrayList<KCVO> k = new ArrayList();
        
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(consulta);
            p.setInt(1, id);
            ResultSet r = p.executeQuery();
            while (r.next()) {                
                k.add(new KCVO(r.getInt(1), r.getString(2), r.getDouble(3), r.getDouble(4), r.getInt(5)));
            }
            return k;
        } catch (SQLException ex) {
            Logger.getLogger(KCDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            conexionop.cerrarConexion();
        }
        
        return k;
    }

    public double reporte (int idp){
        double total = 0;
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(reporte);
            p.setInt(1, idp);
            ResultSet r = p.executeQuery();
            while(r.next()){
                total = r.getDouble("Total");
            }
            return total;
        } catch (SQLException ex) {
            Logger.getLogger(KCDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            conexionop.cerrarConexion();
        }
        return total;
    }
}
