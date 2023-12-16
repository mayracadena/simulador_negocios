/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Conexion.Conexion;
import Interfaces.Obligacion;
import VO.EmbarqueVO;
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
public class EmbarqueDAO implements Obligacion<EmbarqueVO>{
    
    public static final Conexion conexionop = Conexion.saberEstado();
    private static final String insert = "INSERT INTO `embarque`(`Origen`, `Destino`, `PesoTotal`, `IdUnidadMedida`, `UnidadComercial`, `VolumenTotal`, `TerminoVenta`, `FormaPago`, `Tiempo`, `TipoCambio`, `IdProducto`) VALUES (?,?,?,?,?,?,?,?,?,?,?)";
    private static final String borrar = "DELETE FROM `embarque` WHERE `IdEmbarque` = ?";
    private static final String editar = "UPDATE `embarque` SET `Origen`=?,`Destino`=?,`PesoTotal`=?,`IdUnidadMedida`=?,`UnidadComercial`=?,`VolumenTotal`=?,`TerminoVenta`=?,`FormaPago`=?,`Tiempo`=?,`TipoCambio`= ? WHERE IdEmbarque = ?";
    private static final String buscar = "SELECT `IdEmbarque`, `Origen`, `Destino`, `PesoTotal`, embarque.IdUnidadMedida, `UnidadComercial`, `VolumenTotal`, `TerminoVenta`, `FormaPago`, `Tiempo`, `TipoCambio`, `IdProducto`, unidadmedida.UMedida FROM `embarque` INNER JOIN unidadmedida on unidadmedida.IdUnidadMedida = embarque.IdUnidadMedida where IdProducto = ?";
    private static final String consulta = "select `IdEmbarque`, `Origen`, `Destino`, `PesoTotal`, embarque.IdUnidadMedida, `UnidadComercial`, `VolumenTotal`, `TerminoVenta`, `FormaPago`, `Tiempo`, `TipoCambio`, `IdProducto`, unidadmedida.UMedida from embarque INNER JOIN unidadmedida on unidadmedida.IdUnidadMedida = embarque.IdUnidadMedida where IdProducto = ?";

    @Override
    public boolean create(EmbarqueVO v) {
        int si = 0;
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(insert);
            p.setString(1, v.getOrigen());
            p.setString(2, v.getDestino());
            p.setDouble(3, v.getPesoTotal());
            p.setInt(4, v.getIdUnidadMedida());
            p.setString(5, v.getUnidadComercial());
            p.setString(6, v.getVolumenTotal());
            p.setString(7, v.getTerminoVenta());
            p.setString(8, v.getFormaPago());
            p.setString(9, v.getTiempo());
            p.setDouble(10, v.getTipoCambio());
            p.setInt(11, v.getIdProducto());
            si = p.executeUpdate();
            if (si != 0) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(EmbarqueDAO.class.getName()).log(Level.SEVERE, null, ex);
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
            PreparedStatement p = conexionop.getCnn().prepareStatement(borrar);
            p.setInt(1, id);
            si = p.executeUpdate();
            if (si != 0) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(EmbarqueDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            conexionop.cerrarConexion();
        }
        return false;
    }

    @Override
    public boolean update(EmbarqueVO v) {
        int si = 0;
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(editar);
            p.setString(1, v.getOrigen());
            p.setString(2, v.getDestino());
            p.setDouble(3, v.getPesoTotal());
            p.setInt(4, v.getIdUnidadMedida());
            p.setString(5, v.getUnidadComercial());
            p.setString(6, v.getVolumenTotal());
            p.setString(7, v.getTerminoVenta());
            p.setString(8, v.getFormaPago());
            p.setString(9, v.getTiempo());
            p.setDouble(10, v.getTipoCambio());
            p.setInt(11, v.getIdEmbarque());
            si = p.executeUpdate();
            if (si != 0) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(EmbarqueDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            conexionop.cerrarConexion();
        }
        return false;
    }

    @Override
    public EmbarqueVO read(Object key) {
        int id = Integer.parseInt(key.toString());
        ResultSet r;
        EmbarqueVO e = null;
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(buscar);
            p.setInt(1, id);
            r = p.executeQuery();
            while(r.next()){
                e = new EmbarqueVO(r.getInt(1), r.getString(2), r.getString(3), r.getDouble(4), r.getInt(5), r.getString(6), r.getString(7), r.getString(8), r.getString(9), r.getString(10), r.getDouble(11), r.getInt(12), r.getString(13));
            }
            return e;
        } catch (SQLException ex) {
            Logger.getLogger(EmbarqueDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            conexionop.cerrarConexion();
        }
        return e;
    }

    @Override
    public ArrayList<EmbarqueVO> readAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    public ArrayList<EmbarqueVO> todo(int id){
        
        ArrayList<EmbarqueVO> e = new ArrayList();
        ResultSet r;
         try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(consulta);
            p.setInt(1, id);
            r = p.executeQuery();
            while(r.next()){
                e.add(new EmbarqueVO (r.getInt(1), r.getString(2), r.getString(3), r.getDouble(4), r.getInt(5), r.getString(6), r.getString(7), r.getString(8), r.getString(9), r.getString(10), r.getDouble(11), r.getInt(12), r.getString(13)));
            }
            return e;
        } catch (SQLException ex) {
            Logger.getLogger(EmbarqueDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            conexionop.cerrarConexion();
        }
         return e;
    }
    
}
