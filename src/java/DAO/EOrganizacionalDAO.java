/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Conexion.Conexion;
import Interfaces.Obligacion;
import VO.EOrganizacionalVO;
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
public class EOrganizacionalDAO implements Obligacion<EOrganizacionalVO>{
    
    public static final Conexion conexionop = Conexion.saberEstado();
    private static final String insertar = "INSERT INTO `eorganizacional`(`IdConcepto`, `Impacto`, `Estrategia`, `IdProyecto`) VALUES (?, ?, ?, ?)";
    private static final String actualizar = "UPDATE `eorganizacional` SET `Impacto`= ? ,`Estrategia`= ?  WHERE `IdOrganizacional` = ?";
    private static final String buscar = "select `IdOrganizacional`, eorganizacional.IdConcepto,`Impacto`, `Estrategia`, IdProyecto ,conceptoorganizacional.ConceptoO from eorganizacional INNER join conceptoorganizacional on eorganizacional.IdConcepto = conceptoorganizacional.IdConcepto where IdProyecto = ?";
    private static final String consulta = "select `IdOrganizacional`, eorganizacional.IdConcepto,`Impacto`, `Estrategia`, IdProyecto ,conceptoorganizacional.ConceptoO from eorganizacional INNER join conceptoorganizacional on eorganizacional.IdConcepto = conceptoorganizacional.IdConcepto where IdOrganizacional = ?";
    private static final String borrar = "delete  from eorganizacional where IdOrganizacional = ?";
    
    @Override
    public boolean create(EOrganizacionalVO v) {
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(insertar);
            p.setInt(1, v.getIdConcepto());
            p.setString(2, v.getImpacto());
            p.setString(3, v.getEstrategia());
            p.setInt(4, v.getIdProyecto());
            if (p.executeUpdate() != 0) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(EOrganizacionalDAO.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(EOrganizacionalDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            conexionop.cerrarConexion();
        }
        return false;
    }

    @Override
    public boolean update(EOrganizacionalVO v) {
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(actualizar);
            p.setString(1, v.getImpacto());
            p.setString(2, v.getEstrategia());
            p.setInt(3, v.getIdOrganizacional());
            if (p.executeUpdate() != 0) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(EOrganizacionalDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            conexionop.cerrarConexion();
        }
        return false;
    }

    @Override
    public ArrayList<EOrganizacionalVO> readAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public EOrganizacionalVO read(Object key) {
        EOrganizacionalVO e = null;
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(consulta);
            p.setInt(1, Integer.parseInt(key.toString()));
            ResultSet r = p.executeQuery();
            while(r.next()){
                e = new EOrganizacionalVO(r.getInt(1), r.getInt(2),r.getString(3), r.getString(4), r.getInt(5), r.getString(6));
            }
            return e;
        } catch (SQLException ex) {
            Logger.getLogger(EOrganizacionalDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            conexionop.cerrarConexion();
        }
        return e;
    }
     public ArrayList<EOrganizacionalVO> todos(int id) {
         ArrayList<EOrganizacionalVO> eo = new ArrayList();
       try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(buscar);
            p.setInt(1, id);
            ResultSet r = p.executeQuery();
            while(r.next()){
                eo.add(new EOrganizacionalVO (r.getInt(1), r.getInt(2),r.getString(3), r.getString(4), r.getInt(5), r.getString(6)));
            }
            return eo;
        } catch (SQLException ex) {
            Logger.getLogger(EOrganizacionalDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            conexionop.cerrarConexion();
        }
       return eo;
    }
    
}
