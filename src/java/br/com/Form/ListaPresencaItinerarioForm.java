/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.Form;

import java.sql.Connection;
import br.com.abre.Util.IDRDate;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author macuser
 */
public class ListaPresencaItinerarioForm extends FormBasico {

    private int idPresencaItinerario;
    private int idAluno;
    private String nomeAluno;
    private int idItinerario;
    private String dsItinerario;
    private int idSerieAno;
    private String dsSerieAno;
    private String[] selectedOptions;
    private String data;
    private int qtdAulas;
    private int nrBimestre;
    private String falta;
    private int qtdFalta;

    public int getIdPresencaItinerario() {
        return idPresencaItinerario;
    }

    public void setIdPresencaItinerario(int idPresencaItinerario) {
        this.idPresencaItinerario = idPresencaItinerario;
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

    public int getIdItinerario() {
        return idItinerario;
    }

    public void setIdItinerario(int idItinerario) {
        this.idItinerario = idItinerario;
    }

    public String getDsItinerario() {
        return dsItinerario;
    }

    public void setDsItinerario(String dsItinerario) {
        this.dsItinerario = dsItinerario;
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

    public String[] getSelectedOptions() {
        return selectedOptions;
    }

    public void setSelectedOptions(String[] selectedOptions) {
        this.selectedOptions = selectedOptions;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    public int getQtdAulas() {
        return qtdAulas;
    }

    public void setQtdAulas(int qtdAulas) {
        this.qtdAulas = qtdAulas;
    }

    public int getNrBimestre() {
        return nrBimestre;
    }

    public void setNrBimestre(int nrBimestre) {
        this.nrBimestre = nrBimestre;
    }

    public String getFalta() {
        return falta;
    }

    public void setFalta(String falta) {
        this.falta = falta;
    }

    public int getQtdFalta() {
        return qtdFalta;
    }

    public void setQtdFalta(int qtdFalta) {
        this.qtdFalta = qtdFalta;
    }

    public List<ListaPresencaItinerarioForm> obterListaAlunosPorItinerario(Connection conn, int idSerieAno, int idItinerario, int ano) throws SQLException {
        List<ListaPresencaItinerarioForm> listaAlunos = new ArrayList<>();
        String query = "select pf.id, pf.nome, i.id_itinerario, i.id_serie"
                + " from itinerario_alunos i, pessoa_fisica pf"
                + " where i.id_aluno = pf.id"
                + " and i.id_serie = ?"
                + " and i.id_itinerario = ?"
                + " and i.ano = ?"
                + " and pf.status = 1"
                + " order by pf.nome";

        PreparedStatement prep = conn.prepareStatement(query);
        prep.setInt(1, idSerieAno);
        prep.setInt(2, idItinerario);
        prep.setInt(3, ano);
        ResultSet rs = prep.executeQuery();
        while (rs.next()) {
            ListaPresencaItinerarioForm listaForm = new ListaPresencaItinerarioForm();
            listaForm.setIdAluno(rs.getInt("id"));
            listaForm.setNomeAluno(rs.getString("nome"));
            listaForm.setIdSerieAno(rs.getInt("id_serie"));
            listaAlunos.add(listaForm);
        }
        rs.close();
        prep.close();

        return listaAlunos;
    }

    public void salvarPresenca(Connection conn, String idAluno, ListaPresencaItinerarioForm listaItinerarioForm, int qtdFalta, int ano, String falta, int idProfessor) throws SQLException {
        String query = "INSERT INTO lista_presenca_itinerario (id_aluno, id_itinerario, nr_bimestre, id_serie, data, falta, qtd_aula, qtd_falta, ano, id_professor) VALUES (?,?,?,?,?,?,?,?,?,?)";
        PreparedStatement prep = conn.prepareStatement(query);
        prep.setString(1, idAluno);
        prep.setInt(2, listaItinerarioForm.getIdItinerario());
        prep.setInt(3, listaItinerarioForm.getNrBimestre());
        prep.setInt(4, listaItinerarioForm.getIdSerieAno());
        prep.setString(5, listaItinerarioForm.getData());
        prep.setString(6, falta);
        prep.setInt(7, listaItinerarioForm.getQtdAulas());
        prep.setInt(8, qtdFalta);
        prep.setInt(9, ano);
        prep.setInt(10, idProfessor);
        prep.execute();
        prep.close();
    }

    public boolean isPresencaLancadaData(Connection conn, ListaPresencaItinerarioForm listaItinerarioForm) throws SQLException {
        boolean isPresencaLancada = false;
        String query = "select * from lista_presenca_itinerario l where l.data = ? and l.id_itinerario = ? and l.id_serie = ?";
        try ( PreparedStatement prep = conn.prepareStatement(query)) {
            prep.setString(1, listaItinerarioForm.getData());
            prep.setInt(2, listaItinerarioForm.getIdItinerario());
            prep.setInt(3, listaItinerarioForm.getIdSerieAno());
            try ( ResultSet rs = prep.executeQuery()) {
                if (rs.next()) {
                    isPresencaLancada = true;
                }
            }
        }

        return isPresencaLancada;
    }

    public List<ListaPresencaItinerarioForm> obterListaAlunosPresenca(Connection conn, int idSerieAno, String data, int idItinerario) throws SQLException {
        List<ListaPresencaItinerarioForm> listaAlunosPresenca = new ArrayList<>();
        String query = "select l.id, l.id_aluno, l.id_itinerario, l.data, l.falta, l.qtd_aula, l.qtd_falta, pf.nome, i.nome_itinerario, ds.descricao, ds.categoria"
                + " from lista_presenca_itinerario l, pessoa_fisica pf, itinerario i, descricao_serie_ano ds"
                + " where l.id_aluno = pf.id"
                + " and l.id_itinerario = i.id_itinerario"
                + " and l.id_serie = ds.id"
                + " and l.data = ? "
                + " and l.id_itinerario = ? "
                + " and l.id_serie = ?";
        try ( PreparedStatement prep = conn.prepareStatement(query)) {
            prep.setString(1, data);
            prep.setInt(2, idItinerario);
            prep.setInt(3, idSerieAno);
            try ( ResultSet rs = prep.executeQuery()) {
                while (rs.next()) {
                    ListaPresencaItinerarioForm listaPresencaItinerarioForm = new ListaPresencaItinerarioForm();
                    listaPresencaItinerarioForm.setIdPresencaItinerario(rs.getInt("id"));
                    listaPresencaItinerarioForm.setIdAluno(rs.getInt("id_aluno"));
                    listaPresencaItinerarioForm.setIdItinerario(rs.getInt("id_itinerario"));
                    listaPresencaItinerarioForm.setData(IDRDate.formatSQLDate(rs.getString("data")));
                    listaPresencaItinerarioForm.setFalta(rs.getString("falta"));
                    listaPresencaItinerarioForm.setQtdAulas(rs.getInt("qtd_aula"));
                    listaPresencaItinerarioForm.setQtdFalta(rs.getInt("qtd_falta"));
                    listaPresencaItinerarioForm.setNomeAluno(rs.getString("nome"));
                    listaPresencaItinerarioForm.setDsItinerario(rs.getString("nome_itinerario"));
                    listaPresencaItinerarioForm.setDsSerieAno(rs.getString("descricao"));

                    listaAlunosPresenca.add(listaPresencaItinerarioForm);
                }
            }
        }

        return listaAlunosPresenca;
    }

    public void excluirPresencaPorID(Connection conn, String idPresenca) throws SQLException {
        String query = "DELETE FROM lista_presenca_itinerario WHERE id=?";
        try ( PreparedStatement prep = conn.prepareStatement(query)) {
            prep.setString(1, idPresenca);
            prep.execute();
        }
    }

}
