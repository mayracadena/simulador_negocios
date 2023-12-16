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
public class OrganizacionVO {
    private int IdOrganizacion;
    private String Nor_empresarial;
    private String Nor_tributaria;
    private String Nor_tecnica;
    private String Nor_laboral;
    private String Nor_ambiental;
    private String Registro_marca;
    private int IdProyecto;

    public OrganizacionVO(int IdOrganizacion, String Nor_empresarial, String Nor_tributaria, String Nor_tecnica, String Nor_laboral, String Nor_ambiental, String Registro_marca, int IdProyecto) {
        this.IdOrganizacion = IdOrganizacion;
        this.Nor_empresarial = Nor_empresarial;
        this.Nor_tributaria = Nor_tributaria;
        this.Nor_tecnica = Nor_tecnica;
        this.Nor_laboral = Nor_laboral;
        this.Nor_ambiental = Nor_ambiental;
        this.Registro_marca = Registro_marca;
        this.IdProyecto = IdProyecto;
    }
    
    

    public int getIdOrganizacion() {
        return IdOrganizacion;
    }

    public void setIdOrganizacion(int IdOrganizacion) {
        this.IdOrganizacion = IdOrganizacion;
    }

    public String getNor_empresarial() {
        return Nor_empresarial;
    }

    public void setNor_empresarial(String Nor_empresarial) {
        this.Nor_empresarial = Nor_empresarial;
    }

    public String getNor_tributaria() {
        return Nor_tributaria;
    }

    public void setNor_tributaria(String Nor_tributaria) {
        this.Nor_tributaria = Nor_tributaria;
    }

    public String getNor_tecnica() {
        return Nor_tecnica;
    }

    public void setNor_tecnica(String Nor_tecnica) {
        this.Nor_tecnica = Nor_tecnica;
    }

    public String getNor_laboral() {
        return Nor_laboral;
    }

    public void setNor_laboral(String Nor_laboral) {
        this.Nor_laboral = Nor_laboral;
    }

    public String getNor_ambiental() {
        return Nor_ambiental;
    }

    public void setNor_ambiental(String Nor_ambiental) {
        this.Nor_ambiental = Nor_ambiental;
    }

    public String getRegistro_marca() {
        return Registro_marca;
    }

    public void setRegistro_marca(String Registro_marca) {
        this.Registro_marca = Registro_marca;
    }

    public int getIdProyecto() {
        return IdProyecto;
    }

    public void setIdProyecto(int IdProyecto) {
        this.IdProyecto = IdProyecto;
    }
    
    
    
    
}
