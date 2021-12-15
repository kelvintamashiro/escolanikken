/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.Action;

import br.com.Dao.NotaBimestreDao;
import br.com.Form.AlunoForm;
import br.com.Form.NotaBimestreForm;
import br.com.Form.RecuperacaoAnualForm;
import br.com.Util.Utilitario;
import br.com.abre.Util.Errors;
import java.sql.Connection;
import java.text.DecimalFormat;
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
public class RecuperacaoAnualAction extends IDRAction {

    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response, Errors errors, String action) {
        String forward = action;
        if (action.equals("page")) {
            this.page(form, request, errors);
        } else if (action.equals("pesquisarAlunosPorSerieRecuperacaoAnual")) {
            this.pesquisarAlunosPorSerieRecuperacaoAnual(form, request, errors);
        } else if (action.equals("pageIncluirNota")) {
            this.pageIncluirNota(form, request, errors);
        } else if (action.equals("salvarNotaRecuperacao")) {
            this.salvarNotaRecuperacao(form, request, errors);
        } else if (action.equals("excluirNotaRecuperacao")) {
            this.excluirNotaRecuperacao(form, request, errors);
        }

        return mapping.findForward(forward);
    }

    private void page(ActionForm form, HttpServletRequest request, Errors errors) {
        RecuperacaoAnualForm recuperacaoAnualForm = new RecuperacaoAnualForm();
        request.setAttribute("RecuperacaoAnualForm", recuperacaoAnualForm);
    }

    private void pesquisarAlunosPorSerieRecuperacaoAnual(ActionForm form, HttpServletRequest request, Errors errors) {
        RecuperacaoAnualForm recuperacaoAnualForm = (RecuperacaoAnualForm) form;
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            int anoVigente = Utilitario.obterAnoVigente(conn);

            //obter todos os alunos por serie
            AlunoForm alunoForm = new AlunoForm();
            alunoForm.setStatus(1);
            alunoForm.setSerieAno(recuperacaoAnualForm.getIdSerieAno());
            ArrayList<AlunoForm> listaAlunos = alunoForm.obterListaAlunos(conn, alunoForm);

            List<RecuperacaoAnualForm> listaAlunosDisciplinaRecupAnual = new ArrayList<>();
            //verificar se pra cada aluno teve alguma recuperacao anual
            for (AlunoForm aluno : listaAlunos) {
                List<RecuperacaoAnualForm> listaNotasAlunos = recuperacaoAnualForm.obterListaMediaAnualPorAluno(conn, aluno.getIdPF(), recuperacaoAnualForm.getIdSerieAno(), anoVigente);
                if (listaNotasAlunos.size() > 0) {
                    for (RecuperacaoAnualForm listaNotasAluno : listaNotasAlunos) {
                        listaAlunosDisciplinaRecupAnual.add(listaNotasAluno);
                    }
                }
            }
            request.setAttribute("listaAlunosDisciplinaRecupAnual", listaAlunosDisciplinaRecupAnual);

            //carregar alunos de recuperacao final ja com nota lancada por serie
            List<RecuperacaoAnualForm> listaNotasAlunosComNotas = recuperacaoAnualForm.obterListaMediaAnualPorAlunoCadastrado(conn, recuperacaoAnualForm.getIdSerieAno(), anoVigente);

            request.setAttribute("listaNotasAlunosComNotas", listaNotasAlunosComNotas);
            request.setAttribute("RecuperacaoAnualForm", recuperacaoAnualForm);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private void pageIncluirNota(ActionForm form, HttpServletRequest request, Errors errors) {
        RecuperacaoAnualForm recuperacaoAnualForm = (RecuperacaoAnualForm) form;
        Connection conn = null;
        HttpSession session = request.getSession();
        try {
            conn = connectionPool.getConnection();

            //obter todas as medias do aluno por disciplina de todos os bimestres
            List<RecuperacaoAnualForm> listaTodasMedias = recuperacaoAnualForm.obterListaMediaPorBimestreAlunoDisciplina(conn, recuperacaoAnualForm);

            //obter dados do aluno / id_disciplina por ano
            session.setAttribute("listaTodasMedias", listaTodasMedias);
            request.setAttribute("RecuperacaoAnualForm", recuperacaoAnualForm);

        } catch (Exception e) {
            e.printStackTrace();
            errors.error("Ocorreu um erro, tente novamente. Caso o erro persistir, entrar em contato com o suporte.");
        } finally {
            connectionPool.free(conn);
        }
    }

    private void salvarNotaRecuperacao(ActionForm form, HttpServletRequest request, Errors errors) {
        RecuperacaoAnualForm recuperacaoAnualForm = (RecuperacaoAnualForm) form;
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            //salvar nota recuperacao anual e calcular o resultado final
            double mediaAnual = recuperacaoAnualForm.getMediaAnual();

            String notaRecup = request.getParameter("notaRecuperacao").replace(",", ".");
            double notaRecuperacao = Double.parseDouble(notaRecup);
            recuperacaoAnualForm.setNotaRecuperacao(notaRecuperacao);

//            double mediaRecuperacao = notaRecuperacao / 4;
//            double mediaRecuperacaoArredondada = Math.round(mediaRecuperacao / 0.5) * 0.5;
//            double mediaFinal = mediaAnual + mediaRecuperacaoArredondada;

            double mediaFinal = (mediaAnual + notaRecuperacao) / 2;
            double mediaFinalArredondado = this.arredondar(mediaFinal);
            
            recuperacaoAnualForm.setMediaFinal(mediaFinalArredondado);
            if (mediaFinalArredondado < 6.0) {
                recuperacaoAnualForm.setPassouDeAno(false);
            } else {
                recuperacaoAnualForm.setPassouDeAno(true);
            }

            recuperacaoAnualForm.salvarNotaRecuperacaoFinal(conn, recuperacaoAnualForm);

            request.setAttribute("mediaSalvo", "true");
            request.setAttribute("RecuperacaoAnualForm", recuperacaoAnualForm);

        } catch (Exception e) {
            e.printStackTrace();
            errors.error("Ocorreu um erro, tente novamente. Caso o erro persistir, entrar em contato com o suporte.");
        } finally {
            connectionPool.free(conn);
        }
    }

    private void excluirNotaRecuperacao(ActionForm form, HttpServletRequest request, Errors errors) {
        RecuperacaoAnualForm recuperacaoAnualForm = (RecuperacaoAnualForm) form;
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();
            
            recuperacaoAnualForm.excluirNotaRecuperacao(conn, recuperacaoAnualForm.getId());
            
            this.pesquisarAlunosPorSerieRecuperacaoAnual(recuperacaoAnualForm, request, errors);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }
    
    private double arredondar(Double valor) {
        String vlStringArredondado = new DecimalFormat("0.0").format(valor).replace(",", ".");
        double valorArredondado = Double.parseDouble(vlStringArredondado);
        return valorArredondado;
    }

}
