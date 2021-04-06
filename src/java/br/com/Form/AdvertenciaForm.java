/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.Form;

import br.com.CriptoDecripto;
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
public class AdvertenciaForm extends FormBasico {

    private int idAdvertencia;
    private String idAdvertenciaCripto;
    private String dsTipoAdvertencia;
    private List<AlunoForm> listaAlunos;
    private String nomeAluno;
    private int idAluno;
    private int idSerieAno;
    private String dsSerieAno;
    private String dsCategoriaSerie;
    private String observacao;
    private String dataAdvertencia;
    private String dataPorExtenso;
    private String[] selectedOptions;

    public String getIdAdvertenciaCripto() {
        return idAdvertenciaCripto;
    }

    public void setIdAdvertenciaCripto(String idAdvertenciaCripto) {
        this.idAdvertenciaCripto = idAdvertenciaCripto;
    }

    public String getDataPorExtenso() {
        return dataPorExtenso;
    }

    public void setDataPorExtenso(String dataPorExtenso) {
        this.dataPorExtenso = dataPorExtenso;
    }

    public int getIdAdvertencia() {
        return idAdvertencia;
    }

    public void setIdAdvertencia(int idAdvertencia) {
        this.idAdvertencia = idAdvertencia;
    }

    public String getDsTipoAdvertencia() {
        return dsTipoAdvertencia;
    }

    public void setDsTipoAdvertencia(String dsTipoAdvertencia) {
        this.dsTipoAdvertencia = dsTipoAdvertencia;
    }

    public String[] getSelectedOptions() {
        return selectedOptions;
    }

    public void setSelectedOptions(String[] selectedOptions) {
        this.selectedOptions = selectedOptions;
    }

    public List<AlunoForm> getListaAlunos() {
        return listaAlunos;
    }

    public void setListaAlunos(List<AlunoForm> listaAlunos) {
        this.listaAlunos = listaAlunos;
    }

    public String getNomeAluno() {
        return nomeAluno;
    }

    public void setNomeAluno(String nomeAluno) {
        this.nomeAluno = nomeAluno;
    }

    public int getIdAluno() {
        return idAluno;
    }

