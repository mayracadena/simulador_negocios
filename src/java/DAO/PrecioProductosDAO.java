/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Conexion.Conexion;
import Interfaces.Obligacion;
import VO.PrecioProductosVO;
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
public class PrecioProductosDAO implements Obligacion<PrecioProductosVO>{
    
    public static final Conexion conexionop = Conexion.saberEstado();
    private static final String insert = "INSERT INTO `preciosproductos`( `Precio`, `year`, `IdProducto`) VALUES (?,?,?)";
    private static final String update = "UPDATE `preciosproductos` SET `Precio`= ?,`year`= ? WHERE `IdPrecioProductos`= ?";
    private static final String delete = "DELETE FROM `preciosproductos` WHERE `IdPrecioProductos` = ?";
    private static final String select = "SELECT * FROM `preciosproductos` WHERE `IdProducto` = ?";
    private static final String select1 = "SELECT * FROM `preciosproductos` WHERE IdPrecioProductos = ?";
    private static final String precio_p ="select Precio from preciosproductos where IdProducto = ? and year = 1";
    
    
    public double precio_p (int id){
        double total = 0;
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(precio_p);
            p.setInt(1, id);
            ResultSet r = p.executeQuery();
            while(r.next()){
              total = r.getDouble("Precio");
            }
        } catch (SQLException ex) {
            Logger.getLogger(PrecioProductosDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            conexionop.cerrarConexion();
        }
        return total;
    }
    
    @Override
    public boolean create(PrecioProductosVO v) {
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(insert);
            p.setDouble(1, v.getPrecio());
            p.setInt(2, v.getYear());
            p.setInt(3, v.getIdProducto());
            if (p.executeUpdate() != 0) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(PrecioProductosDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            conexionop.cerrarConexion();
        }
        return false;
    }

    @Override
    public boolean delete(Object key) {
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(delete);
            p.setInt(1, Integer.parseInt(key.toString()));
            if (p.executeUpdate() != 0) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(PrecioProductosDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            conexionop.cerrarConexion();
        }
        return false;
    }

    @Override
    public boolean update(PrecioProductosVO v) {
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(update);
            p.setDouble(1, v.getPrecio());
            p.setInt(2, v.getYear());
            p.setInt(3, v.getIdPrecioProductos());
            if (p.executeUpdate() != 0) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(PrecioProductosDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            conexionop.cerrarConexion();
        }
        return false;
    }

    @Override
    public PrecioProductosVO read(Object key) {
        PrecioProductosVO pp = null;
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(select1);
            p.setInt(1, Integer.parseInt(key.toString()));
            ResultSet r = p.executeQuery();
            while(r.next()){
                pp = new PrecioProductosVO(r.getInt(1), r.getDouble(2), r.getInt(3), r.getInt(4));
            }
            return pp;
        } catch (SQLException ex) {
            Logger.getLogger(PrecioProductosDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            conexionop.cerrarConexion();
        }
        return pp;
    }

    @Override
    public ArrayList<PrecioProductosVO> readAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
     public ArrayList<PrecioProductosVO> todo(int id) {
         ArrayList<PrecioProductosVO> app = new ArrayList();
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(select);
            p.setInt(1, id);
            ResultSet r = p.executeQuery();
            while(r.next()){
                app.add(new PrecioProductosVO(r.getInt(1), r.getDouble(2), r.getInt(3), r.getInt(4)));
            }
            return app;
        } catch (SQLException ex) {
            Logger.getLogger(PrecioProductosDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            conexionop.cerrarConexion();
        }
        return app;
    }
}
