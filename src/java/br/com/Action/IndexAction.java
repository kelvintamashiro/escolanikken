/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.Action;

import br.com.Form.ComunicadosForm;
import br.com.Form.IndexForm;
import br.com.Form.LoginForm;
import br.com.Form.PessoaFisicaForm;
import br.com.abre.Util.Errors;
import java.sql.Connection;
import java.util.ArrayList;
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
public class IndexAction extends IDRAction {

    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response, Errors errors, String action) {
        String forward = action;
        if (action.equals("redirecionarAcesso")) {
            this.redirecionarAcesso(form, request, errors);
        }

        return mapping.findForward(forward);
    }

    private void redirecionarAcesso(ActionForm form, HttpServletRequest request, Errors errors) {
//        IndexForm indexForm = (IndexForm) form;
        Connection conn = null;
        HttpSession session = request.getSession(true);
        try {
            conn = connectionPool.getConnection();
            String login = request.getParameter("login");
            String tipoPerfil = request.getParameter("tipoPerfil");

            //obter dados pessoa_fisica pelo login
            PessoaFisicaForm pfForm = new PessoaFisicaForm();
            pfForm = pfForm.obterDadosPessoaFisicaPorLogin(conn, login);

            switch (tipoPerfil) {
                case "professor":
                    System.out.println("Perfil de Professor");
                    break;
                case "aluno":
                    System.out.println("Perfil de Aluno");
                    //carregar ultimos avisos da escola
                    ComunicadosForm comunicadosForm = new ComunicadosForm();
                    ArrayList<ComunicadosForm> listaComunicados = comunicadosForm.obterUltimosComunicadosPorIDPessoa(conn, pfForm.getIdPF());
                    session.setAttribute("listaComunicados", listaComunicados);
                    break;
                case "coordenacao":
                    System.out.println("Perfil de Coordenacao");
                    break;
                case "diretoria":
                    System.out.println("Perfil de Diretoria");
                    break;
                default:
                    break;
            }

            System.out.println("Nome: " + pfForm.getNome());
            session.setAttribute("nome", pfForm.getNome());
            session.setAttribute("tipoPerfil", tipoPerfil);
            session.setAttribute("login", login);
            session.setAttribute("idPF", pfForm.getIdPF());
            request.setAttribute("PessoaFisicaForm", pfForm);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

}
