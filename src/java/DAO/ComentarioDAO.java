/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import static DAO.UsuarioDAO.conexionop;
import Interfaces.Obligacion;
import VO.ComentarioVO;
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
public class ComentarioDAO implements Obligacion<ComentarioVO>{

    private final String Insertar = "INSERT INTO comentarios(Comentario, IdProyecto) VALUES (?, ?)";
    private final String Actualizar = "UPDATE comentarios SET Comentario= ?  WHERE IdProyecto = ?";
    private final String Buscar = "select * from comentarios where IdProyecto = ?";
    
    @Override
    public boolean create(ComentarioVO v) {
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(Insertar);
            p.setString(1, "No hay comentarios");
            p.setInt(2, v.getIdProyecto());
           boolean si = p.execute();
            if (si) {
                return true;
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(ComentarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            conexionop.cerrarConexion();
        }
        return false;
    }

    @Override
    public boolean delete(Object key) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean update(ComentarioVO v) {
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(Actualizar);
            p.setString(1, v.getComentario());
            p.setInt(2, v.getIdProyecto());
            int si = p.executeUpdate();
            if (si != 0) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ComentarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            conexionop.cerrarConexion();
        }
        return false;
    }

    @Override
    public ComentarioVO read(Object key) {
        ComentarioVO c = null;
        ResultSet rs;
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(Buscar);
            p.setInt(1, Integer.parseInt(key.toString()));
            rs = p.executeQuery();
            while(rs.next()){
                c = new ComentarioVO(rs.getInt(1), rs.getString(2), rs.getInt(3));
            }
            return c;
        } catch (SQLException ex) {
            Logger.getLogger(ComentarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            conexionop.cerrarConexion();
        }
        return c;
    }

    @Override
    public ArrayList<ComentarioVO> readAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
