/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Conexion.Conexion;
import static DAO.ProyectoDAO.conexionop;
import Interfaces.Obligacion;
import VO.UsuarioVO;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import utils.UtilsMM;

/**
 *
 * @author mayracadena
 */
public class UsuarioDAO implements Obligacion<UsuarioVO> {

    private static final String insertar = "INSERT INTO usuario( Nombre1, Nombre2, Apellido1, Apellido2, Email, Password, Documento, IdTDocumento, Direccion, Telefono, IdRol, IdFicha, IdEtapa, IdEspecialidad) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
    private static final String cambiarContra = "update usuario set Password = ? where IdUsuario = ?";
    private static final String insertarInstructor = "INSERT INTO usuario( Nombre1, Nombre2, Apellido1, Apellido2, Email, Password, Documento, IdTDocumento, Direccion, Telefono, IdRol, IdEspecialidad, IdEtapa) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)";
    private static final String actualizarAprendiz = "UPDATE usuario SET Nombre1=?,Nombre2=?,Apellido1=?,Apellido2=?,Documento=?,IdTDocumento=?,Direccion=?,Telefono=?,IdFicha=?, IdEtapa=?, IdEspecialidad=? WHERE IdUsuario = ?";
    private static final String buscar = "select * from usuario where Email = ? and Password = ?";
    private static final String cambiarPassword = "update usuario set Password = ? where email = ?";
    private static final String buscarCorreo = "select password from usuario where Email = ?";
    private static final String BuscarEmail = "SELECT * from usuario where usuario.email LIKE '%' ? '%' and IdUsuario != ?";
    private static final String TodosInstructores = "select * from usuario where IdRol = 2";
    private static final String cambioRol = "update usuario set IdRol = ? where IdUsuario = ?";
    private static final String TodosAprendices = "SELECT usuario.IdUsuario, `nombre1`,`nombre2`,`apellido1`,`apellido2`,`email`,`IdRol`,usuario.IdFicha, ficha.Ficha from usuario inner join ficha on usuario.IdFicha = ficha.IdFicha where IdRol = 3";
    private static final String actualizarInstructor = "UPDATE usuario SET Nombre1=?,Nombre2=?,Apellido1=?,Apellido2=?,Documento=?,IdTDocumento=?,Direccion=?,Telefono=? WHERE IdUsuario = ?";
    private static final String validarContra = "select * from usuario where IdUsuario = ? and Password = ?";
    
    
    
    public static final Conexion conexionop = Conexion.saberEstado();

    @Override
    public boolean create(UsuarioVO v) {
        int si = 0;
        try {
            PreparedStatement ps = conexionop.getCnn().prepareStatement(insertar);
            ps.setString(1, v.getNombre1());
            ps.setString(2, v.getNombre2());
            ps.setString(3, v.getApellido1());
            ps.setString(4, v.getApellido2());
            ps.setString(5, v.getEmail());
            ps.setString(6, UtilsMM.encriptar(v.getPassword()));
            ps.setString(7, v.getDocumento());
            ps.setInt(8, v.getIdTDocumento());

            ps.setString(9, v.getDireccion());
            ps.setString(10, v.getTelefono());
            ps.setInt(11, v.getIdRol());
            ps.setInt(12, v.getIdficha());
            ps.setInt(13, v.getIdEtapa());
            ps.setInt(14, v.getIdEspecialidad());
            si = ps.executeUpdate();
            if (si != 0) {
                return true;
            }

        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        } finally {
            conexionop.cerrarConexion();
        }
        return false;
    }

    public boolean insertar(UsuarioVO v) {
        int si = 0;
        try {
            PreparedStatement ps = conexionop.getCnn().prepareStatement(insertarInstructor);
            ps.setString(1, v.getNombre1());
            ps.setString(2, v.getNombre2());
            ps.setString(3, v.getApellido1());
            ps.setString(4, v.getApellido2());
            ps.setString(5, v.getEmail());
            ps.setString(6, UtilsMM.encriptar(v.getPassword()));
            ps.setString(7, v.getDocumento());
            ps.setInt(8, v.getIdTDocumento());

            ps.setString(9, v.getDireccion());
            ps.setString(10, v.getTelefono());
            ps.setInt(11, v.getIdRol());
            ps.setInt(12, 5);
            ps.setInt(13, 2);

            si = ps.executeUpdate();
            if (si != 0) {
                return true;
            }

        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        } finally {
            conexionop.cerrarConexion();
        }
        return false;
    }

    public String buscarcorreo(String correo) {
        ResultSet si;
        String email = "";
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(buscarCorreo);
            p.setString(1, correo);
            si = p.executeQuery();
            if (si.next()) {
                email = si.getString(1);
            }
            return email;
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return email;
    }

