/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.Form;

/**
 *
 * @author macuser
 */
public class IndexForm extends FormBasico {
    
    private String nome;
    private String login;
    private LoginForm dadosLogin;

    public LoginForm getDadosLogin() {
        return dadosLogin;
    }

    public void setDadosLogin(LoginForm dadosLogin) {
        this.dadosLogin = dadosLogin;
    }
    
    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }
    
    
    
    
}
