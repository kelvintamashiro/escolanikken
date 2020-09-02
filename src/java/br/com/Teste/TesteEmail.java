/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.Teste;

import br.com.abre.Util.IDRUtil;
import java.net.PasswordAuthentication;
import java.util.Properties;
import javax.mail.Address;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author macuser
 */
public class TesteEmail {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Properties props = new Properties();
        props.put("mail.smtp.host", "mail.escolanikken.com");
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "465");
        props.put("mail.imap.partialfetch", "false");

        Session session = Session.getDefaultInstance(props,
                new javax.mail.Authenticator() {
            protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
                return new javax.mail.PasswordAuthentication("comunicado@escolanikken.com", "nikken20");
            }
        });

        /**
         * Ativa Debug para sessão
         */
//        session.setDebug(true);

        try {
            
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("comunicado@escolanikken.com")); //Remetente
            message.setContent("mensagem de teste", "text/html;charset=UTF-8");
            

            //Destinatário(s)
            Address[] toUser = InternetAddress.parse("kelvin@mitsistemas.com.br");

            message.setRecipients(Message.RecipientType.TO, toUser);
            message.setSubject("Enviando email com JavaMail");
            /**
             * Método para enviar a mensagem criada
             */
            javax.mail.Transport.send(message);

            System.out.println("Feito!!!");

        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }

}
