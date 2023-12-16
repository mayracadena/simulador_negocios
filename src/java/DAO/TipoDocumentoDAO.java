/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Conexion.Conexion;
import Interfaces.Obligacion;
import VO.TipoDocumentoVO;
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
public class TipoDocumentoDAO implements Obligacion<TipoDocumentoVO> {

    private static final String buscarAll = "select * from tipodocumento";
    private static final Conexion conexionop = Conexion.saberEstado();
    
    @Override
    public boolean create(TipoDocumentoVO v) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean delete(Object key) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean update(TipoDocumentoVO v) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public TipoDocumentoVO read(Object key) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ArrayList<TipoDocumentoVO> readAll() {
            ArrayList<TipoDocumentoVO> td = new ArrayList();
            ResultSet rs;
        try {
            
            PreparedStatement ps = conexionop.getCnn().prepareStatement(buscarAll);
            rs = ps.executeQuery();
            while(rs.next()){
                td.add(new TipoDocumentoVO(rs.getInt(1), rs.getString(2)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(TipoDocumentoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            conexionop.cerrarConexion();
        }
        return td;
    }
    
}
