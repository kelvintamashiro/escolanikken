/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.Teste;

import java.math.BigDecimal;
import java.math.MathContext;

/**
 *
 * @author macuser
 */
public class Teste {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        double notaProducao = 9.5;
        double notaMensal = 7.3;
        double notaBimestral = 2.8;
        double media = (notaMensal + notaProducao + (notaBimestral * 2)) / 4;
        double notaArredondada = Math.round(media / 0.5) * 0.5;
        
        System.out.println(notaArredondada);
        
    }

}
