/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Conexion.Conexion;
import static DAO.InversionDAO.conexionop;
import Interfaces.Obligacion;
import VO.InversionVO;
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
public class InversionDAO implements Obligacion<InversionVO> {

    public static final Conexion conexionop = Conexion.saberEstado();
    private static final String insertar = "INSERT INTO `inversion`( `Detalle`, `Cantidad`, `ValorUnitario`, `VidaUtil`, `IdTipoInversion`, `IdProyecto`) VALUES (?,?,?,?,?,?)";
    private static final String borrar = "DELETE FROM `inversion` WHERE `IdInversion` =?";
    private static final String actualizar = "UPDATE `inversion` SET `Detalle`= ? ,`Cantidad`= ?,`ValorUnitario` = ?,`VidaUtil`= ?  WHERE `IdInversion` =?";
    private static final String consulta = "SELECT `IdInversion`, `Detalle`, `Cantidad`, `ValorUnitario`, `VidaUtil`, inversion.IdTipoInversion, `IdProyecto` , tipoinversion.Tinversion FROM `inversion` INNER JOIN tipoinversion on inversion.IdTipoInversion = tipoinversion.IdTipoInversion where inversion.IdTipoInversion = ? and inversion.IdProyecto = ?";
    private static final String buscar = "select * from inversion where IdInversion = ?";
    private static final String inv20 = "SELECT sum(Cantidad * ValorUnitario) as 'Total' from inversion WHERE VidaUtil = 20 and IdProyecto = ? and IdTipoInversion = ?";
    private static final String inv10 = "SELECT sum(Cantidad * ValorUnitario) as 'Total' from inversion WHERE VidaUtil = 10 and IdProyecto = ? and IdTipoInversion = ?";
    private static final String inv5 = "SELECT sum(Cantidad * ValorUnitario) as 'Total' from inversion WHERE VidaUtil = 5 and IdProyecto = ? and IdTipoInversion = ?";
    private static final String otrainv = "SELECT sum(Cantidad * ValorUnitario) as 'Total' FROM `inversion` WHERE `VidaUtil` != 20 and `VidaUtil` != 10 and `VidaUtil` != 5 and IdProyecto = ?  and IdTipoInversion = ?";
    private static final String depresiacion = "select * from inversion where IdProyecto = ? and IdTipoInversion = ?";

    @Override
    public boolean create(InversionVO v) {
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(insertar);
            p.setString(1, v.getDetalle());
            p.setInt(2, v.getCantidad());
            p.setDouble(3, v.getValorUnitario());
            p.setInt(4, v.getVidaUtil());
            p.setInt(5, v.getIdTipoInversion());
            p.setInt(6, v.getIdProyecto());

            if (p.executeUpdate() != 0) {
                return true;
            }

        } catch (SQLException ex) {
            Logger.getLogger(InversionDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            conexionop.cerrarConexion();
        }
        return false;
    }

    @Override
    public boolean delete(Object key) {
        int id = Integer.parseInt(key.toString());
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(borrar);
            p.setInt(1, id);

            if (p.executeUpdate() != 0) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(InversionDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            conexionop.cerrarConexion();
        }
        return false;
    }

    @Override
    public boolean update(InversionVO v) {
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(actualizar);
            p.setString(1, v.getDetalle());
            p.setInt(2, v.getCantidad());
            p.setDouble(3, v.getValorUnitario());
            p.setInt(4, v.getVidaUtil());
            p.setInt(5, v.getIdInversion());

            if (p.executeUpdate() != 0) {
                return true;
            }

        } catch (SQLException ex) {
            Logger.getLogger(InversionDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            conexionop.cerrarConexion();
        }
        return false;
    }

    @Override
    public InversionVO read(Object key) {
        InversionVO iv = null;
        ResultSet r;
        int id = Integer.parseInt(key.toString());
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(buscar);
            p.setInt(1, id);
            r = p.executeQuery();
            if (r.next()) {
                iv = new InversionVO(r.getInt(1), r.getString(2), r.getInt(3), r.getDouble(4), r.getInt(5), r.getInt(6), r.getInt(7));
            }
            return iv;
        } catch (SQLException ex) {
            Logger.getLogger(InversionDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            conexionop.cerrarConexion();
        }
        return iv;
    }

    @Override
    public ArrayList<InversionVO> readAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public ArrayList<InversionVO> todo(int id, int idp) {
        ArrayList<InversionVO> i = new ArrayList();
        ResultSet r;
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(consulta);
            p.setInt(1, id);
            p.setInt(2, idp);
            r = p.executeQuery();
            while (r.next()) {
                i.add(new InversionVO(r.getInt(1), r.getString(2), r.getInt(3), r.getDouble(4), r.getInt(5), r.getInt(6), r.getInt(7), r.getString(8)));
            }
            return i;
        } catch (SQLException ex) {
            Logger.getLogger(InversionDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            conexionop.cerrarConexion();
        }
        return i;
    }

public double resultado20 (int id, int idt){
    double total = 0;
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(inv20);
            p.setInt(1, id);
            p.setInt(2, idt);
            ResultSet r = p.executeQuery();
            while(r.next()){
                total = r.getDouble("Total");
            }
        } catch (SQLException ex) {
            Logger.getLogger(InversionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            conexionop.cerrarConexion();
        }
        return total;
}
public double resultado10 (int id, int idt){
    double total = 0;
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(inv10);
            p.setInt(1, id);
            p.setInt(2, idt);
            ResultSet r = p.executeQuery();
            while(r.next()){
                total = r.getDouble("Total");
            }
        } catch (SQLException ex) {
            Logger.getLogger(InversionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            conexionop.cerrarConexion();
        }
        return total;
}
public double resultado5 (int id, int idt){
    double total = 0;
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(inv5);
            p.setInt(1, id);
            p.setInt(2, idt);
            ResultSet r = p.executeQuery();
            while(r.next()){
                total = r.getDouble("Total");
            }
        } catch (SQLException ex) {
            Logger.getLogger(InversionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            conexionop.cerrarConexion();
        }
        return total;
}

 public  double otrainversion(int id, int idt){
     double i = 0;
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(otrainv);
            p.setInt(1, id);
            p.setInt(2, idt);
            ResultSet r = p.executeQuery();
            while(r.next()){
                i = r.getDouble("Total");
            }
            return i;
        } catch (SQLException ex) {
            Logger.getLogger(InversionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            conexionop.cerrarConexion();
        }
        return i;
 }
 
  public ArrayList<InversionVO> Depresiacion (int idp, int id) {
      ArrayList<InversionVO> i = new ArrayList();
        ResultSet r;
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(depresiacion);
            p.setInt(1, idp);
            p.setInt(2, id);
            r = p.executeQuery();
            while (r.next()) {                
                i.add(new InversionVO(r.getInt(1), r.getString(2), r.getInt(3), r.getDouble(4), r.getInt(5), r.getInt(6), r.getInt(7)));
           
            }
            return i;
        } catch (SQLException ex) {
            Logger.getLogger(InversionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            conexionop.cerrarConexion();
        }
        return i;
  }
}

