/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Conexion.Conexion;
import Interfaces.Obligacion;
import VO.InversionDiferidaVO;
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
public class InversionDiferidaDAO implements Obligacion<InversionDiferidaVO> {

    public static final Conexion conexionop = Conexion.saberEstado();
    private static final String consulta = "SELECT inversiondiferida.IdInversionDiferida, inversiondiferida.IdTipoInversionDiferida, Total, tipoinversiondiferida.TinversionD as 'TipoInversionDiferida' FROM inversiondiferida inner join tipoinversiondiferida on inversiondiferida.IdTipoInversionDiferida = tipoinversiondiferida.IdTipoInversionDiferida WHERE IdProyecto = ? ";
    private static final String consulta2 = "select inversiondiferida.IdInversionDiferida,inversiondiferida.IdTipoInversionDiferida, Total, tipoinversiondiferida.TinversionD as 'TipoInversionDiferida' FROM inversiondiferida inner join tipoinversiondiferida on inversiondiferida.IdTipoInversionDiferida = tipoinversiondiferida.IdTipoInversionDiferida WHERE inversiondiferida.IdInversionDiferida = ?";
    private static final String actualizar = "update inversiondiferida set IdTipoInversionDiferida = ?, Total = ? where IdInversionDiferida = ? and IdProyecto = ?";
    private static final String borrar = "delete from inversiondiferida where IdInversionDiferida = ?";
    private static final String crear = "INSERT INTO inversiondiferida(IdTipoInversionDiferida, Total, IdProyecto) VALUES (?,?,?)";
    private static final String Total = "select sum(Total) as 'Total' from inversiondiferida where IdProyecto = ?";
    
    @Override
    public boolean create(InversionDiferidaVO v) {
        int si = 0;
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(crear);
            p.setInt(1, v.getIdTipoInversionDiferida());
            p.setDouble(2, v.getTotal());
            p.setInt(3, v.getIdProyecto());
            si = p.executeUpdate();
            if (si != 0) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(InversionDiferidaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
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
            Logger.getLogger(InversionDiferidaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            conexionop.cerrarConexion();
        }
        return false;
    }

    @Override
    public boolean update(InversionDiferidaVO v) {
        int si = 0;
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(actualizar);
            p.setInt(1, v.getIdTipoInversionDiferida());
            p.setDouble(2, v.getTotal());
            p.setInt(3, v.getIdInversionDiferida());
            p.setInt(4, v.getIdProyecto());
            si = p.executeUpdate();
            if (si != 0) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(InversionDiferidaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            conexionop.cerrarConexion();
        }
        return false;
    }

    @Override
    public InversionDiferidaVO read(Object key) {
        int id = Integer.parseInt(key.toString());
        InversionDiferidaVO ivd = null;
        ResultSet rs;
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(consulta2);
            p.setInt(1, id);
           rs = p.executeQuery();
            while(rs.next()){
                ivd = new InversionDiferidaVO (rs.getInt(1), rs.getInt(2), rs.getDouble(3), rs.getString(4) );
            }
            return ivd;
        } catch (SQLException ex) {
            Logger.getLogger(InversionDiferidaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            conexionop.cerrarConexion();
        }
        return ivd;
    }

    @Override
    public ArrayList<InversionDiferidaVO> readAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public ArrayList<InversionDiferidaVO> todo(int id) {
        ArrayList<InversionDiferidaVO> idv = new ArrayList();
        ResultSet r;
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(consulta);
            p.setInt(1, id);
            r = p.executeQuery();
            while(r.next()){
                idv.add(new InversionDiferidaVO (r.getInt(1), r.getInt(2), r.getDouble(3), r.getString(4)));
            }
            return idv;
        } catch (SQLException ex) {
            Logger.getLogger(InversionDiferidaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            conexionop.cerrarConexion();
        }
        return idv;
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
            Logger.getLogger(InversionDiferidaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            conexionop.cerrarConexion();
        }
        return total;
    }
}
