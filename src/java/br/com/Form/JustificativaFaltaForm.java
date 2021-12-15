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
public class JustificativaFaltaForm extends FormBasico {

    private int id;
    private int idSerieAno;
    private String dsSerieAno;
    private int idAluno;
    private String nomeAluno;
    private int nrBimestre;
    private int ano;
    private String dataFalta;
    private String descricao;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdSerieAno() {
        return idSerieAno;
    }

    public void setIdSerieAno(int idSerieAno) {
        this.idSerieAno = idSerieAno;
    }

    public String getDsSerieAno() {
        return dsSerieAno;
    }

    public void setDsSerieAno(String dsSerieAno) {
        this.dsSerieAno = dsSerieAno;
    }

    public int getIdAluno() {
        return idAluno;
    }

    public void setIdAluno(int idAluno) {
        this.idAluno = idAluno;
    }

    public String getNomeAluno() {
        return nomeAluno;
    }

    public void setNomeAluno(String nomeAluno) {
        this.nomeAluno = nomeAluno;
    }

    public int getAno() {
        return ano;
    }

    public void setAno(int ano) {
        this.ano = ano;
    }

    public int getNrBimestre() {
        return nrBimestre;
    }

    public void setNrBimestre(int nrBimestre) {
        this.nrBimestre = nrBimestre;
    }

    public String getDataFalta() {
        return dataFalta;
    }

    public void setDataFalta(String dataFalta) {
        this.dataFalta = dataFalta;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public void salvar(Connection conn, JustificativaFaltaForm justificativaFaltaForm) throws SQLException {
        String query = "INSERT INTO justificativa_falta (id_serie_ano, id_aluno, nr_bimestre, data_falta, descricao, ano) VALUES (?,?,?,?,?,?)";
        PreparedStatement prep = conn.prepareStatement(query);
        prep.setInt(1, justificativaFaltaForm.getIdSerieAno());
        prep.setInt(2, justificativaFaltaForm.getIdAluno());
        prep.setInt(3, justificativaFaltaForm.getNrBimestre());
        prep.setString(4, justificativaFaltaForm.getDataFalta());
        prep.setString(5, justificativaFaltaForm.getDescricao());
        prep.setInt(6, justificativaFaltaForm.getAno());
        prep.execute();
        prep.close();
    }

    public List<JustificativaFaltaForm> pesquisar(Connection conn) throws SQLException {
        List<JustificativaFaltaForm> listaJustificativas = new ArrayList<>();
        String query = "select j.*, ds.descricao as ds_serie, ds.categoria, pf.nome"
                + " from justificativa_falta j, descricao_serie_ano ds, pessoa_fisica pf, ano_vigente av "
                + " where j.id_serie_ano = ds.id"
                + " and j.id_aluno = pf.id"
                + " and j.ano = av.ano_vigente"
                + " order by j.data_falta desc";
        PreparedStatement prep = conn.prepareStatement(query);
        ResultSet rs = prep.executeQuery();
        while (rs.next()) {
            JustificativaFaltaForm justificativaFaltaForm = new JustificativaFaltaForm();
            justificativaFaltaForm.setId(rs.getInt("id"));
            justificativaFaltaForm.setIdSerieAno(rs.getInt("id_serie_ano"));
            justificativaFaltaForm.setDsSerieAno(rs.getString("ds_serie"));
            justificativaFaltaForm.setIdAluno(rs.getInt("id_aluno"));
            justificativaFaltaForm.setNrBimestre(rs.getInt("nr_bimestre"));
            justificativaFaltaForm.setDataFalta(rs.getString("data_falta"));
            justificativaFaltaForm.setDescricao(rs.getString("descricao"));
            justificativaFaltaForm.setNomeAluno(rs.getString("nome"));
            justificativaFaltaForm.setAno(rs.getInt("ano"));
            
            listaJustificativas.add(justificativaFaltaForm);
        }
        rs.close();
        prep.close();
        
        return listaJustificativas;
    }

    public void excluir(Connection conn, int id) throws SQLException {
        String query = "DELETE FROM justificativa_falta WHERE id=?";
        PreparedStatement prep = conn.prepareStatement(query);
        prep.setInt(1, id);
        prep.execute();
        prep.close();
    }

}
