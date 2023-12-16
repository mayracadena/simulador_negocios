/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package VO;

/**
 *
 * @author mayrayesenia
 */
public class ActividadesVO {
    private int IdActividad;
    private String Actividad;
    private String Tiempo;
    private String Cargos;
    private String N_cargos;
    private String Equipos;
    private int IdProducto;

    public ActividadesVO(int IdActividad, String Actividad, String Tiempo, String Cargos, String N_cargos, String Equipos, int IdProducto) {
        this.IdActividad = IdActividad;
        this.Actividad = Actividad;
        this.Tiempo = Tiempo;
        this.Cargos = Cargos;
        this.N_cargos = N_cargos;
        this.Equipos = Equipos;
        this.IdProducto = IdProducto;
    }
    
    

    public int getIdActividad() {
        return IdActividad;
    }

    public void setIdActividad(int IdActividad) {
        this.IdActividad = IdActividad;
    }

    public String getActividad() {
        return Actividad;
    }

    public void setActividad(String Actividad) {
        this.Actividad = Actividad;
    }

    public String getTiempo() {
        return Tiempo;
    }

    public void setTiempo(String Tiempo) {
        this.Tiempo = Tiempo;
    }

    public String getCargos() {
        return Cargos;
    }

    public void setCargos(String Cargos) {
        this.Cargos = Cargos;
    }

    public String getN_cargos() {
        return N_cargos;
    }

    public void setN_cargos(String N_cargos) {
        this.N_cargos = N_cargos;
    }

    public String getEquipos() {
        return Equipos;
    }

    public void setEquipos(String Equipos) {
        this.Equipos = Equipos;
    }

    public int getIdProducto() {
        return IdProducto;
    }

    public void setIdProducto(int IdProducto) {
        this.IdProducto = IdProducto;
    }
    
    
    
    
    
}
