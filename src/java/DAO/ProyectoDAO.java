/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Conexion.Conexion;
import Interfaces.Obligacion;
import VO.ComentarioVO;
import VO.ProyectoVO;
import VO.UsuarioVO;
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
public class ProyectoDAO implements Obligacion<ProyectoVO> {

    public static final Conexion conexionop = Conexion.saberEstado();
    private static final String crear = "insert into proyecto ( `nombreP`, `IdCreador`, `Descripcion`, `OGeneral`, `OEspecifico`, `Justificacion`, `Problema`, `Historia`, `Avances`, `MesesImproductivos`, `RazonSocial`, IdEtapa, IdEspecialidad) values (?,?,?,?,?,?,?,?,?,?,?,?,?)";
    private static final String consulta = "SELECT IdProyecto FROM proyectousuario WHERE IdUsuario = ? ";
    private static final String subconsulta = "SELECT IdProyecto,`nombreP`,`IdCreador`,`Descripcion`,`OGeneral`,`OEspecifico`,`Justificacion`,`Problema`,`Historia`,`Avances`,`MesesImproductivos`,`RazonSocial`,`IdTipoSociedad`, IdEtapa, IdEspecialidad FROM proyecto WHERE IdProyecto = ?";
    private static final String p_uc = "SELECT MAX(IdProyecto) AS 'id' FROM proyecto";
    private static final String p_u = "insert into proyectousuario (IdProyecto, IdUsuario) values (?,?)";
    private static final String actualizar = "update proyecto set Descripcion = ?, OGeneral = ?, OEspecifico = ?, Justificacion = ?, Problema=?, Historia=?, Avances=?, MesesImproductivos =?, RazonSocial = ?,IdTipoSociedad =? where IdProyecto = ?";
    private static final String agregar = "INSERT INTO `proyectousuario`(`IdProyecto`, `IdUsuario`) VALUES (?, ?) ";
    private static final String Lider = "select usuario.IdUsuario,usuario.Nombre1,usuario.Nombre2,  usuario.Apellido1, usuario.Apellido2 from usuario inner join proyecto on usuario.IdUsuario = proyecto.IdCreador where proyecto.IdProyecto = ?";
    private static final String integrantes = "SELECT usuario.nombre1 , usuario.apellido1, usuario.email, usuario.IdUsuario, usuario.IdRol FROM proyecto INNER join proyectousuario on proyecto.IdProyecto = proyectousuario.IdProyecto inner join usuario on usuario.IdUsuario = proyectousuario.IdUsuario where proyecto.IdProyecto = ?";
    private static final String borrar2 = "DELETE FROM `proyectousuario` WHERE `IdProyecto` = ? ";
    private static final String borrar = "DELETE FROM `proyectousuario` WHERE `IdProyecto` = ? and IdUsuario = ?";
    private static final String borrarProyecto = "delete from proyecto where proyecto.IdProyecto = ? ";
    private static final String cambio = "select IdProyecto, nombreP from proyecto where IdProyecto = ?";
    private static final String cambio2 = "update proyecto set nombreP = ? where IdProyecto = ?";
    private static final String allProyectos = "SELECT proyecto.IdProyecto,`nombreP`, `IdCreador`, `FechaCreacion`, `Descripcion`, usuario.nombre1, usuario.nombre2, usuario.apellido1, usuario.apellido2, usuario.email FROM `proyecto` inner join usuario on proyecto.IdCreador = usuario.IdUsuario";

    public boolean creacion(String nombre, int idu, int especialidad, int etapa) {
        int si = 0, sip = 0, id = 0;
        ResultSet r;
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(crear);
            p.setString(1, nombre);
            p.setInt(2, idu);
            p.setString(3, "");
            p.setString(4, "");
            p.setString(5, "");
            p.setString(6, "");
            p.setString(7, "");
            p.setString(8, "");
            p.setString(9, "");
            p.setInt(10, 0);
            p.setString(11, "");
            p.setInt(12, etapa);
            p.setInt(13, especialidad);
            si = p.executeUpdate();

            if (si != 0) {
                PreparedStatement ps = conexionop.getCnn().prepareStatement(p_uc);
                r = ps.executeQuery();
                while (r.next()) {
                    id = r.getInt("id");
                }
                PreparedStatement pst = conexionop.getCnn().prepareStatement(p_u);
                pst.setInt(1, id);
                pst.setInt(2, idu);
                sip = pst.executeUpdate();
                if (sip != 0) {
                // estos de aqui son variables que se llenaran por defecto
                // para evitar errores posibles dentro de la pagina web 
                InfInsumoDAO inf = new InfInsumoDAO();
                inf.prellenado(id);
                
                TemporalDAO temp = new TemporalDAO();
                temp.crear(id);
                
                ComentarioDAO coment = new ComentarioDAO();
                ComentarioVO  comentVO= new ComentarioVO(0, "", id);
                coment.create(comentVO);
                
                    return true;
                }

            }
        } catch (SQLException ex) {
            Logger.getLogger(ProyectoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            conexionop.cerrarConexion();
        }
        return false;
    }

    
    
    
    
