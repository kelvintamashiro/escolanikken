/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.Form;

import br.com.Util.EnvioEmail;
import br.com.abre.Util.IDRDate;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.mail.MessagingException;

/**
 *
 * @author macuser
 */
public class ComunicadosForm extends FormBasico {

    private int idComunicado;
    private int idPessoa;
    private String descricao;
    private String assunto;
    private String data;
    private String[] selectedOptions;
    private String tipoPerfil;
    private int cdSerieAno;
    private String dsSerieAno;
    private String listaSerieAno;
    private int idProfessor;
    private String nomeProfessor;
    private String tipoComunicado;

    public String getTipoComunicado() {
        return tipoComunicado;
    }

    public void setTipoComunicado(String tipoComunicado) {
        this.tipoComunicado = tipoComunicado;
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

    public int getCdSerieAno() {
        return cdSerieAno;
    }

    public void setCdSerieAno(int cdSerieAno) {
        this.cdSerieAno = cdSerieAno;
    }

    public String getDsSerieAno() {
        return dsSerieAno;
    }

    public void setDsSerieAno(String dsSerieAno) {
        this.dsSerieAno = dsSerieAno;
    }

    public String getListaSerieAno() {
        return listaSerieAno;
    }

    public void setListaSerieAno(String listaSerieAno) {
        this.listaSerieAno = listaSerieAno;
    }

    public String[] getSelectedOptions() {
        return selectedOptions;
    }

    public void setSelectedOptions(String[] selectedOptions) {
        this.selectedOptions = selectedOptions;
    }

    public String getTipoPerfil() {
        return tipoPerfil;
    }

    public void setTipoPerfil(String tipoPerfil) {
        this.tipoPerfil = tipoPerfil;
    }

    public int getIdComunicado() {
        return idComunicado;
    }

    public void setIdComunicado(int idComunicado) {
        this.idComunicado = idComunicado;
    }

    public int getIdPessoa() {
        return idPessoa;
    }

    public void setIdPessoa(int idPessoa) {
        this.idPessoa = idPessoa;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public String getAssunto() {
        return assunto;
    }

    public void setAssunto(String assunto) {
        this.assunto = assunto;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    public ArrayList<ComunicadosForm> obterUltimosComunicadosPorIDPessoa(Connection conn, int idPF) throws SQLException {
        ArrayList<ComunicadosForm> listaComunicado = new ArrayList<>();
        String query = "select cg.id, cg.data_comunicado, cg.titulo"
                + " from comunicados c, comunicado_gerenciamento cg"
                + " where c.id_comunicado_gerenciamento = cg.id"
                + " and c.id_pessoa = ?"
                + " order by cg.id desc"
                + " limit 5";
        try (PreparedStatement prep = conn.prepareStatement(query)) {
            prep.setInt(1, idPF);
            try (ResultSet rs = prep.executeQuery()) {
                while (rs.next()) {
                    ComunicadosForm comunicadosForm = new ComunicadosForm();
                    comunicadosForm.setIdComunicado(rs.getInt("id"));
                    comunicadosForm.setData(IDRDate.formatSQLDate(rs.getString("data_comunicado")));
                    comunicadosForm.setAssunto(rs.getString("titulo"));
                    listaComunicado.add(comunicadosForm);
                }
            }
        }

        return listaComunicado;
    }

    public ArrayList<ComunicadosForm> obterTodosComunicadosPorIDPessoa(Connection conn, int idPF, String tipoComunicado) throws SQLException {
        ArrayList<ComunicadosForm> listaComunicado = new ArrayList<>();
        String query = "select cg.id, cg.data_comunicado, cg.titulo, cg.id_professor, pf.nome"
                + " from comunicados c, comunicado_gerenciamento cg, pessoa_fisica pf"
                + " where c.id_comunicado_gerenciamento = cg.id"
                + " and cg.id_professor = pf.id"
                + " and c.id_pessoa = ?"
                + " and cg.tipo_comunicado = ?"
                + " order by cg.id desc";
        try (PreparedStatement prep = conn.prepareStatement(query)) {
            prep.setInt(1, idPF);
            prep.setString(2, tipoComunicado);
            try (ResultSet rs = prep.executeQuery()) {
                while (rs.next()) {
                    ComunicadosForm comunicadosForm = new ComunicadosForm();
                    comunicadosForm.setIdComunicado(rs.getInt("id"));
                    comunicadosForm.setData(IDRDate.formatSQLDate(rs.getString("data_comunicado")));
                    comunicadosForm.setAssunto(rs.getString("titulo"));
                    comunicadosForm.setNomeProfessor(rs.getString("nome"));
                    listaComunicado.add(comunicadosForm);
                }
            }
        }

        return listaComunicado;
    }

    public int inserirComunicadoGerenciamento(Connection conn, String assunto, String descricao, int idProfessorSession, String tipoComunicado) throws SQLException {
        int idComunicadoGerenciamento = 0;
        String query = "insert comunicado_gerenciamento (data_comunicado, titulo, descricao, id_professor, tipo_comunicado) values (now(),?,?,?,?)";
//        PreparedStatement prep = conn.prepareStatement(query);
        PreparedStatement prep = conn.prepareStatement(query, PreparedStatement.RETURN_GENERATED_KEYS);
        prep.setString(1, assunto);
        prep.setString(2, descricao);
        prep.setInt(3, idProfessorSession);
        prep.setString(4, tipoComunicado);
        prep.execute();
        ResultSet rs = prep.getGeneratedKeys();
        rs.next();
        idComunicadoGerenciamento = rs.getInt(1);
        rs.close();
        prep.close();
        return idComunicadoGerenciamento;
    }

    public void inserirComunicadoAluno(Connection conn, String serieAno, int idComunicadoGerenciamento, String assunto, String descricao) throws SQLException {
        String query = "select a.id_pessoa_fisica from alunos a where a.serie_ano = ?";
        PreparedStatement prep = conn.prepareStatement(query);
        prep.setString(1, serieAno);
        ResultSet rs = prep.executeQuery();
        ArrayList<String> listaAlunos = new ArrayList();
        while (rs.next()) {
            listaAlunos.add(rs.getString("id_pessoa_fisica"));
        }
        rs.close();
        prep.close();

        for (String cdEstudante : listaAlunos) {
            String queryInsert = "INSERT INTO comunicados (id_pessoa, id_comunicado_gerenciamento, serie_ano) VALUES (?,?,?);";
            PreparedStatement prepInsert = conn.prepareStatement(queryInsert);
            prepInsert.setString(1, cdEstudante);
            prepInsert.setInt(2, idComunicadoGerenciamento);
            prepInsert.setString(3, serieAno);
            prepInsert.execute();
            prepInsert.close();

            //enviar email para os alunos da serie
            try {
                this.enviarEmailAluno(conn, cdEstudante, assunto, descricao);
                Thread.sleep(2000);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    public void inserirComunicadoPorAluno(Connection conn, String idAluno, String idSerie, int idComunicadoGerenciamento, String assunto, String descricao) throws SQLException {
        String queryInsert = "INSERT INTO comunicados (id_pessoa, id_comunicado_gerenciamento, serie_ano) VALUES (?,?,?);";
        try (PreparedStatement prepInsert = conn.prepareStatement(queryInsert)) {
            prepInsert.setString(1, idAluno);
            prepInsert.setInt(2, idComunicadoGerenciamento);
            prepInsert.setString(3, idSerie);
            prepInsert.execute();
        }

        //enviar email para os alunos da serie
        try {
            this.enviarEmailAluno(conn, idAluno, assunto, descricao);
            Thread.sleep(2000);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void enviarEmailAluno(Connection conn, String cdEstudante, String assunto, String descricao) throws SQLException, MessagingException {
        //obter email pelo cdEstudante
        String query = "select pf.email from pessoa_fisica pf where pf.id = ?";
        PreparedStatement prep = conn.prepareStatement(query);
        prep.setString(1, cdEstudante);
        ResultSet rs = prep.executeQuery();
        if (rs.next()) {
            String email = rs.getString("email");
            EnvioEmail envio = new EnvioEmail();
            envio.enviarEmail(email, descricao, assunto);
//            envio.enviarEmail("kelvin@mitsistemas.com.br", descricao, assunto);
        }
        rs.close();
        prep.close();
    }

    public List<ComunicadosForm> obterListaComunicados(Connection conn, String tipoComunicado) throws SQLException {
        List<ComunicadosForm> listaComunicados = new ArrayList<>();
        String query = "select c.*, pf.nome from comunicado_gerenciamento c, pessoa_fisica pf"
                + " where c.id_professor = pf.id"
                + " and c.tipo_comunicado = ?"
                + " order by id desc";
        PreparedStatement prep = conn.prepareStatement(query);
        prep.setString(1, tipoComunicado);
        ResultSet rs = prep.executeQuery();
        while (rs.next()) {
            ComunicadosForm comunicadosForm = new ComunicadosForm();
            comunicadosForm.setIdComunicado(rs.getInt("id"));
            comunicadosForm.setData(IDRDate.formatSQLDate(rs.getString("data_comunicado")));
            comunicadosForm.setAssunto(rs.getString("titulo"));
            comunicadosForm.setNomeProfessor(rs.getString("nome"));
            comunicadosForm.setListaSerieAno(this.obterListaSerie(conn, comunicadosForm.getIdComunicado()));
            listaComunicados.add(comunicadosForm);
        }
        rs.close();
        prep.close();

        return listaComunicados;
    }

    public List<ComunicadosForm> obterListaTodosComunicadosPorProfessor(Connection conn, String tipoComunicado) throws SQLException {
        List<ComunicadosForm> listaComunicados = new ArrayList<>();
        String query = "select c.*, pf.nome from comunicado_gerenciamento c, pessoa_fisica pf"
                + " where c.id_professor = pf.id"
                + " and c.tipo_comunicado = ?"
                + " order by id desc";
        PreparedStatement prep = conn.prepareStatement(query);
        prep.setString(1, tipoComunicado);
        ResultSet rs = prep.executeQuery();
        while (rs.next()) {
            ComunicadosForm comunicadosForm = new ComunicadosForm();
            comunicadosForm.setIdComunicado(rs.getInt("id"));
            comunicadosForm.setData(IDRDate.formatSQLDate(rs.getString("data_comunicado")));
            comunicadosForm.setAssunto(rs.getString("titulo"));
            comunicadosForm.setNomeProfessor(rs.getString("nome"));
            comunicadosForm.setListaSerieAno(this.obterListaSerie(conn, comunicadosForm.getIdComunicado()));
            listaComunicados.add(comunicadosForm);
        }
        rs.close();
        prep.close();

        return listaComunicados;
    }
    
    public List<ComunicadosForm> obterListaComunicadosPorProfessor(Connection conn, String tipoComunicado, int idProfessor) throws SQLException {
        List<ComunicadosForm> listaComunicados = new ArrayList<>();
        String query = "select c.*, pf.nome from comunicado_gerenciamento c, pessoa_fisica pf"
                + " where c.id_professor = pf.id"
                + " and c.tipo_comunicado = ?"
                + " and c.id_professor = ?"
                + " order by id desc";
        PreparedStatement prep = conn.prepareStatement(query);
        prep.setString(1, tipoComunicado);
        prep.setInt(2, idProfessor);
        ResultSet rs = prep.executeQuery();
        while (rs.next()) {
            ComunicadosForm comunicadosForm = new ComunicadosForm();
            comunicadosForm.setIdComunicado(rs.getInt("id"));
            comunicadosForm.setData(IDRDate.formatSQLDate(rs.getString("data_comunicado")));
            comunicadosForm.setAssunto(rs.getString("titulo"));
            comunicadosForm.setNomeProfessor(rs.getString("nome"));
            comunicadosForm.setListaSerieAno(this.obterListaSerie(conn, comunicadosForm.getIdComunicado()));
            listaComunicados.add(comunicadosForm);
        }
        rs.close();
        prep.close();

        return listaComunicados;
    }

    private String obterListaSerie(Connection conn, int idComunicado) throws SQLException {
        String query = " select c.serie_ano, d.descricao"
                + " from comunicados c, descricao_serie_ano d"
                + " where c.serie_ano = d.id"
                + " and c.id_comunicado_gerenciamento = ?"
                + " group by c.serie_ano"
                + " order by d.ordem, d.id";

        PreparedStatement prep = conn.prepareStatement(query);
        prep.setInt(1, idComunicado);
        ResultSet rs = prep.executeQuery();
        String listaSerie = "";
        while (rs.next()) {
            listaSerie += rs.getString("descricao") + ",";
        }
        if (listaSerie.length() > 0) {
            listaSerie = listaSerie.substring(0, listaSerie.length() - 1);
        }
        rs.close();
        prep.close();

        return listaSerie;
    }

    public ComunicadosForm obterComunicadoPorID(Connection conn, int idComunicado) throws SQLException {
        ComunicadosForm comunicadosForm = new ComunicadosForm();
        String query = "select * from comunicado_gerenciamento cg where cg.id = ?";
        try (PreparedStatement prep = conn.prepareStatement(query)) {
            prep.setInt(1, idComunicado);
            try (ResultSet rs = prep.executeQuery()) {
                if (rs.next()) {
                    comunicadosForm.setIdComunicado(rs.getInt("id"));
                    comunicadosForm.setAssunto(rs.getString("titulo"));
                    comunicadosForm.setDescricao(rs.getString("descricao"));
                    comunicadosForm.setData(IDRDate.formatSQLDate(rs.getString("data_comunicado")));
                }
            }
        }

        return comunicadosForm;
    }

    public void excluirComunicadoPorID(Connection conn, int idComunicado) throws SQLException {
        String query = "DELETE FROM comunicado_gerenciamento WHERE id = ?";
        try (PreparedStatement prep = conn.prepareStatement(query)) {
            prep.setInt(1, idComunicado);
            prep.execute();
            prep.close();
        }

        String query2 = "DELETE from comunicados where id_comunicado_gerenciamento = ?";
        try (PreparedStatement prep2 = conn.prepareStatement(query2)) {
            prep2.setInt(1, idComunicado);
            prep2.execute();
            prep2.close();
        }

    }

}
