/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Conexion.Conexion;
import Interfaces.Obligacion;
import VO.CompetenciaVO;
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
public class CompetenciaDAO implements Obligacion<CompetenciaVO> {

    //sentencias SQL para la tabla copetencia
    public static final Conexion conexionop = Conexion.saberEstado();
    private static final String guardar = "INSERT INTO `competencia`(`nombre`, `analisis`, `ImagenEmpresa`, `FrenteCompetencia`, `IdProducto`) VALUES (?,?,?,?,?)";
    private static final String editar = "UPDATE `competencia` SET `nombre`= ?,`analisis`= ?,`ImagenEmpresa`= ?,`FrenteCompetencia`= ? WHERE `IdCompetencia`= ?";
    private static final String borrar = "DELETE FROM `competencia` WHERE `IdCompetencia` = ?";
    private static final String todos = "SELECT * FROM `competencia` WHERE `IdProducto` = ?";
    private static final String buscar = "SELECT * FROM `competencia` WHERE `IdCompetencia` = ?";

    @Override
    public boolean create(CompetenciaVO v) {
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(guardar);
            p.setString(1, v.getNombre());
            p.setString(2, v.getAnalisis());
            p.setString(3, v.getImagenEmpresa());
            p.setString(4, v.getFrenteCompetencia());
            p.setInt(5, v.getIdProducto());
            if (p.executeUpdate() != 0) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CompetenciaDAO.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(CompetenciaDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            conexionop.cerrarConexion();
        }
        return false;
    }

    @Override
    public boolean update(CompetenciaVO v) {
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(editar);
            p.setString(1, v.getNombre());
            p.setString(2, v.getAnalisis());
            p.setString(3, v.getImagenEmpresa());
            p.setString(4, v.getFrenteCompetencia());
            p.setInt(5, v.getIdCompetencia());
            if (p.executeUpdate() != 0) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CompetenciaDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            conexionop.cerrarConexion();
        }
        return false;
    }

    @Override
    public CompetenciaVO read(Object key) {
        CompetenciaVO c = null;
        try {
            PreparedStatement p =  conexionop.getCnn().prepareStatement(buscar);
            p.setInt(1, Integer.parseInt(key.toString()));
            ResultSet r = p.executeQuery();
            while(r.next()){
                c = new CompetenciaVO(r.getInt(1), r.getString(2), r.getString(3), r.getString(4),r.getString(5), r.getInt(6));
            }
            return c;
        } catch (SQLException ex) {
            Logger.getLogger(CompetenciaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            conexionop.cerrarConexion();
        }
        return c;
    }

    @Override
    public ArrayList<CompetenciaVO> readAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public ArrayList<CompetenciaVO> Todo(int id) {
        ArrayList<CompetenciaVO> c = new ArrayList();
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(todos);
            p.setInt(1, id);
            ResultSet r = p.executeQuery();
            while(r.next()){
                c.add(new CompetenciaVO(r.getInt(1), r.getString(2), r.getString(3), r.getString(4),r.getString(5), r.getInt(6)));
            }
            return c;
        } catch (SQLException ex) {
            Logger.getLogger(CompetenciaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            conexionop.cerrarConexion();
        }
        return c;
    }
}
