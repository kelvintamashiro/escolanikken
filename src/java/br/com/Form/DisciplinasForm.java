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
public class DisciplinasForm extends FormBasico {

    private int idDisciplina;
    private String nomeDisciplina;
    private String categoriaEnsino;
    private String dsCategoriaEnsino;
    private int pesoProducaoSala;
    private int pesoProvaMensal;
    private int pesoProvaBimestral;

    public int getIdDisciplina() {
        return idDisciplina;
    }

    public void setIdDisciplina(int idDisciplina) {
        this.idDisciplina = idDisciplina;
    }

    public String getNomeDisciplina() {
        return nomeDisciplina;
    }

    public void setNomeDisciplina(String nomeDisciplina) {
        this.nomeDisciplina = nomeDisciplina;
    }

    public String getCategoriaEnsino() {
        return categoriaEnsino;
    }

    public void setCategoriaEnsino(String categoriaEnsino) {
        this.categoriaEnsino = categoriaEnsino;
    }

    public String getDsCategoriaEnsino() {
        return dsCategoriaEnsino;
    }

    public void setDsCategoriaEnsino(String dsCategoriaEnsino) {
        this.dsCategoriaEnsino = dsCategoriaEnsino;
    }

    public int getPesoProducaoSala() {
        return pesoProducaoSala;
    }

    public void setPesoProducaoSala(int pesoProducaoSala) {
        this.pesoProducaoSala = pesoProducaoSala;
    }

    public int getPesoProvaMensal() {
        return pesoProvaMensal;
    }

    public void setPesoProvaMensal(int pesoProvaMensal) {
        this.pesoProvaMensal = pesoProvaMensal;
    }

    public int getPesoProvaBimestral() {
        return pesoProvaBimestral;
    }

    public void setPesoProvaBimestral(int pesoProvaBimestral) {
        this.pesoProvaBimestral = pesoProvaBimestral;
    }

    public void cadastrarDisciplina(Connection conn, DisciplinasForm disciplinasForm) throws SQLException {
        String query = "INSERT INTO disciplina (nome_disciplina, categoria_ensino, peso_producao_sala, peso_prova_mensal, peso_prova_bimestral) VALUES (?,?,?,?,?)";
        PreparedStatement prep = conn.prepareStatement(query);
        prep.setString(1, disciplinasForm.getNomeDisciplina());
        prep.setString(2, disciplinasForm.getCategoriaEnsino());
        prep.setInt(3, disciplinasForm.getPesoProducaoSala());
        prep.setInt(4, disciplinasForm.getPesoProvaMensal());
        prep.setInt(5, disciplinasForm.getPesoProvaBimestral());
        prep.execute();
        prep.close();
    }

    public List<DisciplinasForm> obterListaDisciplinasCadastradas(Connection conn) throws SQLException {
        String query = "select * from disciplina where status = 1 order by categoria_ensino, nome_disciplina";
        PreparedStatement prep = conn.prepareStatement(query);
        ResultSet rs = prep.executeQuery();
        List<DisciplinasForm> listaDisciplinas = new ArrayList<>();
        while (rs.next()) {
            DisciplinasForm disciplinasForm = new DisciplinasForm();
            disciplinasForm.setIdDisciplina(rs.getInt("id_disciplina"));
            disciplinasForm.setNomeDisciplina(rs.getString("nome_disciplina"));
            disciplinasForm.setCategoriaEnsino(rs.getString("categoria_ensino"));
            disciplinasForm.setPesoProducaoSala(rs.getInt("peso_producao_sala"));
            disciplinasForm.setPesoProvaMensal(rs.getInt("peso_prova_mensal"));
            disciplinasForm.setPesoProvaBimestral(rs.getInt("peso_prova_bimestral"));
            listaDisciplinas.add(disciplinasForm);
        }
        rs.close();
        prep.close();

        return listaDisciplinas;
    }

