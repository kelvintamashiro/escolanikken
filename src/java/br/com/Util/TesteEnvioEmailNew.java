/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.Util;

/**
 *
 * @author macuser
 */
public class TesteEnvioEmailNew {

    public static void main(String[] args) {

        try {

            String origem = "comunicadonikken@gmail.com";
            String destino = "kelvin@mitsistemas.com.br";
            String assunto = "assunto";
            String mensagem = "Mensagem";

            SendMail sm = new SendMail("smtp.gmail.com", "465");
            sm.sendMail(origem, destino, assunto, mensagem);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
