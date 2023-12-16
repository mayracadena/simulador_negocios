/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Conexion.Conexion;
import Interfaces.Obligacion;
import VO.GastoCostoVO;
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
public class GastoCostoDAO implements Obligacion<GastoCostoVO> {

    public static final Conexion conexionop = Conexion.saberEstado();
    private static final String crear = "INSERT INTO `gastocosto`(`Detalle`, `Meses`, `CantidadM`, `ValorMoA`, `IdTipoGastoCosto`, `IdProyecto`) VALUES (?,?,?,?,?,?)";
    private static final String borrar = "DELETE FROM `gastocosto` WHERE `IdGastoCosto`= ?";
    private static final String editar = "UPDATE `gastocosto` SET `Detalle`=?,`Meses`= ?,`CantidadM`= ?,`ValorMoA`= ? WHERE `IdGastoCosto` = ?";
    private static final String buscar = "select * from gastocosto where IdGastoCosto = ?";
    private static final String consulta = "select * from gastocosto where IdProyecto = ? and IdTipoGastoCosto = ?";
    private static final String resultado = "SELECT sum(ValorMoA) as 'total' from gastocosto where IdTipoGastoCosto = 3 and IdProyecto = ?";//ya me acorde para hacer un reporte pendejo -.- , ahoritas las elimino :'v :3
    private static final String resultado2 = "SELECT sum(ValorMoA) as 'total' from gastocosto where IdTipoGastoCosto = 5 and IdProyecto = ?";//no me acuerdo por que las use :'v
    private static final String reporte = "SELECT sum(`ValorMoA`) as 'total' from gastocosto where IdProyecto = ? and `IdTipoGastoCosto` = ?";
    
    @Override
    public boolean create(GastoCostoVO v) {
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(crear);
            p.setString(1, v.getDetalle());
            p.setInt(2, v.getMeses());
            p.setInt(3, v.getCantidadM());
            p.setDouble(4, v.getValorMoA());
            p.setInt(5, v.getIdTipoGastoCosto());
            p.setInt(6, v.getIdProyecto());
            
            if (p.executeUpdate() != 0) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(GastoCostoDAO.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(GastoCostoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            conexionop.cerrarConexion();
        }
        return false;
    }

    @Override
    public boolean update(GastoCostoVO v) {
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(editar);
            p.setString(1, v.getDetalle());
            p.setInt(2, v.getMeses());
            p.setInt(3, v.getCantidadM());
            p.setDouble(4, v.getValorMoA());
            p.setInt(5, v.getIdGastoCosto());
            if (p.executeUpdate() != 0) {
                return true;
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(GastoCostoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            conexionop.cerrarConexion();
        }
        return false;
    }

    @Override
    public GastoCostoVO read(Object key) {
        GastoCostoVO g = null;
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(buscar);
            p.setInt(1, Integer.parseInt(key.toString()));
            ResultSet r = p.executeQuery();
            while(r.next()){
                g = new GastoCostoVO (r.getInt(1), r.getString(2), r.getInt(3), r.getInt(4), r.getDouble(5), r.getInt(6), r.getInt(7));
            }
            return g;
        } catch (SQLException ex) {
            Logger.getLogger(GastoCostoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            conexionop.cerrarConexion();
        }
        return g;
    }

    @Override
    public ArrayList<GastoCostoVO> readAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    public ArrayList<GastoCostoVO> todo (int id, int idtg){
        ArrayList<GastoCostoVO> gc = new ArrayList();
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(consulta);
            p.setInt(1, id);
            p.setInt(2, idtg);
            ResultSet r = p.executeQuery();
            while(r.next()){
                gc.add(new GastoCostoVO (r.getInt(1), r.getString(2), r.getInt(3), r.getInt(4), r.getDouble(5), r.getInt(6), r.getInt(7)));
            }
            return gc;
        } catch (SQLException ex) {
            Logger.getLogger(GastoCostoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            conexionop.cerrarConexion();
        }
        return gc;
    }

    public double resultadoConsulta (int id){
        double total = 0;
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(resultado);
            p.setInt(1, id);
            ResultSet r =p.executeQuery();
            while(r.next()){
                total = r.getDouble("total");
            }
            return total;
        } catch (SQLException ex) {
            Logger.getLogger(GastoCostoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            conexionop.cerrarConexion();
        }
        return total;
    }
       public double resultadoConsulta2 (int id){
        double total = 0;
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(resultado2);
            p.setInt(1, id);
            
            ResultSet r =p.executeQuery();
            while(r.next()){
                total = r.getDouble("total");
            }
            return total;
        } catch (SQLException ex) {
            Logger.getLogger(GastoCostoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            conexionop.cerrarConexion();
        }
        return total;
    }
       public double Reporte (int id, int idt){
        double total = 0;
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(reporte);
            p.setInt(1, id);
            p.setInt(2, idt);
            ResultSet r =p.executeQuery();
            while(r.next()){
                total = r.getDouble("total");
            }
            return total;
        } catch (SQLException ex) {
            Logger.getLogger(GastoCostoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            conexionop.cerrarConexion();
        }
        return total;
    }
}