    @Override
    public boolean create(ProyectoVO v) {
        int si = 0;
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(actualizar);
            p.setString(1, v.getDescripcion());
            p.setString(2, v.getOGeneral());
            p.setString(3, v.getOEspecificos());
            p.setString(4, v.getJustificacion());
            p.setString(5, v.getProblema());
            p.setString(6, v.getHistoria());
            p.setString(7, v.getAvances());
            p.setInt(8, v.getMesesImproductivos());
            p.setString(9, v.getRazonSocial());
            p.setInt(10, v.getIdTipoSociedad());
            p.setInt(11, v.getIdProyecto());
            si = p.executeUpdate();
            if (si != 0) {
                return true;
            }

        } catch (SQLException ex) {
            Logger.getLogger(ProyectoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            conexionop.cerrarConexion();
        }
        return false;
    }

    @Override
    public boolean delete(Object key) {
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(borrarProyecto);
            p.setInt(1, Integer.parseInt(key.toString()));
            PreparedStatement P = conexionop.getCnn().prepareStatement(borrar2);
            P.setInt(1, Integer.parseInt(key.toString()));
            if (P.executeUpdate() != 0 && p.executeUpdate() != 0) {
                return true;
            }
          
        } catch (SQLException ex) {
            Logger.getLogger(ProyectoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            conexionop.cerrarConexion();
        }
        return false;
    }

    @Override
    public boolean update(ProyectoVO v) {
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(cambio2);
            p.setString(1, v.getNombreP());
            p.setInt(2, v.getIdProyecto());
            if (p.executeUpdate() != 0) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProyectoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            conexionop.cerrarConexion();
        }
        return false;
    }

    @Override
    public ProyectoVO read(Object key) {
        int id = Integer.parseInt(key.toString());
        ResultSet rs;
        ProyectoVO pv = null;
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(subconsulta);
            p.setInt(1, id);
            rs = p.executeQuery();
            while (rs.next()) {
                pv = new ProyectoVO(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getInt(11), rs.getString(12), rs.getInt(13), rs.getInt(14), rs.getInt(15));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProyectoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            conexionop.cerrarConexion();
        }
        return pv;
    }

    public ProyectoVO cambiar(int id) {
        ProyectoVO a = null;
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(cambio);
            p.setInt(1, id);
            ResultSet r = p.executeQuery();
            while (r.next()) {
                a = new ProyectoVO(r.getInt("IdProyecto"), r.getString("nombreP"), 0, "", "", "", "", "", "", "", 0, "", 0);
            }
            return a;
        } catch (SQLException ex) {
            Logger.getLogger(ProyectoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            conexionop.cerrarConexion();
        }
        return a;
    }

    public ArrayList<ProyectoVO> readAlls(int idU) {

        ResultSet r, rs;
        ArrayList<ProyectoVO> pr = new ArrayList();
        int idp;
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(consulta);
            p.setInt(1, idU);
            r = p.executeQuery();
            while (r.next()) {
                idp = r.getInt("IdProyecto");

                PreparedStatement ps = conexionop.getCnn().prepareStatement(subconsulta);
                ps.setInt(1, idp);
                rs = ps.executeQuery();
                while (rs.next()) {

                    pr.add(new ProyectoVO(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getInt(11), rs.getString(12), rs.getInt(13), rs.getInt(14), rs.getInt(15)));
                }
            }
            return pr;

        } catch (SQLException ex) {
            Logger.getLogger(ProyectoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            conexionop.cerrarConexion();
        }
        return pr;
    }

    @Override
    public ArrayList<ProyectoVO> readAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public UsuarioVO lider(int id) {
        UsuarioVO u = null;
        String nombre = null, apellido = null, nombre2 = null, apellido2 = null;
        int idu = 0;
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(Lider);
            p.setInt(1, id);
            ResultSet r = p.executeQuery();
            while (r.next()) {
                nombre = r.getString("Nombre1");
                nombre2 = r.getString("Nombre2");
                apellido = r.getString("Apellido1");
                apellido2 = r.getString("Apellido2");
                idu = r.getInt("IdUsuario");
            }
            u = new UsuarioVO(idu, nombre, nombre2, apellido, apellido2, "", "", "", 0, "", "", 0, 0,0,0);
            return u;
        } catch (SQLException ex) {
            Logger.getLogger(ProyectoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            conexionop.cerrarConexion();
        }
        return null;
    }

    public ArrayList<UsuarioVO> integrante(int id) {
        ArrayList<UsuarioVO> u = new ArrayList();
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(integrantes);
            p.setInt(1, id);
            ResultSet r = p.executeQuery();
            while (r.next()) {
                u.add(new UsuarioVO(r.getInt("IdUsuario"), r.getString("nombre1"), "", r.getString("apellido1"), "", r.getString("email"), "", "", 0, "", "", r.getInt("idRol"),0,0,0)); 
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProyectoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            conexionop.cerrarConexion();
        }

        return u;
    }

    public boolean agregar(int id, int idp) {
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(agregar);
            p.setInt(1, idp);
            p.setInt(2, id);
            if (p.executeUpdate() != 0) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProyectoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            conexionop.cerrarConexion();
        }
        return false;
    }

    public boolean borrar(int id, int idp) {
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(borrar);
            p.setInt(1, idp);
            p.setInt(2, id);
            if (p.executeUpdate() != 0) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProyectoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            conexionop.cerrarConexion();
        }
        return false;
    }
    
    public ResultSet detallesProyecto (){
        ResultSet r = null;
        try {
            PreparedStatement p = conexionop.getCnn().prepareStatement(allProyectos);
            r = p.executeQuery();
            return r;
        } catch (SQLException ex) {
            Logger.getLogger(ProyectoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            conexionop.cerrarConexion();
        }
        return r;
    }

}
