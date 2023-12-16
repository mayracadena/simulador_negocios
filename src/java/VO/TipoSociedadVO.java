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
public class TipoSociedadVO {
    private int IdTipoSociedad;
    private String TSociedad;

    public TipoSociedadVO(int IdTipoSociedad, String TSociedad) {
        this.IdTipoSociedad = IdTipoSociedad;
        this.TSociedad = TSociedad;
    }
    
    

    public int getIdTipoSociedad() {
        return IdTipoSociedad;
    }

    public void setIdTipoSociedad(int IdTipoSociedad) {
        this.IdTipoSociedad = IdTipoSociedad;
    }

    public String getTSociedad() {
        return TSociedad;
    }

    public void setTSociedad(String TSociedad) {
        this.TSociedad = TSociedad;
    }

 
    
}
