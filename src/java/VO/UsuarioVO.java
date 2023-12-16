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
public class UsuarioVO {
    
    private int IdUsuario;
    private String Nombre1;
    private String Nombre2;
    private String Apellido1;
    private String Apellido2;
    private String Email;
    private String Password;
    private String Documento;
    private int IdTDocumento;
   
    private String Direccion;
    private String Telefono;
    private int idRol;
    private int Idficha;
    
    private String Ficha;
    private String TDocumento;
    private int idEtapa;
    private int idEspecialidad;

    public UsuarioVO(int IdUsuario, String Nombre1, String Nombre2, String Apellido1, String Apellido2, String Email, String Password, String Documento, int IdTDocumento, String Direccion, String Telefono, int idRol, int Idficha, int idEtapa, int idEspecialidad) {
        this.IdUsuario = IdUsuario;
        this.Nombre1 = Nombre1;
        this.Nombre2 = Nombre2;
        this.Apellido1 = Apellido1;
        this.Apellido2 = Apellido2;
        this.Email = Email;
        this.Password = Password;
        this.Documento = Documento;
        this.IdTDocumento = IdTDocumento;
        this.Direccion = Direccion;
        this.Telefono = Telefono;
        this.idRol = idRol;
        this.Idficha = Idficha;
        this.idEtapa = idEtapa;
        this.idEspecialidad = idEspecialidad;
    }
    
   


    public UsuarioVO(int IdUsuario, String Nombre1, String Nombre2, String Apellido1, String Apellido2, String Email, String Password, String Documento, int IdTDocumento, String Direccion, String Telefono, int idRol, int Idficha, String Ficha, String TDocumento) {
        this.IdUsuario = IdUsuario;
        this.Nombre1 = Nombre1;
        this.Nombre2 = Nombre2;
        this.Apellido1 = Apellido1;
        this.Apellido2 = Apellido2;
        this.Email = Email;
        this.Password = Password;
        this.Documento = Documento;
        this.IdTDocumento = IdTDocumento;
        this.Direccion = Direccion;
        this.Telefono = Telefono;
        this.idRol = idRol;
        this.Idficha = Idficha;
        this.Ficha = Ficha;
        this.TDocumento = TDocumento;
    }

  

    public UsuarioVO(int IdUsuario, String Nombre1, String Nombre2, String Apellido1, String Apellido2, String Email, int idRol, int Idficha, String Ficha) {
        this.IdUsuario = IdUsuario;
        this.Nombre1 = Nombre1;
        this.Nombre2 = Nombre2;
        this.Apellido1 = Apellido1;
        this.Apellido2 = Apellido2;
        this.Email = Email;
        this.idRol = idRol;
        this.Idficha = Idficha;
        this.Ficha = Ficha;
    
    }
    
    

    public int getIdUsuario() {
        return IdUsuario;
    }

    public void setIdUsuario(int IdUsuario) {
        this.IdUsuario = IdUsuario;
    }

    public String getNombre1() {
        return Nombre1;
    }

    public void setNombre1(String Nombre1) {
        this.Nombre1 = Nombre1;
    }

    public String getNombre2() {
        return Nombre2;
    }

    public void setNombre2(String Nombre2) {
        this.Nombre2 = Nombre2;
    }

    public String getApellido1() {
        return Apellido1;
    }

    public void setApellido1(String Apellido1) {
        this.Apellido1 = Apellido1;
    }

    public String getApellido2() {
        return Apellido2;
    }

    public void setApellido2(String Apellido2) {
        this.Apellido2 = Apellido2;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

    public String getDocumento() {
        return Documento;
    }

    public void setDocumento(String Documento) {
        this.Documento = Documento;
    }

    public int getIdTDocumento() {
        return IdTDocumento;
    }

    public void setIdTDocumento(int IdTDocumento) {
        this.IdTDocumento = IdTDocumento;
    }

    public String getDireccion() {
        return Direccion;
    }

    public void setDireccion(String Direccion) {
        this.Direccion = Direccion;
    }

    public String getTelefono() {
        return Telefono;
    }

    public void setTelefono(String Telefono) {
        this.Telefono = Telefono;
    }

    public int getIdRol() {
        return idRol;
    }

    public void setIdRol(int idRol) {
        this.idRol = idRol;
    }

    public int getIdficha() {
        return Idficha;
    }

    public void setIdficha(int Idficha) {
        this.Idficha = Idficha;
    }

    public String getFicha() {
        return Ficha;
    }

    public void setFicha(String Ficha) {
        this.Ficha = Ficha;
    }

    public String getTDocumento() {
        return TDocumento;
    }

    public void setTDocumento(String TDocumento) {
        this.TDocumento = TDocumento;
    }

    public int getIdEtapa() {
        return idEtapa;
    }

    public void setIdEtapa(int idEtapa) {
        this.idEtapa = idEtapa;
    }

    public int getIdEspecialidad() {
        return idEspecialidad;
    }

    public void setIdEspecialidad(int idEspecialidad) {
        this.idEspecialidad = idEspecialidad;
    }

    
    
}

