/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Conexion.Conexion;
import VO.ConceptoFinanciacionVO;
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
public class ConceptoFinanciacionDAO {
    public static final Conexion conexionop = Conexion.saberEstado();
    private static final String todo = "select * from conceptofinanciacion";
    
     public ArrayList<ConceptoFinanciacionVO> readAll() {
         ArrayList<ConceptoFinanciacionVO> c = new ArrayList();
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(todo);
            ResultSet r = p.executeQuery();
            while(r.next()){
                c.add(new ConceptoFinanciacionVO(r.getInt(1), r.getString(2)));
            }
            return c;
        } catch (SQLException ex) {
            Logger.getLogger(ConceptoFinanciacionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            conexionop.cerrarConexion();
        }
        return c;
    }
}
