/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.Form;

import br.com.Util.EncryptMD5;
import br.com.Util.Utilitario;
import br.com.abre.Util.IDRDate;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Vector;

/**
 *
 * @author macuser
 */
public class PessoaFisicaForm extends FormBasico {

    private int idPF;
    private int idNkUser;
    private String nome;
    private String dataNascimento;
    private String dataCadastro;
    private String naturalidade;
    private String nacionalidade;
    private String dsEndereco;
    private String provincia;
    private String cidade;
    private String telefoneProfessor;
    private String telefoneContato;
    private String contatoEmergencia;
    private int status; //1 = ativo 2 = inativo
    private String dsStatus;
    private String tipoPerfil;
    private String email;
    private String password;
    private String passwordMD5;
    private String sexo;
    private String dtInicio;
    private String dtDesligamento;

    public String getDtInicio() {
        return dtInicio;
    }

    public void setDtInicio(String dtInicio) {
        this.dtInicio = dtInicio;
    }

    public String getDtDesligamento() {
        return dtDesligamento;
    }

    public void setDtDesligamento(String dtDesligamento) {
        this.dtDesligamento = dtDesligamento;
    }

    public int getIdPF() {
        return idPF;
    }

    public void setIdPF(int idPF) {
        this.idPF = idPF;
    }

    public int getIdNkUser() {
        return idNkUser;
    }

