/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Conexion.Conexion;
import Interfaces.Obligacion;
import VO.NominaVO;
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
public class NominaDAO implements Obligacion<NominaVO> {

    public static final Conexion conexionop = Conexion.saberEstado();
    private static final String consulta = "select * from nomina where IdProyecto = ? and IdTipoNomina = ?";
    private static final String guardar = "INSERT INTO `nomina`(`cargo`, `meses`, `cantidad`, `salario`, `IdTipoNomina`, `IdProyecto`) VALUES (?,?,?,?,?,?)";
    private static final String actualizar = "update nomina set cargo = ?, meses = ?, cantidad = ?, salario = ? where IdNomina = ?";
    private static final String consulta2 = "select * from nomina where IdNomina = ?";
    private static final String borrar = "delete from nomina where IdNomina = ?";
    
    @Override
    public boolean create(NominaVO v) {
        int si = 0;
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(guardar);
            p.setString(1, v.getCargo());
            p.setInt(2, v.getMeses());
            p.setInt(3, v.getCantidad());
            p.setDouble(4, v.getSalario());
            p.setInt(5, v.getIdTipoNomina());
            p.setInt(6, v.getIdProyecto());
            si = p.executeUpdate();
            if (si != 0) {
                return true;
            }

        } catch (SQLException ex) {
            Logger.getLogger(NominaDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            conexionop.cerrarConexion();
        }
        return false;
    }

    @Override
    public boolean delete(Object key) {
            int id = Integer.parseInt(key.toString());
            int si = 0;
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(borrar);
            p.setInt(1, id);
            si = p.executeUpdate();
            if (si != 0) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(NominaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            conexionop.cerrarConexion();
        }
        return false;
    }

    @Override
    public boolean update(NominaVO v) {
        int si = 0;
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(actualizar);
            p.setString(1, v.getCargo());
            p.setInt(2, v.getMeses());
            p.setInt(3, v.getCantidad());
            p.setDouble(4, v.getSalario());
            p.setInt(5, v.getIdNomina());
            si = p.executeUpdate();
            if (si != 0) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(NominaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            conexionop.cerrarConexion();
        }
        return false;
    }

    @Override
    public NominaVO read(Object key) {
        int id = Integer.parseInt(key.toString());
        NominaVO n = null;
        ResultSet r;
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(consulta2);
            p.setInt(1, id);
            r = p.executeQuery();
            while(r.next()){
                n = new NominaVO( r.getInt(1), r.getString(2), r.getInt(3), r.getInt(4), r.getDouble(5), r.getInt(6), r.getInt(7));
            }
            return n;
        } catch (SQLException ex) {
            Logger.getLogger(NominaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            conexionop.cerrarConexion();
        }
        return n;
    }

    @Override
    public ArrayList<NominaVO> readAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public ArrayList<NominaVO> consulta(int idp, int tn) {
        ArrayList<NominaVO> n = new ArrayList();
        ResultSet r;
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(consulta);
            p.setInt(1, idp);
            p.setInt(2, tn);
            r = p.executeQuery();
            while (r.next()) {
                n.add(new NominaVO(r.getInt(1), r.getString(2), r.getInt(3), r.getInt(4), r.getDouble(5), r.getInt(6), r.getInt(7)));
            }
            return n;
        } catch (SQLException ex) {
            Logger.getLogger(NominaDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            conexionop.cerrarConexion();
        }
        return n;
    }

}
