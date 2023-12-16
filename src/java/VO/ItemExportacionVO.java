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
public class ItemExportacionVO {
    private int IdItemExportacion;
    private String Item;
    private int IdConceptoExportacion;

    public ItemExportacionVO(int IdItemExportacion, String Item, int IdConceptoExportacion) {
        this.IdItemExportacion = IdItemExportacion;
        this.Item = Item;
        this.IdConceptoExportacion = IdConceptoExportacion;
    }

    public int getIdItemExportacion() {
        return IdItemExportacion;
    }

    public void setIdItemExportacion(int IdItemExportacion) {
        this.IdItemExportacion = IdItemExportacion;
    }

    public String getItem() {
        return Item;
    }

    public void setItem(String Item) {
        this.Item = Item;
    }

    public int getIdConceptoExportacion() {
        return IdConceptoExportacion;
    }

    public void setIdConceptoExportacion(int IdConceptoExportacion) {
        this.IdConceptoExportacion = IdConceptoExportacion;
    }
    
    
}
