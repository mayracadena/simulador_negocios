/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Conexion.Conexion;
import VO.TipoGastoCostoVO;
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
public class TipoGastoCostoDAO {
    public static final Conexion conexionop = Conexion.saberEstado();
    private static final String buscarAll = "select * from tipogastocosto";
    
    public ArrayList<TipoGastoCostoVO> readAll() {
        ArrayList<TipoGastoCostoVO> tgc = new ArrayList();
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(buscarAll);
            ResultSet r = p.executeQuery();
            while(r.next()){
                tgc.add(new TipoGastoCostoVO (r.getInt(1), r.getString(2)));
            }
            return tgc;
        } catch (SQLException ex) {
            Logger.getLogger(TipoGastoCostoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            conexionop.cerrarConexion();
        }
        return tgc;
    }
}
