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
public class ProyectoVO {
    
    private int IdProyecto;
    private String nombreP;
    private int creador;
    private String Descripcion;
    private String OGeneral;
    private String OEspecificos;
    private String Justificacion;
    private String Problema;
    private String Historia;
    private String Avances;
    private int MesesImproductivos;
    private String RazonSocial;
    private int IdTipoSociedad;
    private int IdEtapa;
    private int IdEspecialidad;

   

    public ProyectoVO(int IdProyecto, String nombreP, int creador, String Descripcion, String OGeneral, String OEspecificos, String Justificacion, String Problema, String Historia, String Avances, int MesesImproductivos, String RazonSocial, int IdTipoSociedad) {
        this.IdProyecto = IdProyecto;
        this.nombreP = nombreP;
        this.creador = creador;
        this.Descripcion = Descripcion;
        this.OGeneral = OGeneral;
        this.OEspecificos = OEspecificos;
        this.Justificacion = Justificacion;
        this.Problema = Problema;
        this.Historia = Historia;
        this.Avances = Avances;
        this.MesesImproductivos = MesesImproductivos;
        this.RazonSocial = RazonSocial;
        this.IdTipoSociedad = IdTipoSociedad;
    }

    public ProyectoVO(int IdProyecto, String nombreP, int creador, String Descripcion, String OGeneral, String OEspecificos, String Justificacion, String Problema, String Historia, String Avances, int MesesImproductivos, String RazonSocial, int IdTipoSociedad, int IdEtapa, int IdEspecialidad) {
        this.IdProyecto = IdProyecto;
        this.nombreP = nombreP;
        this.creador = creador;
        this.Descripcion = Descripcion;
        this.OGeneral = OGeneral;
        this.OEspecificos = OEspecificos;
        this.Justificacion = Justificacion;
        this.Problema = Problema;
        this.Historia = Historia;
        this.Avances = Avances;
        this.MesesImproductivos = MesesImproductivos;
        this.RazonSocial = RazonSocial;
        this.IdTipoSociedad = IdTipoSociedad;
        this.IdEtapa = IdEtapa;
        this.IdEspecialidad = IdEspecialidad;
    }
    
    

    public int getCreador() {
        return creador;
    }

    public void setCreador(int creador) {
        this.creador = creador;
    }

    
    /**
     * @return the IdProyecto
     */
    public int getIdProyecto() {
        return IdProyecto;
    }

    /**
     * @param IdProyecto the IdProyecto to set
     */
    public void setIdProyecto(int IdProyecto) {
        this.IdProyecto = IdProyecto;
    }

    /**
     * @return the nombreP
     */
    public String getNombreP() {
        return nombreP;
    }

    /**
     * @param nombreP the nombreP to set
     */
    public void setNombreP(String nombreP) {
        this.nombreP = nombreP;
    }

    /**
     * @return the Descripcion
     */
    public String getDescripcion() {
        return Descripcion;
    }

    /**
     * @param Descripcion the Descripcion to set
     */
    public void setDescripcion(String Descripcion) {
        this.Descripcion = Descripcion;
    }

    /**
     * @return the OGeneral
     */
    public String getOGeneral() {
        return OGeneral;
    }

    /**
     * @param OGeneral the OGeneral to set
     */
    public void setOGeneral(String OGeneral) {
        this.OGeneral = OGeneral;
    }

    /**
     * @return the OEspecificos
     */
    public String getOEspecificos() {
        return OEspecificos;
    }

    /**
     * @param OEspecificos the OEspecificos to set
     */
    public void setOEspecificos(String OEspecificos) {
        this.OEspecificos = OEspecificos;
    }

    /**
     * @return the Justificacion
     */
    public String getJustificacion() {
        return Justificacion;
    }

    /**
     * @param Justificacion the Justificacion to set
     */
    public void setJustificacion(String Justificacion) {
        this.Justificacion = Justificacion;
    }

    /**
     * @return the Problema
     */
    public String getProblema() {
        return Problema;
    }

    /**
     * @param Problema the Problema to set
     */
    public void setProblema(String Problema) {
        this.Problema = Problema;
    }

    /**
     * @return the Historia
     */
    public String getHistoria() {
        return Historia;
    }

    /**
     * @param Historia the Historia to set
     */
    public void setHistoria(String Historia) {
        this.Historia = Historia;
    }

    /**
     * @return the Avances
     */
    public String getAvances() {
        return Avances;
    }

    /**
     * @param Avances the Avances to set
     */
    public void setAvances(String Avances) {
        this.Avances = Avances;
    }

    /**
     * @return the MesesImproductivos
     */
    public int getMesesImproductivos() {
        return MesesImproductivos;
    }

    /**
     * @param MesesImproductivos the MesesImproductivos to set
     */
    public void setMesesImproductivos(int MesesImproductivos) {
        this.MesesImproductivos = MesesImproductivos;
    }

    /**
     * @return the RazonSocial
     */
    public String getRazonSocial() {
        return RazonSocial;
    }

    /**
     * @param RazonSocial the RazonSocial to set
     */
    public void setRazonSocial(String RazonSocial) {
        this.RazonSocial = RazonSocial;
    }

    /**
     * @return the IdTipoSociedad
     */
    public int getIdTipoSociedad() {
        return IdTipoSociedad;
    }

    /**
     * @param IdTipoSociedad the IdTipoSociedad to set
     */
    public void setIdTipoSociedad(int IdTipoSociedad) {
        this.IdTipoSociedad = IdTipoSociedad;
    }

    public int getIdEtapa() {
        return IdEtapa;
    }

    public void setIdEtapa(int IdEtapa) {
        this.IdEtapa = IdEtapa;
    }

    public int getIdEspecialidad() {
        return IdEspecialidad;
    }

    public void setIdEspecialidad(int IdEspecialidad) {
        this.IdEspecialidad = IdEspecialidad;
    }
    
    
}
