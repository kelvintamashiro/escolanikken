/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.Form;

import br.com.Util.Utilitario;
import br.com.abre.Util.IDRDate;
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
public class ListaPresencaForm extends FormBasico {

    private int idPresenca;
    private int idAluno;
    private String nomeAluno;
    private int idSerieAno;
    private String dsSerieAno;
    private String[] selectedOptions;
    private String data;
    private int idDisciplina;
    private String dsDisciplina;
    private String dsCategoriaEnsino;
    private int qtdAulas;
    private int nrBimestre;
    private String falta;
    private int qtdFalta;
    private PlanejamentoAulasForm planejamentoAulasForm;
    private String nomeProfessor;
    private List<String> listaNomeProfessor;

    public List<String> getListaNomeProfessor() {
        return listaNomeProfessor;
    }

    public void setListaNomeProfessor(List<String> listaNomeProfessor) {
        this.listaNomeProfessor = listaNomeProfessor;
    }
    
    public String getNomeProfessor() {
        return nomeProfessor;
    }

    public void setNomeProfessor(String nomeProfessor) {
        this.nomeProfessor = nomeProfessor;
    }

    public String getDsCategoriaEnsino() {
        return dsCategoriaEnsino;
    }

    public void setDsCategoriaEnsino(String dsCategoriaEnsino) {
        this.dsCategoriaEnsino = dsCategoriaEnsino;
    }
    
    public PlanejamentoAulasForm getPlanejamentoAulasForm() {
        return planejamentoAulasForm;
    }

    public void setPlanejamentoAulasForm(PlanejamentoAulasForm planejamentoAulasForm) {
        this.planejamentoAulasForm = planejamentoAulasForm;
    }

    public int getQtdFalta() {
        return qtdFalta;
    }

    public void setQtdFalta(int qtdFalta) {
        this.qtdFalta = qtdFalta;
    }

    public String getFalta() {
        return falta;
    }

    public void setFalta(String falta) {
        this.falta = falta;
    }

    public int getIdPresenca() {
        return idPresenca;
    }

    public void setIdPresenca(int idPresenca) {
        this.idPresenca = idPresenca;
    }

    public int getNrBimestre() {
        return nrBimestre;
    }

    public void setNrBimestre(int nrBimestre) {
        this.nrBimestre = nrBimestre;
    }

    public int getQtdAulas() {
        return qtdAulas;
    }

    public void setQtdAulas(int qtdAulas) {
        this.qtdAulas = qtdAulas;
    }

    public int getIdDisciplina() {
        return idDisciplina;
    }

    public void setIdDisciplina(int idDisciplina) {
        this.idDisciplina = idDisciplina;
    }

    public String getDsDisciplina() {
        return dsDisciplina;
    }

