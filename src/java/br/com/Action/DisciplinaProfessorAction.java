/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.Action;

import static br.com.Action.IDRAction.connectionPool;
import br.com.Form.DisciplinaProfessorForm;
import br.com.Form.DisciplinasForm;
import br.com.Form.PessoaFisicaForm;
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
public class DisciplinaProfessorAction extends IDRAction {

    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response, Errors errors, String action) {
        String forward = action;
        if (action.equals("page")) {
            this.page(form, request, errors);
        } else if (action.equals("salvarProfessorDisciplina")) {
            this.salvarProfessorDisciplina(form, request, errors);
        }

        return mapping.findForward(forward);
    }

    private void page(ActionForm form, HttpServletRequest request, Errors errors) {
        DisciplinaProfessorForm disciplinaProfessorForm = new DisciplinaProfessorForm();
        Connection conn = null;
        HttpSession session = request.getSession();
        try {
            conn = connectionPool.getConnection();
            String idDisciplina = request.getParameter("idDisciplina");
            String categoriaEnsino = request.getParameter("categoriaEnsino");
            //obter professor cadastrados para a disciplina na tabela disciplina_professor
            List<DisciplinaProfessorForm> listaProfessoresCadastradoDisciplina = disciplinaProfessorForm.obterProfessoresCadastradoDisciplina(conn, categoriaEnsino, idDisciplina);
            for (DisciplinaProfessorForm professorForm : listaProfessoresCadastradoDisciplina) {
                if (categoriaEnsino.equals("EF1")) {
                    switch (professorForm.getSerieAno()) {
                        case 1:
                            disciplinaProfessorForm.setIdProf1ano(professorForm.getIdProf1ano());
                            break;
                        case 2:
                            disciplinaProfessorForm.setIdProf2ano(professorForm.getIdProf2ano());
                            break;
                        case 3:
                            disciplinaProfessorForm.setIdProf3ano(professorForm.getIdProf3ano());
                            break;
                        case 4:
                            disciplinaProfessorForm.setIdProf4ano(professorForm.getIdProf4ano());
                            break;
                        case 5:
                            disciplinaProfessorForm.setIdProf5ano(professorForm.getIdProf5ano());
                            break;
                        default:
                            break;
                    }
                } else if (categoriaEnsino.equals("EF2")) {
                    switch (professorForm.getSerieAno()) {
                        case 6:
                            disciplinaProfessorForm.setIdProf6ano(professorForm.getIdProf6ano());
                            break;
                        case 7:
                            disciplinaProfessorForm.setIdProf7ano(professorForm.getIdProf7ano());
                            break;
                        case 8:
                            disciplinaProfessorForm.setIdProf8ano(professorForm.getIdProf8ano());
                            break;
                        case 9:
                            disciplinaProfessorForm.setIdProf9ano(professorForm.getIdProf9ano());
                            break;
                        default:
                            break;
                    }
                } else if (categoriaEnsino.equals("EM")) {
                    switch (professorForm.getSerieAno()) {
                        case 10:
                            disciplinaProfessorForm.setIdProf1serie(professorForm.getIdProf1serie());
                            break;
                        case 20:
                            disciplinaProfessorForm.setIdProf2serie(professorForm.getIdProf2serie());
                            break;
                        case 30:
                            disciplinaProfessorForm.setIdProf3serie(professorForm.getIdProf3serie());
                            break;
                        default:
                            break;
                    }
                } else if (categoriaEnsino.equals("INF")) {
                    switch (professorForm.getSerieAno()) {
                        case 11:
                            disciplinaProfessorForm.setIdProfInfantilI(professorForm.getIdProfInfantilI());
                            break;
                        case 12:
                            disciplinaProfessorForm.setIdProfInfantilII(professorForm.getIdProfInfantilII());
                            break;
                        case 13:
                            disciplinaProfessorForm.setIdProfInfantilIII(professorForm.getIdProfInfantilIII());
                            break;
                        default:
                            break;
                    }
                }
            }

            //carregar os dados cadastrados na tabela disciplina
            DisciplinasForm disciplinasForm = new DisciplinasForm();
            disciplinasForm = disciplinasForm.obterDadosDisciplinaID(conn, Integer.parseInt(idDisciplina));
            disciplinaProfessorForm.setDisciplinasForm(disciplinasForm);

            //carregar combo dos professores da escola
            PessoaFisicaForm professorForm = new PessoaFisicaForm();
            professorForm.setStatus(1);
            PessoaFisicaForm[] listaProfessor = professorForm.obterListaTodosProfessores(conn, professorForm);
            session.setAttribute("listaProfessor", listaProfessor);

            request.setAttribute("DisciplinaProfessorForm", disciplinaProfessorForm);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private void salvarProfessorDisciplina(ActionForm form, HttpServletRequest request, Errors errors) {
        DisciplinaProfessorForm disciplinaProfessorForm = (DisciplinaProfessorForm) form;
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();
            String categoriaEnsino = request.getParameter("categoriaEnsino");
            String idDisciplina = request.getParameter("idDisciplina");
            switch (categoriaEnsino) {
                case "INF":
                    //verificar se idProfInfantilI, idProfInfantilII e idProfInfantilIII foi informado
                    if (disciplinaProfessorForm.getIdProfInfantilI() == 0
                            && disciplinaProfessorForm.getIdProfInfantilII() == 0
                            && disciplinaProfessorForm.getIdProfInfantilIII() == 0) {
                        errors.error("Deve ser informado o professor para todos os anos/séries!!");
                    } else {
                        //salvar o id professor na tabela disciplina_professor
                        disciplinaProfessorForm.salvarProfessorSerieAno(conn, categoriaEnsino, idDisciplina, disciplinaProfessorForm.getIdProfInfantilI(), 11);
                        disciplinaProfessorForm.salvarProfessorSerieAno(conn, categoriaEnsino, idDisciplina, disciplinaProfessorForm.getIdProfInfantilII(), 12);
                        disciplinaProfessorForm.salvarProfessorSerieAno(conn, categoriaEnsino, idDisciplina, disciplinaProfessorForm.getIdProfInfantilIII(), 13);
                        errors.error("Professores Vinculados a Disciplinas com SUCESSO!!");
                    }
                    break;
                case "EF1":
                    //verificar se idProf1ano a idProf5ano foi informado
                    if (disciplinaProfessorForm.getIdProf1ano() == 0
                            && disciplinaProfessorForm.getIdProf2ano() == 0
                            && disciplinaProfessorForm.getIdProf3ano() == 0
                            && disciplinaProfessorForm.getIdProf4ano() == 0
                            && disciplinaProfessorForm.getIdProf5ano() == 0) {
                        errors.error("Deve ser informado o professor para todos os anos/séries!!");
                    } else {
                        //salvar o id professor na tabela disciplina_professor
                        disciplinaProfessorForm.salvarProfessorSerieAno(conn, categoriaEnsino, idDisciplina, disciplinaProfessorForm.getIdProf1ano(), 1);
                        disciplinaProfessorForm.salvarProfessorSerieAno(conn, categoriaEnsino, idDisciplina, disciplinaProfessorForm.getIdProf2ano(), 2);
                        disciplinaProfessorForm.salvarProfessorSerieAno(conn, categoriaEnsino, idDisciplina, disciplinaProfessorForm.getIdProf3ano(), 3);
                        disciplinaProfessorForm.salvarProfessorSerieAno(conn, categoriaEnsino, idDisciplina, disciplinaProfessorForm.getIdProf4ano(), 4);
                        disciplinaProfessorForm.salvarProfessorSerieAno(conn, categoriaEnsino, idDisciplina, disciplinaProfessorForm.getIdProf5ano(), 5);
                        errors.error("Professores Vinculados a Disciplinas com SUCESSO!!");
                    }
                    break;
                case "EF2":
                    //verificar se idProf6ano a idProf9ano foi informado
                    if (disciplinaProfessorForm.getIdProf6ano() == 0
                            && disciplinaProfessorForm.getIdProf7ano() == 0
                            && disciplinaProfessorForm.getIdProf8ano() == 0
                            && disciplinaProfessorForm.getIdProf9ano() == 0) {
                        errors.error("Deve ser informado o professor para todos os anos/séries!!");
                    } else {
                        //salvar o id professor na tabela disciplina_professor
                        disciplinaProfessorForm.salvarProfessorSerieAno(conn, categoriaEnsino, idDisciplina, disciplinaProfessorForm.getIdProf6ano(), 6);
                        disciplinaProfessorForm.salvarProfessorSerieAno(conn, categoriaEnsino, idDisciplina, disciplinaProfessorForm.getIdProf7ano(), 7);
                        disciplinaProfessorForm.salvarProfessorSerieAno(conn, categoriaEnsino, idDisciplina, disciplinaProfessorForm.getIdProf8ano(), 8);
                        disciplinaProfessorForm.salvarProfessorSerieAno(conn, categoriaEnsino, idDisciplina, disciplinaProfessorForm.getIdProf9ano(), 9);
                        errors.error("Professores Vinculados a Disciplinas com SUCESSO!!");
                    }
                    break;
                default:
                    //verificar se idProf1serie a idProf3serie foi informado
                    if (disciplinaProfessorForm.getIdProf1serie() == 0
                            && disciplinaProfessorForm.getIdProf2serie() == 0
                            && disciplinaProfessorForm.getIdProf3serie() == 0) {
                        errors.error("Deve ser informado o professor para todos os anos/séries!!");
                    } else {
                        //salvar o id professor na tabela disciplina_professor
                        disciplinaProfessorForm.salvarProfessorSerieAno(conn, categoriaEnsino, idDisciplina, disciplinaProfessorForm.getIdProf1serie(), 10);
                        disciplinaProfessorForm.salvarProfessorSerieAno(conn, categoriaEnsino, idDisciplina, disciplinaProfessorForm.getIdProf2serie(), 20);
                        disciplinaProfessorForm.salvarProfessorSerieAno(conn, categoriaEnsino, idDisciplina, disciplinaProfessorForm.getIdProf3serie(), 30);
                        errors.error("Professores Vinculados a Disciplinas com SUCESSO!!");
                    }
                    break;
            }

            //carregar os dados cadastrados na tabela disciplina_professor
            DisciplinasForm disciplinasForm = new DisciplinasForm();
            disciplinasForm = disciplinasForm.obterDadosDisciplinaID(conn, Integer.parseInt(idDisciplina));
            disciplinaProfessorForm.setDisciplinasForm(disciplinasForm);

            request.setAttribute("DisciplinaProfessorForm", disciplinaProfessorForm);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

}
