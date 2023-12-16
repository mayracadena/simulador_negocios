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
public class EDistribuicionVO {
    private int IdDistribuicion;
    private String Penetracion;
    private String Comercializacion;
    private String DistribuicionNI;
    private String Tactica;
    private String Canal;
    private int IdProyecto;

    public EDistribuicionVO(int IdDistribuicion, String Penetracion, String Comercializacion, String DistribuicionNI, String Tactica, String Canal, int IdProyecto) {
        this.IdDistribuicion = IdDistribuicion;
        this.Penetracion = Penetracion;
        this.Comercializacion = Comercializacion;
        this.DistribuicionNI = DistribuicionNI;
        this.Tactica = Tactica;
        this.Canal = Canal;
        this.IdProyecto = IdProyecto;
    }

    public int getIdDistribuicion() {
        return IdDistribuicion;
    }

    public void setIdDistribuicion(int IdDistribuicion) {
        this.IdDistribuicion = IdDistribuicion;
    }

    public String getPenetracion() {
        return Penetracion;
    }

    public void setPenetracion(String Penetracion) {
        this.Penetracion = Penetracion;
    }

    public String getComercializacion() {
        return Comercializacion;
    }

    public void setComercializacion(String Comercializacion) {
        this.Comercializacion = Comercializacion;
    }

    public String getDistribuicionNI() {
        return DistribuicionNI;
    }

    public void setDistribuicionNI(String DistribuicionNI) {
        this.DistribuicionNI = DistribuicionNI;
    }

    public String getTactica() {
        return Tactica;
    }

    public void setTactica(String Tactica) {
        this.Tactica = Tactica;
    }

    public String getCanal() {
        return Canal;
    }

    public void setCanal(String Canal) {
        this.Canal = Canal;
    }

    public int getIdProyecto() {
        return IdProyecto;
    }

    public void setIdProyecto(int IdProyecto) {
        this.IdProyecto = IdProyecto;
    }
    
    
}
