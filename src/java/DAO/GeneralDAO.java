/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Conexion.Conexion;
import Interfaces.Obligacion;
import VO.GeneralVO;
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
public class GeneralDAO implements Obligacion<GeneralVO> {

    public static final Conexion conexionop = Conexion.saberEstado();
    private static final String buscarAll = "select * from general";
    private static final String actualizar = "UPDATE `general` SET `salarioM`= ?,`subsidioT`=?,`TazaImpuestos`=?,`TazaOportunidad`=?,`Cesantias`=?,`InteresesCesantias`=?,`PrimaServicios`=?,`Vacaciones`=?,`CajaCompensacion`=?,`EPSalud`=?,`Pension`=?,`Riesgos`= ? WHERE id = 1";
    private static final String sumaNomina = "SELECT sum(`Cesantias` + `InteresesCesantias` + `PrimaServicios` + `Vacaciones` + `CajaCompensacion` + `EPSalud` + `Pension` + `Riesgos`) as 'totalS' FROM `general` WHERE `id` = 1";
    @Override
    public boolean create(GeneralVO v) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean delete(Object key) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean update(GeneralVO v) {
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(actualizar);
            p.setDouble(1, v.getSalarioM());
            p.setDouble(2, v.getSubsidioT());
            p.setDouble(3, v.getTazaImpuestos());
            p.setDouble(4, 0);
            p.setFloat(5, v.getCesantias());
            p.setFloat(6, v.getInteresesCesantias());
            p.setFloat(7, v.getPrimaServicios());
            p.setFloat(8, v.getVacaciones());
            p.setFloat(9, v.getCajaCompensacion());
            p.setFloat(10, v.getEPSalud());
            p.setFloat(11, v.getPension());
            p.setFloat(12, v.getRiesgos());
           
            
            if (p.executeUpdate() != 0) {
                return true;
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(GeneralDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            conexionop.cerrarConexion();
        }
        return false;
    }

    @Override
    public GeneralVO read(Object key) {
        GeneralVO g = null;
        ResultSet r;
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(buscarAll);
            r = p.executeQuery();
            while (r.next()) {
                g = new GeneralVO(r.getInt(1), r.getDouble(2), r.getDouble(3), r.getDouble(4), r.getDouble(5), r.getFloat(6), r.getFloat(7), r.getFloat(8), r.getFloat(9),r.getFloat(10), r.getFloat(11),r.getFloat(12) , r.getFloat(13));
            }
            return g;
        } catch (SQLException ex) {
            Logger.getLogger(GeneralDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            conexionop.cerrarConexion();
        }
        return g;
    }

    @Override
    public ArrayList<GeneralVO> readAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    


}
