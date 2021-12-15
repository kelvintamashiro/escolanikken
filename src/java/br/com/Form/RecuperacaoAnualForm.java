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
public class RecuperacaoAnualForm extends FormBasico {

    private int id;
    private int idNotaBimestre;
    private int idDisciplina;
    private String nomeDisciplina;
    private int idAluno;
    private String nomeAluno;
    private int nrBimestre;
    private int idSerieAno;
    private String dsSerieAno;
    private int ano;
    private double mediaBimestre;
    private double mediaFinal;
    private double mediaAnual;
    private double notaRecuperacao;
    private boolean passouDeAno;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public boolean isPassouDeAno() {
        return passouDeAno;
    }

    public void setPassouDeAno(boolean passouDeAno) {
        this.passouDeAno = passouDeAno;
    }

    public int getIdNotaBimestre() {
        return idNotaBimestre;
    }

    public void setIdNotaBimestre(int idNotaBimestre) {
        this.idNotaBimestre = idNotaBimestre;
    }

    public int getIdDisciplina() {
        return idDisciplina;
    }

    public void setIdDisciplina(int idDisciplina) {
        this.idDisciplina = idDisciplina;
    }

    public int getIdAluno() {
        return idAluno;
    }

    public void setIdAluno(int idAluno) {
        this.idAluno = idAluno;
    }

    public int getNrBimestre() {
        return nrBimestre;
    }