    public List<DisciplinasForm> obterListaDisciplinasPorCategoria(Connection conn, String categoriaEnsino) throws SQLException {
        String query = "select * from disciplina d"
                + " where d.categoria_ensino = ?"
                + " and d.status = 1"
                + " order by d.nome_disciplina";
        PreparedStatement prep = conn.prepareStatement(query);
        prep.setString(1, categoriaEnsino);
        ResultSet rs = prep.executeQuery();
        List<DisciplinasForm> listaDisciplinas = new ArrayList<>();
        while (rs.next()) {
            DisciplinasForm disciplinasForm = new DisciplinasForm();
            disciplinasForm.setIdDisciplina(rs.getInt("id_disciplina"));
            disciplinasForm.setNomeDisciplina(rs.getString("nome_disciplina"));
            disciplinasForm.setCategoriaEnsino(rs.getString("categoria_ensino"));
            disciplinasForm.setDsCategoriaEnsino(this.obterDsCategoriaEnsino(rs.getString("categoria_ensino")));
            disciplinasForm.setPesoProducaoSala(rs.getInt("peso_producao_sala"));
            disciplinasForm.setPesoProvaMensal(rs.getInt("peso_prova_mensal"));
            disciplinasForm.setPesoProvaBimestral(rs.getInt("peso_prova_bimestral"));
            listaDisciplinas.add(disciplinasForm);
        }
        rs.close();
        prep.close();

        return listaDisciplinas;
    }

    public List<DisciplinasForm> obterListaDisciplinasPorCategoriaSerie(Connection conn, String categoriaEnsino, int idSerie, int anoVigente) throws SQLException {
        StringBuilder sb = new StringBuilder();
        sb.append("select * from disciplina d");
        sb.append(" where d.categoria_ensino = ?");
        sb.append(" and d.status = 1 ");
        if (idSerie == 20) {
            sb.append(" and d.id_disciplina not in (14, 15)");
        } else if (idSerie == 30) {
            sb.append(" and d.id_disciplina not in (15)");
        } else if (idSerie == 2 || idSerie == 3 || idSerie == 4 || idSerie == 5) {
            sb.append(" and d.id_disciplina not in (60)");
        }
        
        sb.append(" order by d.nome_disciplina");
        PreparedStatement prep = conn.prepareStatement(sb.toString());
        prep.setString(1, categoriaEnsino);
        ResultSet rs = prep.executeQuery();
        List<DisciplinasForm> listaDisciplinas = new ArrayList<>();
        while (rs.next()) {
            DisciplinasForm disciplinasForm = new DisciplinasForm();
            disciplinasForm.setIdDisciplina(rs.getInt("id_disciplina"));
            disciplinasForm.setNomeDisciplina(rs.getString("nome_disciplina"));
            disciplinasForm.setCategoriaEnsino(rs.getString("categoria_ensino"));
            disciplinasForm.setDsCategoriaEnsino(this.obterDsCategoriaEnsino(rs.getString("categoria_ensino")));
            disciplinasForm.setPesoProducaoSala(rs.getInt("peso_producao_sala"));
            disciplinasForm.setPesoProvaMensal(rs.getInt("peso_prova_mensal"));
            disciplinasForm.setPesoProvaBimestral(rs.getInt("peso_prova_bimestral"));
            listaDisciplinas.add(disciplinasForm);
        }
        rs.close();
        prep.close();

        return listaDisciplinas;
    }

    public List<DisciplinasForm> obterListaDisciplinasPorCategoriaPorProfessor(Connection conn, String categoriaEnsino, int idPF, int idSerieAno) throws SQLException {
        String query = "select d.*"
                + " from disciplina_professor dp, disciplina d"
                + " where dp.id_disciplina = d.id_disciplina"
                + " and dp.id_professor = ?"
                + " and dp.categoria_ensino = ?"
                + " and dp.serie_ano = ?"
                + " and d.status = 1"
                + " group by dp.id_disciplina"
                + " order by nome_disciplina, serie_ano";

        PreparedStatement prep = conn.prepareStatement(query);
        prep.setInt(1, idPF);
        prep.setString(2, categoriaEnsino);
        prep.setInt(3, idSerieAno);
        ResultSet rs = prep.executeQuery();
        List<DisciplinasForm> listaDisciplinas = new ArrayList<>();
        while (rs.next()) {
            DisciplinasForm disciplinasForm = new DisciplinasForm();
            disciplinasForm.setIdDisciplina(rs.getInt("id_disciplina"));
            disciplinasForm.setNomeDisciplina(rs.getString("nome_disciplina"));
            disciplinasForm.setCategoriaEnsino(rs.getString("categoria_ensino"));
            disciplinasForm.setDsCategoriaEnsino(this.obterDsCategoriaEnsino(rs.getString("categoria_ensino")));
            disciplinasForm.setPesoProducaoSala(rs.getInt("peso_producao_sala"));
            disciplinasForm.setPesoProvaMensal(rs.getInt("peso_prova_mensal"));
            disciplinasForm.setPesoProvaBimestral(rs.getInt("peso_prova_bimestral"));
            listaDisciplinas.add(disciplinasForm);
        }
        rs.close();
        prep.close();

        return listaDisciplinas;
    }

