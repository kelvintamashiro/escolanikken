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
public class DisciplinaProfessorForm extends FormBasico {

    private int idDisciplinaProfessor;
    private int serieAno;
    private int idProfessor;
    private ArrayList<PessoaFisicaForm> listaProfessores;
    private PessoaFisicaForm professor;
    private DisciplinasForm disciplinasForm;
    private SerieAnoForm serieAnoForm;
    private int idProfInfantilI;
    private int idProfInfantilII;
    private int idProfInfantilIII;
    private int idProf1ano;
    private int idProf2ano;
    private int idProf3ano;
    private int idProf4ano;
    private int idProf5ano;
    private int idProf6ano;
    private int idProf7ano;
    private int idProf8ano;
    private int idProf9ano;
    private int idProf1serie;
    private int idProf2serie;
    private int idProf3serie;

    public int getIdProfInfantilI() {
        return idProfInfantilI;
    }

    public void setIdProfInfantilI(int idProfInfantilI) {
        this.idProfInfantilI = idProfInfantilI;
    }

    public int getIdProfInfantilII() {
        return idProfInfantilII;
    }

    public void setIdProfInfantilII(int idProfInfantilII) {
        this.idProfInfantilII = idProfInfantilII;
    }

    public int getIdProfInfantilIII() {
        return idProfInfantilIII;
    }

    public void setIdProfInfantilIII(int idProfInfantilIII) {
        this.idProfInfantilIII = idProfInfantilIII;
    }

    public int getIdProf1ano() {
        return idProf1ano;
    }

    public void setIdProf1ano(int idProf1ano) {
        this.idProf1ano = idProf1ano;
    }

    public int getIdProf2ano() {
        return idProf2ano;
    }

    public void setIdProf2ano(int idProf2ano) {
        this.idProf2ano = idProf2ano;
    }

    public int getIdProf3ano() {
        return idProf3ano;
    }

    public void setIdProf3ano(int idProf3ano) {
        this.idProf3ano = idProf3ano;
    }

    public int getIdProf4ano() {
        return idProf4ano;
    }

    public void setIdProf4ano(int idProf4ano) {
        this.idProf4ano = idProf4ano;
    }

    public int getIdProf5ano() {
        return idProf5ano;
    }

    public void setIdProf5ano(int idProf5ano) {
        this.idProf5ano = idProf5ano;
    }

    public int getIdProf6ano() {
        return idProf6ano;
    }

    public void setIdProf6ano(int idProf6ano) {
        this.idProf6ano = idProf6ano;
    }

    public int getIdProf7ano() {
        return idProf7ano;
    }

    public void setIdProf7ano(int idProf7ano) {
        this.idProf7ano = idProf7ano;
    }

    public int getIdProf8ano() {
        return idProf8ano;
    }

    public void setIdProf8ano(int idProf8ano) {
        this.idProf8ano = idProf8ano;
    }

    public int getIdProf9ano() {
        return idProf9ano;
    }

    public void setIdProf9ano(int idProf9ano) {
        this.idProf9ano = idProf9ano;
    }

    public int getIdProf1serie() {
        return idProf1serie;
    }

    public void setIdProf1serie(int idProf1serie) {
        this.idProf1serie = idProf1serie;
    }

    public int getIdProf2serie() {
        return idProf2serie;
    }

    public void setIdProf2serie(int idProf2serie) {
        this.idProf2serie = idProf2serie;
    }

    public int getIdProf3serie() {
        return idProf3serie;
    }

    public void setIdProf3serie(int idProf3serie) {
        this.idProf3serie = idProf3serie;
    }

    public SerieAnoForm getSerieAnoForm() {
        return serieAnoForm;
    }

    public void setSerieAnoForm(SerieAnoForm serieAnoForm) {
        this.serieAnoForm = serieAnoForm;
    }

    public DisciplinasForm getDisciplinasForm() {
        return disciplinasForm;
    }

    public void setDisciplinasForm(DisciplinasForm disciplinasForm) {
        this.disciplinasForm = disciplinasForm;
    }

    public PessoaFisicaForm getProfessor() {
        return professor;
    }

    public void setProfessor(PessoaFisicaForm professor) {
        this.professor = professor;
    }

