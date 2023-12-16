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
public class CompetenciaVO {
    private int IdCompetencia;
    private String Nombre;
    private String analisis;
    private String ImagenEmpresa;
    private String FrenteCompetencia;
    private int IdProducto;

    public CompetenciaVO(int IdCompetencia, String Nombre, String analisis, String ImagenEmpresa, String FrenteCompetencia, int IdProducto) {
        this.IdCompetencia = IdCompetencia;
        this.Nombre = Nombre;
        this.analisis = analisis;
        this.ImagenEmpresa = ImagenEmpresa;
        this.FrenteCompetencia = FrenteCompetencia;
        this.IdProducto = IdProducto;
    }

    public int getIdCompetencia() {
        return IdCompetencia;
    }

    public void setIdCompetencia(int IdCompetencia) {
        this.IdCompetencia = IdCompetencia;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public String getAnalisis() {
        return analisis;
    }

    public void setAnalisis(String analisis) {
        this.analisis = analisis;
    }

    public String getImagenEmpresa() {
        return ImagenEmpresa;
    }

    public void setImagenEmpresa(String ImagenEmpresa) {
        this.ImagenEmpresa = ImagenEmpresa;
    }

    public String getFrenteCompetencia() {
        return FrenteCompetencia;
    }

    public void setFrenteCompetencia(String FrenteCompetencia) {
        this.FrenteCompetencia = FrenteCompetencia;
    }

    public int getIdProducto() {
        return IdProducto;
    }

    public void setIdProducto(int IdProducto) {
        this.IdProducto = IdProducto;
    }
    
    
}
