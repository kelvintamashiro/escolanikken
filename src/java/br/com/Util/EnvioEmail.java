/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.Util;

import java.util.Properties;
import javax.mail.Address;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author macuser
 */
public class EnvioEmail {

    public void enviarEmail(String destinatario, String mensagem, String assunto) {
        Properties props = new Properties();
//        props.put("mail.smtp.host", "mail.escolanikken.com");
//        props.put("mail.smtp.socketFactory.port", "26");
//        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
//        props.put("mail.smtp.auth", "false");
//        props.put("mail.smtp.port", "26");
//        props.put("mail.imap.partialfetch", "false");


        //dados de acesso ao servidor VPS
        props.put("mail.smtp.host", "162.214.120.203");
        props.put("mail.smtp.socketFactory.port", "587");
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "587");
        props.put("mail.imap.partialfetch", "false");

        Session session = Session.getDefaultInstance(props,
                new javax.mail.Authenticator() {
            protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
//                return new javax.mail.PasswordAuthentication("comunicado@escolanikken.com", "nikken20");
                return new javax.mail.PasswordAuthentication("escolanikken@mitsistemas.com", "@nikken2020");
            }
        });

        /**
         * Ativa Debug para sessão
         */
//        session.setDebug(true);
        try {

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("comunicado@escolanikken.com")); //Remetente
//            message.setFrom(new InternetAddress("escolanikken@mitsistemas.com")); //Remetente
            message.setContent(mensagem, "text/html;charset=UTF-8");

            //Destinatário(s)
            Address[] toUser = InternetAddress.parse(destinatario);

            message.setRecipients(Message.RecipientType.TO, toUser);
            message.setSubject(assunto);
            /**
             * Método para enviar a mensagem criada
             */
            javax.mail.Transport.send(message);

            System.out.println("Email Enviado: " + destinatario);

        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }

}
