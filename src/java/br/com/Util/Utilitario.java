/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.Util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author macuser
 */
public class Utilitario {

    public static String obterDescricaoSerieAno(int serieAno) {
        String descricaoSerieAno = "";
        switch (serieAno) {
            case 11:
                descricaoSerieAno = "Infantil I";
                break;
            case 12:
                descricaoSerieAno = "Infantil II";
                break;
            case 13:
                descricaoSerieAno = "Infantil III";
                break;
            case 1:
                descricaoSerieAno = "1� ano";
                break;
            case 2:
                descricaoSerieAno = "2� ano";
                break;
            case 3:
                descricaoSerieAno = "3� ano";
                break;
            case 4:
                descricaoSerieAno = "4� ano";
                break;
            case 5:
                descricaoSerieAno = "5� ano";
                break;
            case 6:
                descricaoSerieAno = "6� ano";
                break;
            case 7:
                descricaoSerieAno = "7� ano";
                break;
            case 8:
                descricaoSerieAno = "8� ano";
                break;
            case 9:
                descricaoSerieAno = "9� ano";
                break;
            case 10:
                descricaoSerieAno = "1� s�rie E.M.";
                break;
            case 20:
                descricaoSerieAno = "2� s�rie E.M.";
                break;
            case 30:
                descricaoSerieAno = "3� s�rie E.M.";
                break;
        }

        return descricaoSerieAno;
    }

    public static String obterDescricaoStatus(int status) {
        String descricaoStatus = "";
        switch (status) {
            case 1:
                descricaoStatus = "Ativo";
                break;
            case 2:
                descricaoStatus = "Inativo";
                break;
        }
        return descricaoStatus;

    }

    public static int obterAnoVigente(Connection conn) throws SQLException {
        String query = "select ano_vigente from ano_vigente";
        PreparedStatement prep = conn.prepareStatement(query);
        ResultSet rs = prep.executeQuery();
        int anoVigente = 0;
        if(rs.next()){
            anoVigente = rs.getInt("ano_vigente");
        }
        rs.close();
        prep.close();
        
        return anoVigente;
    }

}