    public void setDsDisciplina(String dsDisciplina) {
        this.dsDisciplina = dsDisciplina;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
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

    public ArrayList<ListaPresencaForm> obterListaAlunosPorSerie(Connection conn, int idSerieAno) throws SQLException {
        ArrayList<ListaPresencaForm> listaAlunos = new ArrayList<>();
        StringBuilder sb = new StringBuilder();
        sb.append("select pf.id, pf.nome, pf.data_nascimento, pf.sexo, pf.cidade, pf.provincia, a.serie_ano, pf.email, pf.status, a.numero_id_aluno ");
        sb.append(" from pessoa_fisica pf, alunos a");
        sb.append(" where pf.id = a.id_pessoa_fisica");
        sb.append(" and a.serie_ano = ").append(idSerieAno);
        sb.append(" and pf.status = 1");
        sb.append(" order by pf.nome");

        PreparedStatement prep = conn.prepareStatement(sb.toString());
        ResultSet rs = prep.executeQuery();
        while (rs.next()) {
            ListaPresencaForm aForm = new ListaPresencaForm();
            aForm.setIdAluno(rs.getInt("id"));
            aForm.setNomeAluno(rs.getString("nome"));
            aForm.setIdSerieAno(rs.getInt("serie_ano"));
            aForm.setDsSerieAno(Utilitario.obterDescricaoSerieAno(aForm.getIdSerieAno()));
            listaAlunos.add(aForm);
        }
        rs.close();
        prep.close();

        return listaAlunos;
    }

    public void salvarPresenca(Connection conn, String idAluno, int idDisciplina, int nrBimestre, int idSerie, String data, int qtdAula, int qtdFalta, String falta, int idProfessor) throws SQLException {
        String query = "INSERT INTO lista_presenca (id_aluno, id_disciplina, id_serie, data, qtd_aula, qtd_falta, falta, nr_bimestre, id_professor) VALUES (?,?,?,?,?,?,?,?,?)";
        PreparedStatement prep = conn.prepareStatement(query);
        prep.setString(1, idAluno);
        prep.setInt(2, idDisciplina);
        prep.setInt(3, idSerie);
        prep.setString(4, data);
        prep.setInt(5, qtdAula);
        prep.setInt(6, qtdFalta);
        prep.setString(7, falta);
        prep.setInt(8, nrBimestre);
        prep.setInt(9, idProfessor);
        prep.execute();
        prep.close();

    }

    public boolean isPresencaLancadaData(Connection conn, String data, int idDisciplina, int idSerie) throws SQLException {
        boolean isPresencaLancada = false;
        String query = "select * from lista_presenca l where l.data = ? and l.id_disciplina = ? and l.id_serie = ?";
        try (PreparedStatement prep = conn.prepareStatement(query)) {
            prep.setString(1, data);
            prep.setInt(2, idDisciplina);
            prep.setInt(3, idSerie);
            try (ResultSet rs = prep.executeQuery()) {
                if (rs.next()) {
                    isPresencaLancada = true;
                }
            }
        }

        return isPresencaLancada;
    }

    public List<ListaPresencaForm> obterListaAlunosPresenca(Connection conn, int idSerieAno, String data, int idDisciplina) throws SQLException {
        List<ListaPresencaForm> listaAlunosPresenca = new ArrayList<>();
        String query = "select l.id, l.id_aluno, l.id_disciplina, l.data, l.falta, l.qtd_aula, l.qtd_falta, pf.nome, d.nome_disciplina, ds.descricao, ds.categoria"
                + " from lista_presenca l, pessoa_fisica pf, disciplina d, descricao_serie_ano ds"
                + " where l.id_aluno = pf.id"
                + " and l.id_disciplina = d.id_disciplina"
                + " and l.id_serie = ds.id"
                + " and l.data = ? "
                + " and l.id_disciplina = ? "
                + " and l.id_serie = ?";
        try (PreparedStatement prep = conn.prepareStatement(query)) {
            prep.setString(1, data);
            prep.setInt(2, idDisciplina);
            prep.setInt(3, idSerieAno);
            try (ResultSet rs = prep.executeQuery()) {
                while (rs.next()) {
                    ListaPresencaForm listaPresencaForm = new ListaPresencaForm();
                    listaPresencaForm.setIdPresenca(rs.getInt("id"));
                    listaPresencaForm.setIdAluno(rs.getInt("id_aluno"));
                    listaPresencaForm.setIdDisciplina(rs.getInt("id_disciplina"));
                    listaPresencaForm.setData(IDRDate.formatSQLDate(rs.getString("data")));
                    listaPresencaForm.setFalta(rs.getString("falta"));
                    listaPresencaForm.setQtdAulas(rs.getInt("qtd_aula"));
                    listaPresencaForm.setQtdFalta(rs.getInt("qtd_falta"));
                    listaPresencaForm.setNomeAluno(rs.getString("nome"));
                    listaPresencaForm.setDsDisciplina(rs.getString("nome_disciplina"));
                    listaPresencaForm.setDsSerieAno(rs.getString("descricao"));

                    listaAlunosPresenca.add(listaPresencaForm);
                }
            }
        }

        return listaAlunosPresenca;
    }

    public ListaPresencaForm obterListaPresencaPorID(Connection conn, int idPresenca) throws SQLException {
        String query = "select l.id, l.id_aluno, l.id_disciplina, l.data, l.falta, l.qtd_aula, l.qtd_falta, l.id_serie, pf.nome, d.nome_disciplina, ds.descricao, ds.categoria"
                + " from lista_presenca l, pessoa_fisica pf, disciplina d, descricao_serie_ano ds"
                + " where l.id_aluno = pf.id"
                + " and l.id_disciplina = d.id_disciplina"
                + " and l.id_serie = ds.id"
                + " and l.id = ?";

        ListaPresencaForm listaPresencaForm;
        try (PreparedStatement prep = conn.prepareStatement(query)) {
            prep.setInt(1, idPresenca);
            try (ResultSet rs = prep.executeQuery()) {
                listaPresencaForm = new ListaPresencaForm();
                if (rs.next()) {
                    listaPresencaForm.setIdPresenca(rs.getInt("id"));
                    listaPresencaForm.setIdAluno(rs.getInt("id_aluno"));
                    listaPresencaForm.setIdDisciplina(rs.getInt("id_disciplina"));
                    listaPresencaForm.setData(IDRDate.formatSQLDate(rs.getString("data")));
                    listaPresencaForm.setFalta(rs.getString("falta"));
                    listaPresencaForm.setQtdAulas(rs.getInt("qtd_aula"));
                    listaPresencaForm.setQtdFalta(rs.getInt("qtd_falta"));
                    listaPresencaForm.setIdSerieAno(rs.getInt("id_serie"));
                    listaPresencaForm.setNomeAluno(rs.getString("nome"));
                    listaPresencaForm.setDsDisciplina(rs.getString("nome_disciplina"));
                    listaPresencaForm.setDsSerieAno(rs.getString("descricao"));
                }
            }
        }

        return listaPresencaForm;
    }

    public void atualizarPresencaPorID(Connection conn, ListaPresencaForm listaPresencaForm) throws SQLException {
        String query = "UPDATE lista_presenca SET falta=?, qtd_aula=?, qtd_falta=? WHERE id=?";
        try (PreparedStatement prep = conn.prepareStatement(query)) {
            prep.setString(1, listaPresencaForm.getFalta());
            prep.setInt(2, listaPresencaForm.getQtdAulas());
            if (listaPresencaForm.getFalta().equals("S")) {
                prep.setInt(3, listaPresencaForm.getQtdAulas());
            } else {
                prep.setInt(3, 0);
            }
            prep.setInt(4, listaPresencaForm.getIdPresenca());
            prep.execute();
        }
    }

    public void excluirPresencaPorID(Connection conn, String idPresenca) throws SQLException {
        String query = "DELETE FROM lista_presenca WHERE id=?";
        try (PreparedStatement prep = conn.prepareStatement(query)) {
            prep.setString(1, idPresenca);
            prep.execute();
        }
    }

    public List<String> obterListaDatasPorSerieBimestreDisciplina(Connection conn, ListaPresencaForm listaPresencaForm) throws SQLException {
        String query = "select distinct l.data"
                + " from lista_presenca l, ano_vigente a"
                + " where l.ano = a.ano_vigente and l.nr_bimestre = ? and l.id_serie = ? and l.id_disciplina = ? and l.ano = 2023"
                + " group by l.data";
        List<String> listaDatas;
        try (PreparedStatement prep = conn.prepareStatement(query)) {
            prep.setInt(1, listaPresencaForm.getNrBimestre());
            prep.setInt(2, listaPresencaForm.getIdSerieAno());
            prep.setInt(3, listaPresencaForm.getIdDisciplina());
            try (ResultSet rs = prep.executeQuery()) {
                listaDatas = new ArrayList<>();
                while (rs.next()) {
                    String data = rs.getString("data");
                    listaDatas.add(data);
                }
            }
        }

        return listaDatas;
    }

    public ListaPresencaForm verificarFaltaPorDataAluno(Connection conn, int nrBimestre, int idSerieAno, int idDisciplina, int idAluno, String dataAula) throws SQLException {
        String query = "select l.falta, l.qtd_falta from lista_presenca l "
                + " where l.nr_bimestre = ?"
                + " and l.id_serie = ?"
                + " and l.id_disciplina = ?"
                + " and l.id_aluno = ?"
                + " and l.data = ?";
        ListaPresencaForm listaPresencaForm = new ListaPresencaForm();
        try (PreparedStatement prep = conn.prepareStatement(query)) {
            prep.setInt(1, nrBimestre);
            prep.setInt(2, idSerieAno);
            prep.setInt(3, idDisciplina);
            prep.setInt(4, idAluno);
            prep.setString(5, dataAula);
            try (ResultSet rs = prep.executeQuery()) {
                if(rs.next()){
                    listaPresencaForm.setFalta(rs.getString("falta"));
                    listaPresencaForm.setQtdFalta(rs.getInt("qtd_falta"));
                }
            }
        }
        
        return listaPresencaForm;
    }

    public void excluirPresencaPorSerieDataDisciplinaBimestre(Connection conn, int idSerieAno, String data, int idDisciplina, int nrBimestre) throws SQLException {
        String query = "select l.id from lista_presenca l where l.id_serie = ? and l.data = ? and l.id_disciplina = ? and l.nr_bimestre = ?";
        PreparedStatement prep = conn.prepareStatement(query);
        prep.setInt(1, idSerieAno);
        prep.setString(2, IDRDate.parseDataIso(data));
        prep.setInt(3, idDisciplina);
        prep.setInt(4, nrBimestre);
        ResultSet rs = prep.executeQuery();
        while(rs.next()) {
            int idPresenca = rs.getInt("id");
            String queryExcluir = "DELETE FROM lista_presenca WHERE id = ?";
            PreparedStatement prepExcluir = conn.prepareStatement(queryExcluir);
            prepExcluir.setInt(1, idPresenca);
            prepExcluir.execute();
            prepExcluir.close();
        }
        rs.close();
        prep.close();
        
        
        
    }

}
