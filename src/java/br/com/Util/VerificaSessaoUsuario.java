/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.Util;

import javax.servlet.http.HttpSession;

public class VerificaSessaoUsuario {

    private static VerificaSessaoUsuario sessaoUsuario = null;

    public static VerificaSessaoUsuario getInstance() {
        if (sessaoUsuario == null) {
            sessaoUsuario = new VerificaSessaoUsuario();
        }

        return sessaoUsuario;
    }

    public boolean verifica(HttpSession session) {
        if (session.getAttribute("idPF") == null) {
            return false;
        }
        return true;
    }
}
