/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com;

import java.util.Base64;

/**
 *
 * @author macuser
 */
public class CriptoDecripto {

    public String cripto(String valor) {
        return new String(Base64.getEncoder().encode(valor.getBytes()));
    }

    public String decripto(String valor) {
        return new String(Base64.getDecoder().decode(valor.getBytes()));
    }

}
