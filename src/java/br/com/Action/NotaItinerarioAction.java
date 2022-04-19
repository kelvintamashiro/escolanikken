/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.Action;

import static br.com.Action.IDRAction.connectionPool;
import br.com.Dao.NotaItinerarioDao;
import br.com.Form.AlunoForm;
import br.com.Form.ItinerarioForm;
import br.com.Form.NotaItinerarioForm;
import br.com.Util.Utilitario;
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
public class NotaItinerarioAction extends IDRAction {

    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response, Errors errors, String action) {
        String forward = action;
        if (action.equals("page")) {
            this.page(form, request, errors);
        } else if (action.equals("pageLancarNota")) {
            this.pageLancarNota(form, request, errors);
        } else if (action.equals("salvarNota")) {
            this.salvarNota(form, request, errors);
        } else if (action.equals("excluirNota")) {
            this.excluirNota(form, request, errors);
        }

        return mapping.findForward(forward);
    }

    private void page(ActionForm form, HttpServletRequest request, Errors errors) {
        NotaItinerarioForm notaItinerarioForm = new NotaItinerarioForm();
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            //obter id do professor pela session
            String idProfessor = request.getParameter("idPF");

            //obter disciplinas que o professor pode dar as notas de projetos
            List<NotaItinerarioForm> listaItinerarioPorProfessor = NotaItinerarioDao.getInstance().obterItinerariosPorProfessor(conn, idProfessor);
            if (listaItinerarioPorProfessor.size() > 0) {
                request.setAttribute("listaItinerarioPorProfessor", listaItinerarioPorProfessor);
            }
            request.setAttribute("NotaItinerarioForm", notaItinerarioForm);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private void pageLancarNota(ActionForm form, HttpServletRequest request, Errors errors) {
        NotaItinerarioForm notaItinerarioForm = (NotaItinerarioForm) form;
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            int anoVigente = Utilitario.obterAnoVigente(conn);
            String idSerieAno = request.getParameter("idSerieAno");
            String bimestre = request.getParameter("nrBimestre");

            //obter nome itinerario pelo idItinerario
            ItinerarioForm itinerarioForm = new ItinerarioForm();
            itinerarioForm = itinerarioForm.obterItinerarioPorId(conn, notaItinerarioForm.getIdItinerario());

            notaItinerarioForm.setIdItinerario(itinerarioForm.getIdItinerario());
            notaItinerarioForm.setNomeItinerario(itinerarioForm.getNomeItinerario());
            notaItinerarioForm.setIdSerieAno(itinerarioForm.getIdSerieAno());
            notaItinerarioForm.setCategoriaEnsino(itinerarioForm.getCategoriaEnsino());

            //carregar lista de alunos por serie que ainda nao tiveram as notas lancadas
            ArrayList<AlunoForm> listaAlunosSemNota = NotaItinerarioDao
                    .getInstance().obterListaAlunosPorSerieSemNotasItinerario(conn, idSerieAno, anoVigente, bimestre, notaItinerarioForm.getIdItinerario());
            if (listaAlunosSemNota.size() > 0) {
                request.setAttribute("listaAlunosSemNota", listaAlunosSemNota);
            }

            //carregar lista de alunos por serie que ainda ja tiveram as notas lancadas
            ArrayList<NotaItinerarioForm> listaAlunosComNota = NotaItinerarioDao
                    .getInstance().obterListaAlunosPorSerieComNotasItinerario(conn, idSerieAno, anoVigente, bimestre, notaItinerarioForm.getIdItinerario());
            if (listaAlunosComNota.size() > 0) {
                request.setAttribute("listaAlunosComNota", listaAlunosComNota);
            }

            notaItinerarioForm.setNotaBimestral("");
            request.setAttribute("bimestre", bimestre);
            request.setAttribute("NotaItinerarioForm", notaItinerarioForm);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private void salvarNota(ActionForm form, HttpServletRequest request, Errors errors) {
        NotaItinerarioForm notaItinerarioForm = (NotaItinerarioForm) form;
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();
            int anoVigente = Utilitario.obterAnoVigente(conn);
            notaItinerarioForm.setAno(anoVigente);

            String ntBimestral = request.getParameter("notaBimestral");
            double notaBimestral = 0;

            if (ntBimestral != null && !ntBimestral.equals("")) {
                notaBimestral = Double.parseDouble(ntBimestral.replace(",", "."));
                notaItinerarioForm.setNotaBimestral(String.valueOf(notaBimestral));
            } else {
                notaItinerarioForm.setNotaBimestral(null);
            }

            //salvar nota do aluno e da materia
            NotaItinerarioDao.getInstance().lancarNota(conn, notaItinerarioForm);

            this.pageLancarNota(form, request, errors);
            request.setAttribute("NotaItinerarioForm", notaItinerarioForm);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private void excluirNota(ActionForm form, HttpServletRequest request, Errors errors) {
        NotaItinerarioForm notaItinerarioForm = (NotaItinerarioForm) form;
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            //excluir nota do aluno e da materia
            NotaItinerarioDao.getInstance().excluirNota(conn, notaItinerarioForm);

            this.pageLancarNota(form, request, errors);
            request.setAttribute("NotaItinerarioForm", notaItinerarioForm);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }
}
