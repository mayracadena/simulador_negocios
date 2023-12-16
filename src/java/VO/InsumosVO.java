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
public class InsumosVO {
    private int IdInsumo;
    private String TipoInsumo;

    public InsumosVO(int IdInsumo, String TipoInsumo) {
        this.IdInsumo = IdInsumo;
        this.TipoInsumo = TipoInsumo;
    }

    public int getIdInsumo() {
        return IdInsumo;
    }

    public void setIdInsumo(int IdInsumo) {
        this.IdInsumo = IdInsumo;
    }

    public String getTipoInsumo() {
        return TipoInsumo;
    }

    public void setTipoInsumo(String TipoInsumo) {
        this.TipoInsumo = TipoInsumo;
    }
    
}
