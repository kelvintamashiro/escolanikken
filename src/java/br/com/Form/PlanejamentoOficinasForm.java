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
public class PlanejamentoOficinasForm extends FormBasico {

    private int idPlanejamento;
    private int idProfessor;
    private String nomeProfessor;
    private String nomeOficina;
    private int idSerieAno;
    private String dsSerieAno;
    private int nrBimestre;
    private String categoriaEnsino;
    private String data;
    private String conteudo;
    private String objetivo;
    private String descricao;
    private String observacao;
    private int confirmar;
    private int vistado;
    private int anoVigente;
    private String[] selectedOptions;

    public String[] getSelectedOptions() {
        return selectedOptions;
    }

    public void setSelectedOptions(String[] selectedOptions) {
        this.selectedOptions = selectedOptions;
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

    public String getNomeOficina() {
        return nomeOficina;
    }

    public void setNomeOficina(String nomeOficina) {
        this.nomeOficina = nomeOficina;
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

    public String getCategoriaEnsino() {
        return categoriaEnsino;
    }

    public void setCategoriaEnsino(String categoriaEnsino) {
        this.categoriaEnsino = categoriaEnsino;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    public String getConteudo() {
        return conteudo;
    }

    public void setConteudo(String conteudo) {
        this.conteudo = conteudo;
    }

    public String getObjetivo() {
        return objetivo;
    }

    public void setObjetivo(String objetivo) {
        this.objetivo = objetivo;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public String getObservacao() {
        return observacao;
    }

    public void setObservacao(String observacao) {
        this.observacao = observacao;
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

    public int getAnoVigente() {
        return anoVigente;
    }

    public void setAnoVigente(int anoVigente) {
        this.anoVigente = anoVigente;
    }

    public void salvar(Connection conn, PlanejamentoOficinasForm planoOficinaForm) throws SQLException {
        String query = "INSERT INTO planejamento_oficina (id_professor, serie_ano, nr_bimestre, nome_oficina, data, conteudo_aula, objetivo, observacao) VALUES (?,?,?,?,?,?,?,?);";
        try (PreparedStatement prep = conn.prepareStatement(query)) {
            prep.setInt(1, planoOficinaForm.getIdProfessor());
            prep.setString(2, planoOficinaForm.getDsSerieAno());
            prep.setInt(3, planoOficinaForm.getNrBimestre());
            prep.setString(4, planoOficinaForm.getNomeOficina());
            prep.setString(5, planoOficinaForm.getData());
            prep.setString(6, planoOficinaForm.getConteudo());
            prep.setString(7, planoOficinaForm.getObjetivo());
            prep.setString(8, planoOficinaForm.getObservacao());
            prep.execute();
        }
    }

    public List<PlanejamentoOficinasForm> obterListaPlanejamentoOficinaPorProfessor(Connection conn, PlanejamentoOficinasForm planoOficinaForm) throws SQLException {
        List<PlanejamentoOficinasForm> listaPlanoOficina = new ArrayList<>();
        StringBuilder sb = new StringBuilder();
        sb.append(" select p.*, pf.nome from planejamento_oficina p, pessoa_fisica pf ");
        sb.append(" where p.id_professor = pf.id");
        sb.append(" and p.id_professor = ? ");
        if (planoOficinaForm.getNrBimestre() > 0) {
            sb.append(" and p.nr_bimestre = ").append(planoOficinaForm.getNrBimestre());
        }
        sb.append(" order by data desc");
        try (PreparedStatement prep = conn.prepareStatement(sb.toString())) {
            prep.setInt(1, idProfessor);
            try (ResultSet rs = prep.executeQuery()) {
                while (rs.next()) {
                    PlanejamentoOficinasForm planoOficina = new PlanejamentoOficinasForm();
                    planoOficina.setIdPlanejamento(rs.getInt("id"));
                    planoOficina.setIdProfessor(rs.getInt("id_professor"));
                    planoOficina.setNomeProfessor(rs.getString("nome"));
                    planoOficina.setNrBimestre(rs.getInt("nr_bimestre"));
                    planoOficina.setNomeOficina(rs.getString("nome_oficina"));
                    planoOficina.setData(IDRDate.formatSQLDate(rs.getString("data")));
                    planoOficina.setConteudo(rs.getString("conteudo_aula"));
                    planoOficina.setObjetivo(rs.getString("objetivo"));
                    planoOficina.setObservacao(rs.getString("observacao"));
                    String idSeries = rs.getString("serie_ano");
                    String dsSerieAno = this.obterDsSerieAno(conn, idSeries);
                    planoOficina.setDsSerieAno(dsSerieAno);

                    listaPlanoOficina.add(planoOficina);
                }
            }
        }

        return listaPlanoOficina;
    }

    private String obterDsSerieAno(Connection conn, String idSeries) throws SQLException {
        String serieAno = "";
        String query = "select d.descricao from descricao_serie_ano d where d.id in (" + idSeries + ") order by ordem";
        try (PreparedStatement prep = conn.prepareStatement(query)) {
//            prep.setString(1, idSeries);
            try (ResultSet rs = prep.executeQuery()) {
                while (rs.next()) {
                    serieAno = serieAno + rs.getString("descricao") + ", ";
                }
            }
            serieAno = serieAno.substring(0, serieAno.length() - 2);
        }

        return serieAno;
    }

    public PlanejamentoOficinasForm obterPlanoOficinaPorID(Connection conn, int idPlanejamento) throws SQLException {
        PlanejamentoOficinasForm planoOficina = new PlanejamentoOficinasForm();
        StringBuilder sb = new StringBuilder();
        sb.append(" select * from planejamento_oficina p ");
        sb.append(" where p.id = ?");
        try (PreparedStatement prep = conn.prepareStatement(sb.toString())) {
            prep.setInt(1, idPlanejamento);
            try (ResultSet rs = prep.executeQuery()) {
                while (rs.next()) {
                    planoOficina.setIdPlanejamento(rs.getInt("id"));
                    planoOficina.setIdProfessor(rs.getInt("id_professor"));
                    planoOficina.setNrBimestre(rs.getInt("nr_bimestre"));
                    planoOficina.setNomeOficina(rs.getString("nome_oficina"));
                    planoOficina.setData(IDRDate.formatSQLDate(rs.getString("data")));
                    planoOficina.setConteudo(rs.getString("conteudo_aula"));
                    planoOficina.setObjetivo(rs.getString("objetivo"));
                    planoOficina.setObservacao(rs.getString("observacao"));
                    String idSeries = rs.getString("serie_ano");
                    String[] listaSeries = idSeries.split(",");
                    planoOficina.setSelectedOptions(listaSeries);
                }
            }
        }

        return planoOficina;
    }

    public void excluir(Connection conn, int idPlanejamento) throws SQLException {
        String query = "DELETE FROM planejamento_oficina WHERE id=?";
        try (PreparedStatement prep = conn.prepareStatement(query)) {
            prep.setInt(1, idPlanejamento);
            prep.execute();
        }
    }

    public void atualizar(Connection conn, PlanejamentoOficinasForm planoOficinaForm) throws SQLException {
        String query = "UPDATE planejamento_oficina SET serie_ano=?, nr_bimestre=?, nome_oficina=?, data=?, conteudo_aula=?, objetivo=?, observacao=?"
                + " WHERE id=?";
        PreparedStatement prep = conn.prepareStatement(query);
        prep.setString(1, planoOficinaForm.getDsSerieAno());
        prep.setInt(2, planoOficinaForm.getNrBimestre());
        prep.setString(3, planoOficinaForm.getNomeOficina());
        prep.setString(4, IDRDate.parseDataIso(planoOficinaForm.getData()));
        prep.setString(5, planoOficinaForm.getConteudo());
        prep.setString(6, planoOficinaForm.getObjetivo());
        prep.setString(7, planoOficinaForm.getObservacao());
        prep.setInt(8, planoOficinaForm.getIdPlanejamento());
        prep.execute();
    }

}
