/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.Action;

import br.com.Form.LoginForm;
import br.com.Form.PessoaFisicaForm;
import br.com.Util.EnvioEmail;
import br.com.Util.GeradorSenha;
import br.com.abre.Util.Errors;
import java.sql.Connection;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author macuser
 */
public class LoginAction extends IDRAction {

    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response, Errors errors, String action) {
        String forward = action;
        if (action.equals("page")) {
            return validar(mapping, form, request, errors);
        } else if (action.equals("pageEsqueceuSenha")) {
            this.pageEsqueceuSenha(form, request, errors);
        } else if (action.equals("resetarSenha")) {
            this.resetarSenha(form, request, errors);
        }

        return mapping.findForward(forward);
    }

    private ActionForward validar(ActionMapping mapping, ActionForm form, HttpServletRequest request, Errors errors) {
        LoginForm loginForm = (LoginForm) form;
        Connection conn = null;
        String strForward = "";
        try {
            conn = connectionPool.getConnection();

            //verificar se o login tem acesso e se esta correto
            String login = request.getParameter("login");
            String password = request.getParameter("password");
            String tipoPerfil = request.getParameter("tipoPerfil");

            boolean isLogin = loginForm.verificarLogin(conn, login, password, tipoPerfil);

            if (isLogin) {
                System.out.println("Login OK");

                loginForm.setLogin(login);
                loginForm.setTipoPerfil(tipoPerfil);

                if (tipoPerfil.equals("professor")) {
                    strForward = "frwProfessor";
                } else if (tipoPerfil.equals("aluno")) {
                    strForward = "frwAluno";
                    //verificar se o email possui mais de um aluno vinculado, pois um pai pode ter 2 ou mais filhos na escola
//                    ArrayList<LoginForm> listaEmailsLogin = loginForm.verificarEmailLogin(conn, login, tipoPerfil);
//                    if (listaEmailsLogin.size() > 1) {
//                        request.setAttribute("listaEmailsLogin", listaEmailsLogin);
//                        strForward = "frwMaisAluno";
//                    } else {
//                        strForward = "frwAluno";
//                    }
                } else if (tipoPerfil.equals("coordenacao")) {
                    strForward = "frwDirecao";
                } else if (tipoPerfil.equals("diretoria")) {
                    strForward = "frwDirecao";
                }

            } else {
                System.out.println("erro de login e/ou senha");
                request.setAttribute("erroLogin", "true");
                strForward = "frwErroLogin";
            }

            request.setAttribute("LoginForm", loginForm);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
        return mapping.findForward(strForward);
    }

    private void pageEsqueceuSenha(ActionForm form, HttpServletRequest request, Errors errors) {
        LoginForm loginForm = new LoginForm();
        try {
            request.setAttribute("LoginForm", loginForm);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void resetarSenha(ActionForm form, HttpServletRequest request, Errors errors) {
        LoginForm loginForm = (LoginForm) form;
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            //verificar pessoa_fisica pelo email e data de nascimento
            PessoaFisicaForm pessoaFisicaForm = new PessoaFisicaForm();
            pessoaFisicaForm = pessoaFisicaForm.verificarPessoaFisicaPorEmailDataNascimento(conn, loginForm);
            if (pessoaFisicaForm.getIdPF() != 0) {
                //gerar nova senha randomica
                GeradorSenha geradorSenha = new GeradorSenha();
                String senha = geradorSenha.gerarSenha(5);

                //atualizar na tabela pessoa_fisica
                PessoaFisicaForm pfForm = new PessoaFisicaForm();
                pfForm.atualizarSenhaPessoaFisica(conn, senha, pessoaFisicaForm.getIdPF());

                //atualizar na tabela nk_users
                pfForm.atualizarSenhaNkUsers(conn, senha, pessoaFisicaForm.getIdNkUser());

                //enviar email com a nova senha
                StringBuilder sb = new StringBuilder();

                sb.append("Olá ").append(pessoaFisicaForm.getNome());
                sb.append("<br/><br/>");
                sb.append("<b>Seja bem vindo ao Portal NIKKEN</b>");
                sb.append("<br/>");
                sb.append("Nessa área você poderá acessar para consultar o boletim e receber alguns comunicados. ");
                sb.append("<br/>");
                sb.append("Segue os dados de acesso: ");
                sb.append("<br/><br/>");
                sb.append("Site: www.escolanikken.com");
                sb.append("<br/>");
                sb.append("Login: ").append(pessoaFisicaForm.getEmail());
                sb.append("<br/>");
                sb.append("Senha: ").append(senha);
                sb.append("<br/>");
                sb.append("<br/>");
                sb.append("Atenciosamente,");
                sb.append("<br/>");
                sb.append("Escola Nikken");

                try {
                    EnvioEmail email = new EnvioEmail();
                    email.enviarEmail(pessoaFisicaForm.getEmail(), sb.toString(), "Alteração de senha");
                } catch (Exception e) {
                    e.printStackTrace();
                }
                errors.error("Foi enviado uma nova senha para o seu e-mail: " + pessoaFisicaForm.getEmail());
                request.setAttribute("erroLogin", "false");
                loginForm = new LoginForm();
            } else {
                errors.error("Dados informados incorretamente!!!");
                request.setAttribute("erroLogin", "true");
            }

            request.setAttribute("LoginForm", loginForm);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

}
