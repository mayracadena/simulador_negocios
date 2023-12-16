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
public class UnidadMedidaVO {
    private int IdUnidadMedida;
    private String UMedida;

    public UnidadMedidaVO(int IdUnidadMedida, String UMedida) {
        this.IdUnidadMedida = IdUnidadMedida;
        this.UMedida = UMedida;
    }
    
    

    public int getIdUnidadMedida() {
        return IdUnidadMedida;
    }

    public void setIdUnidadMedida(int IdUnidadMedida) {
        this.IdUnidadMedida = IdUnidadMedida;
    }

    public String getUMedida() {
        return UMedida;
    }

    public void setUMedida(String UMedida) {
        this.UMedida = UMedida;
    }
    
    
}