    public void setNrBimestre(int nrBimestre) {
        this.nrBimestre = nrBimestre;
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

    public int getAno() {
        return ano;
    }

    public void setAno(int ano) {
        this.ano = ano;
    }

    public double getMediaBimestre() {
        return mediaBimestre;
    }

    public void setMediaBimestre(double mediaBimestre) {
        this.mediaBimestre = mediaBimestre;
    }

    public double getMediaFinal() {
        return mediaFinal;
    }

    public void setMediaFinal(double mediaFinal) {
        this.mediaFinal = mediaFinal;
    }

    public double getMediaAnual() {
        return mediaAnual;
    }

    public void setMediaAnual(double mediaAnual) {
        this.mediaAnual = mediaAnual;
    }

    public double getNotaRecuperacao() {
        return notaRecuperacao;
    }

    public void setNotaRecuperacao(double notaRecuperacao) {
        this.notaRecuperacao = notaRecuperacao;
    }

    public String getNomeDisciplina() {
        return nomeDisciplina;
    }

    public void setNomeDisciplina(String nomeDisciplina) {
        this.nomeDisciplina = nomeDisciplina;
    }

    public String getNomeAluno() {
        return nomeAluno;
    }

    public void setNomeAluno(String nomeAluno) {
        this.nomeAluno = nomeAluno;
    }

    public List<RecuperacaoAnualForm> obterListaMediaAnualPorAluno(Connection conn, int idPF, int idSerieAno, int anoVigente) throws SQLException {
        List<RecuperacaoAnualForm> listaNotasAlunos = new ArrayList<>();
        String query = "select sum(n.media) as totalMedia, n.serie_ano, n.ano, d.id_disciplina, d.nome_disciplina, n.id_aluno, pf.nome,"
                + " r.nota_media_anual, r.nota_media_recup_final, r.nota_recup_anual, r.passou"
                + " from disciplina d, pessoa_fisica pf, nota_bimestre n"
                + " left join recuperacao_anual r on (n.id_aluno = r.id_aluno and n.id_disciplina = r.id_disciplina and r.ano = ?) "
                + " where n.id_disciplina = d.id_disciplina"
                + " and n.id_aluno = pf.id"
                + " and n.serie_ano = ?"
                + " and n.id_aluno = ?"
                + " and n.ano = ?"
                + " and r.nota_recup_anual is null"
                + " group by n.id_disciplina"
                + " order by d.nome_disciplina";

        PreparedStatement prep = conn.prepareStatement(query);
        prep.setInt(1, anoVigente);
        prep.setInt(2, idSerieAno);
        prep.setInt(3, idPF);
        prep.setInt(4, anoVigente);
        ResultSet rs = prep.executeQuery();
        while (rs.next()) {
            RecuperacaoAnualForm recuperacaoAnualForm = new RecuperacaoAnualForm();
            double mediaAnual = rs.getDouble("totalMedia") / 4;
            double mediaArredondada = Math.round(mediaAnual / 0.5) * 0.5;
            recuperacaoAnualForm.setIdDisciplina(rs.getInt("id_disciplina"));
            recuperacaoAnualForm.setNomeDisciplina(rs.getString("nome_disciplina"));
            recuperacaoAnualForm.setIdAluno(rs.getInt("id_aluno"));
            recuperacaoAnualForm.setNomeAluno(rs.getString("nome"));
            recuperacaoAnualForm.setMediaAnual(mediaArredondada);

            if (mediaArredondada < 6.0) {
                listaNotasAlunos.add(recuperacaoAnualForm);
            }
        }
        rs.close();
        prep.close();

        return listaNotasAlunos;
    }

    public List<RecuperacaoAnualForm> obterListaMediaAnualPorAlunoCadastrado(Connection conn, int idSerieAno, int anoVigente) throws SQLException {
        List<RecuperacaoAnualForm> listaNotasAlunos = new ArrayList<>();
        String query = "select r.id, r.id_aluno, r.id_disciplina, pf.nome, d.nome_disciplina, r.nota_media_anual, r.nota_recup_anual, r.nota_media_recup_final "
                + " from recuperacao_anual r, disciplina d, pessoa_fisica pf"
                + " where r.id_disciplina = d.id_disciplina"
                + " and r.id_aluno = pf.id"
                + " and r.id_serie_ano = ?"
                + " and r.ano = ?";

        PreparedStatement prep = conn.prepareStatement(query);
        prep.setInt(1, idSerieAno);
        prep.setInt(2, anoVigente);
        ResultSet rs = prep.executeQuery();
        while (rs.next()) {
            RecuperacaoAnualForm recuperacaoAnualForm = new RecuperacaoAnualForm();
            recuperacaoAnualForm.setId(rs.getInt("id"));
            recuperacaoAnualForm.setIdAluno(rs.getInt("id_aluno"));
            recuperacaoAnualForm.setIdDisciplina(rs.getInt("id_disciplina"));
            recuperacaoAnualForm.setNomeDisciplina(rs.getString("nome_disciplina"));
            recuperacaoAnualForm.setNomeAluno(rs.getString("nome"));
            recuperacaoAnualForm.setMediaAnual(rs.getDouble("nota_media_anual"));
            recuperacaoAnualForm.setNotaRecuperacao(rs.getDouble("nota_recup_anual"));
            recuperacaoAnualForm.setMediaFinal(rs.getDouble("nota_media_recup_final"));
            listaNotasAlunos.add(recuperacaoAnualForm);
        }
        rs.close();
        prep.close();

        return listaNotasAlunos;
    }

    public void salvarNotaRecuperacaoFinal(Connection conn, RecuperacaoAnualForm recuperacaoAnualForm) throws SQLException {
        String query = "INSERT INTO recuperacao_anual (id_aluno, id_disciplina, nota_media_anual,"
                + " nota_recup_anual, nota_media_recup_final, passou, id_serie_ano, ano) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement prep = conn.prepareStatement(query);
        prep.setInt(1, recuperacaoAnualForm.getIdAluno());
        prep.setInt(2, recuperacaoAnualForm.getIdDisciplina());
        prep.setDouble(3, recuperacaoAnualForm.getMediaAnual());
        prep.setDouble(4, recuperacaoAnualForm.getNotaRecuperacao());
        prep.setDouble(5, recuperacaoAnualForm.getMediaFinal());
        prep.setBoolean(6, recuperacaoAnualForm.isPassouDeAno());
        prep.setInt(7, recuperacaoAnualForm.getIdSerieAno());
        prep.setInt(8, recuperacaoAnualForm.getAno());
        prep.execute();
        prep.close();

    }

    public List<RecuperacaoAnualForm> obterListaMediaPorBimestreAlunoDisciplina(Connection conn, RecuperacaoAnualForm recuperacaoAnualForm) throws SQLException {
        List<RecuperacaoAnualForm> listaTodasMedias = new ArrayList<>();
        String query = "select n.nr_bimestre, n.media"
                + " from nota_bimestre n"
                + " where n.id_aluno = ?"
                + " and n.id_disciplina = ?"
                + " and n.ano = ?"
                + " order by n.nr_bimestre";

        PreparedStatement prep = conn.prepareStatement(query);
        prep.setInt(1, recuperacaoAnualForm.getIdAluno());
        prep.setInt(2, recuperacaoAnualForm.getIdDisciplina());
        prep.setInt(3, recuperacaoAnualForm.getAno());
        ResultSet rs = prep.executeQuery();
        while (rs.next()) {
            RecuperacaoAnualForm recupForm = new RecuperacaoAnualForm();
            recupForm.setNrBimestre(rs.getInt("nr_bimestre"));
            recupForm.setMediaBimestre(rs.getDouble("media"));
            listaTodasMedias.add(recupForm);
        }
        rs.close();
        prep.close();

        return listaTodasMedias;
    }

    public double obterMediaRecupFinalPorAlunoDisciplina(Connection conn, int idDisciplina, int ano, int idAluno, int idSerieAno) throws SQLException {
        String query = "select r.nota_media_recup_final from recuperacao_anual r"
                + " where r.id_aluno = ?"
                + " and r.id_disciplina = ?"
                + " and r.id_serie_ano = ?"
                + " and r.ano = ?";
        PreparedStatement prep = conn.prepareStatement(query);
        prep.setInt(1, idAluno);
        prep.setInt(2, idDisciplina);
        prep.setInt(3, idSerieAno);
        prep.setInt(4, ano);
        ResultSet rs = prep.executeQuery();
        double mediaRecupFinal = 0;
        if (rs.next()) {
            mediaRecupFinal = rs.getDouble("nota_media_recup_final");
        }
        rs.close();
        prep.close();

        return mediaRecupFinal;
    }

    public void excluirNotaRecuperacao(Connection conn, int id) throws SQLException {
        String query = "DELETE FROM recuperacao_anual WHERE id=?";
        try (PreparedStatement prep = conn.prepareStatement(query)) {
            prep.setInt(1, id);
            prep.execute();
        }
    }

}
