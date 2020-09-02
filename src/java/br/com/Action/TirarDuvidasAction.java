/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.Action;

import br.com.Dao.NotaBimestreDao;
import br.com.Form.AlunoForm;
import br.com.Form.DisciplinasForm;
import br.com.Form.TirarDuvidasForm;
import br.com.Util.EnvioEmail;
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
public class TirarDuvidasAction extends IDRAction {

    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response, Errors errors, String action) {
        String forward = action;
        if (action.equals("page")) {
            this.page(form, request, errors);
        } else if (action.equals("enviar")) {
            this.enviar(form, request, errors);
        }

        return mapping.findForward(forward);
    }

    private void page(ActionForm form, HttpServletRequest request, Errors errors) {
        TirarDuvidasForm duvidasForm = new TirarDuvidasForm();
        Connection conn = null;
        HttpSession session = request.getSession(true);
        try {
            conn = connectionPool.getConnection();

            //obter id do aluno e carregar disciplinas do aluno
            String nomeAluno = (String) session.getAttribute("nome");
            String idPF = request.getParameter("idPF");
            duvidasForm.setNomeAluno(nomeAluno);

            AlunoForm alunoForm = new AlunoForm();
            alunoForm = alunoForm.obterDadosAlunoPorID(conn, idPF);
            duvidasForm.setEmailAluno(alunoForm.getEmail());

            //carregar categoria por serie
            String categoria = NotaBimestreDao.getInstance().obterCategoriaEnsinoPorSerie(alunoForm.getSerieAno());

            //carregar disciplinas por categoria
            DisciplinasForm disciplinasForm = new DisciplinasForm();
            List<DisciplinasForm> listaDisciplinas = disciplinasForm.obterListaDisciplinasPorCategoria(conn, categoria);

            duvidasForm.setMensagem("");
            duvidasForm.setIdDisciplina("0");
            request.setAttribute("nomeAluno", nomeAluno);
            request.setAttribute("listaDisciplinas", listaDisciplinas);
            request.setAttribute("TirarDuvidasForm", duvidasForm);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private void enviar(ActionForm form, HttpServletRequest request, Errors errors) {
        TirarDuvidasForm duvidasForm = (TirarDuvidasForm) form;
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            //enviar por email para escola contato@escolanikken.com
            try {
                EnvioEmail envio = new EnvioEmail();
                String email = "contato@escolanikken.com";
                StringBuilder sb = new StringBuilder();
                sb.append("Nome do Aluno: ").append(duvidasForm.getNomeAluno());
                sb.append("<br/>");
                sb.append("E-mail do Aluno: ").append(duvidasForm.getEmailAluno());
                sb.append("<br/>");
                sb.append("Disciplina/Assunto: ").append(duvidasForm.getIdDisciplina());
                sb.append("<br/>");
                sb.append("Mensagem: ").append(duvidasForm.getMensagem());
                sb.append("<br/><br/><br/>");
                sb.append("E-mail enviado pelo portal NIKKEN");
                envio.enviarEmail(email, sb.toString(), "Envio formulário Dúvidas - Portal Nikken");
                errors.error("E-mail enviado com SUCESSO!!");

                duvidasForm.setMensagem("");
                duvidasForm.setIdDisciplina("0");
                this.page(form, request, errors);
                request.setAttribute("TirarDuvidasForm", duvidasForm);
            } catch (Exception e) {
                e.printStackTrace();
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

}
