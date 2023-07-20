/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.Teste;

import br.com.abre.Util.ParametroUtil;
import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author macuser
 */
public class JobGravarAlunoAnoEstudado {

    private static final String USUARIO = "wwmits_user";
    private static final String SENHA = "Miguel0210!";
    private static final String URL = "jdbc:mysql://162.214.120.203:3306/wwmits_nikken";
    private static final String DRIVER = "com.mysql.jdbc.Driver";

    public static void main(String[] args) throws ClassNotFoundException, InstantiationException, IllegalAccessException {
        try {
            Class.forName(DRIVER);
            Connection conn = DriverManager.getConnection(URL, USUARIO, SENHA);

            String query = "select * from alunos a order by a.id";
            PreparedStatement prep = conn.prepareStatement(query);
            ResultSet rs = prep.executeQuery();
            while (rs.next()) {
                int idAluno = rs.getInt("id");
//                String insert = "INSERT INTO alunos_ano_estudado (id_aluno, ano_estudado, status) VALUES (?, 2021, 1)";
//                PreparedStatement prepInsert = conn.prepareStatement(insert);
//                prepInsert.setInt(1, idAluno);
//                prepInsert.execute();
//                prepInsert.close();
                
                System.out.println("ID Aluno: " + idAluno);
            }
            rs.close();
            prep.close();
            

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
