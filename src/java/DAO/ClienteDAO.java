/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Conexion.Conexion;
import Interfaces.Obligacion;
import VO.ClienteVO;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author mayrayesenia
 */
public class ClienteDAO implements Obligacion<ClienteVO>{

    public static final Conexion conexionop = Conexion.saberEstado();
    private static final String crear = "INSERT INTO `cliente`(`Perfil`, `Localizacion`, `Justificacion`, `Satisfaccion`, `Volumen_compra`, `Caracteristicas`, `Sitio_compra`, `Forma_pago`, `Precio`, `Requisitos_posventa`, `Garantias`, `Margen_comercial`, `IdProducto`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)";
    private static final String actualizar = "UPDATE `cliente` SET `Perfil`=?,`Localizacion`=?,`Justificacion`=?,`Satisfaccion`=?,`Volumen_compra`=?,`Caracteristicas`=?,`Sitio_compra`=?,`Forma_pago`=?,`Precio`=?,`Requisitos_posventa`=?,`Garantias`=?,`Margen_comercial`=? WHERE `IdCliente`=?";
    private static final String borrar = "DELETE FROM `cliente` WHERE `IdCliente` = ?";
    private static final String consultar = "SELECT * FROM `cliente` WHERE `IdProducto` = ?";
    private static final String consulta2 = "SELECT * FROM `cliente` WHERE `IdCliente` = ?";
    
    @Override
    public boolean create(ClienteVO v) {
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(crear);
            p.setString(1, v.getPerfil());
            p.setString(2, v.getLocalizacion());
            p.setString(3, v.getJustificacion());
            p.setString(4, v.getSatisfaccion());
            p.setString(5, v.getVolumen_compra());
            p.setString(6, v.getCaracteristicas());
            p.setString(7, v.getSitio_compra());
            p.setString(8, v.getForma_pago());
            p.setString(9, v.getPrecio());
            p.setString(10, v.getRequisitos_posventa());
            p.setString(11, v.getGarantias());
            p.setString(12, v.getMargen_comercial());
            p.setInt(13, v.getIdProducto());
            
            int si = p.executeUpdate();
            
            if (si != 0) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
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
            int si = p.executeUpdate();
            
            if (si != 0) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            conexionop.cerrarConexion();
        }
        return false;
    }

    @Override
    public boolean update(ClienteVO v) {
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(actualizar);
            p.setString(1, v.getPerfil());
            p.setString(2, v.getLocalizacion());
            p.setString(3, v.getJustificacion());
            p.setString(4, v.getSatisfaccion());
            p.setString(5, v.getVolumen_compra());
            p.setString(6, v.getCaracteristicas());
            p.setString(7, v.getSitio_compra());
            p.setString(8, v.getForma_pago());
            p.setString(9, v.getPrecio());
            p.setString(10, v.getRequisitos_posventa());
            p.setString(11, v.getGarantias());
            p.setString(12, v.getMargen_comercial()); 
            p.setInt(13, v.getIdCliente());
            
            int si = p.executeUpdate();
            
            if (si != 0) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            conexionop.cerrarConexion();
        }
        return false;
    }

    @Override
    public ClienteVO read(Object key) {
        ClienteVO cl = null;
        ResultSet rs;
        
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(consulta2);
            p.setInt(1, Integer.parseInt(key.toString()));
            
            rs = p.executeQuery();
            while(rs.next()){
                cl = new ClienteVO(rs.getInt(1), rs.getString(2),rs.getString(3),rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9),rs.getString(10),rs.getString(11),rs.getString(12),rs.getString(13),rs.getInt(14));
            }
            return cl;
        } catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            conexionop.cerrarConexion();
        }
        return cl;
    }

    @Override
    public ArrayList<ClienteVO> readAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    public ArrayList<ClienteVO> consultar_All(int idp) {
        ArrayList<ClienteVO> acl = new ArrayList();
        ResultSet rs;
        
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(consultar);
            p.setInt(1, idp);
            rs = p.executeQuery();
            while(rs.next()){
                acl.add(new ClienteVO(rs.getInt(1), rs.getString(2),rs.getString(3),rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9),rs.getString(10),rs.getString(11),rs.getString(12),rs.getString(13),rs.getInt(14)));
            }
            return acl;
        } catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            conexionop.cerrarConexion();
        }
        return acl;
    }
}
