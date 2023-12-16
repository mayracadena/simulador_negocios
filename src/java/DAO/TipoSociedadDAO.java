/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Conexion.Conexion;
import Interfaces.Obligacion;
import VO.TipoDocumentoVO;
import VO.TipoSociedadVO;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author mayracadena
 */
public class TipoSociedadDAO implements Obligacion <TipoSociedadVO>{
    
    public static final Conexion conexionop = Conexion.saberEstado();
    private static final String buscarAll = "SELECT * FROM `tiposociedad`";
    private static final String buscar = "select * from tiposociedad where IdTipoSociedad = ?";
    

    @Override
    public boolean create(TipoSociedadVO v) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean delete(Object key) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean update(TipoSociedadVO v) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public TipoSociedadVO read(Object key) {
        TipoSociedadVO ts = null;
        ResultSet r;
         int id = Integer.parseInt(key.toString());
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(buscar);
            p.setInt(1, id);
            r = p.executeQuery();
            while(r.next()){
                ts = new TipoSociedadVO(r.getInt(1), r.getString(2));
            }
            return ts;
        } catch (SQLException ex) {
            Logger.getLogger(TipoSociedadDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            conexionop.cerrarConexion();
        }
        return ts;
    }

    @Override
    public ArrayList<TipoSociedadVO> readAll() {
       ArrayList<TipoSociedadVO> td = new ArrayList();
            ResultSet rs;
        try {
            
            PreparedStatement ps = conexionop.getCnn().prepareStatement(buscarAll);
            rs = ps.executeQuery();
            while(rs.next()){
                td.add(new TipoSociedadVO(rs.getInt(1), rs.getString(2)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(TipoSociedadDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            conexionop.cerrarConexion();
        }
        return td;
    }
    
}