    public void setIdNkUser(int idNkUser) {
        this.idNkUser = idNkUser;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getDataNascimento() {
        return dataNascimento;
    }

    public void setDataNascimento(String dataNascimento) {
        this.dataNascimento = dataNascimento;
    }

    public String getDataCadastro() {
        return dataCadastro;
    }

    public void setDataCadastro(String dataCadastro) {
        this.dataCadastro = dataCadastro;
    }

    public String getNaturalidade() {
        return naturalidade;
    }

    public void setNaturalidade(String naturalidade) {
        this.naturalidade = naturalidade;
    }

    public String getNacionalidade() {
        return nacionalidade;
    }

    public void setNacionalidade(String nacionalidade) {
        this.nacionalidade = nacionalidade;
    }

    public String getDsEndereco() {
        return dsEndereco;
    }

    public void setDsEndereco(String dsEndereco) {
        this.dsEndereco = dsEndereco;
    }

    public String getProvincia() {
        return provincia;
    }

    public void setProvincia(String provincia) {
        this.provincia = provincia;
    }

    public String getCidade() {
        return cidade;
    }

    public void setCidade(String cidade) {
        this.cidade = cidade;
    }

    public String getTelefoneProfessor() {
        return telefoneProfessor;
    }

    public void setTelefoneProfessor(String telefoneProfessor) {
        this.telefoneProfessor = telefoneProfessor;
    }

    public String getTelefoneContato() {
        return telefoneContato;
    }

    public void setTelefoneContato(String telefoneContato) {
        this.telefoneContato = telefoneContato;
    }

    public String getContatoEmergencia() {
        return contatoEmergencia;
    }

    public void setContatoEmergencia(String contatoEmergencia) {
        this.contatoEmergencia = contatoEmergencia;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getDsStatus() {
        return dsStatus;
    }

    public void setDsStatus(String dsStatus) {
        this.dsStatus = dsStatus;
    }

    public String getTipoPerfil() {
        return tipoPerfil;
    }

    public void setTipoPerfil(String tipoPerfil) {
        this.tipoPerfil = tipoPerfil;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPasswordMD5() {
        return passwordMD5;
    }

    public void setPasswordMD5(String passwordMD5) {
        this.passwordMD5 = passwordMD5;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public PessoaFisicaForm obterDadosPessoaFisicaPorLogin(Connection conn, String login) throws SQLException {
        String query = "select * from pessoa_fisica pf where pf.email = ?";
        PreparedStatement prep = conn.prepareStatement(query);
        prep.setString(1, login);
        ResultSet rs = prep.executeQuery();
        PessoaFisicaForm pfForm = new PessoaFisicaForm();
        if (rs.next()) {
            pfForm.setIdPF(rs.getInt("id"));
            pfForm.setNome(rs.getString("nome"));
            pfForm.setDataNascimento(IDRDate.parseDataBra(rs.getString("data_nascimento")));
            pfForm.setNaturalidade(rs.getString("naturalidade"));
            pfForm.setNacionalidade(rs.getString("nacionalidade"));
            pfForm.setDsEndereco(rs.getString("endereco"));
            pfForm.setProvincia(rs.getString("provincia"));
            pfForm.setCidade(rs.getString("cidade"));
            pfForm.setTelefoneContato(rs.getString("telefone_contato"));
            pfForm.setContatoEmergencia(rs.getString("contato_emergencia"));
            pfForm.setStatus(rs.getInt("status"));
            pfForm.setTipoPerfil(rs.getString("tipo"));
            pfForm.setEmail(rs.getString("email"));
        }
        rs.close();
        prep.close();

        return pfForm;
    }

    public int inserirPessoaFisica(Connection conn, PessoaFisicaForm pessoaFisica, int idWpUser) throws SQLException {
        int idPessoaFisica = 0;
        String query = "INSERT INTO pessoa_fisica (id_nk_users, nome, data_nascimento, naturalidade, sexo, nacionalidade, endereco, provincia, cidade,"
                + " telefone_contato, contato_emergencia, status, tipo, telefone_professor, password, email, data_cadastro, data_inicio, data_desligamento) "
                + " VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,now(),?,?)";

        PreparedStatement prep = conn.prepareStatement(query, PreparedStatement.RETURN_GENERATED_KEYS);
        prep.setInt(1, idWpUser);
        prep.setString(2, pessoaFisica.getNome());
        if (pessoaFisica.getDataNascimento() != null) {
            prep.setString(3, IDRDate.parseDataIso(pessoaFisica.getDataNascimento()));
        } else {
            prep.setString(3, null);
        }
        prep.setString(4, pessoaFisica.getNaturalidade());
        prep.setString(5, pessoaFisica.getSexo());
        prep.setString(6, pessoaFisica.getNacionalidade());
        prep.setString(7, pessoaFisica.getDsEndereco());
        prep.setString(8, pessoaFisica.getProvincia());
        prep.setString(9, pessoaFisica.getCidade());
        prep.setString(10, pessoaFisica.getTelefoneContato());
        prep.setString(11, pessoaFisica.getContatoEmergencia());
        prep.setInt(12, pessoaFisica.getStatus());
        prep.setString(13, pessoaFisica.getTipoPerfil());
        prep.setString(14, pessoaFisica.getTelefoneProfessor());
        prep.setString(15, pessoaFisica.getPassword());
        prep.setString(16, pessoaFisica.getEmail());
        if (pessoaFisica.getDtInicio() != null && !pessoaFisica.getDtInicio().equals("")) {
            prep.setString(17, IDRDate.parseDataIso(pessoaFisica.getDtInicio()));
        } else {
            prep.setString(17, null);
        }
        if (pessoaFisica.getDtDesligamento() != null && !pessoaFisica.getDtDesligamento().equals("")) {
            prep.setString(18, IDRDate.parseDataIso(pessoaFisica.getDtDesligamento()));
        } else {
            prep.setString(18, null);
        }
        prep.execute();
        ResultSet rs = prep.getGeneratedKeys();
        if (rs.next()) {
            idPessoaFisica = rs.getInt(1);
        }
        rs.close();
        prep.close();

        return idPessoaFisica;
    }

    public int inserirWpUsers(Connection conn, PessoaFisicaForm pessoaFisica) throws SQLException {
        int idPessoaFisica = 0;

        String query = "INSERT INTO nk_users (user_login, user_pass, user_nicename, user_email, user_registered, user_status, display_name) "
                + "VALUES (?,?,?,?, now(), '0',?)";
//        String query = "INSERT INTO nk_users (user_login, user_pass, user_nicename, user_email, user_registered, user_status, display_name) "
//                + "VALUES ('miguel', 'c132e4cb532430c0ec8c884cc0249c20', 'miguel-yudi', 'miguel@teste.com', now(), '0', 'Miguel Yudi')";

        String userLogin = pessoaFisica.getNome().replace(" ", "_").toLowerCase();
        PreparedStatement prep = conn.prepareStatement(query, PreparedStatement.RETURN_GENERATED_KEYS);
        prep.setString(1, userLogin);
        prep.setString(2, EncryptMD5.md5(pessoaFisica.getPassword()));
        prep.setString(3, userLogin);
        prep.setString(4, pessoaFisica.getEmail());
        prep.setString(5, pessoaFisica.getNome());
        prep.execute();
        ResultSet rs = prep.getGeneratedKeys();
        if (rs.next()) {
            idPessoaFisica = rs.getInt(1);
        }
        rs.close();
        prep.close();

        this.inserirWpUserMeta(conn, pessoaFisica, idPessoaFisica);

        return idPessoaFisica;
    }

    private void inserirWpUserMeta(Connection conn, PessoaFisicaForm pessoaFisica, int idPessoaFisica) throws SQLException {
        String userLogin = pessoaFisica.getNome().replace(" ", "_").toLowerCase();
        String[] textoSeparado = pessoaFisica.getNome().split(" ");
        String query1 = "insert into nk_usermeta (user_id, meta_key, meta_value) values (" + idPessoaFisica + ", 'nickname', '" + userLogin + "')";
        String query2 = "insert into nk_usermeta (user_id, meta_key, meta_value) values (" + idPessoaFisica + ", 'first_name', '" + textoSeparado[0] + "')";
        String query3 = "insert into nk_usermeta (user_id, meta_key, meta_value) values (" + idPessoaFisica + ", 'last_name', '" + textoSeparado[textoSeparado.length - 1] + "')";
        String query4 = "insert into nk_usermeta (user_id, meta_key, meta_value) values (" + idPessoaFisica + ", 'rich_editing', true)";
        String query5 = "insert into nk_usermeta (user_id, meta_key, meta_value) values (" + idPessoaFisica + ", 'syntax_highlighting', true)";
        String query6 = "insert into nk_usermeta (user_id, meta_key, meta_value) values (" + idPessoaFisica + ", 'comment_shortcuts', true)";
        String query7 = "insert into nk_usermeta (user_id, meta_key, meta_value) values (" + idPessoaFisica + ", 'admin_color', 'fresh')";
        String query8 = "insert into nk_usermeta (user_id, meta_key, meta_value) values (" + idPessoaFisica + ", 'use_ssl', 0)";
        String query9 = "insert into nk_usermeta (user_id, meta_key, meta_value) values (" + idPessoaFisica + ", 'show_admin_bar_front', true)";
        String query10 = "insert into nk_usermeta (user_id, meta_key, meta_value) values (" + idPessoaFisica + ", 'nk_capabilities', 'a:1:{s:10:\"subscriber\";b:1;}')";
        String query11 = "insert into nk_usermeta (user_id, meta_key, meta_value) values (" + idPessoaFisica + ", 'nk_user_level', 0)";

        PreparedStatement prep1 = conn.prepareStatement(query1);
        prep1.execute();
        prep1.close();
        PreparedStatement prep2 = conn.prepareStatement(query2);
        prep2.execute();
        prep2.close();
        PreparedStatement prep3 = conn.prepareStatement(query3);
        prep3.execute();
        prep3.close();
        PreparedStatement prep4 = conn.prepareStatement(query4);
        prep4.execute();
        prep4.close();
        PreparedStatement prep5 = conn.prepareStatement(query5);
        prep5.execute();
        prep5.close();
        PreparedStatement prep6 = conn.prepareStatement(query6);
        prep6.execute();
        prep6.close();
        PreparedStatement prep7 = conn.prepareStatement(query7);
        prep7.execute();
        prep7.close();
        PreparedStatement prep8 = conn.prepareStatement(query8);
        prep8.execute();
        prep8.close();
        PreparedStatement prep9 = conn.prepareStatement(query9);
        prep9.execute();
        prep9.close();
        PreparedStatement prep10 = conn.prepareStatement(query10);
        prep10.execute();
        prep10.close();
        PreparedStatement prep11 = conn.prepareStatement(query11);
        prep11.execute();
        prep11.close();

    }

    public boolean verificarNomePessoaFisicaCadastrado(Connection conn, String nomeAluno) throws SQLException {
        boolean isExisteAluno = false;
        String query = "select * from pessoa_fisica pf where pf.nome like '" + nomeAluno.trim() + "'";
        PreparedStatement prep = conn.prepareStatement(query);
        ResultSet rs = prep.executeQuery();
        if (rs.next()) {
            isExisteAluno = true;
        }
        rs.close();
        prep.close();

        return isExisteAluno;
    }

    public boolean verificarEmailPessoaFisicaCadastrado(Connection conn, String email) throws SQLException {
        boolean isExisteAluno = false;
        String query = "select * from nk_users user where user.user_email = '" + email.trim() + "'";
//        String query = "select * from pessoa_fisica pf where pf.email like '" + email.trim() + "'";
        PreparedStatement prep = conn.prepareStatement(query);
        ResultSet rs = prep.executeQuery();
        if (rs.next()) {
            isExisteAluno = true;
        }
        rs.close();
        prep.close();

        return isExisteAluno;
    }

    public void atualizarPessoaFisica(Connection conn, PessoaFisicaForm pessoaFisicaForm) throws SQLException {
        String query = "UPDATE pessoa_fisica SET nome=?, data_nascimento=?, naturalidade=?, sexo=?, nacionalidade=?, endereco=?, provincia=?,"
                + " cidade=?, telefone_contato=?, contato_emergencia=?, status=?, tipo=?, telefone_professor=?, data_inicio=?, data_desligamento=?"
                + " WHERE id=?";
        PreparedStatement prep = conn.prepareStatement(query);
        prep.setString(1, pessoaFisicaForm.getNome());
        if (pessoaFisicaForm.getDataNascimento() != null) {
            prep.setString(2, IDRDate.parseDataIso(pessoaFisicaForm.getDataNascimento()));
        } else {
            prep.setString(2, null);
        }
        prep.setString(3, pessoaFisicaForm.getNaturalidade());
        prep.setString(4, pessoaFisicaForm.getSexo());
        prep.setString(5, pessoaFisicaForm.getNacionalidade());
        prep.setString(6, pessoaFisicaForm.getDsEndereco());
        prep.setString(7, pessoaFisicaForm.getProvincia());
        prep.setString(8, pessoaFisicaForm.getCidade());
        prep.setString(9, pessoaFisicaForm.getTelefoneContato());
        prep.setString(10, pessoaFisicaForm.getContatoEmergencia());
        prep.setInt(11, pessoaFisicaForm.getStatus());
        prep.setString(12, pessoaFisicaForm.getTipoPerfil());
        prep.setString(13, pessoaFisicaForm.getTelefoneProfessor());
        if (pessoaFisicaForm.getDtInicio() != null && !pessoaFisicaForm.getDtInicio().equals("")) {
            prep.setString(14, IDRDate.parseDataIso(pessoaFisicaForm.getDtInicio()));
        } else {
            prep.setString(14, null);
        }
        if (pessoaFisicaForm.getDtDesligamento() != null && !pessoaFisicaForm.getDtDesligamento().equals("")) {
            prep.setString(15, IDRDate.parseDataIso(pessoaFisicaForm.getDtDesligamento()));
        } else {
            prep.setString(15, null);
        }
        prep.setInt(16, pessoaFisicaForm.getIdPF());
        prep.execute();
        prep.close();
    }

    public ArrayList<PessoaFisicaForm> obterListaProfessores(Connection conn, PessoaFisicaForm professorForm) throws SQLException {

        ArrayList<PessoaFisicaForm> listaProfessores = new ArrayList<>();
        StringBuilder sb = new StringBuilder();
        sb.append("select pf.id, pf.nome, pf.data_nascimento, pf.sexo, pf.cidade, pf.provincia, pf.email, pf.status ");
        sb.append(" from pessoa_fisica pf");
        sb.append(" where (pf.tipo = 'professor' or pf.tipo = 'coordenacao')");
        if (professorForm.getNome() != null && !("").equals(professorForm.getNome())) {
            sb.append(" and pf.nome like '%").append(professorForm.getNome()).append("%'");
        }
        if (professorForm.getSexo() != null && !("").equals(professorForm.getSexo())) {
            sb.append(" and pf.sexo = '").append(professorForm.getSexo()).append("'");
        }
        sb.append(" and pf.status = ").append(professorForm.getStatus());
        sb.append(" order by pf.nome");

        PreparedStatement prep = conn.prepareStatement(sb.toString());
        ResultSet rs = prep.executeQuery();
        while (rs.next()) {
            PessoaFisicaForm pfForm = new PessoaFisicaForm();
            pfForm.setIdPF(rs.getInt("id"));
            pfForm.setNome(rs.getString("nome"));
            pfForm.setDataNascimento(IDRDate.formatSQLDate(rs.getString("data_nascimento")));
            pfForm.setSexo(rs.getString("sexo"));
            pfForm.setCidade(rs.getString("cidade"));
            pfForm.setProvincia(rs.getString("provincia"));
            pfForm.setEmail(rs.getString("email"));
            pfForm.setStatus(rs.getInt("status"));
            pfForm.setDsStatus(Utilitario.obterDescricaoStatus(pfForm.getStatus()));

            listaProfessores.add(pfForm);
        }
        rs.close();
        prep.close();

        return listaProfessores;
    }

    public PessoaFisicaForm[] obterListaTodosProfessores(Connection conn, PessoaFisicaForm professorForm) throws SQLException {

        Vector data = new Vector();
        StringBuilder sb = new StringBuilder();
        sb.append("select pf.id, pf.nome, pf.data_nascimento, pf.sexo, pf.cidade, pf.provincia, pf.email, pf.status ");
        sb.append(" from pessoa_fisica pf");
        sb.append(" where (pf.tipo = 'professor' or pf.tipo = 'coordenacao')");
        sb.append(" and pf.status = ").append(professorForm.getStatus());

        PreparedStatement prep = conn.prepareStatement(sb.toString());
        ResultSet rs = prep.executeQuery();
        while (rs.next()) {
            PessoaFisicaForm pfForm = new PessoaFisicaForm();
            pfForm.setIdPF(rs.getInt("id"));
            pfForm.setNome(rs.getString("nome"));
            pfForm.setDataNascimento(IDRDate.formatSQLDate(rs.getString("data_nascimento")));
            pfForm.setSexo(rs.getString("sexo"));
            pfForm.setCidade(rs.getString("cidade"));
            pfForm.setProvincia(rs.getString("provincia"));
            pfForm.setEmail(rs.getString("email"));
            pfForm.setStatus(rs.getInt("status"));
            pfForm.setDsStatus(Utilitario.obterDescricaoStatus(pfForm.getStatus()));

            data.add(pfForm);
        }
        rs.close();
        prep.close();

        PessoaFisicaForm[] listaProfessores = null;
        if (data.size() > 0) {
            listaProfessores = new PessoaFisicaForm[data.size()];
            for (int i = 0; i < data.size(); i++) {
                listaProfessores[i] = (PessoaFisicaForm) data.elementAt(i);
            }
        }
        return listaProfessores;
    }

    public PessoaFisicaForm obterDadosPessoaFisicaPorID(Connection conn, String idPf) throws SQLException {
        String query = "select * from pessoa_fisica pf where pf.id = ?";
        PreparedStatement prep = conn.prepareStatement(query);
        prep.setString(1, idPf);
        ResultSet rs = prep.executeQuery();
        PessoaFisicaForm pfForm = new PessoaFisicaForm();
        if (rs.next()) {
            pfForm.setIdPF(rs.getInt("id"));
            pfForm.setNome(rs.getString("nome"));
            pfForm.setDataNascimento(IDRDate.parseDataBra(rs.getString("data_nascimento")));
            pfForm.setDataCadastro(IDRDate.formatSQLDate(rs.getString("data_cadastro")));
            pfForm.setNaturalidade(rs.getString("naturalidade"));
            pfForm.setNacionalidade(rs.getString("nacionalidade"));
            pfForm.setSexo(rs.getString("sexo"));
            pfForm.setDsEndereco(rs.getString("endereco"));
            pfForm.setProvincia(rs.getString("provincia"));
            pfForm.setCidade(rs.getString("cidade"));
            pfForm.setTelefoneProfessor(rs.getString("telefone_professor"));
            pfForm.setTelefoneContato(rs.getString("telefone_contato"));
            pfForm.setContatoEmergencia(rs.getString("contato_emergencia"));
            pfForm.setStatus(rs.getInt("status"));
            pfForm.setTipoPerfil(rs.getString("tipo"));
            pfForm.setEmail(rs.getString("email"));
            if (rs.getString("data_inicio") != null) {
                pfForm.setDtInicio(IDRDate.parseDataBra(rs.getString("data_inicio")));
            }
            if (rs.getString("data_desligamento") != null) {
                pfForm.setDtDesligamento(IDRDate.parseDataBra(rs.getString("data_desligamento")));
            }

        }
        rs.close();
        prep.close();

        return pfForm;
    }

    public int obterIdNkUserPorIdPF(Connection conn, int idPF) throws SQLException {
        int idNkUser = 0;
        String query = "select pf.id_nk_users from pessoa_fisica pf where pf.id = ?";
        PreparedStatement prep = conn.prepareStatement(query);
        prep.setInt(1, idPF);
        ResultSet rs = prep.executeQuery();
        if (rs.next()) {
            idNkUser = rs.getInt("id_nk_users");
        }
        rs.close();
        prep.close();

        return idNkUser;
    }

    public PessoaFisicaForm verificarPessoaFisicaPorEmailDataNascimento(Connection conn, LoginForm loginForm) throws SQLException {

        PessoaFisicaForm pessoaFisicaForm = new PessoaFisicaForm();
        String query = "select * from pessoa_fisica pf where"
                + " pf.email = ?"
                + " and pf.data_nascimento = ?";
        try ( PreparedStatement prep = conn.prepareStatement(query)) {
            prep.setString(1, loginForm.getLogin());
            prep.setString(2, IDRDate.parseDataIso(loginForm.getDtNascimento()));
            try ( ResultSet rs = prep.executeQuery()) {
                if (rs.next()) {
                    pessoaFisicaForm.setIdPF(rs.getInt("id"));
                    pessoaFisicaForm.setIdNkUser(rs.getInt("id_nk_users"));
                    pessoaFisicaForm.setEmail(rs.getString("email"));
                    pessoaFisicaForm.setNome(rs.getString("nome"));
                }
            }
        }

        return pessoaFisicaForm;
    }

    public void atualizarSenhaPessoaFisica(Connection conn, String senha, int idPF) throws SQLException {
        String query = "UPDATE pessoa_fisica SET password=? WHERE id=?";
        try ( PreparedStatement prep = conn.prepareStatement(query)) {
            prep.setString(1, senha);
            prep.setInt(2, idPF);
            prep.execute();
        }
    }

    public void atualizarSenhaNkUsers(Connection conn, String senha, int idNkUser) throws SQLException {
        String query = "UPDATE nk_users SET user_pass=? WHERE ID=?";
        try ( PreparedStatement prep = conn.prepareStatement(query)) {
            prep.setString(1, EncryptMD5.md5(senha));
            prep.setInt(2, idNkUser);
            prep.execute();
        }
    }

}