    public ArrayList<PessoaFisicaForm> getListaProfessores() {
        return listaProfessores;
    }

    public void setListaProfessores(ArrayList<PessoaFisicaForm> listaProfessores) {
        this.listaProfessores = listaProfessores;
    }

    public int getIdDisciplinaProfessor() {
        return idDisciplinaProfessor;
    }

    public void setIdDisciplinaProfessor(int idDisciplinaProfessor) {
        this.idDisciplinaProfessor = idDisciplinaProfessor;
    }

    public int getSerieAno() {
        return serieAno;
    }

    public void setSerieAno(int serieAno) {
        this.serieAno = serieAno;
    }

    public int getIdProfessor() {
        return idProfessor;
    }

    public void setIdProfessor(int idProfessor) {
        this.idProfessor = idProfessor;
    }

    public void salvarProfessorSerieAno(Connection conn, String categoriaEnsino, String idDisciplina, int idProfessor, int serieAno) throws SQLException {
        //verificar se ja existe, se existe ele atualiza senao ele cadastra
        String querySelect = "select * from disciplina_professor d"
                + " where d.id_disciplina = ?"
                + " and d.categoria_ensino = ?"
                + " and d.serie_ano = ?";
        PreparedStatement prepSelect = conn.prepareStatement(querySelect);
        prepSelect.setString(1, idDisciplina);
        prepSelect.setString(2, categoriaEnsino);
        prepSelect.setInt(3, serieAno);
        ResultSet rs = prepSelect.executeQuery();
        if (rs.next()) {
            int id = rs.getInt("id");
            String queryUpdate = "UPDATE disciplina_professor SET id_professor=? WHERE id=?";
            PreparedStatement prep = conn.prepareStatement(queryUpdate);
            prep.setInt(1, idProfessor);
            prep.setInt(2, id);
            prep.execute();
        } else {
            String query = "INSERT INTO disciplina_professor (id_disciplina, categoria_ensino, serie_ano, id_professor) VALUES (?,?,?,?)";
            PreparedStatement prep = conn.prepareStatement(query);
            prep.setString(1, idDisciplina);
            prep.setString(2, categoriaEnsino);
            prep.setInt(3, serieAno);
            prep.setInt(4, idProfessor);
            prep.execute();
            prep.close();
        }
    }

    public List<DisciplinaProfessorForm> obterProfessoresCadastradoDisciplina(Connection conn, String categoriaEnsino, String idDisciplina) throws SQLException {
        List<DisciplinaProfessorForm> listaProfessoresCadastradoDisciplina = new ArrayList<>();
        String query = "select d.id_disciplina, d.categoria_ensino, d.serie_ano, d.id_professor, pf.nome "
                + " from disciplina_professor d, pessoa_fisica pf "
                + " where d.id_professor = pf.id "
                + " and d.categoria_ensino = ?"
                + " and d.id_disciplina = ?";

        PreparedStatement prep = conn.prepareStatement(query);
        prep.setString(1, categoriaEnsino);
        prep.setString(2, idDisciplina);
        ResultSet rs = prep.executeQuery();
        while (rs.next()) {
            DisciplinaProfessorForm disciplinaProfessorForm = new DisciplinaProfessorForm();
            disciplinaProfessorForm.setSerieAno(rs.getInt("serie_ano"));

            if (categoriaEnsino.equals("EF1")) {
                switch (disciplinaProfessorForm.getSerieAno()) {
                    case 1:
                        disciplinaProfessorForm.setIdProf1ano(rs.getInt("id_professor"));
                        break;
                    case 2:
                        disciplinaProfessorForm.setIdProf2ano(rs.getInt("id_professor"));
                        break;
                    case 3:
                        disciplinaProfessorForm.setIdProf3ano(rs.getInt("id_professor"));
                        break;
                    case 4:
                        disciplinaProfessorForm.setIdProf4ano(rs.getInt("id_professor"));
                        break;
                    case 5:
                        disciplinaProfessorForm.setIdProf5ano(rs.getInt("id_professor"));
                        break;
                    default:
                        break;
                }
            } else if (categoriaEnsino.equals("EF2")) {
                switch (disciplinaProfessorForm.getSerieAno()) {
                    case 6:
                        disciplinaProfessorForm.setIdProf6ano(rs.getInt("id_professor"));
                        break;
                    case 7:
                        disciplinaProfessorForm.setIdProf7ano(rs.getInt("id_professor"));
                        break;
                    case 8:
                        disciplinaProfessorForm.setIdProf8ano(rs.getInt("id_professor"));
                        break;
                    case 9:
                        disciplinaProfessorForm.setIdProf9ano(rs.getInt("id_professor"));
                        break;
                    default:
                        break;
                }
            } else if (categoriaEnsino.equals("EM")) {
                switch (disciplinaProfessorForm.getSerieAno()) {
                    case 10:
                        disciplinaProfessorForm.setIdProf1serie(rs.getInt("id_professor"));
                        break;
                    case 20:
                        disciplinaProfessorForm.setIdProf2serie(rs.getInt("id_professor"));
                        break;
                    case 30:
                        disciplinaProfessorForm.setIdProf3serie(rs.getInt("id_professor"));
                        break;
                    default:
                        break;
                }
            } else if (categoriaEnsino.equals("INF")) {
                switch (disciplinaProfessorForm.getSerieAno()) {
                    case 11:
                        disciplinaProfessorForm.setIdProfInfantilI(rs.getInt("id_professor"));
                        break;
                    case 12:
                        disciplinaProfessorForm.setIdProfInfantilII(rs.getInt("id_professor"));
                        break;
                    case 13:
                        disciplinaProfessorForm.setIdProfInfantilIII(rs.getInt("id_professor"));
                        break;
                    default:
                        break;
                }
            }

            listaProfessoresCadastradoDisciplina.add(disciplinaProfessorForm);
        }
        rs.close();
        prep.close();
        return listaProfessoresCadastradoDisciplina;
    }

