/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.Action;

import br.com.CriptoDecripto;
import br.com.Form.AdvertenciaForm;
import br.com.Form.AlunoForm;
import br.com.abre.Util.Errors;
import br.com.abre.Util.IDRDate;
import java.sql.Connection;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
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
public class AdvertenciaAction extends IDRAction {

    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response, Errors errors, String action) {
        String forward = action;
        if (action.equals("page")) {
            this.page(form, request, errors);
        } else if (action.equals("carregarAlunosPorSerie")) {
            this.carregarAlunosPorSerie(form, request, errors);
        } else if (action.equals("salvarAdvertencia")) {
            this.salvarAdvertencia(form, request, errors);
        } else if (action.equals("pagePesquisar")) {
            this.pagePesquisar(form, request, errors);
        } else if (action.equals("imprimirAdvertencia")) {
            this.imprimirAdvertencia(form, request, errors);
        } else if (action.equals("pagePesquisarAluno")) {
            return pagePesquisarAluno(mapping, form, request, errors);
        } else if (action.equals("imprimirAdvertenciaAluno")) {
            this.imprimirAdvertenciaAluno(form, request, errors);
        } else if (action.equals("excluirAdvertencia")) {
            this.excluirAdvertencia(form, request, errors);
        }

        return mapping.findForward(forward);
    }

    private void page(ActionForm form, HttpServletRequest request, Errors errors) {
        AdvertenciaForm advertenciaForm = new AdvertenciaForm();
        HttpSession session = request.getSession(true);
        session.removeAttribute("listaAlunos");
        session.removeAttribute("listaAdvertencia");
        request.setAttribute("AdvertenciaForm", advertenciaForm);
    }

    private void carregarAlunosPorSerie(ActionForm form, HttpServletRequest request, Errors errors) {
        AdvertenciaForm advertenciaForm = new AdvertenciaForm();
        Connection conn = null;
        HttpSession session = request.getSession(true);
        try {
            conn = connectionPool.getConnection();
            String idSerieAno = request.getParameter("idSerieAno");
            advertenciaForm.setIdSerieAno(Integer.parseInt(idSerieAno));

            //carregar lista de alunos por serie
            AlunoForm alunoForm = new AlunoForm();
            List<AlunoForm> listaAlunos = alunoForm.obterAlunosPorSerie(conn, idSerieAno);
            session.setAttribute("listaAlunos", listaAlunos);

            //carregar lista de advertencia
            List<AdvertenciaForm> listaAdvertencia = advertenciaForm.obterListaAdvertencia(conn);
            session.setAttribute("listaAdvertencia", listaAdvertencia);

            request.setAttribute("AdvertenciaForm", advertenciaForm);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private void salvarAdvertencia(ActionForm form, HttpServletRequest request, Errors errors) {
        AdvertenciaForm advertenciaForm = (AdvertenciaForm) form;
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            String[] idTiposAdvertencias = advertenciaForm.getSelectedOptions();
            if (idTiposAdvertencias != null) {
                String idAdvertencias = "";
                for (String idTiposAdvertencia : idTiposAdvertencias) {
                    System.out.println(idTiposAdvertencia);
                    idAdvertencias += idTiposAdvertencia + ",";
                }
                idAdvertencias = idAdvertencias.substring(0, idAdvertencias.length() - 1);

                //salvar advertencia_aluno
                advertenciaForm.salvarAdvertencia(conn, advertenciaForm, idAdvertencias);

                errors.error("Advertência Cadastrada com Sucesso!!");
                request.setAttribute("salvo", "true");
            } else {
                errors.error("Deve ser informado o tipo da Advertência!!");
                request.setAttribute("salvo", "false");
            }
            request.setAttribute("AdvertenciaForm", advertenciaForm);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private void pagePesquisar(ActionForm form, HttpServletRequest request, Errors errors) {
        AdvertenciaForm advertenciaForm = new AdvertenciaForm();
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            //pesquisar todas as advertencias
            List<AdvertenciaForm> listaAdvertencias = advertenciaForm.obterListaAdvertenciasAlunos(conn);
            request.setAttribute("listaAdvertencias", listaAdvertencias);
            request.setAttribute("AdvertenciaForm", advertenciaForm);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private ActionForward pagePesquisarAluno(ActionMapping mapping, ActionForm form, HttpServletRequest request, Errors errors) {
        AdvertenciaForm advertenciaForm = new AdvertenciaForm();
        Connection conn = null;
        HttpSession session = request.getSession();
        String strForward = "";
        try {
            conn = connectionPool.getConnection();

            int idAluno = Integer.parseInt(request.getParameter("idPF"));

            //verificar se o ID é o mesmo que esta na sessao
            int idPfSession = (int) session.getAttribute("idPF");
            if (idAluno != idPfSession) {
                strForward = "fwrError";
            } else {
                strForward = "pagePesquisarAluno";

                //pesquisar todas as advertencias
                List<AdvertenciaForm> listaAdvertencias = advertenciaForm.obterListaAdvertenciasAlunos(conn, idAluno);
                request.setAttribute("listaAdvertencias", listaAdvertencias);

                request.setAttribute("AdvertenciaForm", advertenciaForm);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
        return mapping.findForward(strForward);
    }

    private void imprimirAdvertencia(ActionForm form, HttpServletRequest request, Errors errors) {
        AdvertenciaForm advertenciaForm = (AdvertenciaForm) form;
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            String idAdvertencia = request.getParameter("idAdvertencia");

            //obter dados advertencia por ID
            advertenciaForm = advertenciaForm.obterListaAdvertenciasPorID(conn, idAdvertencia);

            DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            Date data = (Date) formatter.parse(advertenciaForm.getDataAdvertencia());
            DateFormat dfl = DateFormat.getDateInstance(DateFormat.LONG, new Locale("pt", "BR"));
            String dataExtenso = dfl.format(data);

            advertenciaForm.setDataPorExtenso(dataExtenso);
            request.setAttribute("AdvertenciaForm", advertenciaForm);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private void imprimirAdvertenciaAluno(ActionForm form, HttpServletRequest request, Errors errors) {
        AdvertenciaForm advertenciaForm = (AdvertenciaForm) form;
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            CriptoDecripto criptoDecripto = new CriptoDecripto();
            String idDecripto = criptoDecripto.decripto(advertenciaForm.getIdAdvertenciaCripto());

            //obter dados advertencia por ID
            advertenciaForm = advertenciaForm.obterListaAdvertenciasPorID(conn, idDecripto);

            DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            Date data = (Date) formatter.parse(advertenciaForm.getDataAdvertencia());
            DateFormat dfl = DateFormat.getDateInstance(DateFormat.LONG, new Locale("pt", "BR"));
            String dataExtenso = dfl.format(data);

            advertenciaForm.setDataPorExtenso(dataExtenso);
            request.setAttribute("AdvertenciaForm", advertenciaForm);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private void excluirAdvertencia(ActionForm form, HttpServletRequest request, Errors errors) {
        AdvertenciaForm advertenciaForm = (AdvertenciaForm) form;
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();
            
            //excluir por idAdvertencia
            advertenciaForm.excluirAdvertencia(conn, advertenciaForm.getIdAdvertencia());
            
            this.pagePesquisar(form, request, errors);
            
            request.setAttribute("AdvertenciaForm", advertenciaForm);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

}
