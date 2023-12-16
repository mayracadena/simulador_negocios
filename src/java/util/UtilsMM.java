/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author sena
 */
public class UtilsMM {

    
    public static String encriptar(String clear)  {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] b = md.digest(clear.getBytes());
            int size = b.length;
            StringBuffer h = new StringBuffer(size);
            //algoritmo y arreglo md5
            for (int i = 0; i < size; i++) {
                int u = b[i] & 255;
                if (u < 16) {
                    h.append("0" + Integer.toHexString(u));
                }
                else {
                    h.append(Integer.toHexString(u));
                }
            }
            //clave encriptada
            return h.toString();
        } catch (NoSuchAlgorithmException ex) {
            ex.printStackTrace();
            return "";
        }
    }
    
    
    public static void main(String[] args) {
        System.out.println(UtilsMM.encriptar("123"));
    }
    
    
}
