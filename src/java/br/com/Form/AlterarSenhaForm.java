/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.Form;

import br.com.Util.EncryptMD5;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author macuser
 */
public class AlterarSenhaForm extends FormBasico {

    private String nome;
    private String senhaAntiga;
    private String senhaNova;
    private String login;
    private int idPF;
    private int idNkUser;

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getSenhaAntiga() {
        return senhaAntiga;
    }

    public void setSenhaAntiga(String senhaAntiga) {
        this.senhaAntiga = senhaAntiga;
    }

    public String getSenhaNova() {
        return senhaNova;
    }

    public void setSenhaNova(String senhaNova) {
        this.senhaNova = senhaNova;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
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

    public void alterarSenha(Connection conn, AlterarSenhaForm alterarSenhaForm) throws SQLException {
        String query = "UPDATE pessoa_fisica SET password=? WHERE id=?";
        PreparedStatement prep = conn.prepareStatement(query);
        prep.setString(1, alterarSenhaForm.getSenhaNova());
        prep.setInt(2, alterarSenhaForm.getIdPF());
        prep.execute();
        prep.close();

        this.alterarSenhaWpUsers(conn, alterarSenhaForm);
//        EncryptMD5.md5
    }

    private void alterarSenhaWpUsers(Connection conn, AlterarSenhaForm alterarSenhaForm) throws SQLException {
        String query = "UPDATE nk_users SET user_pass=? WHERE ID=?";
        PreparedStatement prep = conn.prepareStatement(query);
        prep.setString(1, EncryptMD5.md5(alterarSenhaForm.getSenhaNova()));
        prep.setInt(2, alterarSenhaForm.getIdNkUser());
        prep.execute();
        prep.close();
    }

    public boolean verificarSenhaAntiga(Connection conn, AlterarSenhaForm alterarSenhaForm) throws SQLException {
        boolean isSenhaAntigaOK = false;
        String query = "select * from pessoa_fisica p "
                + "where p.id = ? and p.password = ?";
        PreparedStatement prep = conn.prepareStatement(query);
        prep.setInt(1, alterarSenhaForm.getIdPF());
        prep.setString(2, alterarSenhaForm.getSenhaAntiga());
        ResultSet rs = prep.executeQuery();
        if (rs.next()) {
            isSenhaAntigaOK = true;
        }
        rs.close();
        prep.close();

        return isSenhaAntigaOK;
    }

}
