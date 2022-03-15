/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.Action;

import br.com.Form.ItinerarioForm;
import br.com.abre.Util.Errors;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import br.com.Form.ListaPresencaItinerarioForm;
import br.com.Util.Utilitario;
import br.com.abre.Util.IDRDate;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;

/**
 *
 * @author macuser
 */
public class ListaPresencaItinerarioAction extends IDRAction {

    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response, Errors errors, String action) {
        String forward = action;
        if (action.equals("page")) {
            this.page(form, request, errors);
        } else if (action.equals("pesquisar")) {
            this.pesquisar(form, request, errors);
        } else if (action.equals("salvarPresenca")) {
            this.salvarPresenca(form, request, errors);
        } else if (action.equals("carregarItinerario")) {
            this.carregarItinerario(form, request, errors);
        } else if (action.equals("pageConsultar")) {
            this.page(form, request, errors);
        } else if (action.equals("carregarItinerarioConsulta")) {
            this.carregarItinerario(form, request, errors);
        } else if (action.equals("consultar")) {
            this.consultar(form, request, errors);
        } else if (action.equals("excluirPresenca")) {
            this.excluirPresenca(form, request, errors);
        }

        return mapping.findForward(forward);
    }

    private void page(ActionForm form, HttpServletRequest request, Errors errors) {
        ListaPresencaItinerarioForm listaItinerarioForm = new ListaPresencaItinerarioForm();
        HttpSession session = request.getSession(true);
        session.removeAttribute("listaAlunos");
        session.removeAttribute("listaItinerarios");
        request.setAttribute("ListaPresencaItinerarioForm", listaItinerarioForm);
    }

    private void carregarItinerario(ActionForm form, HttpServletRequest request, Errors errors) {
        ListaPresencaItinerarioForm listaItinerarioForm = (ListaPresencaItinerarioForm) form;
        Connection conn = null;
        HttpSession session = request.getSession(true);
        try {
            conn = connectionPool.getConnection();
            session.removeAttribute("listaAlunos");
            session.removeAttribute("listaItinerarios");

            String data = request.getParameter("data");
            request.setAttribute("data", data);

            //carregar itinerarios por serie
            ItinerarioForm itinerarioForm = new ItinerarioForm();
            List<ItinerarioForm> listaItinerarios = itinerarioForm.obterListaItinerarioPorSerie(conn, listaItinerarioForm.getIdSerieAno());
            session.setAttribute("listaItinerarios", listaItinerarios);

            request.setAttribute("ListaPresencaItinerarioForm", listaItinerarioForm);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private void pesquisar(ActionForm form, HttpServletRequest request, Errors errors) {
        ListaPresencaItinerarioForm listaItinerarioForm = (ListaPresencaItinerarioForm) form;
        Connection conn = null;
        HttpSession session = request.getSession(true);
        try {
            conn = connectionPool.getConnection();
            String data = listaItinerarioForm.getData();
            request.setAttribute("data", data);

            //obter ano vigente
            int ano = Utilitario.obterAnoVigente(conn);

            //obter alunos por serie e itinerario
            List<ListaPresencaItinerarioForm> listaAlunos = listaItinerarioForm.obterListaAlunosPorItinerario(conn, listaItinerarioForm.getIdSerieAno(), listaItinerarioForm.getIdItinerario(), ano);
            session.setAttribute("listaAlunos", listaAlunos);

            request.setAttribute("ListaPresencaItinerarioForm", listaItinerarioForm);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private void salvarPresenca(ActionForm form, HttpServletRequest request, Errors errors) {
        ListaPresencaItinerarioForm listaItinerarioForm = (ListaPresencaItinerarioForm) form;
        Connection conn = null;
        HttpSession session = request.getSession(true);
        try {
            conn = connectionPool.getConnection();

            //obter ano vigente
            int ano = Utilitario.obterAnoVigente(conn);

            //verificar se para essa data e disciplina ja foi lancado
            boolean isPresencaLancada = listaItinerarioForm.isPresencaLancadaData(conn, listaItinerarioForm);
            if (!isPresencaLancada) {

                ArrayList<ListaPresencaItinerarioForm> listaAlunos = new ArrayList<>();
                if (session.getAttribute("listaAlunos") != null) {
                    listaAlunos = (ArrayList<ListaPresencaItinerarioForm>) session.getAttribute("listaAlunos");
                }

                ArrayList<String> listaAlunosFaltaram = new ArrayList<>();

                for (ListaPresencaItinerarioForm aluno : listaAlunos) {
                    listaAlunosFaltaram.add(String.valueOf(aluno.getIdAluno()));
                }

                ArrayList<String> listaAlunosPresenca = new ArrayList<>();
                String[] listaIdAlunos = listaItinerarioForm.getSelectedOptions();
                if (listaIdAlunos != null) {
                    for (String idAluno : listaIdAlunos) {
                        listaAlunosPresenca.add(idAluno);
                        listaItinerarioForm.salvarPresenca(conn, idAluno, listaItinerarioForm, 0, ano, "N");
                    }
                }

                listaAlunosFaltaram.removeAll(listaAlunosPresenca);
                for (String idAlunoFalta : listaAlunosFaltaram) {
                    listaItinerarioForm.salvarPresenca(conn, idAlunoFalta, listaItinerarioForm, listaItinerarioForm.getQtdAulas(), ano, "S");
                }

                listaItinerarioForm.setIdItinerario(0);

                errors.error("Presença confirmada com Sucesso!!");
            } else {
                errors.error("Já foi lançado presença para essa série, itinerário e data. Caso queira alterar, consulte e faça a edição.");
            }

            session.removeAttribute("listaAlunos");
            request.setAttribute("ListaPresencaItinerarioForm", listaItinerarioForm);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private void consultar(ActionForm form, HttpServletRequest request, Errors errors) {
        ListaPresencaItinerarioForm listaItinerarioForm = (ListaPresencaItinerarioForm) form;
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            int idSerieAno = Integer.parseInt(request.getParameter("idSerieAno"));
            int idItinerario = listaItinerarioForm.getIdItinerario();
            String data = listaItinerarioForm.getData();
            if (data.contains("/")) {
                data = IDRDate.parseDataIso(data);
            }

            //carregar lista de alunos por data, serie e itinerario
            List<ListaPresencaItinerarioForm> listaAlunosPresenca = listaItinerarioForm.obterListaAlunosPresenca(conn, idSerieAno, data, idItinerario);
            request.setAttribute("listaAlunosPresenca", listaAlunosPresenca);

            request.setAttribute("data", data);
            request.setAttribute("ListaPresencaItinerarioForm", listaItinerarioForm);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private void excluirPresenca(ActionForm form, HttpServletRequest request, Errors errors) {
        ListaPresencaItinerarioForm listaItinerarioForm = (ListaPresencaItinerarioForm) form;
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            String[] listaIdPresenca = listaItinerarioForm.getSelectedOptions();
            for (String idPresenca : listaIdPresenca) {
                listaItinerarioForm.excluirPresencaPorID(conn, idPresenca);
            }

            request.setAttribute("ListaPresencaItinerarioForm", listaItinerarioForm);
            this.consultar(listaItinerarioForm, request, errors);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

   

}