    public void setIdAluno(int idAluno) {
        this.idAluno = idAluno;
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

    public String getDsCategoriaSerie() {
        return dsCategoriaSerie;
    }

    public void setDsCategoriaSerie(String dsCategoriaSerie) {
        this.dsCategoriaSerie = dsCategoriaSerie;
    }

    public String getObservacao() {
        return observacao;
    }

    public void setObservacao(String observacao) {
        this.observacao = observacao;
    }

    public String getDataAdvertencia() {
        return dataAdvertencia;
    }

    public void setDataAdvertencia(String dataAdvertencia) {
        this.dataAdvertencia = dataAdvertencia;
    }

    public List<AdvertenciaForm> obterListaAdvertencia(Connection conn) throws SQLException {
        List<AdvertenciaForm> listaAdvertencias = new ArrayList<>();
        String query = "select * from advertencia order by id";
        PreparedStatement prep = conn.prepareStatement(query);
        ResultSet rs = prep.executeQuery();
        while (rs.next()) {
            AdvertenciaForm advForm = new AdvertenciaForm();
            advForm.setIdAdvertencia(rs.getInt("id"));
            advForm.setDsTipoAdvertencia(rs.getString("descricao"));
            listaAdvertencias.add(advForm);
        }
        rs.close();
        prep.close();

        return listaAdvertencias;
    }

    public void salvarAdvertencia(Connection conn, AdvertenciaForm advertenciaForm, String idAdvertencias) throws SQLException {
        String query = "INSERT INTO advertencia_aluno (id_aluno, id_serie_ano, id_advertencia, observacao, data_advertencia) VALUES (?,?,?,?, ?)";
        PreparedStatement prep = conn.prepareStatement(query);
        prep.setInt(1, advertenciaForm.getIdAluno());
        prep.setInt(2, advertenciaForm.getIdSerieAno());
        prep.setString(3, idAdvertencias);
        prep.setString(4, advertenciaForm.getObservacao());
        prep.setString(5, advertenciaForm.getDataAdvertencia());
        prep.execute();
        prep.close();
    }

    public List<AdvertenciaForm> obterListaAdvertenciasAlunos(Connection conn) throws SQLException {
        String query = "select a.id, a.id_aluno, a.id_serie_ano, a.id_advertencia, a.observacao, a.data_advertencia, pf.nome, d.descricao"
                + " from advertencia_aluno a, pessoa_fisica pf, descricao_serie_ano d"
                + " where a.id_aluno = pf.id"
                + " and a.id_serie_ano = d.id"
                + " order by a.data_advertencia desc";
        PreparedStatement prep = conn.prepareStatement(query);
        ResultSet rs = prep.executeQuery();
        List<AdvertenciaForm> listaAdvertencias = new ArrayList<>();
        while (rs.next()) {
            AdvertenciaForm advForm = new AdvertenciaForm();
            advForm.setIdAdvertencia(rs.getInt("id"));
            advForm.setIdAluno(rs.getInt("id_aluno"));
            advForm.setIdSerieAno(rs.getInt("id_serie_ano"));
            advForm.setNomeAluno(rs.getString("nome"));
            advForm.setObservacao(rs.getString("observacao"));
            advForm.setDataAdvertencia(IDRDate.formatSQLDate(rs.getString("data_advertencia")));
            advForm.setDsSerieAno(rs.getString("descricao"));
            //obter descricao advertencias
            advForm.setDsTipoAdvertencia(this.obterDescricaoTipoAdvertencia(conn, rs.getString("id_advertencia")));

            listaAdvertencias.add(advForm);
        }
        rs.close();
        prep.close();

        return listaAdvertencias;
    }
    
    public List<AdvertenciaForm> obterListaAdvertenciasAlunos(Connection conn, int idAluno) throws SQLException {
        String query = "select a.id, a.id_aluno, a.id_serie_ano, a.id_advertencia, a.observacao, a.data_advertencia, pf.nome, d.descricao"
                + " from advertencia_aluno a, pessoa_fisica pf, descricao_serie_ano d"
                + " where a.id_aluno = pf.id"
                + " and a.id_serie_ano = d.id"
                + " and a.id_aluno = ?"
                + " order by a.data_advertencia desc";
        PreparedStatement prep = conn.prepareStatement(query);
        prep.setInt(1, idAluno);
        ResultSet rs = prep.executeQuery();
        List<AdvertenciaForm> listaAdvertencias = new ArrayList<>();
        while (rs.next()) {
            AdvertenciaForm advForm = new AdvertenciaForm();
            advForm.setIdAdvertencia(rs.getInt("id"));
            
            CriptoDecripto criptoDecripto = new CriptoDecripto();
            String idCripto = criptoDecripto.cripto(rs.getString("id"));
            advForm.setIdAdvertenciaCripto(idCripto);
            
            advForm.setIdAluno(rs.getInt("id_aluno"));
            advForm.setIdSerieAno(rs.getInt("id_serie_ano"));
            advForm.setNomeAluno(rs.getString("nome"));
            advForm.setObservacao(rs.getString("observacao"));
            advForm.setDataAdvertencia(IDRDate.formatSQLDate(rs.getString("data_advertencia")));
            advForm.setDsSerieAno(rs.getString("descricao"));
            //obter descricao advertencias
            advForm.setDsTipoAdvertencia(this.obterDescricaoTipoAdvertencia(conn, rs.getString("id_advertencia")));

            listaAdvertencias.add(advForm);
        }
        rs.close();
        prep.close();

        return listaAdvertencias;
    }

    public AdvertenciaForm obterListaAdvertenciasPorID(Connection conn, String idAdvertencia) throws SQLException {
        String query = "select a.id, a.id_aluno, a.id_serie_ano, a.id_advertencia, a.observacao, a.data_advertencia, pf.nome, d.descricao, d.categoria"
                + " from advertencia_aluno a, pessoa_fisica pf, descricao_serie_ano d"
                + " where a.id_aluno = pf.id"
                + " and a.id_serie_ano = d.id"
                + " and a.id = ?"
                + " order by a.data_advertencia desc";
        PreparedStatement prep = conn.prepareStatement(query);
        prep.setString(1, idAdvertencia);
        ResultSet rs = prep.executeQuery();
        AdvertenciaForm advForm = new AdvertenciaForm();
        if (rs.next()) {
            advForm.setIdAdvertencia(rs.getInt("id"));
            advForm.setIdAluno(rs.getInt("id_aluno"));
            advForm.setIdSerieAno(rs.getInt("id_serie_ano"));
            advForm.setNomeAluno(rs.getString("nome"));
            advForm.setObservacao(rs.getString("observacao"));
            advForm.setDataAdvertencia(rs.getString("data_advertencia"));
            advForm.setDsSerieAno(rs.getString("descricao"));
            advForm.setDsCategoriaSerie(rs.getString("categoria"));
            //obter descricao advertencias
            advForm.setDsTipoAdvertencia(this.obterDescricaoTipoAdvertenciaImprimir(conn, rs.getString("id_advertencia")));

        }
        rs.close();
        prep.close();

        return advForm;
    }

    private String obterDescricaoTipoAdvertenciaImprimir(Connection conn, String idAdvertencia) throws SQLException {
        String query = "select ad.descricao from advertencia ad where ad.id in (" + idAdvertencia + ")";
        PreparedStatement prep = conn.prepareStatement(query);
        ResultSet rs = prep.executeQuery();
        String dsTipoAdvertencia = "";
        while (rs.next()) {
            dsTipoAdvertencia += "- " + rs.getString("descricao") + "; <br/> ";
        }
        rs.close();
        prep.close();

        return dsTipoAdvertencia;
    }
    private String obterDescricaoTipoAdvertencia(Connection conn, String idAdvertencia) throws SQLException {
        String query = "select ad.descricao from advertencia ad where ad.id in (" + idAdvertencia + ")";
        PreparedStatement prep = conn.prepareStatement(query);
        ResultSet rs = prep.executeQuery();
        String dsTipoAdvertencia = "";
        while (rs.next()) {
            dsTipoAdvertencia += rs.getString("descricao") + "; ";
        }
        rs.close();
        prep.close();

        return dsTipoAdvertencia;
    }

    public void excluirAdvertencia(Connection conn, int idAdvertencia) throws SQLException {
        String query = "DELETE FROM advertencia_aluno WHERE id=?";
        PreparedStatement prep = conn.prepareStatement(query);
        prep.setInt(1, idAdvertencia);
        prep.execute();
        prep.close();
    }

}
