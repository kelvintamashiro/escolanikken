/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.Form;

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
public class PlanejamentoAulasForm extends FormBasico {

    private int idPlanejamento;
    private int idProfessor;
    private String nomeProfessor;
    private int idDisciplina;
    private String nomeDisciplina;
    private int idSerieAno;
    private String dsSerieAno;
    private int nrBimestre;
    private String categoriaEnsino;
    private String data;
    private String metodologia;
    private String recurso;
    private String tarefa;
    private String avaliacao;
    private String conteudoAula;
    private String observacao;
    private int confirmar;
    private int vistado;
    private int anoVigente;

    public int getAnoVigente() {
        return anoVigente;
    }

    public void setAnoVigente(int anoVigente) {
        this.anoVigente = anoVigente;
    }

    public int getConfirmar() {
        return confirmar;
    }

    public void setConfirmar(int confirmar) {
        this.confirmar = confirmar;
    }

    public int getVistado() {
        return vistado;
    }

    public void setVistado(int vistado) {
        this.vistado = vistado;
    }

    public String getCategoriaEnsino() {
        return categoriaEnsino;
    }

    public void setCategoriaEnsino(String categoriaEnsino) {
        this.categoriaEnsino = categoriaEnsino;
    }

    public int getIdPlanejamento() {
        return idPlanejamento;
    }

    public void setIdPlanejamento(int idPlanejamento) {
        this.idPlanejamento = idPlanejamento;
    }

    public int getIdProfessor() {
        return idProfessor;
    }

    public void setIdProfessor(int idProfessor) {
        this.idProfessor = idProfessor;
    }

    public String getNomeProfessor() {
        return nomeProfessor;
    }

    public void setNomeProfessor(String nomeProfessor) {
        this.nomeProfessor = nomeProfessor;
    }

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

    public int getNrBimestre() {
        return nrBimestre;
    }