    @Override
    public boolean delete(Object key) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean update(UsuarioVO v) {
        PreparedStatement ps;
        int si = 0;
        try {
            ps = conexionop.getCnn().prepareStatement(actualizarAprendiz);
            ps.setString(1, v.getNombre1());
            ps.setString(2, v.getNombre2());
            ps.setString(3, v.getApellido1());
            ps.setString(4, v.getApellido2());
            ps.setString(5, v.getDocumento());
            ps.setInt(6, v.getIdTDocumento());
            ps.setString(7, v.getDireccion());
            ps.setString(8, v.getTelefono());
            ps.setLong(9, v.getIdficha());
            ps.setInt(10, v.getIdEtapa());
            ps.setInt(11, v.getIdEspecialidad());
            ps.setInt(12, v.getIdUsuario());
            si = ps.executeUpdate();
            if (si != 0) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            conexionop.cerrarConexion();
        }

        return false;
    }
    
     public boolean updateI(UsuarioVO v) {
        PreparedStatement ps;
        int si = 0;
        try {
            ps = conexionop.getCnn().prepareStatement(actualizarInstructor);
            ps.setString(1, v.getNombre1());
            ps.setString(2, v.getNombre2());
            ps.setString(3, v.getApellido1());
            ps.setString(4, v.getApellido2());
            ps.setString(5, v.getDocumento());
            ps.setInt(6, v.getIdTDocumento());
            ps.setString(7, v.getDireccion());
            ps.setString(8, v.getTelefono());
          
            ps.setInt(9, v.getIdUsuario());
            si = ps.executeUpdate();
            if (si != 0) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            conexionop.cerrarConexion();
        }

        return false;
    }

    @Override
    public UsuarioVO read(Object key) {
//        try {
//            PreparedStatement ps;
//
//            ps = conexionop.getCnn().prepareStatement(buscar);
//        } catch (SQLException ex) {
//            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
        return null;
    }

    @Override
    public ArrayList<UsuarioVO> readAll() {
        ArrayList<UsuarioVO> u = new ArrayList();
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(TodosInstructores);
            ResultSet rs = p.executeQuery();
            while (rs.next()) {
                u.add(new UsuarioVO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), "", "", rs.getInt(9), "", rs.getString(11), rs.getInt(12), rs.getInt(13), rs.getInt(14), rs.getInt(15)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            conexionop.cerrarConexion();
        }
        return u;
    }

    public UsuarioVO login(String correo, String pass) {

        UsuarioVO u = null;

        PreparedStatement ps;
        ResultSet rs;
        try {
            ps = conexionop.getCnn().prepareStatement(buscar);
            ps.setString(1, correo);
            ps.setString(2, pass);
            rs = ps.executeQuery();
            while (rs.next()) {
                u = new UsuarioVO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), "", rs.getString(8), rs.getInt(9), rs.getString(10), rs.getString(11), rs.getInt(12), rs.getInt(13), rs.getInt(14), rs.getInt(15));
            }
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return u;
    }

    public ArrayList<UsuarioVO> buscarEmail(String correo, int id) {
        ArrayList<UsuarioVO> u = new ArrayList();
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(BuscarEmail);
            p.setString(1, correo);
            p.setInt(2, id);
            ResultSet r = p.executeQuery();
            while (r.next()) {
                u.add(new UsuarioVO(r.getInt(1), r.getString(2), r.getString(3), r.getString(4), r.getString(5), r.getString(6), "", "", 0, "", "", 0, 0, r.getInt(14), r.getInt(15)));
            }
            return u;
        } catch (SQLException ex) {
            Logger.getLogger(ProyectoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            conexionop.cerrarConexion();
        }
        return u;
    }

    public boolean ccambioDeRol(int idu, int idr) {
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(cambioRol);
            p.setInt(1, idr);
            p.setInt(2, idu);
            if (p.executeUpdate() != 0) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            conexionop.cerrarConexion();
        }
        return false;
    }

    public ArrayList<UsuarioVO> AllAprendices() {
        ArrayList<UsuarioVO> u = new ArrayList();
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(TodosAprendices);
            ResultSet rs = p.executeQuery();
            while (rs.next()) {
                u.add(new UsuarioVO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getInt(7), rs.getInt(8), rs.getString(9)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            conexionop.cerrarConexion();
        }
        return u;
    }
    
    public boolean contra (int id, String pass){
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(validarContra);
            p.setInt(1, id);
            p.setString(2, UtilsMM.encriptar(pass));
            if (p.executeQuery().next()) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            conexionop.cerrarConexion();
        }
        return false;
    }
    
    public boolean cambioDePass (int id, String contra){
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(cambiarContra);
            p.setString(1, UtilsMM.encriptar(contra));
            p.setInt(2, id);
            if (p.executeUpdate() != 0) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            conexionop.cerrarConexion();
        }
        return false;
    }
    
    
    public boolean cambiarpassword (String email, String pass){
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(cambiarPassword);
            p.setString(1, pass);
            p.setString(2, email);
            if (p.executeUpdate() != 0) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            conexionop.cerrarConexion();
        }
        return false;
    }
}