    public int obterIdProfessorPorDiscSerie(Connection conn, int idDisciplina, int idSerieAno) throws SQLException {
        int idProfessor = 0;
        String query = "select d.id_professor from disciplina_professor d where d.id_disciplina = ? and d.serie_ano = ?";
        try ( PreparedStatement prep = conn.prepareStatement(query)) {
            prep.setInt(1, idDisciplina);
            prep.setInt(2, idSerieAno);
            ResultSet rs = prep.executeQuery();
            if (rs.next()) {
                idProfessor = rs.getInt("id_professor");
            }
            rs.close();
        }

        return idProfessor;
    }

    public String obterNomeProfessorPorDiscSerie(Connection conn, int idDisciplina, int idSerieAno) throws SQLException {
        String query = "select pf.nome from disciplina_professor d, pessoa_fisica pf "
                + " where d.id_professor = pf.id"
                + " and d.id_disciplina = ?"
                + " and d.serie_ano = ?";
        String nomeProfessor;
        try ( PreparedStatement prep = conn.prepareStatement(query)) {
            prep.setInt(1, idDisciplina);
            prep.setInt(2, idSerieAno);
            try ( ResultSet rs = prep.executeQuery()) {
                nomeProfessor = "";
                if (rs.next()) {
                    nomeProfessor = rs.getString("nome");
                }
            }
        }

        return nomeProfessor;
    }

    public List<String> obterNomesProfessorPorIdSerieBimestreDisciplina(Connection conn, int idSerieAno, int nrBimestre, int idDisciplina) throws SQLException {
        List<String> listaNomeProfessor = new ArrayList<>();
        String query = "select pf.nome"
                + " from lista_presenca l, pessoa_fisica pf, ano_vigente av"
                + " where l.id_professor = pf.id"
                + " and l.ano = av.ano_vigente"
                + " and l.id_serie = ? and l.nr_bimestre = ? and l.id_disciplina = ? group by l.id_professor";
        try ( PreparedStatement prep = conn.prepareStatement(query)) {
            prep.setInt(1, idSerieAno);
            prep.setInt(2, nrBimestre);
            prep.setInt(3, idDisciplina);
            try ( ResultSet rs = prep.executeQuery()) {
                while (rs.next()) {
                    listaNomeProfessor.add(rs.getString("nome"));
                }
            }
        }
        return listaNomeProfessor;
    }

}
