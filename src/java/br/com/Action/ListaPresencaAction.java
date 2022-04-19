/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.Action;

import br.com.Dao.NotaBimestreDao;
import br.com.Form.AlunoForm;
import br.com.Form.DiarioClasseForm;
import br.com.Form.DisciplinaProfessorForm;
import br.com.Form.DisciplinasForm;
import br.com.Form.ListaPresencaForm;
import br.com.Form.NotaBimestreForm;
import br.com.Form.PlanejamentoAulasForm;
import br.com.Util.Utilitario;
import br.com.abre.Util.Errors;
import br.com.abre.Util.IDRDate;
import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
public class ListaPresencaAction extends IDRAction {

    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response, Errors errors, String action) {
        String forward = action;
        if (action.equals("page")) {
            this.page(form, request, errors);
        } else if (action.equals("pesquisar")) {
            this.pesquisar(form, request, errors);
        } else if (action.equals("salvarPresenca")) {
            this.salvarPresenca(form, request, errors);
        } else if (action.equals("pageConsultar")) {
            this.page(form, request, errors);
        } else if (action.equals("carregarDisciplina") || action.equals("carregarDisciplinaCadastro") || action.equals("carregarDisciplinaImpDiario")) {
            this.carregarDisciplina(form, request, errors);
        } else if (action.equals("consultar")) {
            this.consultar(form, request, errors);
        } else if (action.equals("editarPresenca")) {
            this.editarPresenca(form, request, errors);
        } else if (action.equals("atualizarPresenca")) {
            this.atualizarPresenca(form, request, errors);
        } else if (action.equals("excluirPresenca")) {
            this.excluirPresenca(form, request, errors);
        } else if (action.equals("imprimirDiario")) {
            this.imprimirDiario(form, request, errors);
        }

        return mapping.findForward(forward);
    }

    private void page(ActionForm form, HttpServletRequest request, Errors errors) {
        ListaPresencaForm listaPresencaForm = new ListaPresencaForm();
        HttpSession session = request.getSession(true);
        session.removeAttribute("listaAlunos");
        session.removeAttribute("listaDisciplinas");
        request.setAttribute("ListaPresencaForm", listaPresencaForm);
    }

    private void pesquisar(ActionForm form, HttpServletRequest request, Errors errors) {
        ListaPresencaForm listaPresencaForm = (ListaPresencaForm) form;
        Connection conn = null;
        HttpSession session = request.getSession(true);
        try {
            conn = connectionPool.getConnection();
            String data = listaPresencaForm.getData();

            if (listaPresencaForm.getIdSerieAno() != 0) {
                int idSerieAno = listaPresencaForm.getIdSerieAno();
            } else {
                int idSerieAno = Integer.parseInt(request.getParameter("idSerieAno"));
                listaPresencaForm.setIdSerieAno(idSerieAno);
            }

            ArrayList<ListaPresencaForm> listaAlunos = listaPresencaForm.obterListaAlunosPorSerie(conn, listaPresencaForm.getIdSerieAno());
            session.setAttribute("listaAlunos", listaAlunos);

            //obter dados do planejamento por data, serie e disciplina
            PlanejamentoAulasForm planoAula = new PlanejamentoAulasForm();
            planoAula = planoAula.obterPlanoAulaPorSerieDisciplinaData(conn, listaPresencaForm.getIdSerieAno(), listaPresencaForm.getIdDisciplina(), listaPresencaForm.getData());
            listaPresencaForm.setPlanejamentoAulasForm(planoAula);
            request.setAttribute("planoAula", planoAula);
            request.setAttribute("data", data);
            request.setAttribute("ListaPresencaForm", listaPresencaForm);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private void salvarPresenca(ActionForm form, HttpServletRequest request, Errors errors) {
        ListaPresencaForm listaPresencaForm = (ListaPresencaForm) form;
        Connection conn = null;
        HttpSession session = request.getSession(true);
        try {
            conn = connectionPool.getConnection();
            int idSerie = listaPresencaForm.getIdSerieAno();
            String data = listaPresencaForm.getData();
            int idDisciplina = listaPresencaForm.getIdDisciplina();
            int qtdAulas = listaPresencaForm.getQtdAulas();
            int nrBimestre = listaPresencaForm.getNrBimestre();
            boolean isIdPF = true;
            Integer idPF = 0;
            try {
                idPF = (Integer) session.getAttribute("idPF");
                System.out.println("idPF: " + idPF);
                if (idPF == null) {
                    isIdPF = false;
                }
            } catch (Exception e) {
                isIdPF = false;
                e.printStackTrace();
            }

            if (isIdPF) {
                //verificar se para essa data e disciplina ja foi lancado
                boolean isPresencaLancada = listaPresencaForm.isPresencaLancadaData(conn, data, idDisciplina, idSerie);
                if (!isPresencaLancada) {
                    //atualizar planejamento de aula
                    String idPlanejamento = request.getParameter("idPlanejamento");
                    String nrBimestrePlano = request.getParameter("nrBimestre");
                    String conteudoAula = request.getParameter("conteudoAula");
                    String metodologia = request.getParameter("metodologia");
                    String recurso = request.getParameter("recurso");
                    String tarefa = request.getParameter("tarefa");
                    String avaliacao = request.getParameter("avaliacao");
                    String observacao = request.getParameter("observacao");

                    PlanejamentoAulasForm planoAulaForm = new PlanejamentoAulasForm();
                    planoAulaForm.setIdPlanejamento(Integer.parseInt(idPlanejamento));
                    planoAulaForm.setNrBimestre(Integer.parseInt(nrBimestrePlano));
                    planoAulaForm.setConteudoAula(conteudoAula);
                    planoAulaForm.setMetodologia(metodologia);
                    planoAulaForm.setRecurso(recurso);
                    planoAulaForm.setTarefa(tarefa);
                    planoAulaForm.setAvaliacao(avaliacao);
                    planoAulaForm.setObservacao(observacao);
                    planoAulaForm.setIdProfessor(idPF);
                    planoAulaForm.setIdDisciplina(idDisciplina);
                    planoAulaForm.setIdSerieAno(idSerie);
                    planoAulaForm.setData(data);

                    //obter idProfessor pela disciplina e serie
                    DisciplinaProfessorForm discForm = new DisciplinaProfessorForm();
                    int idProfessor = discForm.obterIdProfessorPorDiscSerie(conn, idDisciplina, idSerie);
                    if (idProfessor != 0) {
                        planoAulaForm.setIdProfessor(idProfessor);
                    }

                    if (idPlanejamento != null && idPlanejamento.equals("0")) {
                        //verificar se nao esta com os dados em branco
                        if (!planoAulaForm.getConteudoAula().equals("") || !planoAulaForm.getMetodologia().equals("") || !planoAulaForm.getRecurso().equals("")
                                || !planoAulaForm.getTarefa().equals("") || !planoAulaForm.getAvaliacao().equals("") || !planoAulaForm.getObservacao().equals("")) {
                            planoAulaForm.salvarComConfirmacao(conn, planoAulaForm);
                        }

                    } else {
                        planoAulaForm.atualizarComConfirmacao(conn, planoAulaForm);
                    }

                    ArrayList<ListaPresencaForm> listaAlunos = new ArrayList<>();
                    if (session.getAttribute("listaAlunos") != null) {
                        listaAlunos = (ArrayList<ListaPresencaForm>) session.getAttribute("listaAlunos");
                    }

                    ArrayList<String> listaAlunosFaltaram = new ArrayList<>();

                    for (ListaPresencaForm aluno : listaAlunos) {
                        listaAlunosFaltaram.add(String.valueOf(aluno.getIdAluno()));
                    }

                    ArrayList<String> listaAlunosPresenca = new ArrayList<>();
                    String[] listaIdAlunos = listaPresencaForm.getSelectedOptions();
                    if (listaIdAlunos != null) {
                        for (String idAluno : listaIdAlunos) {
                            listaAlunosPresenca.add(idAluno);
                            listaPresencaForm.salvarPresenca(conn, idAluno, idDisciplina, nrBimestre, idSerie, data, qtdAulas, 0, "N");
                        }
                    }

                    listaAlunosFaltaram.removeAll(listaAlunosPresenca);
                    for (String idAlunoFalta : listaAlunosFaltaram) {
                        listaPresencaForm.salvarPresenca(conn, idAlunoFalta, idDisciplina, nrBimestre, idSerie, data, qtdAulas, qtdAulas, "S");
                    }

                    listaPresencaForm.setIdDisciplina(0);

                    errors.error("Presença e plano de aula confirmado com Sucesso!!");
                } else {
                    errors.error("Já foi lançado presença para essa série, disciplina e data. Caso queira alterar, consulte e faça a edição.");
                }
                session.removeAttribute("listaAlunos");
            } else {
                errors.error("Ocorreu um erro no seu login. Favor deslogar do sistema e acessar novamente!!");
            }
            request.setAttribute("ListaPresencaForm", listaPresencaForm);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private void carregarDisciplina(ActionForm form, HttpServletRequest request, Errors errors) {
        ListaPresencaForm listaPresencaForm = (ListaPresencaForm) form;
        Connection conn = null;
        HttpSession session = request.getSession(true);
        try {
            conn = connectionPool.getConnection();
            session.removeAttribute("listaAlunos");
            session.removeAttribute("listaDisciplinas");

            int idSerieAno = listaPresencaForm.getIdSerieAno();

            String data = request.getParameter("data");
            request.setAttribute("data", data);

            String categoriaEnsino = NotaBimestreDao.getInstance().obterCategoriaEnsinoPorSerie(idSerieAno);
            DisciplinasForm disciplinasForm = new DisciplinasForm();

            //verificar se o perfil eh professor que carrega somente o dele
            List<DisciplinasForm> listaDisciplinas = new ArrayList<>();
            String tipoPerfil = (String) session.getAttribute("tipoPerfil");
            if (tipoPerfil != null && tipoPerfil.equals("professor")) {
                Integer idPF = (Integer) session.getAttribute("idPF");
                listaDisciplinas = disciplinasForm.obterListaDisciplinasPorCategoriaPorProfessor(conn, categoriaEnsino, idPF);
            } else {
                listaDisciplinas = disciplinasForm.obterListaDisciplinasPorCategoria(conn, categoriaEnsino);
            }

            session.setAttribute("listaDisciplinas", listaDisciplinas);
            request.setAttribute("ListaPresencaForm", listaPresencaForm);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private void consultar(ActionForm form, HttpServletRequest request, Errors errors) {
        ListaPresencaForm listaPresencaForm = (ListaPresencaForm) form;
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            if (listaPresencaForm.getIdSerieAno() != 0) {
                int idSerieAno = listaPresencaForm.getIdSerieAno();
            } else {
                int idSerieAno = Integer.parseInt(request.getParameter("idSerieAno"));
                listaPresencaForm.setIdSerieAno(idSerieAno);
            }
            int idDisciplina = listaPresencaForm.getIdDisciplina();
            String data = listaPresencaForm.getData();
            if (data.contains("/")) {
                data = IDRDate.parseDataIso(data);
            }

            //carregar lista de alunos por data, serie e disciplina
            List<ListaPresencaForm> listaAlunosPresenca = listaPresencaForm.obterListaAlunosPresenca(conn, listaPresencaForm.getIdSerieAno(), data, idDisciplina);
            request.setAttribute("listaAlunosPresenca", listaAlunosPresenca);

            request.setAttribute("data", data);
            request.setAttribute("ListaPresencaForm", listaPresencaForm);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private void editarPresenca(ActionForm form, HttpServletRequest request, Errors errors) {
        ListaPresencaForm listaPresencaForm = (ListaPresencaForm) form;
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            int idPresenca = listaPresencaForm.getIdPresenca();

            //obter dados lista presencao por ID
            listaPresencaForm = listaPresencaForm.obterListaPresencaPorID(conn, idPresenca);

            request.setAttribute("ListaPresencaForm", listaPresencaForm);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private void atualizarPresenca(ActionForm form, HttpServletRequest request, Errors errors) {
        ListaPresencaForm listaPresencaForm = (ListaPresencaForm) form;
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            //atualizar presenca
            listaPresencaForm.atualizarPresencaPorID(conn, listaPresencaForm);

            errors.error("Atualização Realizada com Sucesso.");
            request.setAttribute("ListaPresencaForm", listaPresencaForm);
            this.editarPresenca(listaPresencaForm, request, errors);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private void excluirPresenca(ActionForm form, HttpServletRequest request, Errors errors) {
        ListaPresencaForm listaPresencaForm = (ListaPresencaForm) form;
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            String[] listaIdPresenca = listaPresencaForm.getSelectedOptions();
            for (String idPresenca : listaIdPresenca) {
                listaPresencaForm.excluirPresencaPorID(conn, idPresenca);
            }

            request.setAttribute("ListaPresencaForm", listaPresencaForm);
            this.consultar(listaPresencaForm, request, errors);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private void imprimirDiario(ActionForm form, HttpServletRequest request, Errors errors) {
        ListaPresencaForm listaPresencaForm = (ListaPresencaForm) form;
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();
            //obter nome da disciplina por ID
            DisciplinasForm disciplinasForm = new DisciplinasForm();
            disciplinasForm = disciplinasForm.obterDadosDisciplinaID(conn, listaPresencaForm.getIdDisciplina());
            listaPresencaForm.setDsDisciplina(disciplinasForm.getNomeDisciplina());
            listaPresencaForm.setDsCategoriaEnsino(disciplinasForm.getDsCategoriaEnsino());

            //obter nome do professor por disciplina e serie
            DisciplinaProfessorForm disciplinaProfessorForm = new DisciplinaProfessorForm();
            String nomeProfessor = disciplinaProfessorForm.obterNomeProfessorPorDiscSerie(conn, listaPresencaForm.getIdDisciplina(), listaPresencaForm.getIdSerieAno());
            listaPresencaForm.setNomeProfessor(nomeProfessor);

            //obter descricaoSerie
            String descricaoSerie = Utilitario.obterDescricaoSerieAno(listaPresencaForm.getIdSerieAno());
            listaPresencaForm.setDsSerieAno(descricaoSerie);

            //obter lista de alunos por serie
            AlunoForm alunoForm = new AlunoForm();
            alunoForm.setStatus(1);
            alunoForm.setSerieAno(listaPresencaForm.getIdSerieAno());
            ArrayList<AlunoForm> listaAlunos = alunoForm.obterListaAlunos(conn, alunoForm);
            //carregar lista de datas de aula por serie, bimestre e disciplina
            List<String> listaDatas = listaPresencaForm.obterListaDatasPorSerieBimestreDisciplina(conn, listaPresencaForm);
            List<DiarioClasseForm> listaDiario = new ArrayList<>();
            for (AlunoForm aluno : listaAlunos) {
                DiarioClasseForm diarioForm = new DiarioClasseForm();
                diarioForm.setIdAluno(aluno.getIdPF());
                diarioForm.setNomeAluno(aluno.getNome());
                List<ListaPresencaForm> listaPresenca = new ArrayList<>();
                int qtdFalta = 0;
                for (String dataAula : listaDatas) {
                    //verificar se para a data foi dado falta pro aluno, caso venha nulo, deixa em branco
                    ListaPresencaForm list = listaPresencaForm.verificarFaltaPorDataAluno(conn, listaPresencaForm.getNrBimestre(), listaPresencaForm.getIdSerieAno(),
                            listaPresencaForm.getIdDisciplina(), aluno.getIdPF(), dataAula);
                    list.setFalta(list.getFalta());
                    list.setData(dataAula);
                    qtdFalta = qtdFalta + list.getQtdFalta();
                    listaPresenca.add(list);
                }
                diarioForm.setFalta(qtdFalta);

                //obter nota avaliacoes por aluno, disciplina, bimestre, serie
                NotaBimestreForm nota = NotaBimestreDao.getInstance().obterNotaPorAlunoDiscBimestre(conn, listaPresencaForm.getIdSerieAno(), listaPresencaForm.getNrBimestre(), listaPresencaForm.getIdDisciplina(), aluno.getIdPF());
                diarioForm.setNotaMensal(nota.getNotaMensal());
                diarioForm.setNotaBimestral(nota.getNotaBimestral());
                diarioForm.setNotaProducaoSala(nota.getNotaProducaoSala());
                diarioForm.setMediaBimestre(nota.getMediaBimestre());

                diarioForm.setListaPresenca(listaPresenca);
                listaDiario.add(diarioForm);
            }
            List<String> listaDataFormatada = new ArrayList<>();
            for (String data : listaDatas) {
                Date date = new Date();
                SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
                SimpleDateFormat sdf = new SimpleDateFormat("dd/MM");
                date = format.parse(data);
                listaDataFormatada.add(sdf.format(date));
            }

            //obter dados do planejamento por disciplina, serie, bimestre, ano
            PlanejamentoAulasForm planejamentoAulasForm = new PlanejamentoAulasForm();
            List<PlanejamentoAulasForm> listaPlanejamento = planejamentoAulasForm.obterListaPlanejamentoPorDiscSerieBimestre(conn, listaPresencaForm.getIdDisciplina(), listaPresencaForm.getIdSerieAno(), listaPresencaForm.getNrBimestre());

            request.setAttribute("listaPlanejamento", listaPlanejamento);
            request.setAttribute("listaDiario", listaDiario);
            request.setAttribute("listaDatas", listaDataFormatada);
            request.setAttribute("ListaPresencaForm", listaPresencaForm);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

}
