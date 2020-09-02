/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.Action;

import br.com.Form.AlunoForm;
import br.com.Form.ComunicadosForm;
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
public class ComunicadosAction extends IDRAction {

    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response, Errors errors, String action) {
        String forward = action;
        if (action.equals("page")) {
            this.page(form, request, errors);
        } else if (action.equals("pageDirecao")) {
            this.page(form, request, errors);
        } else if (action.equals("salvar") || (action.equals("salvarDirecao"))) {
            this.salvar(form, request, errors);
        } else if (action.equals("pesquisar")) {
            this.pesquisar(form, request, errors);
        } else if (action.equals("visualizar")) {
            this.visualizar(form, request, errors);
        } else if (action.equals("excluir")) {
            this.excluir(form, request, errors);
        } else if (action.equals("listaComunicados")) {
            this.listaComunicados(form, request, errors);
        } else if (action.equals("pagePorAluno")) {
            this.pagePorAluno(form, request, errors);
        } else if (action.equals("salvarPorAluno")) {
            this.salvarPorAluno(form, request, errors);
        } else if (action.equals("visualizarAlunos")) {
            this.visualizarAlunos(form, request, errors);
        }

        return mapping.findForward(forward);
    }

    private void page(ActionForm form, HttpServletRequest request, Errors errors) {
        ComunicadosForm comunicadosForm = new ComunicadosForm();
        HttpSession session = request.getSession();
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            //obter lista serie/ano
            SerieAnoForm serieAnoForm = new SerieAnoForm();
            List<SerieAnoForm> listaSerieAno = serieAnoForm.listaTodasSeries(conn);
            session.setAttribute("listaSerieAno", listaSerieAno);

            request.setAttribute("ComunicadosForm", comunicadosForm);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private void pagePorAluno(ActionForm form, HttpServletRequest request, Errors errors) {
        ComunicadosForm comunicadosForm = new ComunicadosForm();
        HttpSession session = request.getSession();
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            //obter todos alunos ativos
            AlunoForm alunoForm = new AlunoForm();
            alunoForm.setStatus(1);
            List<AlunoForm> listaAlunos = alunoForm.obterListaAlunos(conn, alunoForm);
            session.setAttribute("listaAlunos", listaAlunos);

            request.setAttribute("ComunicadosForm", comunicadosForm);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private void salvar(ActionForm form, HttpServletRequest request, Errors errors) {
        ComunicadosForm comunicadosForm = (ComunicadosForm) form;
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            //obter id da pessoa que esta enviando por session
            HttpSession session = request.getSession(true);
            Integer idProfessorSession = (Integer) session.getAttribute("idPF");

            int idComunicadoGerenciamento = comunicadosForm.inserirComunicadoGerenciamento(conn, comunicadosForm.getAssunto(), comunicadosForm.getDescricao(), idProfessorSession, comunicadosForm.getTipoComunicado());

            String[] listaSerieAno = comunicadosForm.getSelectedOptions();
            for (String serieAno : listaSerieAno) {
                comunicadosForm.inserirComunicadoAluno(conn, serieAno, idComunicadoGerenciamento, comunicadosForm.getAssunto(), comunicadosForm.getDescricao());
            }

            errors.error("Comunicado Salvo com SUCESSO!!");
            request.setAttribute("salvo", "true");
            request.setAttribute("ComunicadosForm", comunicadosForm);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private void salvarPorAluno(ActionForm form, HttpServletRequest request, Errors errors) {
        ComunicadosForm comunicadosForm = (ComunicadosForm) form;
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            //obter id da pessoa que esta enviando por session
            HttpSession session = request.getSession(true);
            Integer idProfessorSession = (Integer) session.getAttribute("idPF");

            int idComunicadoGerenciamento = comunicadosForm.inserirComunicadoGerenciamento(conn, comunicadosForm.getAssunto(), comunicadosForm.getDescricao(), idProfessorSession, comunicadosForm.getTipoComunicado());

            String[] listaIdAlunos = comunicadosForm.getSelectedOptions();
            for (String idAlunoSerie : listaIdAlunos) {
                String[] spliteAluno = idAlunoSerie.split("-");
                String idAluno = spliteAluno[0];
                String idSerie = spliteAluno[1];

                comunicadosForm.inserirComunicadoPorAluno(conn, idAluno, idSerie, idComunicadoGerenciamento, comunicadosForm.getAssunto(), comunicadosForm.getDescricao());
            }
            errors.error("Comunicado Salvo com SUCESSO!!");
            request.setAttribute("salvo", "true");
            request.setAttribute("ComunicadosForm", comunicadosForm);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private void pesquisar(ActionForm form, HttpServletRequest request, Errors errors) {
        ComunicadosForm comunicadosForm = (ComunicadosForm) form;
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();
            List<ComunicadosForm> listaComunicados = new ArrayList<>();

            if (comunicadosForm.getTipoComunicado().equals("PROFESSOR")) {
                //obter id da pessoa que esta enviando por session
                HttpSession session = request.getSession(true);
                Integer idProfessorSession = (Integer) session.getAttribute("idPF");
                String tipoPerfil = (String) session.getAttribute("tipoPerfil");

                if (tipoPerfil.equals("diretoria")) {
                    //obter lista de todos comunicados cadastrado pelos professores
                    listaComunicados = comunicadosForm.obterListaTodosComunicadosPorProfessor(conn, comunicadosForm.getTipoComunicado());
                } else {
                    //obter lista de todos comunicados por professor
                    listaComunicados = comunicadosForm.obterListaComunicadosPorProfessor(conn, comunicadosForm.getTipoComunicado(), idProfessorSession);
                }
            } else {
                //obter lista de todos comunicados
                listaComunicados = comunicadosForm.obterListaComunicados(conn, comunicadosForm.getTipoComunicado());
            }
            if (listaComunicados.size() > 0) {
                request.setAttribute("listaComunicados", listaComunicados);
            }

            request.setAttribute("ComunicadosForm", comunicadosForm);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private void visualizar(ActionForm form, HttpServletRequest request, Errors errors) {
        ComunicadosForm comunicadosForm = (ComunicadosForm) form;
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            //obter comunicado por ID
            comunicadosForm = comunicadosForm.obterComunicadoPorID(conn, comunicadosForm.getIdComunicado());
            request.setAttribute("ComunicadosForm", comunicadosForm);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private void excluir(ActionForm form, HttpServletRequest request, Errors errors) {
        ComunicadosForm comunicadosForm = (ComunicadosForm) form;
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            //excluir comunicado por ID
            comunicadosForm.excluirComunicadoPorID(conn, comunicadosForm.getIdComunicado());
            request.setAttribute("ComunicadosForm", comunicadosForm);
            this.pesquisar(form, request, errors);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private void listaComunicados(ActionForm form, HttpServletRequest request, Errors errors) {
        ComunicadosForm comunicadosForm = (ComunicadosForm) form;
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            String idPF = request.getParameter("idPF");
            comunicadosForm.setIdPessoa(Integer.parseInt(idPF));

            //obter lista de comunicados por idAluno
            ArrayList<ComunicadosForm> listaComunicados = comunicadosForm.obterTodosComunicadosPorIDPessoa(conn, comunicadosForm.getIdPessoa(), comunicadosForm.getTipoComunicado());
            request.setAttribute("listaComunicados", listaComunicados);
            request.setAttribute("ComunicadosForm", comunicadosForm);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private void visualizarAlunos(ActionForm form, HttpServletRequest request, Errors errors) {
        ComunicadosForm comunicadosForm = (ComunicadosForm) form;
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            //obter lista de alunos enviado por id_comunicado_gerenciamento
            AlunoForm alunoForm = new AlunoForm();
            List<AlunoForm> listaAlunosAvisos = alunoForm.obterListaAlunosAvisos(conn, comunicadosForm.getIdComunicado());
            request.setAttribute("listaAlunosAvisos", listaAlunosAvisos);

            request.setAttribute("ComunicadosForm", comunicadosForm);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }
}
