/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.Action;

import br.com.Dao.NotaBimestreDao;
import br.com.Form.NotaBimestreForm;
import br.com.Form.PessoaFisicaForm;
import br.com.Form.PlanejamentoAulasForm;
import br.com.Form.SerieAnoForm;
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
public class PlanejamentoAulasAction extends IDRAction {

    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response, Errors errors, String action) {
        String forward = action;
        if (action.equals("page")) {
            this.page(form, request, errors);
        } else if (action.equals("carregarSerie")) {
            this.carregarSerie(form, request, errors);
        } else if (action.equals("salvar")) {
            this.salvar(form, request, errors);
        } else if (action.equals("pesquisar")) {
            this.pesquisar(form, request, errors);
        } else if (action.equals("pesquisarProfessorBimestre")) {
            this.pesquisarProfessorBimestre(form, request, errors);
        } else if (action.equals("pesquisarTodos")) {
            this.pesquisarTodos(form, request, errors);
        } else if (action.equals("editar")) {
            this.editar(form, request, errors);
        } else if (action.equals("excluir")) {
            this.excluir(form, request, errors);
        } else if (action.equals("atualizar")) {
            this.atualizar(form, request, errors);
        } else if (action.equals("confirmar")) {
            this.confirmar(form, request, errors);
        } else if (action.equals("pagePesquisarPorProfessor")) {
            this.pagePesquisarPorProfessor(form, request, errors);
        } else if (action.equals("carregarDisciplinaPorProfessorSerie")) {
            this.carregarDisciplinaPorProfessorSerie(form, request, errors);
        }

        return mapping.findForward(forward);
    }

    private void page(ActionForm form, HttpServletRequest request, Errors errors) {
        PlanejamentoAulasForm planejamentoAulasForm = new PlanejamentoAulasForm();
        try {
            String idProfessor = request.getParameter("idPF");
            planejamentoAulasForm.setIdProfessor(Integer.parseInt(idProfessor));

            request.setAttribute("PlanejamentoAulasForm", planejamentoAulasForm);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void carregarSerie(ActionForm form, HttpServletRequest request, Errors errors) {
        PlanejamentoAulasForm planejamentoAulasForm = (PlanejamentoAulasForm) form;
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();
            String idProfessor = request.getParameter("idPF");
            String categoriaEnsino = request.getParameter("categoriaEnsino");

            //carregar serie por Categoria Ensino
            SerieAnoForm serieAnoForm = new SerieAnoForm();
            ArrayList<SerieAnoForm> listaSerie = serieAnoForm.obterSerieAnoPorCategoria(categoriaEnsino);
            if (listaSerie.size() > 0) {
                request.setAttribute("listaSerie", listaSerie);
            }

            //carregar lista disciplinas por idProfessor e categoria
            List<PlanejamentoAulasForm> listaDisciplinaPorProfessor = planejamentoAulasForm.obterDisciplinasPorProfessor(conn, idProfessor, categoriaEnsino);
            if (listaDisciplinaPorProfessor.size() > 0) {
                request.setAttribute("listaDisciplinaPorProfessor", listaDisciplinaPorProfessor);
            }

            request.setAttribute("PlanejamentoAulasForm", planejamentoAulasForm);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }

    }

    private void salvar(ActionForm form, HttpServletRequest request, Errors errors) {
        PlanejamentoAulasForm planejamentoAulasForm = (PlanejamentoAulasForm) form;
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();
            String idProfessor = request.getParameter("idPF");

            //salvar na tabela planejamento_aula
            planejamentoAulasForm.salvar(conn, planejamentoAulasForm);

            planejamentoAulasForm = new PlanejamentoAulasForm();
            planejamentoAulasForm.setIdProfessor(Integer.parseInt(idProfessor));

            errors.error("Plano de Aula Cadastrada com Sucesso!!");
            request.setAttribute("PlanejamentoAulasForm", planejamentoAulasForm);
        } catch (Exception e) {
            e.printStackTrace();
            errors.error("Ocorreu um erro ao Salvar o Plano de Aula. Error: " + e.getMessage());
        } finally {
            connectionPool.free(conn);
        }
    }

    private void pesquisar(ActionForm form, HttpServletRequest request, Errors errors) {
        PlanejamentoAulasForm planejamentoAulasForm = (PlanejamentoAulasForm) form;
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();
            String idProfessor = request.getParameter("idPF");
            planejamentoAulasForm.setIdProfessor(Integer.parseInt(idProfessor));

            //carregar plano de aula por Professor
            List<PlanejamentoAulasForm> listaPlanoAulas = planejamentoAulasForm.obterListaPlanoAulasPorProfessor(conn, idProfessor);
            if (listaPlanoAulas.size() > 0) {
                request.setAttribute("listaPlanoAulas", listaPlanoAulas);
            }

            request.setAttribute("PlanejamentoAulasForm", planejamentoAulasForm);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private void pesquisarTodos(ActionForm form, HttpServletRequest request, Errors errors) {
        PlanejamentoAulasForm planejamentoAulasForm = (PlanejamentoAulasForm) form;
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            //carregar plano de aula por Professor
            List<PlanejamentoAulasForm> listaPlanoAulas = planejamentoAulasForm.obterListaPlanoAulas(conn);
            if (listaPlanoAulas.size() > 0) {
                request.setAttribute("listaPlanoAulas", listaPlanoAulas);
            }

            request.setAttribute("PlanejamentoAulasForm", planejamentoAulasForm);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private void editar(ActionForm form, HttpServletRequest request, Errors errors) {
        PlanejamentoAulasForm planejamentoAulasForm = (PlanejamentoAulasForm) form;
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            //carregar plano de aula por idPlanejamento
            planejamentoAulasForm = planejamentoAulasForm.obterPlanoAulaPorID(conn, planejamentoAulasForm.getIdPlanejamento());

            request.setAttribute("PlanejamentoAulasForm", planejamentoAulasForm);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private void excluir(ActionForm form, HttpServletRequest request, Errors errors) {
        PlanejamentoAulasForm planejamentoAulasForm = (PlanejamentoAulasForm) form;
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            //excluir plano de aula por idPlanejamento
            planejamentoAulasForm.excluir(conn, planejamentoAulasForm.getIdPlanejamento());

            this.pesquisar(planejamentoAulasForm, request, errors);
            request.setAttribute("PlanejamentoAulasForm", planejamentoAulasForm);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private void atualizar(ActionForm form, HttpServletRequest request, Errors errors) {
        PlanejamentoAulasForm planejamentoAulasForm = (PlanejamentoAulasForm) form;
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            //atualizar plano de aula por idPlanejamento
            planejamentoAulasForm.atualizar(conn, planejamentoAulasForm);

            errors.error("Plano de Aula atualizado com SUCESSO!!");

            this.editar(planejamentoAulasForm, request, errors);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private void confirmar(ActionForm form, HttpServletRequest request, Errors errors) {
        PlanejamentoAulasForm planejamentoAulasForm = (PlanejamentoAulasForm) form;
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            //confirmar plano de aula por idPlanejamento
            planejamentoAulasForm.confirmar(conn, planejamentoAulasForm);

            errors.error("Plano de Aula Confirmado com SUCESSO!!");

            this.pesquisar(planejamentoAulasForm, request, errors);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private void pagePesquisarPorProfessor(ActionForm form, HttpServletRequest request, Errors errors) {
        PlanejamentoAulasForm planejamentoAulasForm = (PlanejamentoAulasForm) form;
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            //obter todos os professores
            PessoaFisicaForm professorForm = new PessoaFisicaForm();
            professorForm.setStatus(1);
            ArrayList<PessoaFisicaForm> listaProfessores = professorForm.obterListaProfessores(conn, professorForm);
            if (listaProfessores.size() > 0) {
                request.setAttribute("listaProfessores", listaProfessores);
            }

            request.setAttribute("PlanejamentoAulasForm", planejamentoAulasForm);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private void pesquisarProfessorBimestre(ActionForm form, HttpServletRequest request, Errors errors) {
        PlanejamentoAulasForm planejamentoAulasForm = (PlanejamentoAulasForm) form;
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            //carregar plano de aula por Professor
            List<PlanejamentoAulasForm> listaPlanoAulas = planejamentoAulasForm.obterListaPlanoAulasPorProfessorBimestre(conn, planejamentoAulasForm);
            if (listaPlanoAulas.size() > 0) {
                request.setAttribute("listaPlanoAulas", listaPlanoAulas);
            }

            request.setAttribute("PlanejamentoAulasForm", planejamentoAulasForm);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private void carregarDisciplinaPorProfessorSerie(ActionForm form, HttpServletRequest request, Errors errors) {
        PlanejamentoAulasForm planejamentoAulasForm = (PlanejamentoAulasForm) form;
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();
            
            //carregar lista disciplinas por idProfessor e serie
            List<PlanejamentoAulasForm> listaDisciplinaPorProfessor = planejamentoAulasForm.obterDisciplinasPorProfessorSerie(conn, planejamentoAulasForm);
            if (listaDisciplinaPorProfessor.size() > 0) {
                request.setAttribute("listaDisciplinaPorProfessor", listaDisciplinaPorProfessor);
            }

            //obter todos os professores
            PessoaFisicaForm professorForm = new PessoaFisicaForm();
            professorForm.setStatus(1);
            ArrayList<PessoaFisicaForm> listaProfessores = professorForm.obterListaProfessores(conn, professorForm);
            if (listaProfessores.size() > 0) {
                request.setAttribute("listaProfessores", listaProfessores);
            }

            request.setAttribute("PlanejamentoAulasForm", planejamentoAulasForm);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

}
