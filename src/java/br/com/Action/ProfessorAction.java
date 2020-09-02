/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.Action;

import static br.com.Action.IDRAction.connectionPool;
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
public class ProfessorAction extends IDRAction {

    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response, Errors errors, String action) {
        String forward = action;
        if (action.equals("pageCadastrar")) {
            this.pageCadastrar(form, request, errors);
        } else if (action.equals("cadastrar")) {
            this.cadastrar(form, request, errors);
        } else if (action.equals("pageConsultar")) {
            this.pageCadastrar(form, request, errors);
        } else if (action.equals("consultar")) {
            this.consultar(form, request, errors);
        } else if (action.equals("pageAtualizar")) {
            this.pageAtualizar(form, request, errors);
        } else if (action.equals("atualizar")) {
            this.atualizar(form, request, errors);
        }

        return mapping.findForward(forward);
    }

    private void pageCadastrar(ActionForm form, HttpServletRequest request, Errors errors) {
        PessoaFisicaForm professorForm = new PessoaFisicaForm();
        request.setAttribute("PessoaFisicaForm", professorForm);
    }

    private void cadastrar(ActionForm form, HttpServletRequest request, Errors errors) {
        PessoaFisicaForm professorForm = (PessoaFisicaForm) form;
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            //verificar se o professor ja se encontra cadastrado
            PessoaFisicaForm pfForm = new PessoaFisicaForm();
            boolean isExisteAluno = pfForm.verificarNomePessoaFisicaCadastrado(conn, professorForm.getNome());
            if (isExisteAluno) {
                errors.error("Esse PROFESSOR já se encontra cadastrado na base de dados!! Favor verificar");
            } else {
                GeradorSenha geradorSenha = new GeradorSenha();
                String senha = geradorSenha.gerarSenha(5);
                professorForm.setPassword(senha);
                //cadastrar na base de dados nas tabelas pessoa_fisica
                professorForm.setStatus(1);
//                professorForm.setTipoPerfil("professor");
                int idWpUser = pfForm.inserirWpUsers(conn, professorForm);
                if (idWpUser != 0) {
                    int idPessoaFisica = pfForm.inserirPessoaFisica(conn, professorForm, idWpUser);
                    //enviar email com a senha gerada
                    try {

                        StringBuilder sb = new StringBuilder();
                        sb.append("Olá ").append(professorForm.getNome());
                        sb.append("<br/><br/>");
                        sb.append("<b>Seja bem vindo ao Portal NIKKEN</b>");
                        sb.append("<br/>");
                        sb.append("Nessa área você poderá acessar para consultar o boletim e receber alguns comunicados. ");
                        sb.append("<br/>");
                        sb.append("Segue os dados de acesso: ");
                        sb.append("<br/><br/>");
                        sb.append("Site: www.escolanikken.com/portal");
                        sb.append("<br/>");
                        sb.append("Login: ").append(professorForm.getEmail());
                        sb.append("<br/>");
                        sb.append("Senha: ").append(senha);
                        sb.append("<br/>");
                        sb.append("<br/>");
                        sb.append("Atenciosamente,");
                        sb.append("<br/>");
                        sb.append("Escola Nikken");

                        EnvioEmail envio = new EnvioEmail();
//                        EnvioEmailGmail envio = new EnvioEmailGmail();
//                        envio.enviarEmail("kelvin@mitsistemas.com.br", sb.toString(), "Dados de Acesso ao Portal Nikken");
                        envio.enviarEmail(professorForm.getEmail(), sb.toString(), "Dados de Acesso ao Portal Nikken");
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    errors.error("Cadastro do PROFESSOR Realizado com Sucesso!");
                    request.setAttribute("cadastro", "true");
                    professorForm = new PessoaFisicaForm();
                    request.setAttribute("PessoaFisicaForm", professorForm);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            errors.error("Erro no Cadastro. Favor verificar!");
            request.setAttribute("cadastro", "false");
        } finally {
            connectionPool.free(conn);
        }
    }

    private void consultar(ActionForm form, HttpServletRequest request, Errors errors) {
        PessoaFisicaForm professorForm = (PessoaFisicaForm) form;
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            ArrayList<PessoaFisicaForm> listaProfessores = professorForm.obterListaProfessores(conn, professorForm);
            if (listaProfessores.size() > 0) {
                request.setAttribute("listaProfessores", listaProfessores);
            }
//            professorForm = new AlunoForm();
            request.setAttribute("PessoaFisicaForm", professorForm);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private void pageAtualizar(ActionForm form, HttpServletRequest request, Errors errors) {
        PessoaFisicaForm professorForm = new PessoaFisicaForm();
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            String idPf = request.getParameter("idPF");

            PessoaFisicaForm dadosProfessor = professorForm.obterDadosPessoaFisicaPorID(conn, idPf);

            request.setAttribute("PessoaFisicaForm", dadosProfessor);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private void atualizar(ActionForm form, HttpServletRequest request, Errors errors) {
        PessoaFisicaForm professorForm = (PessoaFisicaForm) form;
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            //atualizar dados pessoa_fisica
            PessoaFisicaForm pfForm = new PessoaFisicaForm();
            professorForm.setTipoPerfil("professor");
            pfForm.atualizarPessoaFisica(conn, professorForm);

            errors.error("Atualização realizada com Sucesso!");
            request.setAttribute("atualizar", "true");
            request.setAttribute("PessoaFisicaForm", professorForm);
        } catch (Exception e) {
            errors.error("Erro na Atualização. Favor verificar!");
            request.setAttribute("atualizar", "false");
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }
}
