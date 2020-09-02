/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.Teste;

import br.com.Util.EnvioEmail;

/**
 *
 * @author macuser
 */
public class TesteEmail2 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        try {
            StringBuilder sb = new StringBuilder();

            sb.append("Olá ");
            sb.append("<br/><br/>");
            sb.append("<b>Seja bem vindo ao Portal NIKKEN</b>");
            sb.append("<br/>");
            sb.append("Nessa área você poderá acessar para consultar o boletim e receber alguns comunicados. ");
            sb.append("<br/>");
            sb.append("Segue os dados de acesso: ");
            sb.append("<br/><br/>");
            sb.append("Site: www.escolanikken.com/portal");
            sb.append("<br/>");
            sb.append("Login: ");
            sb.append("<br/>");
            sb.append("Senha: ");
            sb.append("<br/>");
            sb.append("<br/>");
            sb.append("Atenciosamente,");
            sb.append("<br/>");
            sb.append("Escola Nikken");

            EnvioEmail envio = new EnvioEmail();
            envio.enviarEmail("kelvin@mitsistemas.com.br", sb.toString(), "Assunto");

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
