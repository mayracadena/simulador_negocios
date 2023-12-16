/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author mayrayesenia
 */
public class Email {
     public boolean enviarCorreo( String para, String mensaje, String asunto){
        boolean enviado = false;
        String de = "demostrar.simproyect@gmail.com";
        String clave = "dipedgyquxmzxppj";
        
        
        try {
            
            String host  = "smtp.gmail.com";
            Properties prop = System.getProperties();
            prop.put("mail.smtp.starttls.enable","true");
            prop.put("mail.smtp.host",host);
            prop.put("mail.smtp.user",de);
            prop.put("mail.smtp.password",clave);
            prop.put("mail.smtp.port","587");
            prop.put("mail.smtp.auth","true");
            
            
            Session sesion = Session.getDefaultInstance(prop, null);
            
            MimeMessage messaje = new MimeMessage(sesion);
            
            messaje.setFrom(new InternetAddress(de));
            
            messaje.setRecipient(Message.RecipientType.TO, new InternetAddress(para));
            messaje.setSubject(asunto);
            messaje.setText(mensaje);
            
            Transport transport = sesion.getTransport("smtp");
            transport.connect(host, de, clave);
            transport.sendMessage(messaje, messaje.getAllRecipients());
            transport.close();
            
            enviado = true;
            
        } catch (Exception e) {
            System.out.println("Error al enviar el correito " +e );
        }
        
        return enviado;
    }

}
