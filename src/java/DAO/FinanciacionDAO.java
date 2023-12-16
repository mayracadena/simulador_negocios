/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Conexion.Conexion;
import Interfaces.Obligacion;
import VO.FinanciacionVO;
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
public class FinanciacionDAO implements Obligacion<FinanciacionVO>{
    public static final Conexion conexionop = Conexion.saberEstado();
    private static final String insertar = "INSERT INTO `financiacion`( `IdConceptoFinanciacion`, `Monto`, `IdProyecto`) VALUES (?,?,?)";
    private static final String actualizar = "UPDATE `financiacion` SET `IdConceptoFinanciacion`= ?,`Monto`= ?  WHERE `IdFinanciacion`= ?";
    private static final String borrar = "DELETE FROM `financiacion` WHERE `IdFinanciacion` = ?";
    private static final String consulta = "SELECT `IdFinanciacion`, financiacion.IdConceptoFinanciacion, `Monto`, `IdProyecto`, conceptofinanciacion.Conceptos FROM `financiacion` INNER JOIN conceptofinanciacion on financiacion.IdConceptoFinanciacion = conceptofinanciacion.IdConceptoFinanciacion where IdProyecto = ?";
    private static final String buscar = "select * from financiacion where IdFinanciacion = ?";
    private static final String reporte = "SELECT sum(Monto) as 'Total' FROM `financiacion` WHERE IdProyecto = ? and `IdConceptoFinanciacion` != 1 and `IdConceptoFinanciacion` != 2 and `IdConceptoFinanciacion` != 7";
    private static final String reporte2 = "select sum(Monto) as 'Total' from financiacion where IdProyecto = ? and IdConceptoFinanciacion = ?";
    
    @Override
    public boolean create(FinanciacionVO v) {
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(insertar);
            p.setInt(1, v.getIdConceptoFinanciacion());
            p.setDouble(2, v.getMonto());
            p.setInt(3, v.getIdProyecto());
            if (p.executeUpdate() != 0) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(FinanciacionDAO.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(FinanciacionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            conexionop.cerrarConexion();
        }
        return false;
    }

    @Override
    public boolean update(FinanciacionVO v) {
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(actualizar);
            p.setInt(1, v.getIdConceptoFinanciacion());
            p.setDouble(2, v.getMonto());
            p.setInt(3, v.getIdFinanciacion());
            if (p.executeUpdate() != 0) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(FinanciacionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            conexionop.cerrarConexion();
        }
        return false;
    }

    @Override
    public FinanciacionVO read(Object key) {
        FinanciacionVO f = null;
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(buscar);
            p.setInt(1, Integer.parseInt(key.toString()));
            ResultSet r = p.executeQuery();
            while(r.next()){
                f = new FinanciacionVO(r.getInt(1), r.getInt(2), r.getDouble(3), r.getInt(4));
            }
            return f;
        } catch (SQLException ex) {
            Logger.getLogger(FinanciacionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            conexionop.cerrarConexion();
        }
        return f;
    }

    @Override
    public ArrayList<FinanciacionVO> readAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    public ArrayList<FinanciacionVO> todo(int id) {
        ArrayList<FinanciacionVO> f = new ArrayList();
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(consulta);
            p.setInt(1, id);
            ResultSet r = p.executeQuery();
            while(r.next()){
                f.add(new FinanciacionVO (r.getInt(1), r.getInt(2), r.getDouble(3), r.getInt(4), r.getString(5)));
            }
            return f;
        } catch (SQLException ex) {
            Logger.getLogger(FinanciacionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            conexionop.cerrarConexion();
        }
        return f;
    }
    
    public double Reporte (int id){
        double total = 0;
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(reporte);
            p.setInt(1, id);
            ResultSet r = p.executeQuery();
            while(r.next()){
                total = r.getDouble("Total");
            }
            return total;
        } catch (SQLException ex) {
            Logger.getLogger(FinanciacionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            conexionop.cerrarConexion();
        }
        return total;
    }
       public double Reporte2 (int id, int idc){
        double total = 0;
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(reporte2);
            p.setInt(1, id);
            p.setInt(2, idc);
            ResultSet r = p.executeQuery();
            while(r.next()){
                total = r.getDouble("Total");
            }
            return total;
        } catch (SQLException ex) {
            Logger.getLogger(FinanciacionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            conexionop.cerrarConexion();
        }
        return total;
    }     
            
            
}