    public void setNrBimestre(int nrBimestre) {
        this.nrBimestre = nrBimestre;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    public String getMetodologia() {
        return metodologia;
    }

    public void setMetodologia(String metodologia) {
        this.metodologia = metodologia;
    }

    public String getRecurso() {
        return recurso;
    }

    public void setRecurso(String recurso) {
        this.recurso = recurso;
    }

    public String getTarefa() {
        return tarefa;
    }

    public void setTarefa(String tarefa) {
        this.tarefa = tarefa;
    }

    public String getAvaliacao() {
        return avaliacao;
    }

    public void setAvaliacao(String avaliacao) {
        this.avaliacao = avaliacao;
    }

    public String getConteudoAula() {
        return conteudoAula;
    }

    public void setConteudoAula(String conteudoAula) {
        this.conteudoAula = conteudoAula;
    }

    public String getObservacao() {
        return observacao;
    }

    public void setObservacao(String observacao) {
        this.observacao = observacao;
    }

    public List<PlanejamentoAulasForm> obterDisciplinasPorProfessor(Connection conn, String idProfessor, String categoriaEnsino) throws SQLException {
        List<PlanejamentoAulasForm> listaDisciplinaPorProfessor = new ArrayList<>();
        String query = "select dp.id_disciplina, dp.categoria_ensino, d.nome_disciplina"
                + " from disciplina_professor dp, disciplina d"
                + " where dp.id_disciplina = d.id_disciplina"
                + " and dp.id_professor = ?"
                + " and dp.categoria_ensino = ?"
                + " group by dp.id_disciplina"
                + " order by nome_disciplina, serie_ano";
        PreparedStatement prep = conn.prepareStatement(query);
        prep.setString(1, idProfessor);
        prep.setString(2, categoriaEnsino);
        ResultSet rs = prep.executeQuery();
        while (rs.next()) {
            PlanejamentoAulasForm planejamentoAula = new PlanejamentoAulasForm();
            planejamentoAula.setIdDisciplina(rs.getInt("id_disciplina"));
            planejamentoAula.setNomeDisciplina(rs.getString("nome_disciplina"));

            listaDisciplinaPorProfessor.add(planejamentoAula);
        }
        rs.close();
        prep.close();

        return listaDisciplinaPorProfessor;
    }

    public void salvar(Connection conn, PlanejamentoAulasForm planoAulaForm) throws SQLException {
        String query = "INSERT INTO planejamento_aula (id_professor, id_disciplina, serie_ano, nr_bimestre, data, metodologia, recurso, "
                + " tarefa, avaliacao, conteudo_aula, observacao) "
                + " VALUES (?,?,?,?,?,?,?,?,?,?,?)";
        try (PreparedStatement prep = conn.prepareStatement(query)) {
            prep.setInt(1, planoAulaForm.getIdProfessor());
            prep.setInt(2, planoAulaForm.getIdDisciplina());
            prep.setInt(3, planoAulaForm.getIdSerieAno());
            prep.setInt(4, planoAulaForm.getNrBimestre());
            prep.setString(5, planoAulaForm.getData());
            prep.setString(6, planoAulaForm.getMetodologia());
            prep.setString(7, planoAulaForm.getRecurso());
            prep.setString(8, planoAulaForm.getTarefa());
            prep.setString(9, planoAulaForm.getAvaliacao());
            prep.setString(10, planoAulaForm.getConteudoAula());
            prep.setString(11, planoAulaForm.getObservacao());
            prep.execute();
        }

    }

    public List<PlanejamentoAulasForm> obterListaPlanoAulasPorProfessor(Connection conn, String idProfessor) throws SQLException {
        List<PlanejamentoAulasForm> listaPlanoAulas = new ArrayList<>();
        String query = "select a.*, d.nome_disciplina, pf.nome"
                + " from planejamento_aula a, disciplina d, pessoa_fisica pf, ano_vigente av"
                + " where a.id_disciplina = d.id_disciplina"
                + " and a.id_professor = pf.id"
                + " and a.ano_vigente = av.ano_vigente"
                + " and a.id_professor = ?"
                + " order by a.data desc, d.nome_disciplina";

        try (PreparedStatement prep = conn.prepareStatement(query)) {
            prep.setString(1, idProfessor);
            try (ResultSet rs = prep.executeQuery()) {
                while (rs.next()) {
                    PlanejamentoAulasForm planoAulaForm = new PlanejamentoAulasForm();
                    planoAulaForm.setIdPlanejamento(rs.getInt("id"));
                    planoAulaForm.setIdProfessor(rs.getInt("id_professor"));
                    planoAulaForm.setNomeProfessor(rs.getString("nome"));
                    planoAulaForm.setIdDisciplina(rs.getInt("id_disciplina"));
                    planoAulaForm.setIdSerieAno(rs.getInt("serie_ano"));
                    planoAulaForm.setNrBimestre(rs.getInt("nr_bimestre"));
                    planoAulaForm.setData(IDRDate.formatSQLDate(rs.getString("data")));
                    planoAulaForm.setMetodologia(rs.getString("metodologia"));
                    planoAulaForm.setRecurso(rs.getString("recurso"));
                    planoAulaForm.setTarefa(rs.getString("tarefa"));
                    planoAulaForm.setAvaliacao(rs.getString("avaliacao"));
                    planoAulaForm.setConteudoAula(rs.getString("conteudo_aula"));
                    planoAulaForm.setObservacao(rs.getString("observacao"));
                    planoAulaForm.setNomeDisciplina(rs.getString("nome_disciplina"));
                    planoAulaForm.setConfirmar(rs.getInt("confirmar"));
                    planoAulaForm.setVistado(rs.getInt("vistado"));

                    listaPlanoAulas.add(planoAulaForm);
                }
            }
        }

        return listaPlanoAulas;
    }

    public List<PlanejamentoAulasForm> obterListaPlanoAulasPorProfessorBimestre(Connection conn, PlanejamentoAulasForm planejamentoAulasForm) throws SQLException {
        List<PlanejamentoAulasForm> listaPlanoAulas = new ArrayList<>();
        StringBuilder sb = new StringBuilder();
        sb.append(" select a.*, d.nome_disciplina, pf.nome");
        sb.append(" from planejamento_aula a, disciplina d, pessoa_fisica pf");
        sb.append(" where a.id_disciplina = d.id_disciplina");
        sb.append(" and a.id_professor = pf.id");
        sb.append(" and a.id_professor = ?");
        if (planejamentoAulasForm.getNrBimestre() > 0) {
            sb.append(" and a.nr_bimestre = ").append(planejamentoAulasForm.getNrBimestre());
        }
        if (planejamentoAulasForm.getIdSerieAno() > 0) {
            sb.append(" and a.serie_ano = ").append(planejamentoAulasForm.getIdSerieAno());
        }
        if (planejamentoAulasForm.getIdDisciplina() > 0) {
            sb.append(" and a.id_disciplina = ").append(planejamentoAulasForm.getIdDisciplina());
        }
        sb.append(" and a.ano_vigente = ?");
        sb.append(" order by a.data desc, d.nome_disciplina");

        try (PreparedStatement prep = conn.prepareStatement(sb.toString())) {
            prep.setInt(1, planejamentoAulasForm.getIdProfessor());
            prep.setInt(2, planejamentoAulasForm.getAnoVigente());
            try (ResultSet rs = prep.executeQuery()) {
                while (rs.next()) {
                    PlanejamentoAulasForm planoAulaForm = new PlanejamentoAulasForm();
                    planoAulaForm.setIdPlanejamento(rs.getInt("id"));
                    planoAulaForm.setIdProfessor(rs.getInt("id_professor"));
                    planoAulaForm.setNomeProfessor(rs.getString("nome"));
                    planoAulaForm.setIdDisciplina(rs.getInt("id_disciplina"));
                    planoAulaForm.setIdSerieAno(rs.getInt("serie_ano"));
                    planoAulaForm.setNrBimestre(rs.getInt("nr_bimestre"));
                    planoAulaForm.setData(IDRDate.formatSQLDate(rs.getString("data")));
                    planoAulaForm.setMetodologia(rs.getString("metodologia"));
                    planoAulaForm.setRecurso(rs.getString("recurso"));
                    planoAulaForm.setTarefa(rs.getString("tarefa"));
                    planoAulaForm.setAvaliacao(rs.getString("avaliacao"));
                    planoAulaForm.setConteudoAula(rs.getString("conteudo_aula"));
                    planoAulaForm.setObservacao(rs.getString("observacao"));
                    planoAulaForm.setNomeDisciplina(rs.getString("nome_disciplina"));
                    planoAulaForm.setConfirmar(rs.getInt("confirmar"));
                    planoAulaForm.setVistado(rs.getInt("vistado"));

                    listaPlanoAulas.add(planoAulaForm);
                }
            }
        }

        return listaPlanoAulas;
    }

    public List<PlanejamentoAulasForm> obterListaPlanoAulas(Connection conn) throws SQLException {
        List<PlanejamentoAulasForm> listaPlanoAulas = new ArrayList<>();
        String query = "select a.*, d.nome_disciplina, pf.nome"
                + " from planejamento_aula a, disciplina d, pessoa_fisica pf"
                + " where a.id_disciplina = d.id_disciplina"
                + " and a.id_professor = pf.id"
                + " order by a.data desc, d.nome_disciplina";

        try (PreparedStatement prep = conn.prepareStatement(query)) {
            try (ResultSet rs = prep.executeQuery()) {
                while (rs.next()) {
                    PlanejamentoAulasForm planoAulaForm = new PlanejamentoAulasForm();
                    planoAulaForm.setIdPlanejamento(rs.getInt("id"));
                    planoAulaForm.setIdProfessor(rs.getInt("id_professor"));
                    planoAulaForm.setNomeProfessor(rs.getString("nome"));
                    planoAulaForm.setIdDisciplina(rs.getInt("id_disciplina"));
                    planoAulaForm.setIdSerieAno(rs.getInt("serie_ano"));
                    planoAulaForm.setNrBimestre(rs.getInt("nr_bimestre"));
                    planoAulaForm.setData(IDRDate.formatSQLDate(rs.getString("data")));
                    planoAulaForm.setMetodologia(rs.getString("metodologia"));
                    planoAulaForm.setRecurso(rs.getString("recurso"));
                    planoAulaForm.setTarefa(rs.getString("tarefa"));
                    planoAulaForm.setAvaliacao(rs.getString("avaliacao"));
                    planoAulaForm.setConteudoAula(rs.getString("conteudo_aula"));
                    planoAulaForm.setObservacao(rs.getString("observacao"));
                    planoAulaForm.setNomeDisciplina(rs.getString("nome_disciplina"));
                    planoAulaForm.setConfirmar(rs.getInt("confirmar"));
                    planoAulaForm.setVistado(rs.getInt("vistado"));

                    listaPlanoAulas.add(planoAulaForm);
                }
            }
        }

        return listaPlanoAulas;
    }

    public PlanejamentoAulasForm obterPlanoAulaPorID(Connection conn, int idPlanejamento) throws SQLException {
        String query = "select a.*, d.nome_disciplina, s.descricao"
                + " from planejamento_aula a, disciplina d, descricao_serie_ano s"
                + " where a.id_disciplina = d.id_disciplina"
                + " and a.serie_ano = s.id"
                + " and a.id = ?";
        PlanejamentoAulasForm planoAulaForm;
        try (PreparedStatement prep = conn.prepareStatement(query)) {
            prep.setInt(1, idPlanejamento);
            try (ResultSet rs = prep.executeQuery()) {
                planoAulaForm = new PlanejamentoAulasForm();
                if (rs.next()) {
                    planoAulaForm.setIdPlanejamento(rs.getInt("id"));
                    planoAulaForm.setIdProfessor(rs.getInt("id_professor"));
                    planoAulaForm.setIdDisciplina(rs.getInt("id_disciplina"));
                    planoAulaForm.setNomeDisciplina(rs.getString("nome_disciplina"));
                    planoAulaForm.setIdSerieAno(rs.getInt("serie_ano"));
                    planoAulaForm.setDsSerieAno(rs.getString("descricao"));
                    planoAulaForm.setNrBimestre(rs.getInt("nr_bimestre"));
                    planoAulaForm.setData(IDRDate.formatSQLDate(rs.getString("data")));
                    planoAulaForm.setMetodologia(rs.getString("metodologia"));
                    planoAulaForm.setRecurso(rs.getString("recurso"));
                    planoAulaForm.setTarefa(rs.getString("tarefa"));
                    planoAulaForm.setAvaliacao(rs.getString("avaliacao"));
                    planoAulaForm.setConteudoAula(rs.getString("conteudo_aula"));
                    planoAulaForm.setObservacao(rs.getString("observacao"));
                    planoAulaForm.setConfirmar(rs.getInt("confirmar"));
                    planoAulaForm.setVistado(rs.getInt("vistado"));
                }
            }
        }
        return planoAulaForm;
    }

    public void excluir(Connection conn, int idPlanejamento) throws SQLException {
        String query = "DELETE FROM planejamento_aula WHERE id=?";
        try (PreparedStatement prep = conn.prepareStatement(query)) {
            prep.setInt(1, idPlanejamento);
            prep.execute();
        }
    }

    public void atualizar(Connection conn, PlanejamentoAulasForm planoAulaForm) throws SQLException {
        String query = "UPDATE planejamento_aula SET nr_bimestre=?, data=?, metodologia=?,"
                + " recurso=?, tarefa=?, avaliacao=?, conteudo_aula=?, observacao=?"
                + " WHERE id=?";
        try (PreparedStatement prep = conn.prepareStatement(query)) {
            prep.setInt(1, planoAulaForm.getNrBimestre());
            prep.setString(2, IDRDate.parseDataIso(planoAulaForm.getData()));
            prep.setString(3, planoAulaForm.getMetodologia());
            prep.setString(4, planoAulaForm.getRecurso());
            prep.setString(5, planoAulaForm.getTarefa());
            prep.setString(6, planoAulaForm.getAvaliacao());
            prep.setString(7, planoAulaForm.getConteudoAula());
            prep.setString(8, planoAulaForm.getObservacao());
            prep.setInt(9, planoAulaForm.getIdPlanejamento());
            prep.execute();
        }
    }

    public void confirmar(Connection conn, PlanejamentoAulasForm planoAulaForm) throws SQLException {
        String query = "UPDATE planejamento_aula SET confirmar=1 WHERE id=?";
        try (PreparedStatement prep = conn.prepareStatement(query)) {
            prep.setInt(1, planoAulaForm.getIdPlanejamento());
            prep.execute();
        }
    }

    public void vistarDiretoria(Connection conn, PlanejamentoAulasForm planoAulaForm) throws SQLException {
        String query = "UPDATE planejamento_aula SET vistado=1 WHERE id=?";
        try (PreparedStatement prep = conn.prepareStatement(query)) {
            prep.setInt(1, planoAulaForm.getIdPlanejamento());
            prep.execute();
        }
    }

    public List<PlanejamentoAulasForm> obterDisciplinasPorProfessorSerie(Connection conn, PlanejamentoAulasForm planoAulaForm) throws SQLException {
        List<PlanejamentoAulasForm> listaDisciplinaPorProfessor = new ArrayList<>();
        String query = "select dp.id_disciplina, d.nome_disciplina"
                + " from disciplina_professor dp, disciplina d"
                + " where dp.id_disciplina = d.id_disciplina"
                + " and dp.id_professor = ?"
                + " and dp.serie_ano = ?"
                + " order by d.nome_disciplina";
        PreparedStatement prep = conn.prepareStatement(query);
        prep.setInt(1, planoAulaForm.getIdProfessor());
        prep.setInt(2, planoAulaForm.getIdSerieAno());
        ResultSet rs = prep.executeQuery();
        while (rs.next()) {
            PlanejamentoAulasForm planejamentoAula = new PlanejamentoAulasForm();
            planejamentoAula.setIdDisciplina(rs.getInt("id_disciplina"));
            planejamentoAula.setNomeDisciplina(rs.getString("nome_disciplina"));

            listaDisciplinaPorProfessor.add(planejamentoAula);
        }
        rs.close();
        prep.close();

        return listaDisciplinaPorProfessor;
    }

}
