/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.Action;

import br.com.Form.AlunoForm;
import br.com.Form.ItinerarioForm;
import br.com.Form.PessoaFisicaForm;
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
public class ItinerarioAction extends IDRAction {

    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response, Errors errors, String action) {
        String forward = action;
        if (action.equals("page")) {
            this.page(form, request, errors);
        } else if (action.equals("cadastrar")) {
            this.cadastrar(form, request, errors);
        } else if (action.equals("excluir")) {
            this.excluir(form, request, errors);
        } else if (action.equals("pageEditarItinerario")) {
            this.pageEditarItinerario(form, request, errors);
        } else if (action.equals("atualizar")) {
            this.atualizar(form, request, errors);
        } else if (action.equals("pageVincularAlunos")) {
            this.pageVincularAlunos(form, request, errors);
        } else if (action.equals("vincularAlunos")){
            this.vincularAlunos(form, request, errors);
        } else if (action.equals("desvincularAluno")) {
            this.desvincularAluno(form, request, errors);
        }

        return mapping.findForward(forward);
    }

    private void page(ActionForm form, HttpServletRequest request, Errors errors) {
        ItinerarioForm itinerarioForm = new ItinerarioForm();
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            //obter lista de itinerarios cadastrados
            List<ItinerarioForm> listaItinerarios = itinerarioForm.obterListaItinerariosCadastrados(conn);
            request.setAttribute("listaItinerarios", listaItinerarios);

            //obter lista de professores ativos
            PessoaFisicaForm professorForm = new PessoaFisicaForm();
            professorForm.setStatus(1);
            PessoaFisicaForm[] listaProfessor = professorForm.obterListaTodosProfessores(conn, professorForm);
            request.setAttribute("listaProfessor", listaProfessor);

            request.setAttribute("ItinerarioForm", itinerarioForm);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private void cadastrar(ActionForm form, HttpServletRequest request, Errors errors) {
        ItinerarioForm itinerarioForm = (ItinerarioForm) form;
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            //inserir na tabela itinerario
            itinerarioForm.cadastrarItinerario(conn, itinerarioForm);
            request.setAttribute("cadastro", "true");
            errors.error("Cadastro do Itinerário Realizado com Sucesso!");
            this.page(form, request, errors);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private void excluir(ActionForm form, HttpServletRequest request, Errors errors) {
        ItinerarioForm itinerarioForm = (ItinerarioForm) form;
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            //verificar se essa disciplina ja possui alguma nota vinculada
            boolean isExisteNotaDisciplina = itinerarioForm.isExisteNotaItinerario(conn, itinerarioForm.getIdItinerario());
            if (isExisteNotaDisciplina) {
                errors.error("Não pode ser realizada a Exclusão do Itinerário pois já possui notas vinculadas!");
            } else {
                itinerarioForm.excluir(conn, itinerarioForm.getIdItinerario());
                errors.error("Exclusão do Itinerário Realizado com Sucesso!");
                this.page(form, request, errors);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private void pageEditarItinerario(ActionForm form, HttpServletRequest request, Errors errors) {
        ItinerarioForm itinerarioForm = (ItinerarioForm) form;
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            //carregar dados do itenerario por ID
            itinerarioForm = itinerarioForm.obterItinerarioPorId(conn, itinerarioForm.getIdItinerario());

            //obter lista de professores ativos
            PessoaFisicaForm professorForm = new PessoaFisicaForm();
            professorForm.setStatus(1);
            PessoaFisicaForm[] listaProfessor = professorForm.obterListaTodosProfessores(conn, professorForm);
            request.setAttribute("listaProfessor", listaProfessor);

            request.setAttribute("ItinerarioForm", itinerarioForm);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void atualizar(ActionForm form, HttpServletRequest request, Errors errors) {
        ItinerarioForm itinerarioForm = (ItinerarioForm) form;
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            //atualizar na tabela itinerario
            itinerarioForm.atualizarItinerario(conn, itinerarioForm);
            request.setAttribute("cadastro", "true");
            errors.error("Itinerário atualizado com Sucesso!");
            this.page(form, request, errors);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private void pageVincularAlunos(ActionForm form, HttpServletRequest request, Errors errors) {
        ItinerarioForm itinerarioForm = (ItinerarioForm) form;
        Connection conn = null;
        HttpSession session = request.getSession(true);
        try {
            conn = connectionPool.getConnection();

            //carregar dados do itenerarioID
            itinerarioForm = itinerarioForm.obterItinerarioPorId(conn, itinerarioForm.getIdItinerario());
            
            //obter lista de alunos por serie/ano
            String idSerieAno = request.getParameter("idSerieAno");
            AlunoForm alunoForm = new AlunoForm();
            List<AlunoForm> listaAlunosSemVinculo = alunoForm.obterAlunosPorSerieSemVinculoItinerario(conn, idSerieAno, itinerarioForm.getIdItinerario());
            session.setAttribute("listaAlunosSemVinculo", listaAlunosSemVinculo);
            
            //obter lista de alunos ja vinculados
            List<AlunoForm> listaAlunosComVinculo = alunoForm.obterAlunosPorSerieComVinculoItinerario(conn, idSerieAno, itinerarioForm.getIdItinerario());
            session.setAttribute("listaAlunosComVinculo", listaAlunosComVinculo);
            
            request.setAttribute("ItinerarioForm", itinerarioForm);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private void vincularAlunos(ActionForm form, HttpServletRequest request, Errors errors) {
        ItinerarioForm itinerarioForm = (ItinerarioForm) form;
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();
            
            //obter ano vigente
            int ano = Utilitario.obterAnoVigente(conn);
            
            //vincular alunos
            String[] listaIdAlunos = itinerarioForm.getSelectedOptions();
            if (listaIdAlunos != null) {
                for (String idAluno : listaIdAlunos) {
                    itinerarioForm.vincularAlunosItinerario(conn, itinerarioForm.getIdItinerario(), idAluno, itinerarioForm.getIdSerieAno(), ano);
                }
            }
            
            this.pageVincularAlunos(form, request, errors);
            
            request.setAttribute("ItinerarioForm", itinerarioForm);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private void desvincularAluno(ActionForm form, HttpServletRequest request, Errors errors) {
        ItinerarioForm itinerarioForm = (ItinerarioForm) form;
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();
            
            //obter ano vigente
            int ano = Utilitario.obterAnoVigente(conn);
            
            //desvincular aluno
            itinerarioForm.desvincularAluno(conn, itinerarioForm.getIdItinerarioAluno());
            
            this.pageVincularAlunos(form, request, errors);
            
            request.setAttribute("ItinerarioForm", itinerarioForm);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

}
