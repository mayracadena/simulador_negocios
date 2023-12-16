/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Conexion.Conexion;
import Interfaces.Obligacion;
import VO.ProductoVO;
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
public class ProductoDAO implements Obligacion<ProductoVO>{

    public static final Conexion conexionop = Conexion.saberEstado();
    private static final String insertar = "INSERT INTO `producto`( `nombre`, `produ_especifico`, `descripcion_general`, `IdUnidadVenta`, `condiciones_especiales`, `otro`,  `IdProyecto`) VALUES (?,?,?,?,?,?,?)";
    private static final String actualizar ="UPDATE `producto` SET `nombre`=?,`produ_especifico`=?,`descripcion_general`=?,`IdUnidadVenta`=?,`condiciones_especiales`=?,`otro`=? WHERE IdProducto = ?";
    private static final String eliminar ="delete from producto where IdProducto = ? ";
    private static final String eliminar2 ="delete from  where IdProducto = ? ";
    private static final String consulta = "SELECT IdProducto, nombre, produ_especifico, descripcion_general, IdUnidadVenta,condiciones_especiales, otro, IdProducto,unidadmedida.UMedida FROM `producto` INNER join unidadmedida  on producto.IdUnidadVenta = unidadmedida.IdUnidadMedida where IdProyecto = ? ";
    private static final String consulta2 = "select * from producto where IdProducto = ?";
    private static final String consulta3 = "select * from producto where IdProyecto = ?";
    
    
    @Override
    public boolean create(ProductoVO v) {
        int si = 0;
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(insertar);
            p.setString(1, v.getNombre());
            p.setString(2, v.getProdu_especifico());
            p.setString(3, v.getDescripcion_general());
            p.setInt(4, v.getIdUnidadVenta());
            p.setString(5, v.getCondiciones_especiales());
            p.setString(6, v.getOtro());
          
            p.setInt(7, v.getIdProyecto());
            si = p.executeUpdate();
            if (si != 0) {
                return true;
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(ProductoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            conexionop.cerrarConexion();
        }
        return false;
    }

    @Override
    public boolean delete(Object key) {
        int id = Integer.parseInt(key.toString());
        int si = 0;
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(eliminar);
            p.setInt(1, id);
            si = p.executeUpdate();
            if (si != 0) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            conexionop.cerrarConexion();
        }
        return false;
    }

    @Override
    public boolean update(ProductoVO v) {
        int si = 0;
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(actualizar);
            p.setString(1, v.getNombre());
            p.setString(2, v.getProdu_especifico()); 
            p.setString(3, v.getDescripcion_general());
            p.setInt(4, v.getIdUnidadVenta());
            p.setString(5, v.getCondiciones_especiales());
            p.setString(6, v.getOtro());
         
            p.setInt(7, v.getIdProducto());
            si = p.executeUpdate();
            if (si != 0) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            conexionop.cerrarConexion();
        }
        return false;
    }

    @Override
    public ProductoVO read(Object key) {
        ResultSet r;
        ProductoVO pd = null;
        int id = Integer.parseInt(key.toString());
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(consulta2);
            p.setInt(1, id);
            r = p.executeQuery();
            while(r.next()){
                pd = new ProductoVO(r.getInt(1), r.getString(2), r.getString(3), r.getString(4), r.getInt(5), r.getString(6), r.getString(7), r.getInt(8));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            conexionop.cerrarConexion();
        }
        return pd;
    }

    @Override
    public ArrayList<ProductoVO> readAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
     public ArrayList<ProductoVO> todos(int id) {
         ResultSet r;
         ArrayList<ProductoVO> pr = new ArrayList();
         
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(consulta);
            p.setInt(1, id);
            r = p.executeQuery();
            while(r.next()){
                pr.add(new ProductoVO(r.getInt(1), r.getString(2), r.getString(3), r.getString(4), r.getInt(5), r.getString(6), r.getString(7), r.getInt(8), r.getString(9) ));
            }
            return pr;
        } catch (SQLException ex) {
            Logger.getLogger(ProductoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            conexionop.cerrarConexion();
        }
        return pr;
    }
     
     public ArrayList<ProductoVO> todosP(int idp) {
         ResultSet r;
         ArrayList<ProductoVO> pr = new ArrayList();
         
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(consulta3);
            p.setInt(1, idp);
            r = p.executeQuery();
            while(r.next()){
                pr.add(new ProductoVO(r.getInt(1), r.getString(2), r.getString(3), r.getString(4), r.getInt(5), r.getString(6), r.getString(7), r.getInt(8))); 
            }
            return pr;
        } catch (SQLException ex) {
            Logger.getLogger(ProductoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            conexionop.cerrarConexion();
        }
        return pr;
    }
    
}
