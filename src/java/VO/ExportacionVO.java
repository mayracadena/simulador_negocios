/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package VO;

/**
 *
 * @author mayrayesenia
 * objeto Exportación
 */
public class ExportacionVO {
    private int IdExportacion;
    private double CostoUnitario;
    private double CostoTotal;
    private float dias;
    private int IdItemExportador;
    private int IdTipoEnvio;
    private int IdProducto;

    public ExportacionVO(int IdExportacion,  double CostoTotal, float dias, int IdItemExportador, int IdTipoEnvio, int IdProducto) {
        this.IdExportacion = IdExportacion;
      
        this.CostoTotal = CostoTotal;
        this.dias = dias;
        this.IdItemExportador = IdItemExportador;
        this.IdTipoEnvio = IdTipoEnvio;
        this.IdProducto = IdProducto;
    }

    public int getIdExportacion() {
        return IdExportacion;
    }

    public void setIdExportacion(int IdExportacion) {
        this.IdExportacion = IdExportacion;
    }

    public double getCostoUnitario() {
        return CostoUnitario;
    }

    public void setCostoUnitario(double CostoUnitario) {
        this.CostoUnitario = CostoUnitario;
    }

    public double getCostoTotal() {
        return CostoTotal;
    }

    public void setCostoTotal(double CostoTotal) {
        this.CostoTotal = CostoTotal;
    }

    public float getDias() {
        return dias;
    }

    public void setDias(float dias) {
        this.dias = dias;
    }

    public int getIdItemExportador() {
        return IdItemExportador;
    }

    public void setIdItemExportador(int IdItemExportador) {
        this.IdItemExportador = IdItemExportador;
    }

    public int getIdTipoEnvio() {
        return IdTipoEnvio;
    }

    public void setIdTipoEnvio(int IdTipoEnvio) {
        this.IdTipoEnvio = IdTipoEnvio;
    }

    public int getIdProducto() {
        return IdProducto;
    }

    public void setIdProducto(int IdProducto) {
        this.IdProducto = IdProducto;
    }
    
    
}
