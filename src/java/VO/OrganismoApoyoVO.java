/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package VO;

/**
 *
 * @author mayracadena
 */
public class OrganismoApoyoVO {
    private int IdOrganismoApoyo;
    private String Entidad;
    private String Definicion;
    private String Implementacion;
    private String Operacion;
    private int IdProyecto;

    public OrganismoApoyoVO(int IdOrganismoApoyo, String Entidad, String Definicion, String Implementacion, String Operacion, int IdProyecto) {
        this.IdOrganismoApoyo = IdOrganismoApoyo;
        this.Entidad = Entidad;
        this.Definicion = Definicion;
        this.Implementacion = Implementacion;
        this.Operacion = Operacion;
        this.IdProyecto = IdProyecto;
    }

    public int getIdOrganismoApoyo() {
        return IdOrganismoApoyo;
    }

    public void setIdOrganismoApoyo(int IdOrganismoApoyo) {
        this.IdOrganismoApoyo = IdOrganismoApoyo;
    }

    public String getEntidad() {
        return Entidad;
    }

    public void setEntidad(String Entidad) {
        this.Entidad = Entidad;
    }

    public String getDefinicion() {
        return Definicion;
    }

    public void setDefinicion(String Definicion) {
        this.Definicion = Definicion;
    }

    public String getImplementacion() {
        return Implementacion;
    }

    public void setImplementacion(String Implementacion) {
        this.Implementacion = Implementacion;
    }

    public String getOperacion() {
        return Operacion;
    }

    public void setOperacion(String Operacion) {
        this.Operacion = Operacion;
    }

    public int getIdProyecto() {
        return IdProyecto;
    }

    public void setIdProyecto(int IdProyecto) {
        this.IdProyecto = IdProyecto;
    }
    
    
}
