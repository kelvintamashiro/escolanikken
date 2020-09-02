/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.Action;

import br.com.Form.AlterarSenhaForm;
import br.com.Form.PessoaFisicaForm;
import br.com.abre.Util.Errors;
import java.sql.Connection;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author macuser
 */
public class AlterarSenhaAction extends IDRAction {

    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response, Errors errors, String action) {
        String forward = action;
        if (action.equals("page")) {
            this.page(form, request, errors);
        } else if (action.equals("alterar")) {
            this.alterar(form, request, errors);
        }

        return mapping.findForward(forward);
    }

    private void page(ActionForm form, HttpServletRequest request, Errors errors) {
        AlterarSenhaForm alterarSenhaForm = new AlterarSenhaForm();
        Connection conn = null;
        HttpSession session = request.getSession(true);
        try {
            conn = connectionPool.getConnection();

            String login = (String) session.getAttribute("login");
            String nome = (String) session.getAttribute("nome");
            Integer idPF = (Integer) session.getAttribute("idPF");
            alterarSenhaForm.setLogin(login);
            alterarSenhaForm.setNome(nome);
            alterarSenhaForm.setIdPF(idPF);

            request.setAttribute("AlterarSenhaForm", alterarSenhaForm);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private void alterar(ActionForm form, HttpServletRequest request, Errors errors) {
        AlterarSenhaForm alterarSenhaForm = (AlterarSenhaForm) form;
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            //verificar se a senha antiga é a mesma que ele informou
            boolean isSenhaAntigaOK = alterarSenhaForm.verificarSenhaAntiga(conn, alterarSenhaForm);
            if (isSenhaAntigaOK) {
                //obter id_nk_users pelo id_pessoa_fisica
                PessoaFisicaForm pf = new PessoaFisicaForm();
                int idNkUser = pf.obterIdNkUserPorIdPF(conn, alterarSenhaForm.getIdPF());
                alterarSenhaForm.setIdNkUser(idNkUser);
                
                //alterar a senha na tabela pessoa_fisica
                alterarSenhaForm.alterarSenha(conn, alterarSenhaForm);

                errors.error("Alteração de SENHA Realizada com Sucesso!");
                request.setAttribute("AlterarSenhaForm", alterarSenhaForm);
                request.setAttribute("atualizar", "true");
            } else {
                errors.error("A senha antiga não é a mesma cadastrada na base da dados. Favor verificar!!");
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("atualizar", "false");
        } finally {
            connectionPool.free(conn);
        }
    }
    
}
