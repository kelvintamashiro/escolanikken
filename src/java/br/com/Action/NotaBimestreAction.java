/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.Action;

import br.com.Dao.HistoricoDao;
import br.com.Dao.NotaBimestreDao;
import br.com.Dao.NotaItinerarioDao;
import br.com.Form.AlunoForm;
import br.com.Form.DisciplinasForm;
import br.com.Form.NotaBimestreForm;
import br.com.Form.NotaItinerarioForm;
import br.com.Form.PessoaFisicaForm;
import br.com.Form.RecuperacaoAnualForm;
import br.com.Form.SerieAnoForm;
import br.com.Util.Utilitario;
import br.com.abre.Util.Errors;
import java.sql.Connection;
import java.text.DateFormat;
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
public class NotaBimestreAction extends IDRAction {

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
        } else if (action.equals("recuperouNota")) {
            this.recuperouNota(form, request, errors);
        } else if (action.equals("pageConsulta")) {
            this.pageConsulta(form, request, errors);
        } else if (action.equals("pageConsultaAluno")) {
            this.pageConsultaAluno(form, request, errors);
        } else if (action.equals("consultarAlunosSerie")) {
            this.consultarAlunosSerie(form, request, errors);
        } else if (action.equals("visualizarNota")) {
            this.visualizarNota(form, request, errors);
        } else if (action.equals("visualizarNotaAluno")) {
            return visualizarNotaAluno(mapping, form, request, errors);
        } else if (action.equals("pageEditarNota")) {
            this.pageEditarNota(form, request, errors);
        } else if (action.equals("editarNota")) {
            this.editarNota(form, request, errors);
        } else if (action.equals("pageNotasBimestrais")) {
            return pageNotasBimestrais(mapping, form, request, errors);
        }

        return mapping.findForward(forward);
    }

    private void page(ActionForm form, HttpServletRequest request, Errors errors) {
        NotaBimestreForm notaBimestreForm = new NotaBimestreForm();
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            //obter id do professor pela session
            String idProfessor = request.getParameter("idPF");

            //obter disciplinas que o professor pode dar as notas
            List<NotaBimestreForm> listaDisciplinaPorProfessor = NotaBimestreDao.getInstance().obterDisciplinasPorProfessor(conn, idProfessor);
            if (listaDisciplinaPorProfessor.size() > 0) {
                request.setAttribute("listaDisciplinaPorProfessor", listaDisciplinaPorProfessor);
            }
            request.setAttribute("NotaBimestreForm", notaBimestreForm);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }

    }

    private void pageLancarNota(ActionForm form, HttpServletRequest request, Errors errors) {
        NotaBimestreForm notaBimestreForm = (NotaBimestreForm) form;
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            int anoVigente = Utilitario.obterAnoVigente(conn);
            String idSerie = request.getParameter("serieAno");
            String bimestre = request.getParameter("nrBimestre");

            //obter nome disciplina pelo idDisciplina
            DisciplinasForm disciplinasForm = new DisciplinasForm();
            disciplinasForm = disciplinasForm.obterDadosDisciplinaID(conn, notaBimestreForm.getIdDisciplina());
            notaBimestreForm.setDisciplinasForm(disciplinasForm);

            SerieAnoForm serieAnoForm = new SerieAnoForm();
//            String dsSerie = serieAnoForm.obterDsSerieAnoPorID(conn, Integer.parseInt(idSerie));
            serieAnoForm.setDsSerieAno(Utilitario.obterDescricaoSerieAno(Integer.parseInt(idSerie)));
            serieAnoForm.setSerieAno(Integer.parseInt(idSerie));
            notaBimestreForm.setSerieAnoForm(serieAnoForm);

            //carregar lista de alunos por serie que ainda nao tiveram as notas lancadas
            AlunoForm alunoForm = new AlunoForm();
            ArrayList<AlunoForm> listaAlunosSemNota = alunoForm.obterListaAlunosPorSerieSemNotas(conn, idSerie, anoVigente, bimestre, notaBimestreForm.getIdDisciplina());
            if (listaAlunosSemNota.size() > 0) {
                request.setAttribute("listaAlunosSemNota", listaAlunosSemNota);
            }

            //carregar lista de alunos por serie que ainda ja tiveram as notas lancadas
            ArrayList<AlunoForm> listaAlunosComNota = alunoForm.obterListaAlunosPorSerieComNotas(conn, idSerie, anoVigente, bimestre, notaBimestreForm.getIdDisciplina());
            if (listaAlunosComNota.size() > 0) {
                request.setAttribute("listaAlunosComNota", listaAlunosComNota);
            }

            notaBimestreForm.setNotaProducaoSala("");
            notaBimestreForm.setNotaMensal("");
            notaBimestreForm.setNotaBimestral("");
            notaBimestreForm.setFalta(0);
            request.setAttribute("bimestre", bimestre);
            request.setAttribute("NotaBimestreForm", notaBimestreForm);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }

    }

    private void salvarNota(ActionForm form, HttpServletRequest request, Errors errors) {
        NotaBimestreForm notaBimestreForm = (NotaBimestreForm) form;
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();
            int anoVigente = Utilitario.obterAnoVigente(conn);
            notaBimestreForm.setAno(anoVigente);

            String ntProducaoSala = request.getParameter("notaProducaoSala");
            String ntMensal = request.getParameter("notaMensal");
            String ntBimestral = request.getParameter("notaBimestral");
            double notaProducao = 0;
            double notaMensal = 0;
            double notaBimestral = 0;
            boolean notasLancadas = true;

            if (ntProducaoSala != null && !ntProducaoSala.equals("")) {
                notaProducao = Double.parseDouble(ntProducaoSala.replace(",", "."));
                notaBimestreForm.setNotaProducaoSala(String.valueOf(notaProducao));
            } else {
                notasLancadas = false;
                notaBimestreForm.setNotaProducaoSala(null);
            }

            if (ntMensal != null && !ntMensal.equals("")) {
                notaMensal = Double.parseDouble(ntMensal.replace(",", "."));
                notaBimestreForm.setNotaMensal(String.valueOf(notaMensal));
            } else {
                notasLancadas = false;
                notaBimestreForm.setNotaMensal(null);
            }

            if (ntBimestral != null && !ntBimestral.equals("")) {
                notaBimestral = Double.parseDouble(ntBimestral.replace(",", "."));
                notaBimestreForm.setNotaBimestral(String.valueOf(notaBimestral));
            } else {
                notasLancadas = false;
                notaBimestreForm.setNotaBimestral(null);
            }

            notaBimestreForm.setIdSerieAno(Integer.parseInt(request.getParameter("serieAno")));

            if (notasLancadas) {
                double media = (notaMensal + notaProducao + (notaBimestral * 2)) / 4;
                double mediaArredondada = Math.round(media / 0.5) * 0.5;
                notaBimestreForm.setMediaBimestre(String.valueOf(mediaArredondada));
            } else {
                notaBimestreForm.setMediaBimestre(null);
            }

            //salvar nota do aluno e da materia
            NotaBimestreDao.getInstance().lancarNota(conn, notaBimestreForm, notaBimestreForm.getNrBimestre());

            //salvar no historico_cadastro_aluno
            try {
                HttpSession session = request.getSession(true);
                Integer idProfessorSession = (Integer) session.getAttribute("idPF");
                String nomeProfessorSession = (String) session.getAttribute("nome");
                StringBuilder descricaoHistorico = new StringBuilder();
                descricaoHistorico.append("LAN�AMENTO DE NOTA REALIZADO:");
                descricaoHistorico.append(" - Prod. Sala: ").append(notaBimestreForm.getNotaProducaoSala());
                descricaoHistorico.append(" - Nota Mensal: ").append(notaBimestreForm.getNotaMensal());
                descricaoHistorico.append(" - Nota Bimestral: ").append(notaBimestreForm.getNotaBimestral());
                descricaoHistorico.append(" - M�dia: ").append(notaBimestreForm.getMediaBimestre());

                HistoricoDao.getInstance().salvarHistoricoLancamentoNota(conn, notaBimestreForm, idProfessorSession, nomeProfessorSession, descricaoHistorico.toString());
            } catch (Exception ex) {
                ex.printStackTrace();
            }

            this.pageLancarNota(form, request, errors);
            request.setAttribute("NotaBimestreForm", notaBimestreForm);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private void excluirNota(ActionForm form, HttpServletRequest request, Errors errors) {
        NotaBimestreForm notaBimestreForm = (NotaBimestreForm) form;
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            //obter dados da nota antes de excluir
            NotaBimestreForm notaForm = NotaBimestreDao.getInstance().obterNotaPorID(conn, notaBimestreForm.getIdNotaBimestre());

            //excluir nota do aluno
            NotaBimestreDao.getInstance().excluirNota(conn, notaBimestreForm.getIdNotaBimestre());

            //salvar no historico_cadastro_aluno
            try {
                HttpSession session = request.getSession(true);
                Integer idProfessorSession = (Integer) session.getAttribute("idPF");
                String nomeProfessorSession = (String) session.getAttribute("nome");
                StringBuilder descricaoHistorico = new StringBuilder();
                descricaoHistorico.append("EXCLUS�O DE NOTA REALIZADO:");
                descricaoHistorico.append(" - Prod. Sala: ").append(notaForm.getNotaProducaoSala());
                descricaoHistorico.append(" - Nota Mensal: ").append(notaForm.getNotaMensal());
                descricaoHistorico.append(" - Nota Bimestral: ").append(notaForm.getNotaBimestral());
                descricaoHistorico.append(" - M�dia: ").append(notaForm.getMediaBimestre());

                HistoricoDao.getInstance().salvarHistoricoLancamentoNota(conn, notaForm, idProfessorSession, nomeProfessorSession, descricaoHistorico.toString());
            } catch (Exception ex) {
                ex.printStackTrace();
            }

            this.pageLancarNota(form, request, errors);
            request.setAttribute("NotaBimestreForm", notaBimestreForm);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private void recuperouNota(ActionForm form, HttpServletRequest request, Errors errors) {
        NotaBimestreForm notaBimestreForm = (NotaBimestreForm) form;
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            //recuperouNota nota do bimestre
            NotaBimestreDao.getInstance().recuperouNota(conn, notaBimestreForm.getIdNotaBimestre());

            this.pageLancarNota(form, request, errors);
            request.setAttribute("NotaBimestreForm", notaBimestreForm);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private void pageConsulta(ActionForm form, HttpServletRequest request, Errors errors) {
        NotaBimestreForm notaBimestreForm = (NotaBimestreForm) form;
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            String tipoPerfil = request.getParameter("tipoPerfil");
            String idPF = request.getParameter("idPF");

            DisciplinasForm disciplinasForm = new DisciplinasForm();
            notaBimestreForm.setDisciplinasForm(disciplinasForm);

            SerieAnoForm serieAnoForm = new SerieAnoForm();
            notaBimestreForm.setSerieAnoForm(serieAnoForm);

            request.setAttribute("NotaBimestreForm", notaBimestreForm);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private void pageConsultaAluno(ActionForm form, HttpServletRequest request, Errors errors) {
        NotaBimestreForm notaBimestreForm = (NotaBimestreForm) form;
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            String idPF = request.getParameter("idPF");
            notaBimestreForm.setIdAluno(Integer.parseInt(idPF));

            DisciplinasForm disciplinasForm = new DisciplinasForm();
            notaBimestreForm.setDisciplinasForm(disciplinasForm);

            SerieAnoForm serieAnoForm = new SerieAnoForm();
            notaBimestreForm.setSerieAnoForm(serieAnoForm);

            //carregar anos para fazer impressao do boleto
            List<NotaBimestreForm> listaAnos = notaBimestreForm.obterAnosNotasAluno(conn, idPF);
            request.setAttribute("listaAnos", listaAnos);
            request.setAttribute("NotaBimestreForm", notaBimestreForm);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private void consultarAlunosSerie(ActionForm form, HttpServletRequest request, Errors errors) {
        NotaBimestreForm notaBimestreForm = (NotaBimestreForm) form;
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            DisciplinasForm disciplinasForm = new DisciplinasForm();
            notaBimestreForm.setDisciplinasForm(disciplinasForm);

            SerieAnoForm serieAnoForm = new SerieAnoForm();
            notaBimestreForm.setSerieAnoForm(serieAnoForm);

            List<NotaBimestreForm> listaAlunosSerieAnoComNota = NotaBimestreDao.getInstance().obterAlunosSerieAnoComNota(conn, notaBimestreForm);

            request.setAttribute("listaAlunosSerieAnoComNota", listaAlunosSerieAnoComNota);
            request.setAttribute("NotaBimestreForm", notaBimestreForm);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private void visualizarNota(ActionForm form, HttpServletRequest request, Errors errors) {
        NotaBimestreForm notaBimestreForm = (NotaBimestreForm) form;
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            //obter descricao da serie/ano
            SerieAnoForm serieAnoForm = new SerieAnoForm();
            if (notaBimestreForm.getIdSerieAno() == 0) {
                //obter idSerieAno pelo Ano que o aluno estudou na Nikken
                int idSerie = notaBimestreForm.obterSeriePorAnoEstudando(conn, notaBimestreForm.getIdAluno(), notaBimestreForm.getAno());
                notaBimestreForm.setIdSerieAno(idSerie);
            }

            String dsSerie = serieAnoForm.obterDsSerieAnoPorID(conn, notaBimestreForm.getIdSerieAno());
            serieAnoForm.setDsSerieAno(dsSerie);
            notaBimestreForm.setSerieAnoForm(serieAnoForm);

            //obter dados pessoa fisica por id_pessoa_fisica
            PessoaFisicaForm pessoaFisicaForm = new PessoaFisicaForm();
            pessoaFisicaForm = pessoaFisicaForm.obterDadosPessoaFisicaPorID(conn, request.getParameter("idAluno"));
            AlunoForm alunoForm = new AlunoForm();
            alunoForm.setNome(pessoaFisicaForm.getNome());
            notaBimestreForm.setAlunoForm(alunoForm);

            //verificar se � do EF1, EF2 ou Ensino Medio
            String categoriaEnsino = NotaBimestreDao.getInstance().obterCategoriaEnsinoPorSerie(notaBimestreForm.getIdSerieAno());
            notaBimestreForm.setCategoriaEnsino(categoriaEnsino);

            //carregar lista de disciplinas por categoria de ensino
            DisciplinasForm disciplinasForm = new DisciplinasForm();
            List<DisciplinasForm> listaDisciplinas = disciplinasForm.obterListaDisciplinasPorCategoriaSerie(conn, categoriaEnsino, notaBimestreForm.getIdSerieAno(), notaBimestreForm.getAno());

            //percorrer as disciplinas e pegar as notas e faltas
            List<NotaBimestreForm> listaNotasDisciplinas = new ArrayList<>();
            List<String> listaObservacao = new ArrayList<>();
            for (DisciplinasForm disciplina : listaDisciplinas) {
                //obter Notas e faltas de todos os bimestres por disciplinas
                NotaBimestreForm notasFaltasDisciplinas = NotaBimestreDao.getInstance().obterNotasFaltasPorDisciplinaAluno(conn, disciplina.getIdDisciplina(), notaBimestreForm.getAno(), notaBimestreForm.getIdAluno(), notaBimestreForm.getIdSerieAno());
                if (notasFaltasDisciplinas.getDisciplinasForm() == null) {
                    DisciplinasForm discForm = new DisciplinasForm();
                    discForm.setNomeDisciplina(disciplina.getNomeDisciplina());
                    discForm.setIdDisciplina(disciplina.getIdDisciplina());
                    notasFaltasDisciplinas.setDisciplinasForm(discForm);
                }

                notasFaltasDisciplinas.setFaltaTotal(notasFaltasDisciplinas.getFalta1Bimestre() + notasFaltasDisciplinas.getFalta2Bimestre() + notasFaltasDisciplinas.getFalta3Bimestre() + notasFaltasDisciplinas.getFalta4Bimestre());

                if (notasFaltasDisciplinas.getMedia1Bimestre() >= 0 && notasFaltasDisciplinas.getMedia2Bimestre() >= 0
                        && notasFaltasDisciplinas.getMedia3Bimestre() >= 0 && notasFaltasDisciplinas.getMedia4Bimestre() >= 0) {
                    double media = (notasFaltasDisciplinas.getMedia1Bimestre() + notasFaltasDisciplinas.getMedia2Bimestre() + notasFaltasDisciplinas.getMedia3Bimestre() + notasFaltasDisciplinas.getMedia4Bimestre()) / 4;
                    double mediaArredondada = Math.round(media / 0.5) * 0.5;
                    notasFaltasDisciplinas.setMediaFinal(mediaArredondada);
                }

                //se a media final for menor que 6.0 verificar se fez recuperacao final e pegar a nota
                if (notasFaltasDisciplinas.getMediaFinal() < 6.0) {
                    String observacaoRecup = "";
                    RecuperacaoAnualForm recuperacaoAnualForm = new RecuperacaoAnualForm();
                    double mediaRecupFinal = recuperacaoAnualForm.obterMediaRecupFinalPorAlunoDisciplina(conn, disciplina.getIdDisciplina(), notaBimestreForm.getAno(), notaBimestreForm.getIdAluno(), notaBimestreForm.getIdSerieAno());
                    if (mediaRecupFinal > 0) {
                        notasFaltasDisciplinas.setFezProvaRecupAnual(true);
                        if (mediaRecupFinal >= 6.0) {
                            notasFaltasDisciplinas.setMediaRecupFinal(mediaRecupFinal);
                            notasFaltasDisciplinas.setPassouDisciplina(true);
                            observacaoRecup = "Aluno(a) foi submetivo a recupera��o anual e obteve �xito na disciplina: " + disciplina.getNomeDisciplina();
                            notasFaltasDisciplinas.setResultadoFinal("Aprovado");
                        } else {
                            notasFaltasDisciplinas.setMediaRecupFinal(mediaRecupFinal);
                            notasFaltasDisciplinas.setPassouDisciplina(false);
                            observacaoRecup = "Aluno(a) foi submetivo a recupera��o anual e n�o obteve �xito na disciplina: " + disciplina.getNomeDisciplina();
                            notasFaltasDisciplinas.setResultadoFinal("Reprovado");
                        }
                        listaObservacao.add(observacaoRecup);
                    }
                } else {
                    //se a media final for maior ou igual a 6, escreve no resultado final Aprovado
                    notasFaltasDisciplinas.setResultadoFinal("Aprovado");
                }

                listaNotasDisciplinas.add(notasFaltasDisciplinas);
            }
            request.setAttribute("listaNotasDisciplinas", listaNotasDisciplinas);

            if (listaObservacao.size() > 0) {
                request.setAttribute("listaObservacao", listaObservacao);
            }

            //obter notas itinerario do aluno que ja possui nota lancada
            List<NotaItinerarioForm> listaNotasItinerarios = new ArrayList<>();
            List<NotaItinerarioForm> listaItinerarios = NotaItinerarioDao.getInstance().obterItinerariosAluno(conn, notaBimestreForm.getIdAluno());
            for (NotaItinerarioForm itinerario : listaItinerarios) {
                //obter notas para cada itinerario do aluno
                NotaItinerarioForm notasFaltasItinerario = NotaItinerarioDao.getInstance().obterNotasFaltasPorItinerarioAluno(conn, notaBimestreForm.getIdAluno(), notaBimestreForm.getAno(), notaBimestreForm.getIdSerieAno(), itinerario.getIdItinerario());
                notasFaltasItinerario.setFaltaTotal(notasFaltasItinerario.getFaltaBimestre1() + notasFaltasItinerario.getFaltaBimestre2() + notasFaltasItinerario.getFaltaBimestre3() + notasFaltasItinerario.getFaltaBimestre4());

                if (notasFaltasItinerario.getNotaBimestre1() >= 0 && notasFaltasItinerario.getNotaBimestre2() >= 0
                        && notasFaltasItinerario.getNotaBimestre3() >= 0 && notasFaltasItinerario.getNotaBimestre4() >= 0) {
                    double media = (notasFaltasItinerario.getNotaBimestre1() + notasFaltasItinerario.getNotaBimestre2() + notasFaltasItinerario.getNotaBimestre3() + notasFaltasItinerario.getNotaBimestre4()) / 4;
                    double mediaArredondada = Math.round(media / 0.5) * 0.5;
                    notasFaltasItinerario.setMediaAnual(mediaArredondada);
                }
                listaNotasItinerarios.add(notasFaltasItinerario);
            }
            
            if(listaNotasItinerarios.size() > 0) {
                request.setAttribute("listaNotasItinerarios", listaNotasItinerarios);
            }

            //pegar data atual
            DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
            Date date = new Date();
            notaBimestreForm.setDataEmissao(dateFormat.format(date));

            request.setAttribute("NotaBimestreForm", notaBimestreForm);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private ActionForward visualizarNotaAluno(ActionMapping mapping, ActionForm form, HttpServletRequest request, Errors errors) {
        NotaBimestreForm notaBimestreForm = (NotaBimestreForm) form;
        Connection conn = null;
        HttpSession session = request.getSession();
        String strForward = "";
        try {
            conn = connectionPool.getConnection();

            int idAluno = Integer.parseInt(request.getParameter("idAluno"));
            //verificar se o ID � o mesmo que esta na sessao
            int idPfSession = (int) session.getAttribute("idPF");
            if (idAluno != idPfSession) {
                strForward = "fwrError";
            } else {
                strForward = "visualizarNotaAluno";
                //obter descricao da serie/ano
                SerieAnoForm serieAnoForm = new SerieAnoForm();
                if (notaBimestreForm.getIdSerieAno() == 0) {
                    //obter idSerieAno pelo Ano que o aluno estudou na Nikken
                    int idSerie = notaBimestreForm.obterSeriePorAnoEstudando(conn, notaBimestreForm.getIdAluno(), notaBimestreForm.getAno());
                    notaBimestreForm.setIdSerieAno(idSerie);
                }

                String dsSerie = serieAnoForm.obterDsSerieAnoPorID(conn, notaBimestreForm.getIdSerieAno());
                serieAnoForm.setDsSerieAno(dsSerie);
                notaBimestreForm.setSerieAnoForm(serieAnoForm);

                //obter dados pessoa fisica por id_pessoa_fisica
                PessoaFisicaForm pessoaFisicaForm = new PessoaFisicaForm();
                pessoaFisicaForm = pessoaFisicaForm.obterDadosPessoaFisicaPorID(conn, request.getParameter("idAluno"));
                AlunoForm alunoForm = new AlunoForm();
                alunoForm.setNome(pessoaFisicaForm.getNome());
                notaBimestreForm.setAlunoForm(alunoForm);

                //verificar se � do EF1, EF2 ou Ensino Medio
                String categoriaEnsino = NotaBimestreDao.getInstance().obterCategoriaEnsinoPorSerie(notaBimestreForm.getIdSerieAno());
                notaBimestreForm.setCategoriaEnsino(categoriaEnsino);

                //carregar lista de disciplinas por categoria de ensino
                DisciplinasForm disciplinasForm = new DisciplinasForm();
                List<DisciplinasForm> listaDisciplinas = disciplinasForm.obterListaDisciplinasPorCategoriaSerie(conn, categoriaEnsino, notaBimestreForm.getIdSerieAno(), notaBimestreForm.getAno());

                //percorrer as disciplinas e pegar as notas e faltas
                List<NotaBimestreForm> listaNotasDisciplinas = new ArrayList<>();
                List<String> listaObservacao = new ArrayList<>();
                for (DisciplinasForm disciplina : listaDisciplinas) {
                    //obter Notas e faltas de todos os bimestres por disciplinas
                    NotaBimestreForm notasFaltasDisciplinas = NotaBimestreDao.getInstance().obterNotasFaltasPorDisciplinaAluno(conn, disciplina.getIdDisciplina(), notaBimestreForm.getAno(), notaBimestreForm.getIdAluno(), notaBimestreForm.getIdSerieAno());
                    if (notasFaltasDisciplinas.getDisciplinasForm() == null) {
                        DisciplinasForm discForm = new DisciplinasForm();
                        discForm.setNomeDisciplina(disciplina.getNomeDisciplina());
                        discForm.setIdDisciplina(disciplina.getIdDisciplina());
                        notasFaltasDisciplinas.setDisciplinasForm(discForm);
                    }

                    notasFaltasDisciplinas.setFaltaTotal(notasFaltasDisciplinas.getFalta1Bimestre() + notasFaltasDisciplinas.getFalta2Bimestre() + notasFaltasDisciplinas.getFalta3Bimestre() + notasFaltasDisciplinas.getFalta4Bimestre());

                    if (notasFaltasDisciplinas.getMedia1Bimestre() >= 0 && notasFaltasDisciplinas.getMedia2Bimestre() >= 0
                            && notasFaltasDisciplinas.getMedia3Bimestre() >= 0 && notasFaltasDisciplinas.getMedia4Bimestre() >= 0) {
                        double media = (notasFaltasDisciplinas.getMedia1Bimestre() + notasFaltasDisciplinas.getMedia2Bimestre() + notasFaltasDisciplinas.getMedia3Bimestre() + notasFaltasDisciplinas.getMedia4Bimestre()) / 4;
                        double mediaArredondada = Math.round(media / 0.5) * 0.5;
                        notasFaltasDisciplinas.setMediaFinal(mediaArredondada);
                    }

                    //se a media final for menor que 6.0 verificar se fez recuperacao final e pegar a nota
                    if (notasFaltasDisciplinas.getMediaFinal() < 6.0) {
                        String observacaoRecup = "";
                        RecuperacaoAnualForm recuperacaoAnualForm = new RecuperacaoAnualForm();
                        double mediaRecupFinal = recuperacaoAnualForm.obterMediaRecupFinalPorAlunoDisciplina(conn, disciplina.getIdDisciplina(), notaBimestreForm.getAno(), notaBimestreForm.getIdAluno(), notaBimestreForm.getIdSerieAno());
                        if (mediaRecupFinal > 0) {
                            notasFaltasDisciplinas.setFezProvaRecupAnual(true);
                            if (mediaRecupFinal >= 6.0) {
                                notasFaltasDisciplinas.setMediaRecupFinal(mediaRecupFinal);
                                notasFaltasDisciplinas.setPassouDisciplina(true);
                                observacaoRecup = "Aluno(a) foi submetivo a recupera��o anual e obteve �xito na disciplina: " + disciplina.getNomeDisciplina();
                                notasFaltasDisciplinas.setResultadoFinal("Aprovado");
                            } else {
                                notasFaltasDisciplinas.setMediaRecupFinal(mediaRecupFinal);
                                notasFaltasDisciplinas.setPassouDisciplina(false);
                                observacaoRecup = "Aluno(a) foi submetivo a recupera��o anual e n�o obteve �xito na disciplina: " + disciplina.getNomeDisciplina();
                                notasFaltasDisciplinas.setResultadoFinal("Reprovado");
                            }
                            listaObservacao.add(observacaoRecup);
                        }
                    } else {
                        //se a media final for maior ou igual a 6, escreve no resultado final Aprovado
                        notasFaltasDisciplinas.setResultadoFinal("Aprovado");
                    }

                    listaNotasDisciplinas.add(notasFaltasDisciplinas);
                }
                request.setAttribute("listaNotasDisciplinas", listaNotasDisciplinas);

                if (listaObservacao.size() > 0) {
                    request.setAttribute("listaObservacao", listaObservacao);
                }

                //pegar data atual
                DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
                Date date = new Date();
                notaBimestreForm.setDataEmissao(dateFormat.format(date));

                request.setAttribute("NotaBimestreForm", notaBimestreForm);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
        return mapping.findForward(strForward);
    }

    private void pageEditarNota(ActionForm form, HttpServletRequest request, Errors errors) {
        NotaBimestreForm notaBimestreForm = (NotaBimestreForm) form;
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            NotaBimestreForm notaForm = NotaBimestreDao.getInstance().obterNotaPorID(conn, notaBimestreForm.getIdNotaBimestre());

            request.setAttribute("NotaBimestreForm", notaForm);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private void editarNota(ActionForm form, HttpServletRequest request, Errors errors) {
        NotaBimestreForm notaBimestreForm = (NotaBimestreForm) form;
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            String ntProducaoSala = request.getParameter("notaProducaoSala");
            String ntMensal = request.getParameter("notaMensal");
            String ntBimestral = request.getParameter("notaBimestral");
            double notaProducao = 0;
            double notaMensal = 0;
            double notaBimestral = 0;
            boolean notasLancadas = true;

            if (ntProducaoSala != null && !ntProducaoSala.equals("")) {
                notaProducao = Double.parseDouble(ntProducaoSala.replace(",", "."));
                notaBimestreForm.setNotaProducaoSala(String.valueOf(notaProducao));
            } else {
                notasLancadas = false;
                notaBimestreForm.setNotaProducaoSala(null);
            }

            if (ntMensal != null && !ntMensal.equals("")) {
                notaMensal = Double.parseDouble(ntMensal.replace(",", "."));
                notaBimestreForm.setNotaMensal(String.valueOf(notaMensal));
            } else {
                notasLancadas = false;
                notaBimestreForm.setNotaMensal(null);
            }

            if (ntBimestral != null && !ntBimestral.equals("")) {
                notaBimestral = Double.parseDouble(ntBimestral.replace(",", "."));
                notaBimestreForm.setNotaBimestral(String.valueOf(notaBimestral));
            } else {
                notasLancadas = false;
                notaBimestreForm.setNotaBimestral(null);
            }

            if (notasLancadas) {
                double media = (notaMensal + notaProducao + (notaBimestral * 2)) / 4;
                double mediaArredondada = Math.round(media / 0.5) * 0.5;
                notaBimestreForm.setMediaBimestre(String.valueOf(mediaArredondada));
            } else {
                notaBimestreForm.setMediaBimestre(null);
            }

            //alterar nota do aluno
            NotaBimestreDao.getInstance().atualizarNota(conn, notaBimestreForm);

            errors.error("Lan�amento de Nota Atualizada com Sucesso!!");

            //salvar no historico_cadastro_aluno
            try {
                HttpSession session = request.getSession(true);
                Integer idProfessorSession = (Integer) session.getAttribute("idPF");
                String nomeProfessorSession = (String) session.getAttribute("nome");
                StringBuilder descricaoHistorico = new StringBuilder();
                descricaoHistorico.append("ALTERA��O DE NOTA REALIZADO:");
                descricaoHistorico.append(" - Prod. Sala: ").append(notaBimestreForm.getNotaProducaoSala());
                descricaoHistorico.append(" - Nota Mensal: ").append(notaBimestreForm.getNotaMensal());
                descricaoHistorico.append(" - Nota Bimestral: ").append(notaBimestreForm.getNotaBimestral());
                descricaoHistorico.append(" - M�dia: ").append(notaBimestreForm.getMediaBimestre());

                HistoricoDao.getInstance().salvarHistoricoLancamentoNota(conn, notaBimestreForm, idProfessorSession, nomeProfessorSession, descricaoHistorico.toString());
            } catch (Exception ex) {
                ex.printStackTrace();
            }

            request.setAttribute("NotaBimestreForm", notaBimestreForm);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private ActionForward pageNotasBimestrais(ActionMapping mapping, ActionForm form, HttpServletRequest request, Errors errors) {
        NotaBimestreForm notaBimestreForm = new NotaBimestreForm();
        Connection conn = null;
        HttpSession session = request.getSession();
        String strForward = "";
        try {
            conn = connectionPool.getConnection();

            int idPF = Integer.parseInt(request.getParameter("idPF"));
            //verificar se o ID � o mesmo que esta na sessao
            int idPfSession = (int) session.getAttribute("idPF");
            if (idPF != idPfSession) {
                strForward = "fwrError";
            } else {
                strForward = "pageNotasBimestrais";
                notaBimestreForm.setIdAluno(idPF);

                //obter notas do aluno no ano vigente
                List<NotaBimestreForm> listaNotas = NotaBimestreDao.getInstance().obterNotasPorAluno(conn, notaBimestreForm.getIdAluno());

                request.setAttribute("listaNotas", listaNotas);
                request.setAttribute("NotaBimestreForm", notaBimestreForm);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
        return mapping.findForward(strForward);
    }

}
