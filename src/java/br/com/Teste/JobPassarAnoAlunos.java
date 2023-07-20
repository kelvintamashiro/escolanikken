/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.Teste;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author macuser
 */
public class JobPassarAnoAlunos {

    private static final String USUARIO = "wwmits_user";
    private static final String SENHA = "Miguel0210!";
    private static final String URL = "jdbc:mysql://162.214.120.203:3306/wwmits_nikken";
    private static final String DRIVER = "com.mysql.jdbc.Driver";

    public static void main(String[] args) {
        try {
            Class.forName(DRIVER);
            Connection conn = DriverManager.getConnection(URL, USUARIO, SENHA);
            
            String query = "select * from alunos a order by a.id";
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
