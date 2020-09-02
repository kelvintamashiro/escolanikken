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

/**
 *
 * @author macuser
 */
public class LoginForm extends FormBasico {

    private String login;
    private String password;
    private String tipoPerfil;
    private String nomeAluno;
    private String dtNascimento;

    public String getDtNascimento() {
        return dtNascimento;
    }

    public void setDtNascimento(String dtNascimento) {
        this.dtNascimento = dtNascimento;
    }
    
    public String getNomeAluno() {
        return nomeAluno;
    }

    public void setNomeAluno(String nomeAluno) {
        this.nomeAluno = nomeAluno;
    }
    
    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getTipoPerfil() {
        return tipoPerfil;
    }

    public void setTipoPerfil(String tipoPerfil) {
        this.tipoPerfil = tipoPerfil;
    }

    public boolean verificarLogin(Connection conn, String login, String password, String tipoPerfil) throws SQLException {
        boolean isLogin = false;
        String query = "select * from pessoa_fisica p"
                + " where p.email = ?"
                + " and p.password = ?"
                + " and p.tipo = ?"
                + " and p.status = 1";
        PreparedStatement prep = conn.prepareStatement(query);
        prep.setString(1, login);
        prep.setString(2, password);
        prep.setString(3, tipoPerfil);
        ResultSet rs = prep.executeQuery();
        if(rs.next()){
            isLogin = true;
        }
        rs.close();
        prep.close();
        
        return isLogin;
    }

    public ArrayList<LoginForm> verificarEmailLogin(Connection conn, String login, String tipoPerfil) throws SQLException {
        String query = "select pf.nome, pf.email, pf.tipo"
                + " from pessoa_fisica pf where pf.email = ? and pf.tipo = ?";
        PreparedStatement prep = conn.prepareStatement(query);
        prep.setString(1, login);
        prep.setString(2, tipoPerfil);
        ResultSet rs = prep.executeQuery();
        ArrayList<LoginForm> listaEmailsLogin = new ArrayList<>();
        while(rs.next()){
            LoginForm loginForm = new LoginForm();
            loginForm.setNomeAluno(rs.getString("nome"));
            loginForm.setLogin(rs.getString("email"));
            loginForm.setTipoPerfil(rs.getString("tipo"));
            listaEmailsLogin.add(loginForm);
        }
        rs.close();
        prep.close();
        
        return listaEmailsLogin;
    }



}
