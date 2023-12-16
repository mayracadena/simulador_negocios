/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Conexion.Conexion;
import Interfaces.Obligacion;
import VO.CostosProductosVO;
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
public class CostosProductosDAO implements Obligacion<CostosProductosVO> {

    public static final Conexion conexionop = Conexion.saberEstado();
    private static final String insert = "INSERT INTO `costosproductos`(`Detalle`, `Iva`, `Cantidad`, `IdUnidadMedida`, `Precio`, `IdTipoCosto`, `IdProducto`) VALUES (?,?,?,?,?,?,?)";
    private static final String editar = "UPDATE `costosproductos` SET `Detalle`=?,`Iva`=?,`Cantidad`=?,`IdUnidadMedida`=?,`Precio`=? WHERE IdCosto = ?";
    private static final String borrar = "delete from costosproductos where IdCosto = ?";
    private static final String buscar = "SELECT `IdCosto`, `Detalle`, `Iva`, `Cantidad`, costosproductos.IdUnidadMedida, `Precio`, `IdTipoCosto`, `IdProducto`, unidadmedida.UMedida FROM `costosproductos` INNER join unidadmedida on unidadmedida.IdUnidadMedida = costosproductos.IdUnidadMedida WHERE IdCosto = ?";
    private static final String consulta = "SELECT `IdCosto`, `Detalle`, `Iva`, `Cantidad`, costosproductos.IdUnidadMedida, `Precio`, `IdTipoCosto`, `IdProducto`, unidadmedida.UMedida FROM `costosproductos` INNER join unidadmedida on unidadmedida.IdUnidadMedida = costosproductos.IdUnidadMedida WHERE IdProducto = ? and IdTipoCosto = ?";
    private static final String Total = "SELECT sum(`Cantidad` * `Precio`) as 'Total' FROM `costosproductos` WHERE `IdProducto` = ?";
    private static final String TotalCostos = "SELECT sum(`Cantidad` * `Precio`) as 'Total' FROM `costosproductos` INNER join producto on costosproductos.IdProducto = producto.IdProducto where producto.IdProyecto = ?";
    
    
    
    
    public double TotalCostos(int id){
        double total = 0;
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(TotalCostos);
            p.setInt(1, id);
             ResultSet r = p.executeQuery();
           
             while (r.next()) {                
                total = r.getDouble("Total");
            }
        } catch (SQLException ex) {
            Logger.getLogger(CostosProductosDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            conexionop.cerrarConexion();
        }
        return total;
    }
    
    
    
    @Override
    public boolean create(CostosProductosVO v) {
        int si = 0;
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(insert);
            p.setString(1, v.getDetalle());
            p.setFloat(2, v.getIva());
            p.setInt(3, v.getCantidad());
            p.setInt(4, v.getIdUnidadMedida());
            p.setDouble(5, v.getPrecio());
            p.setInt(6, v.getIdTipoCosto());
            p.setInt(7, v.getIdProducto());
            si = p.executeUpdate();
            if (si != 0) {
                return true;
            }

        } catch (SQLException ex) {
            Logger.getLogger(CostosProductosDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            conexionop.cerrarConexion();
        }
        return false;
    }

    @Override
    public boolean delete(Object key) {
        int si = 0;
        int id = Integer.parseInt(key.toString());
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(borrar);
            p.setInt(1, id);
            si = p.executeUpdate();
            if (si != 0) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CostosProductosDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            conexionop.cerrarConexion();
        }

        return false;
    }

    @Override
    public boolean update(CostosProductosVO v) {
        int si = 0;
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(editar);
            p.setString(1, v.getDetalle());
            p.setFloat(2, v.getIva());
            p.setInt(3, v.getCantidad());
            p.setInt(4, v.getIdUnidadMedida());
            p.setDouble(5, v.getPrecio());
         
            p.setInt(6, v.getIdCosto());
            si = p.executeUpdate();
            if (si != 0) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CostosProductosDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            conexionop.cerrarConexion();
        }
        return false;
    }

    @Override
    public CostosProductosVO read(Object key) {
        int id = Integer.parseInt(key.toString());
        ResultSet r;
        CostosProductosVO cp = null;
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(buscar);
            p.setInt(1, id);
            r = p.executeQuery();
            while(r.next()){
                cp = new CostosProductosVO(r.getInt(1), r.getString(2), r.getFloat(3), r.getInt(4), r.getInt(5), r.getDouble(6), r.getInt(7), r.getInt(8), r.getString(9));
            }
            return cp;
        } catch (SQLException ex) {
            Logger.getLogger(CostosProductosDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            conexionop.cerrarConexion();
        }
        return cp;
    }

    @Override
    public ArrayList<CostosProductosVO> readAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
     public ArrayList<CostosProductosVO> todo(int id, int idt) {
         
         ArrayList<CostosProductosVO> cp = new ArrayList();
         ResultSet r;
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(consulta);
            p.setInt(1, id);
            p.setInt(2, idt);
            r = p.executeQuery();
            while (r.next()){
                cp.add(new CostosProductosVO(r.getInt(1), r.getString(2), r.getFloat(3), r.getInt(4), r.getInt(5), r.getDouble(6), r.getInt(7), r.getInt(8), r.getString(9)));
            }
            return cp;
            
        } catch (SQLException ex) {
            Logger.getLogger(CostosProductosDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            conexionop.cerrarConexion();
        }
        return cp;
    }

     public double total (int id){
         double total = 0;
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(Total);
            p.setInt(1, id);
            ResultSet r = p.executeQuery();
            while(r.next()){
                total = r.getDouble("Total");
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(CostosProductosDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            conexionop.cerrarConexion();
        }
        return total;
     } 
}
