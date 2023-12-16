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
public class FichaVO {
    
    
    private int IdFicha;
    private long Ficha;

    public FichaVO(int IdFicha, long Ficha) {
        this.IdFicha = IdFicha;
        this.Ficha = Ficha;
    }
    
    
    

    public int getIdFicha() {
        return IdFicha;
    }

    public void setIdFicha(int IdFicha) {
        this.IdFicha = IdFicha;
    }

    public long getFicha() {
        return Ficha;
    }

    public void setFicha(long Ficha) {
        this.Ficha = Ficha;
    }
    
    
    
}
