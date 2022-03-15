/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.Action;

import br.com.Form.DisciplinasForm;
import br.com.Form.PessoaFisicaForm;
import br.com.abre.Util.Errors;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author macuser
 */
public class DisciplinasAction extends IDRAction {

    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response, Errors errors, String action) {
        String forward = action;
        if (action.equals("page")) {
            this.page(form, request, errors);
        } else if (action.equals("cadastrar")) {
            this.cadastrar(form, request, errors);
        } else if (action.equals("editar")) {
            this.editar(form, request, errors);
        } else if (action.equals("atualizar")) {
            this.atualizar(form, request, errors);
        } else if (action.equals("excluir")) {
            this.excluir(form, request, errors);
        }
//        else if (action.equals("vincularProfessor")) {
//            this.vincularProfessor(form, request, errors);
//        }

        return mapping.findForward(forward);
    }

    private void page(ActionForm form, HttpServletRequest request, Errors errors) {
        DisciplinasForm disciplinasForm = new DisciplinasForm();
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            //obter lista de disciplinas cadastradas
            List<DisciplinasForm> listaDisciplinas = disciplinasForm.obterListaDisciplinasCadastradas(conn);
            request.setAttribute("listaDisciplinas", listaDisciplinas);
            request.setAttribute("DisciplinasForm", disciplinasForm);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }

    }

    private void cadastrar(ActionForm form, HttpServletRequest request, Errors errors) {
        DisciplinasForm disciplinasForm = (DisciplinasForm) form;
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            //inserir na tabela
            disciplinasForm.cadastrarDisciplina(conn, disciplinasForm);
            request.setAttribute("cadastro", "true");
            errors.error("Cadastro da Disciplina Realizado com Sucesso!");
            this.page(form, request, errors);

        } catch (Exception e) {
            e.printStackTrace();
            errors.error("Erro no Cadastro. Favor verificar!");
        } finally {
            connectionPool.free(conn);
        }
    }

    private void editar(ActionForm form, HttpServletRequest request, Errors errors) {
        DisciplinasForm disciplinasForm = (DisciplinasForm) form;
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();
            //obter dados da disciplina
            disciplinasForm = disciplinasForm.obterDadosDisciplinaID(conn, disciplinasForm.getIdDisciplina());
            request.setAttribute("DisciplinasForm", disciplinasForm);
        } catch (Exception e) {
            e.printStackTrace();
            errors.error("Erro no Cadastro. Favor verificar!");
        } finally {
            connectionPool.free(conn);
        }
    }

    private void atualizar(ActionForm form, HttpServletRequest request, Errors errors) {
        DisciplinasForm disciplinasForm = (DisciplinasForm) form;
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            //inserir na tabela
            disciplinasForm.atualizar(conn, disciplinasForm);
            request.setAttribute("cadastro", "true");
            errors.error("Atualização da Disciplina Realizado com Sucesso!");
        } catch (Exception e) {
            e.printStackTrace();
            errors.error("Erro no Cadastro. Favor verificar!");
        } finally {
            connectionPool.free(conn);
        }
    }

    private void excluir(ActionForm form, HttpServletRequest request, Errors errors) {
        DisciplinasForm disciplinasForm = (DisciplinasForm) form;
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            //verificar se essa disciplina ja possui alguma nota vinculada
            boolean isExisteNotaDisciplina = disciplinasForm.isExisteNotaDisciplina(conn, disciplinasForm.getIdDisciplina());
            if (isExisteNotaDisciplina) {
                errors.error("Não pode ser realizada a Exclusão da Disciplina pois já possui notas vinculadas!");
            } else {
                disciplinasForm.excluir(conn, disciplinasForm.getIdDisciplina());
                errors.error("Exclusão da Disciplina Realizado com Sucesso!");
                this.page(form, request, errors);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

}
