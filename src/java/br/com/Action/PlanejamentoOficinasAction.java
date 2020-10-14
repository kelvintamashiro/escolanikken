/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.Action;

import static br.com.Action.IDRAction.connectionPool;
import br.com.Form.PessoaFisicaForm;
import br.com.Form.PlanejamentoOficinasForm;
import br.com.Form.SerieAnoForm;
import br.com.abre.Util.Errors;
import java.sql.Connection;
import java.util.ArrayList;
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
public class PlanejamentoOficinasAction extends IDRAction {

    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response, Errors errors, String action) {
        String forward = action;
        if (action.equals("page")) {
            this.page(form, request, errors);
        } else if (action.equals("salvar")) {
            this.salvar(form, request, errors);
        } else if (action.equals("pagePesquisar")) {
            this.pagePesquisar(form, request, errors);
        } else if (action.equals("pesquisar")) {
            this.pesquisar(form, request, errors);
        } else if (action.equals("editar") || action.equals("visualizar")) {
            this.editar(form, request, errors);
        } else if (action.equals("excluir")) {
            this.excluir(form, request, errors);
        } else if (action.equals("atualizar")) {
            this.atualizar(form, request, errors);
        }

        return mapping.findForward(forward);
    }

    private void page(ActionForm form, HttpServletRequest request, Errors errors) {
        PlanejamentoOficinasForm planejamentoOficinaForm = new PlanejamentoOficinasForm();
        HttpSession session = request.getSession();
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();
            String idProfessor = request.getParameter("idPF");
            planejamentoOficinaForm.setIdProfessor(Integer.parseInt(idProfessor));

            //obter lista serie/ano
            SerieAnoForm serieAnoForm = new SerieAnoForm();
            List<SerieAnoForm> listaSerieAno = serieAnoForm.listaTodasSeries(conn);
            session.setAttribute("listaSerieAno", listaSerieAno);

            request.setAttribute("PlanejamentoOficinasForm", planejamentoOficinaForm);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private void salvar(ActionForm form, HttpServletRequest request, Errors errors) {
        PlanejamentoOficinasForm planejamentoOficinaForm = (PlanejamentoOficinasForm) form;
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();
            String idProfessor = request.getParameter("idPF");

            String[] listaSerieAno = planejamentoOficinaForm.getSelectedOptions();
            if (listaSerieAno != null) {
                String serieAno = "";
                for (String idSerie : listaSerieAno) {
                    System.out.println(idSerie);
                    serieAno += idSerie + ",";
                }

                serieAno = serieAno.substring(0, serieAno.length() - 1);
                planejamentoOficinaForm.setDsSerieAno(serieAno);

                //salvar na tabela planejamento_oficina
                planejamentoOficinaForm.salvar(conn, planejamentoOficinaForm);
                planejamentoOficinaForm = new PlanejamentoOficinasForm();
                planejamentoOficinaForm.setIdProfessor(Integer.parseInt(idProfessor));

                errors.error("Planejamento de Oficina Cadastrada com Sucesso!!");
                request.setAttribute("PlanejamentoOficinasForm", planejamentoOficinaForm);
            } else {
                errors.error("Deve ser informado as Séries/Ano");
            }
        } catch (Exception e) {
            e.printStackTrace();
            errors.error("Ocorreu um erro ao Salvar o Planejamento de Oficina. Error: " + e.getMessage());
        } finally {
            connectionPool.free(conn);
        }
    }

    private void pagePesquisar(ActionForm form, HttpServletRequest request, Errors errors) {
        PlanejamentoOficinasForm planejamentoOficinaForm = new PlanejamentoOficinasForm();
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();
            String idProfessor = request.getParameter("idPF");
            planejamentoOficinaForm.setIdProfessor(Integer.parseInt(idProfessor));

            //obter todos os professores
            PessoaFisicaForm professorForm = new PessoaFisicaForm();
            professorForm.setStatus(1);
            ArrayList<PessoaFisicaForm> listaProfessores = professorForm.obterListaProfessores(conn, professorForm);
            if (listaProfessores.size() > 0) {
                request.setAttribute("listaProfessores", listaProfessores);
            }

            request.setAttribute("PlanejamentoOficinasForm", planejamentoOficinaForm);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private void pesquisar(ActionForm form, HttpServletRequest request, Errors errors) {
        PlanejamentoOficinasForm planejamentoOficinaForm = (PlanejamentoOficinasForm) form;
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();
//            String idProfessor = request.getParameter("idPF");
//            planejamentoOficinaForm.setIdProfessor(Integer.parseInt(idProfessor));

            //carregar planejamento de oficina por professor
            List<PlanejamentoOficinasForm> listaPlanoOficinas = planejamentoOficinaForm.obterListaPlanejamentoOficinaPorProfessor(conn, planejamentoOficinaForm);
            if (listaPlanoOficinas.size() > 0) {
                request.setAttribute("listaPlanoOficinas", listaPlanoOficinas);
            }

            request.setAttribute("PlanejamentoOficinasForm", planejamentoOficinaForm);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private void editar(ActionForm form, HttpServletRequest request, Errors errors) {
        PlanejamentoOficinasForm planejamentoOficinaForm = (PlanejamentoOficinasForm) form;
        HttpSession session = request.getSession();
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            //obter lista serie/ano
            SerieAnoForm serieAnoForm = new SerieAnoForm();
            List<SerieAnoForm> listaSerieAno = serieAnoForm.listaTodasSeries(conn);
            session.setAttribute("listaSerieAno", listaSerieAno);

            //carregar plano de aula por idPlanejamento
            planejamentoOficinaForm = planejamentoOficinaForm.obterPlanoOficinaPorID(conn, planejamentoOficinaForm.getIdPlanejamento());
            request.setAttribute("PlanejamentoOficinasForm", planejamentoOficinaForm);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private void excluir(ActionForm form, HttpServletRequest request, Errors errors) {
        PlanejamentoOficinasForm planejamentoOficinaForm = (PlanejamentoOficinasForm) form;
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            //excluir plano de aula por idPlanejamento
            planejamentoOficinaForm.excluir(conn, planejamentoOficinaForm.getIdPlanejamento());
            this.pesquisar(planejamentoOficinaForm, request, errors);
            request.setAttribute("PlanejamentoOficinasForm", planejamentoOficinaForm);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private void atualizar(ActionForm form, HttpServletRequest request, Errors errors) {
        PlanejamentoOficinasForm planejamentoOficinaForm = (PlanejamentoOficinasForm) form;
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            String[] listaSerieAno = planejamentoOficinaForm.getSelectedOptions();
            if (listaSerieAno != null) {
                String serieAno = "";
                for (String idSerie : listaSerieAno) {
                    System.out.println(idSerie);
                    serieAno += idSerie + ",";
                }

                serieAno = serieAno.substring(0, serieAno.length() - 1);
                planejamentoOficinaForm.setDsSerieAno(serieAno);

                //atualizar plano de aula por idPlanejamento
                planejamentoOficinaForm.atualizar(conn, planejamentoOficinaForm);
                errors.error("Planejamento de Oficina atualizado com SUCESSO!!");

//                this.editar(planejamentoOficinaForm, request, errors);
            } else {
                errors.error("Deve ser informado as Séries/Ano");
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

}
