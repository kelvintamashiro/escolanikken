///*
// * To change this license header, choose License Headers in Project Properties.
// * To change this template file, choose Tools | Templates
// * and open the template in the editor.
// */
//package br.com.Util;
//
//import javax.mail.*;
//import javax.mail.internet.InternetAddress;
//import javax.mail.internet.MimeMessage;
//import java.util.Properties;
//import javax.mail.internet.AddressException;
//
///**
// *
// * @author macuser
// */
//public class EnvioEmailGmail {
//
//    static Properties mailServerProperties;
//    static Session getMailSession;
//    static MimeMessage generateMailMessage;
//
//    public void enviarEmail(String destinatario, String mensagem, String assunto) throws AddressException, MessagingException {
//        // Step1
//        System.out.println("\n 1st ===> setup Mail Server Properties..");
//        mailServerProperties = System.getProperties();
//        mailServerProperties.put("mail.smtp.port", "587");
//        mailServerProperties.put("mail.smtp.auth", "true");
//        mailServerProperties.put("mail.smtp.starttls.enable", "true");
//        System.out.println("Mail Server Properties have been setup successfully..");
//
//        // Step2
//        System.out.println("\n\n 2nd ===> get Mail Session..");
//        getMailSession = Session.getDefaultInstance(mailServerProperties, null);
//        generateMailMessage = new MimeMessage(getMailSession);
//        generateMailMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(destinatario));
////        generateMailMessage.addRecipient(Message.RecipientType.CC, new InternetAddress("test2@crunchify.com"));
//        generateMailMessage.setSubject(assunto);
//        generateMailMessage.setContent(mensagem, "text/html");
//        System.out.println("Mail Session has been created successfully..");
//
//        // Step3
//        System.out.println("\n\n 3rd ===> Get Session and Send mail");
//        Transport transport = getMailSession.getTransport("smtp");
//
//        // Enter your correct gmail UserID and Password
//        // if you have 2FA enabled then provide App Specific Password
//        transport.connect("smtp.gmail.com", "comunicadonikken@gmail.com", "@escolanikken2020");
//        transport.sendMessage(generateMailMessage, generateMailMessage.getAllRecipients());
//        transport.close();
//    }
//
//}
