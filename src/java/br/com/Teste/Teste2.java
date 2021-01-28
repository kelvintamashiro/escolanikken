/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.Teste;

import br.com.abre.Util.IDRDate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

/**
 *
 * @author macuser
 */
public class Teste2 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        
        String data = "13/01/2021";
//        String data = "2021-01-13";
        
        if(data.contains("/")){
            data = IDRDate.parseDataIso(data);
            System.out.println(data);
        } else {
            System.out.println("nao");
        }

//        List<String> listaAlunos = new ArrayList<String>();;
//        listaAlunos.add("25");
//        listaAlunos.add("26");
//        listaAlunos.add("27");
//        
//        List<String> listaFaltas = new ArrayList<String>();
//        listaFaltas.add("25");
//        listaFaltas.add("27");
//        
//        listaAlunos.removeAll(listaFaltas);
//        System.out.println(listaAlunos);
        
        
        
        
//        boolean existe = listaAlunos.contains("28");
//        System.out.println(existe);


//        List<Integer> lista1 = Arrays.asList(1, 2, 3, 4, 5, 6);
//        List<String> lista2 = Arrays.asList("5", "6", "7", "8");
//
//        List<Integer> interseccao = lista1.stream().filter(item1 -> {
//            return lista2.stream().filter(item2 -> new Integer(item2).equals(item1)).findAny().isPresent();
//        }).collect(Collectors.toList());
//
//        System.out.println(interseccao);

    }

}
