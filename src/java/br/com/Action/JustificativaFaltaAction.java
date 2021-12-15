/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.Action;

import static br.com.Action.IDRAction.connectionPool;
import br.com.Form.AlunoForm;
import br.com.Form.JustificativaFaltaForm;
import br.com.Util.Utilitario;
import br.com.abre.Util.Errors;
import java.sql.Connection;
import java.util.List;
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
public class JustificativaFaltaAction extends IDRAction {

    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response, Errors errors, String action) {
        String forward = action;
        if (action.equals("page")) {
            this.page(form, request, errors);
        } else if (action.equals("carregarAlunosPorSerie")) {
            this.carregarAlunosPorSerie(form, request, errors);
        } else if (action.equals("salvarJustificativa")) {
            this.salvarJustificativa(form, request, errors);
        } else if (action.equals("pesquisar")) {
            this.pesquisar(form, request, errors);
        } else if (action.equals("excluir")) {
            this.excluir(form, request, errors);
        }

        return mapping.findForward(forward);
    }

    private void page(ActionForm form, HttpServletRequest request, Errors errors) {
        JustificativaFaltaForm justificativaFaltaForm = new JustificativaFaltaForm();
        request.setAttribute("JustificativaFaltaForm", justificativaFaltaForm);
    }

    private void carregarAlunosPorSerie(ActionForm form, HttpServletRequest request, Errors errors) {
        JustificativaFaltaForm justificativaFaltaForm = new JustificativaFaltaForm();
        Connection conn = null;
        HttpSession session = request.getSession(true);
        try {
            conn = connectionPool.getConnection();
            String idSerieAno = request.getParameter("idSerieAno");
            justificativaFaltaForm.setIdSerieAno(Integer.parseInt(idSerieAno));

            //carregar lista de alunos por serie
            AlunoForm alunoForm = new AlunoForm();
            List<AlunoForm> listaAlunos = alunoForm.obterAlunosPorSerie(conn, idSerieAno);
            session.setAttribute("listaAlunos", listaAlunos);

            request.setAttribute("JustificativaFaltaForm", justificativaFaltaForm);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private void salvarJustificativa(ActionForm form, HttpServletRequest request, Errors errors) {
        JustificativaFaltaForm justificativaFaltaForm = (JustificativaFaltaForm) form;
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();
            
            //obter ano vigente
            int anoVigente = Utilitario.obterAnoVigente(conn);
            justificativaFaltaForm.setAno(anoVigente);

            //salvar na tabela justificativa_falta
            justificativaFaltaForm.salvar(conn, justificativaFaltaForm);

            justificativaFaltaForm = new JustificativaFaltaForm();
            request.setAttribute("JustificativaFaltaForm", justificativaFaltaForm);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private void pesquisar(ActionForm form, HttpServletRequest request, Errors errors) {
        JustificativaFaltaForm justificativaFaltaForm = (JustificativaFaltaForm) form;
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            //pesquisar na tabela justificativa_falta
            List<JustificativaFaltaForm> listaJustificativas = justificativaFaltaForm.pesquisar(conn);

            request.setAttribute("listaJustificativas", listaJustificativas);
            request.setAttribute("JustificativaFaltaForm", justificativaFaltaForm);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private void excluir(ActionForm form, HttpServletRequest request, Errors errors) {
        JustificativaFaltaForm justificativaFaltaForm = (JustificativaFaltaForm) form;
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            //excluir a tabela justificativa_falta
            justificativaFaltaForm.excluir(conn, justificativaFaltaForm.getId());

            //pesquisar na tabela justificativa_falta
            List<JustificativaFaltaForm> listaJustificativas = justificativaFaltaForm.pesquisar(conn);
            
            errors.error("Excluído com Sucesso!!");
            
            request.setAttribute("listaJustificativas", listaJustificativas);
            request.setAttribute("JustificativaFaltaForm", justificativaFaltaForm);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

}
