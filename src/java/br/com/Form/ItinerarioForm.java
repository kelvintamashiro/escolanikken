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
public class ItinerarioForm extends FormBasico {

    private int idItinerario;
    private String nomeItinerario;
    private String categoriaEnsino;
    private String dsCategoriaEnsino;
    private int idSerieAno;
    private String dsSerieAno;
    private ArrayList<PessoaFisicaForm> listaProfessores;
    private int idProfessor;
    private String nomeProfessor;
    private String[] selectedOptions;
    private int idAluno;
    private int idItinerarioAluno;

    public int getIdItinerarioAluno() {
        return idItinerarioAluno;
    }

    public void setIdItinerarioAluno(int idItinerarioAluno) {
        this.idItinerarioAluno = idItinerarioAluno;
    }

    public int getIdAluno() {
        return idAluno;
    }

    public void setIdAluno(int idAluno) {
        this.idAluno = idAluno;
    }

    public String[] getSelectedOptions() {
        return selectedOptions;
    }

    public void setSelectedOptions(String[] selectedOptions) {
        this.selectedOptions = selectedOptions;
    }

    public ArrayList<PessoaFisicaForm> getListaProfessores() {
        return listaProfessores;
    }

    public void setListaProfessores(ArrayList<PessoaFisicaForm> listaProfessores) {
        this.listaProfessores = listaProfessores;
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

    public int getIdItinerario() {
        return idItinerario;
    }

    public void setIdItinerario(int idItinerario) {
        this.idItinerario = idItinerario;
    }

    public String getNomeItinerario() {
        return nomeItinerario;
    }

    public void setNomeItinerario(String nomeItinerario) {
        this.nomeItinerario = nomeItinerario;
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

    public List<ItinerarioForm> obterListaItinerariosCadastrados(Connection conn) throws SQLException {
        String query = "select i.id_itinerario, i.id_serie_ano, i.categoria_ensino, i.nome_itinerario, i.id_professor, pf.nome "
                + " from itinerario i, pessoa_fisica pf"
                + " where i.id_professor = pf.id"
                + " order by i.categoria_ensino, i.nome_itinerario";
        PreparedStatement prep = conn.prepareStatement(query);
        ResultSet rs = prep.executeQuery();
        List<ItinerarioForm> listaItinerario = new ArrayList<>();
        while (rs.next()) {
            ItinerarioForm itinerarioForm = new ItinerarioForm();
            itinerarioForm.setIdItinerario(rs.getInt("id_itinerario"));
            itinerarioForm.setIdSerieAno(rs.getInt("id_serie_ano"));
            itinerarioForm.setCategoriaEnsino(rs.getString("categoria_ensino"));
            itinerarioForm.setNomeItinerario(rs.getString("nome_itinerario"));
            itinerarioForm.setIdProfessor(rs.getInt("id_professor"));
            itinerarioForm.setNomeProfessor(rs.getString("nome"));
            listaItinerario.add(itinerarioForm);
        }
        rs.close();
        prep.close();

        return listaItinerario;
    }

    public void cadastrarItinerario(Connection conn, ItinerarioForm itinerarioForm) throws SQLException {
        String query = "INSERT INTO itinerario (categoria_ensino, id_serie_ano, nome_itinerario, id_professor) VALUES (?,?,?,?)";
        PreparedStatement prep = conn.prepareStatement(query);
        prep.setString(1, itinerarioForm.getCategoriaEnsino());
        prep.setInt(2, itinerarioForm.getIdSerieAno());
        prep.setString(3, itinerarioForm.getNomeItinerario());
        prep.setInt(4, itinerarioForm.getIdProfessor());
        prep.execute();
        prep.close();
    }

    public boolean isExisteNotaItinerario(Connection conn, int idItinerario) throws SQLException {
        boolean isExisteNotaItinerario = false;
        String query = "select count(*) as qtd from nota_itinerario n where n.id_itinerario = ?";
        PreparedStatement prep = conn.prepareStatement(query);
        prep.setInt(1, idItinerario);
        ResultSet rs = prep.executeQuery();
        if (rs.next()) {
            int qtd = rs.getInt("qtd");
            if (qtd > 0) {
                isExisteNotaItinerario = true;
            }
        }
        rs.close();
        prep.close();

        return isExisteNotaItinerario;
    }

    public void excluir(Connection conn, int idItinerario) throws SQLException {
        String query = "DELETE FROM itinerario WHERE id_itinerario=?";
        PreparedStatement prep = conn.prepareStatement(query);
        prep.setInt(1, idItinerario);
        prep.execute();
        prep.close();
    }

    public ItinerarioForm obterItinerarioPorId(Connection conn, int idItinerario) throws SQLException {
        String query = "select * from itinerario i where i.id_itinerario = ?";
        PreparedStatement prep = conn.prepareStatement(query);
        prep.setInt(1, idItinerario);
        ResultSet rs = prep.executeQuery();
        ItinerarioForm itinerarioForm = new ItinerarioForm();
        if (rs.next()) {
            itinerarioForm.setIdItinerario(rs.getInt("id_itinerario"));
            itinerarioForm.setCategoriaEnsino(rs.getString("categoria_ensino"));
            itinerarioForm.setIdSerieAno(rs.getInt("id_serie_ano"));
            itinerarioForm.setNomeItinerario(rs.getString("nome_itinerario"));
            itinerarioForm.setIdProfessor(rs.getInt("id_professor"));
        }
        rs.close();
        prep.close();

        return itinerarioForm;
    }

    public void atualizarItinerario(Connection conn, ItinerarioForm itinerarioForm) throws SQLException {
        String query = "UPDATE itinerario SET id_serie_ano=?, nome_itinerario=?, id_professor=? WHERE id_itinerario=?";
        PreparedStatement prep = conn.prepareStatement(query);
        prep.setInt(1, itinerarioForm.getIdSerieAno());
        prep.setString(2, itinerarioForm.getNomeItinerario());
        prep.setInt(3, itinerarioForm.getIdProfessor());
        prep.setInt(4, itinerarioForm.getIdItinerario());
        prep.execute();
        prep.close();
    }

    public void vincularAlunosItinerario(Connection conn, int idItinerario, String idAluno, int idSerieAno, int ano) throws SQLException {
        String query = "INSERT INTO itinerario_alunos (id_itinerario, id_aluno, id_serie, ano) VALUES (?,?,?,?)";
        PreparedStatement prep = conn.prepareStatement(query);
        prep.setInt(1, idItinerario);
        prep.setString(2, idAluno);
        prep.setInt(3, idSerieAno);
        prep.setInt(4, ano);
        prep.execute();
        prep.close();
    }

    public void desvincularAluno(Connection conn, int idItinerarioAluno) throws SQLException {
        String query = "DELETE FROM itinerario_alunos WHERE id=?";
        PreparedStatement prep = conn.prepareStatement(query);
        prep.setInt(1, idItinerarioAluno);
        prep.execute();
        prep.close();
    }

    public List<ItinerarioForm> obterListaItinerarioPorSerie(Connection conn, int idSerieAno) throws SQLException {
        String query = "select i.id_itinerario, i.nome_itinerario from itinerario i where i.id_serie_ano = ? order by i.nome_itinerario";
        PreparedStatement prep = conn.prepareStatement(query);
        prep.setInt(1, idSerieAno);
        ResultSet rs = prep.executeQuery();
        List<ItinerarioForm> listaItinerario = new ArrayList<>();
        while (rs.next()) {
            ItinerarioForm itinerarioForm = new ItinerarioForm();
            itinerarioForm.setIdItinerario(rs.getInt("id_itinerario"));
            itinerarioForm.setNomeItinerario(rs.getString("nome_itinerario"));
            listaItinerario.add(itinerarioForm);
        }
        rs.close();
        prep.close();

        return listaItinerario;
    }

}
