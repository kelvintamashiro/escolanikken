/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.Form;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author macuser
 */
public class SerieAnoForm {

    private int serieAno;
    private String dsSerieAno;

    public int getSerieAno() {
        return serieAno;
    }

    public void setSerieAno(int serieAno) {
        this.serieAno = serieAno;
    }

    public String getDsSerieAno() {
        return dsSerieAno;
    }

    public void setDsSerieAno(String dsSerieAno) {
        this.dsSerieAno = dsSerieAno;
    }

    public String obterDsSerieAnoPorID(Connection conn, int serieAno) throws SQLException {
        String dsSerie = "";
        String query = "select descricao from descricao_serie_ano where id = ?";
        PreparedStatement prep = conn.prepareStatement(query);
        prep.setInt(1, serieAno);
        ResultSet rs = prep.executeQuery();
        if (rs.next()) {
            dsSerie = rs.getString("descricao");
        }
        rs.close();
        prep.close();

        return dsSerie;
    }

    public ArrayList<SerieAnoForm> listaTodasSeries(Connection conn) throws SQLException {
        ArrayList<SerieAnoForm> listaTodasSeries = new ArrayList<>();
        String query = "select * from descricao_serie_ano order by ordem, descricao";
        PreparedStatement prep = conn.prepareStatement(query);
        ResultSet rs = prep.executeQuery();
        while (rs.next()) {
            SerieAnoForm serieAnoForm = new SerieAnoForm();
            serieAnoForm.setSerieAno(rs.getInt("id"));
            serieAnoForm.setDsSerieAno(rs.getString("descricao"));
            listaTodasSeries.add(serieAnoForm);
        }
        rs.close();
        prep.close();

        return listaTodasSeries;

    }

    public ArrayList<SerieAnoForm> listaTodasSeriesComNotas(Connection conn) throws SQLException {
        ArrayList<SerieAnoForm> listaTodasSeries = new ArrayList<>();
        String query = "select * from descricao_serie_ano"
                + " where id not in (11, 12, 13, 1)"
                + " order by ordem, descricao";
        PreparedStatement prep = conn.prepareStatement(query);
        ResultSet rs = prep.executeQuery();
        while (rs.next()) {
            SerieAnoForm serieAnoForm = new SerieAnoForm();
            serieAnoForm.setSerieAno(rs.getInt("id"));
            serieAnoForm.setDsSerieAno(rs.getString("descricao"));
            listaTodasSeries.add(serieAnoForm);
        }
        rs.close();
        prep.close();

        return listaTodasSeries;

    }

    public ArrayList<SerieAnoForm> obterSerieAnoPorCategoria(String categoriaEnsino) {
        ArrayList<SerieAnoForm> listaSerieAno = new ArrayList<>();
        SerieAnoForm serieAno = new SerieAnoForm();
        switch (categoriaEnsino) {
            case "INF":
                serieAno.setSerieAno(11);
                serieAno.setDsSerieAno("Infantil I");
                listaSerieAno.add(serieAno);
                serieAno = new SerieAnoForm();
                serieAno.setSerieAno(12);
                serieAno.setDsSerieAno("Infantil II");
                listaSerieAno.add(serieAno);
                serieAno = new SerieAnoForm();
                serieAno.setSerieAno(13);
                serieAno.setDsSerieAno("Infantil III");
                listaSerieAno.add(serieAno);
                break;
            case "EF1":
                serieAno.setSerieAno(1);
                serieAno.setDsSerieAno("1º ano");
                listaSerieAno.add(serieAno);
                serieAno = new SerieAnoForm();
                serieAno.setSerieAno(2);
                serieAno.setDsSerieAno("2º ano");
                listaSerieAno.add(serieAno);
                serieAno = new SerieAnoForm();
                serieAno.setSerieAno(3);
                serieAno.setDsSerieAno("3º ano");
                listaSerieAno.add(serieAno);
                serieAno = new SerieAnoForm();
                serieAno.setSerieAno(4);
                serieAno.setDsSerieAno("4º ano");
                listaSerieAno.add(serieAno);
                serieAno = new SerieAnoForm();
                serieAno.setSerieAno(5);
                serieAno.setDsSerieAno("5º ano");
                listaSerieAno.add(serieAno);
                break;
            case "EF2":
                serieAno.setSerieAno(6);
                serieAno.setDsSerieAno("6º ano");
                listaSerieAno.add(serieAno);
                serieAno = new SerieAnoForm();
                serieAno.setSerieAno(7);
                serieAno.setDsSerieAno("7º ano");
                listaSerieAno.add(serieAno);
                serieAno = new SerieAnoForm();
                serieAno.setSerieAno(8);
                serieAno.setDsSerieAno("8º ano");
                listaSerieAno.add(serieAno);
                serieAno = new SerieAnoForm();
                serieAno.setSerieAno(9);
                serieAno.setDsSerieAno("9º ano");
                listaSerieAno.add(serieAno);
                break;
            case "EM":
                serieAno = new SerieAnoForm();
                serieAno.setSerieAno(10);
                serieAno.setDsSerieAno("1ª série E.M.");
                listaSerieAno.add(serieAno);
                serieAno = new SerieAnoForm();
                serieAno.setSerieAno(20);
                serieAno.setDsSerieAno("2ª série E.M.");
                listaSerieAno.add(serieAno);
                serieAno = new SerieAnoForm();
                serieAno.setSerieAno(30);
                serieAno.setDsSerieAno("3ª série E.M.");
                listaSerieAno.add(serieAno);
                break;
            default:
                break;
        }

        return listaSerieAno;
    }
}