    public DisciplinasForm obterDadosDisciplinaID(Connection conn, int idDisciplina) throws SQLException {
        String query = "select * from disciplina d where d.id_disciplina = ?";
        PreparedStatement prep = conn.prepareStatement(query);
        prep.setInt(1, idDisciplina);
        ResultSet rs = prep.executeQuery();
        DisciplinasForm disciplinasForm = new DisciplinasForm();
        if (rs.next()) {
            disciplinasForm.setIdDisciplina(rs.getInt("id_disciplina"));
            disciplinasForm.setNomeDisciplina(rs.getString("nome_disciplina"));
            disciplinasForm.setCategoriaEnsino(rs.getString("categoria_ensino"));
            disciplinasForm.setDsCategoriaEnsino(this.obterDsCategoriaEnsino(rs.getString("categoria_ensino")));
            disciplinasForm.setPesoProducaoSala(rs.getInt("peso_producao_sala"));
            disciplinasForm.setPesoProvaMensal(rs.getInt("peso_prova_mensal"));
            disciplinasForm.setPesoProvaBimestral(rs.getInt("peso_prova_bimestral"));
        }
        rs.close();
        prep.close();
        return disciplinasForm;
    }

    public void atualizar(Connection conn, DisciplinasForm disciplinasForm) throws SQLException {
        String query = "UPDATE disciplina SET nome_disciplina=?, categoria_ensino = ?, peso_producao_sala=?, peso_prova_mensal=?, peso_prova_bimestral=?"
                + " WHERE id_disciplina=?";
        PreparedStatement prep = conn.prepareStatement(query);
        prep.setString(1, disciplinasForm.getNomeDisciplina());
        prep.setString(2, disciplinasForm.getCategoriaEnsino());
        prep.setInt(3, disciplinasForm.getPesoProducaoSala());
        prep.setInt(4, disciplinasForm.getPesoProvaMensal());
        prep.setInt(5, disciplinasForm.getPesoProvaBimestral());
        prep.setInt(6, disciplinasForm.getIdDisciplina());
        prep.execute();
        prep.close();
    }

    public void excluir(Connection conn, int idDisciplina) throws SQLException {
        String query = "DELETE FROM disciplina WHERE id_disciplina=?";
        PreparedStatement prep = conn.prepareStatement(query);
        prep.setInt(1, idDisciplina);
        prep.execute();
        prep.close();
    }

    private String obterDsCategoriaEnsino(String categoriaEnsino) {
        switch (categoriaEnsino) {
            case "INF":
                return "Educação Infantil";
            case "EF1":
                return "Fundamental I";
            case "EF2":
                return "Fundamental II";
            default:
                return "Ensino Médio";
        }
    }

    public boolean isExisteNotaDisciplina(Connection conn, int idDisciplina) throws SQLException {
        boolean isExisteNotaDisciplina = false;
        String query = "select count(*) as qtd from nota_bimestre n where n.id_disciplina = ?";
        PreparedStatement prep = conn.prepareStatement(query);
        prep.setInt(1, idDisciplina);
        ResultSet rs = prep.executeQuery();
        if (rs.next()) {
            int qtd = rs.getInt("qtd");
            if (qtd > 0) {
                isExisteNotaDisciplina = true;
            }
        }
        rs.close();
        prep.close();

        return isExisteNotaDisciplina;
    }

}
