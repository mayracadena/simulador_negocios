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
public class ComentarioVO {
    private int IdComentario;
    private String Comentario;
    private int IdProyecto;

    public ComentarioVO(int IdComentario, String Comentario, int IdProyecto) {
        this.IdComentario = IdComentario;
        this.Comentario = Comentario;
        this.IdProyecto = IdProyecto;
    }

    public int getIdComentario() {
        return IdComentario;
    }

    public void setIdComentario(int IdComentario) {
        this.IdComentario = IdComentario;
    }

    public String getComentario() {
        return Comentario;
    }

    public void setComentario(String Comentario) {
        this.Comentario = Comentario;
    }

    public int getIdProyecto() {
        return IdProyecto;
    }

    public void setIdProyecto(int IdProyecto) {
        this.IdProyecto = IdProyecto;
    }
    
    
}
