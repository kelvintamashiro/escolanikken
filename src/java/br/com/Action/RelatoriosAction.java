/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.Action;

import br.com.Dao.NotaBimestreDao;
import br.com.Dao.RelatoriosDao;
import br.com.Form.AlunoForm;
import br.com.Form.DisciplinasForm;
import br.com.Form.NotaBimestreForm;
import br.com.Form.RelatoriosForm;
import br.com.Form.RelatoriosNotasForm;
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
public class RelatoriosAction extends IDRAction {

    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response, Errors errors, String action) {
        String forward = action;
        if (action.equals("page")) {
            this.page(form, request, errors);
        } else if (action.equals("relTelefonePais")) {
            this.relTelefonePais(form, request, errors);
        } else if (action.equals("relListaAniversario")) {
            this.relListaAniversario(form, request, errors);
        } else if (action.equals("pageRelNotasMensalPorBimestre") || action.equals("pageRelNotasBimestralPorBimestre")
                || action.equals("pageRelNotasProducaoPorBimestre") || action.equals("pageRelNotasMediaPorBimestre") || action.equals("pageNotasPorAluno")) {
            this.pageRelNotasPorBimestre(form, request, errors);
        } else if (action.equals("relNotasMensalPorBimestre") || action.equals("relNotasBimestralPorBimestre")
                || action.equals("relNotasProducaoPorBimestre") || action.equals("relNotasMediaPorBimestre")) {
            this.relNotasPorBimestre(form, request, errors);
        } else if (action.equals("pageRelLancamentoNotas")) {
            this.page(form, request, errors);
        } else if (action.equals("relLancamentoNotas")) {
            this.relLancamentoNotas(form, request, errors);
        } else if (action.equals("pageRelMelhoresNotasPorBimestre")) {
            this.pageRelNotasPorBimestre(form, request, errors);
        } else if (action.equals("relMelhoresNotasPorBimestre")) {
            this.relMelhoresNotasPorBimestre(form, request, errors);
        } else if (action.equals("relListaEndereco")) {
            this.relListaEndereco(form, request, errors);
        } else if (action.equals("relGeralAtivoInativoTurma")) {
            this.relGeralAtivoInativoTurma(form, request, errors);
        } else if (action.equals("carregarAlunosPorSerie")) {
            this.carregarAlunosPorSerie(form, request, errors);
        } else if (action.equals("relNotasPorAluno")) {
            this.relNotasPorAluno(form, request, errors);
        }

        return mapping.findForward(forward);
    }

    private void page(ActionForm form, HttpServletRequest request, Errors errors) {
        RelatoriosForm relForm = new RelatoriosForm();
        request.setAttribute("RelatoriosForm", relForm);
    }

    private void relTelefonePais(ActionForm form, HttpServletRequest request, Errors errors) {
        RelatoriosForm relForm = new RelatoriosForm();
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();
            //obter lista de telefones de todos os pais de alunos
            List<RelatoriosForm> listaTelefonesPais = RelatoriosDao.getInstance().obterListaTelefonesPais(conn);
            request.setAttribute("listaTelefonesPais", listaTelefonesPais);
            request.setAttribute("RelatoriosForm", relForm);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }

    }

    private void relListaAniversario(ActionForm form, HttpServletRequest request, Errors errors) {
        RelatoriosForm relForm = new RelatoriosForm();
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();
            //obter lista de aniversariantes
            List<RelatoriosForm> listaAniversariantes = RelatoriosDao.getInstance().obterListaAniversariantes(conn);
            request.setAttribute("listaAniversariantes", listaAniversariantes);
            request.setAttribute("RelatoriosForm", relForm);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private void pageRelNotasPorBimestre(ActionForm form, HttpServletRequest request, Errors errors) {
        RelatoriosForm relForm = new RelatoriosForm();
        NotaBimestreForm notaBimestreForm = new NotaBimestreForm();
        DisciplinasForm disciplinasForm = new DisciplinasForm();
        relForm.setDisciplinasForm(disciplinasForm);
        relForm.setNotaBimestreForm(notaBimestreForm);
        request.setAttribute("RelatoriosForm", relForm);
    }

    private void relNotasPorBimestre(ActionForm form, HttpServletRequest request, Errors errors) {
        RelatoriosForm relForm = (RelatoriosForm) form;
        RelatoriosNotasForm relNotasForm = new RelatoriosNotasForm();
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            String nrBimestre = request.getParameter("nrBimestre");
            String ano = request.getParameter("ano");
            String idSerieAno = request.getParameter("idSerieAno");

            //verificar se é do EF1, EF2 ou Ensino Medio
            NotaBimestreForm notaBimestreForm = new NotaBimestreForm();
            String categoriaEnsino = NotaBimestreDao.getInstance().obterCategoriaEnsinoPorSerie(Integer.parseInt(request.getParameter("idSerieAno")));
            notaBimestreForm.setCategoriaEnsino(categoriaEnsino);

            //percorrer lista de alunos por serie/Ano
            AlunoForm alunoForm = new AlunoForm();
//            alunoForm.setSerieAno(Integer.parseInt(request.getParameter("idSerieAno")));
//            alunoForm.setStatus(1);
//            ArrayList<AlunoForm> listaAlunos = alunoForm.obterListaAlunos(conn, alunoForm);
            ArrayList<AlunoForm> listaAlunos = alunoForm.obterListaAlunosComNotaPorAno(conn, idSerieAno, ano);
            List<AlunoForm> listaNotasAlunos = new ArrayList<>();
            for (AlunoForm aluno : listaAlunos) {
                //para cada aluno obter as notas de todas as disciplinas individualmente por bimestre
                List<RelatoriosForm> listaNotasPorAlunoAnoBimestre = RelatoriosDao.getInstance().obterListaNotasPorAlunoAnoBimestre(conn, aluno.getIdPF(), ano, nrBimestre, categoriaEnsino);
                aluno.setListaNotas(listaNotasPorAlunoAnoBimestre);
                listaNotasAlunos.add(aluno);
            }

            System.out.println(listaNotasAlunos);

            String tipo = request.getParameter("tipo");
            request.setAttribute("ano", ano);
            request.setAttribute("tipo", tipo);
            request.setAttribute("listaNotasAlunos", listaNotasAlunos);
            request.setAttribute("nrBimestre", nrBimestre);
            request.setAttribute("RelatoriosNotasForm", relNotasForm);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private void relLancamentoNotas(ActionForm form, HttpServletRequest request, Errors errors) {
        RelatoriosForm relForm = (RelatoriosForm) form;
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            //obter relatorio de lancamento de notas por data de inicio e data final
            List<RelatoriosForm> historicoLancamentoNotas = RelatoriosDao.getInstance().obterHistoricoLancamentoNotasPorData(conn, relForm);
            request.setAttribute("historicoLancamentoNotas", historicoLancamentoNotas);
            request.setAttribute("RelatoriosForm", relForm);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }

    }

    private void relMelhoresNotasPorBimestre(ActionForm form, HttpServletRequest request, Errors errors) {
        RelatoriosForm relForm = (RelatoriosForm) form;
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            //obter series
            SerieAnoForm serieForm = new SerieAnoForm();
            ArrayList<SerieAnoForm> listaTodasSeries = serieForm.listaTodasSeriesComNotas(conn);

            //percorrer todas as series e obter a quantidade de medias
            String qtdMelhoresNotas = request.getParameter("qtdMelhoresNotas");
            String nrBimestre = request.getParameter("nrBimestre");
            String ano = request.getParameter("ano");

            ArrayList<RelatoriosForm> listaMelhoresMedias2ano = new ArrayList<>();
            ArrayList<RelatoriosForm> listaMelhoresMedias3ano = new ArrayList<>();
            ArrayList<RelatoriosForm> listaMelhoresMedias4ano = new ArrayList<>();
            ArrayList<RelatoriosForm> listaMelhoresMedias5ano = new ArrayList<>();
            ArrayList<RelatoriosForm> listaMelhoresMedias6ano = new ArrayList<>();
            ArrayList<RelatoriosForm> listaMelhoresMedias7ano = new ArrayList<>();
            ArrayList<RelatoriosForm> listaMelhoresMedias8ano = new ArrayList<>();
            ArrayList<RelatoriosForm> listaMelhoresMedias9ano = new ArrayList<>();
            ArrayList<RelatoriosForm> listaMelhoresMedias1serie = new ArrayList<>();
            ArrayList<RelatoriosForm> listaMelhoresMedias2serie = new ArrayList<>();
            ArrayList<RelatoriosForm> listaMelhoresMedias3serie = new ArrayList<>();
            for (SerieAnoForm serieAno : listaTodasSeries) {
                switch (serieAno.getSerieAno()) {
                    case 2:
                        listaMelhoresMedias2ano = RelatoriosDao.getInstance().obterMelhoresNotasPorBimestre(conn, serieAno.getSerieAno(), qtdMelhoresNotas, ano, nrBimestre);
                        request.setAttribute("listaMelhoresMedias2ano", listaMelhoresMedias2ano);
                        break;
                    case 3:
                        listaMelhoresMedias3ano = RelatoriosDao.getInstance().obterMelhoresNotasPorBimestre(conn, serieAno.getSerieAno(), qtdMelhoresNotas, ano, nrBimestre);
                        request.setAttribute("listaMelhoresMedias3ano", listaMelhoresMedias3ano);
                        break;
                    case 4:
                        listaMelhoresMedias4ano = RelatoriosDao.getInstance().obterMelhoresNotasPorBimestre(conn, serieAno.getSerieAno(), qtdMelhoresNotas, ano, nrBimestre);
                        request.setAttribute("listaMelhoresMedias4ano", listaMelhoresMedias4ano);
                        break;
                    case 5:
                        listaMelhoresMedias5ano = RelatoriosDao.getInstance().obterMelhoresNotasPorBimestre(conn, serieAno.getSerieAno(), qtdMelhoresNotas, ano, nrBimestre);
                        request.setAttribute("listaMelhoresMedias5ano", listaMelhoresMedias5ano);
                        break;
                    case 6:
                        listaMelhoresMedias6ano = RelatoriosDao.getInstance().obterMelhoresNotasPorBimestre(conn, serieAno.getSerieAno(), qtdMelhoresNotas, ano, nrBimestre);
                        request.setAttribute("listaMelhoresMedias6ano", listaMelhoresMedias6ano);
                        break;
                    case 7:
                        listaMelhoresMedias7ano = RelatoriosDao.getInstance().obterMelhoresNotasPorBimestre(conn, serieAno.getSerieAno(), qtdMelhoresNotas, ano, nrBimestre);
                        request.setAttribute("listaMelhoresMedias7ano", listaMelhoresMedias7ano);
                        break;
                    case 8:
                        listaMelhoresMedias8ano = RelatoriosDao.getInstance().obterMelhoresNotasPorBimestre(conn, serieAno.getSerieAno(), qtdMelhoresNotas, ano, nrBimestre);
                        request.setAttribute("listaMelhoresMedias8ano", listaMelhoresMedias8ano);
                        break;
                    case 9:
                        listaMelhoresMedias9ano = RelatoriosDao.getInstance().obterMelhoresNotasPorBimestre(conn, serieAno.getSerieAno(), qtdMelhoresNotas, ano, nrBimestre);
                        request.setAttribute("listaMelhoresMedias9ano", listaMelhoresMedias9ano);
                        break;
                    case 10:
                        listaMelhoresMedias1serie = RelatoriosDao.getInstance().obterMelhoresNotasPorBimestre(conn, serieAno.getSerieAno(), qtdMelhoresNotas, ano, nrBimestre);
                        request.setAttribute("listaMelhoresMedias1serie", listaMelhoresMedias1serie);
                        break;
                    case 20:
                        listaMelhoresMedias2serie = RelatoriosDao.getInstance().obterMelhoresNotasPorBimestre(conn, serieAno.getSerieAno(), qtdMelhoresNotas, ano, nrBimestre);
                        request.setAttribute("listaMelhoresMedias2serie", listaMelhoresMedias2serie);
                        break;
                    case 30:
                        listaMelhoresMedias3serie = RelatoriosDao.getInstance().obterMelhoresNotasPorBimestre(conn, serieAno.getSerieAno(), qtdMelhoresNotas, ano, nrBimestre);
                        request.setAttribute("listaMelhoresMedias3serie", listaMelhoresMedias3serie);
                        break;
                    default:
                        break;
                }
            }

            request.setAttribute("RelatoriosForm", relForm);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private void relListaEndereco(ActionForm form, HttpServletRequest request, Errors errors) {
        RelatoriosForm relForm = new RelatoriosForm();
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();
            //obter lista de enderecos, telefones e transporte
            List<RelatoriosForm> listaEnderecoTelefone = RelatoriosDao.getInstance().obterListaEnderecoTelefone(conn);
            request.setAttribute("listaEnderecoTelefone", listaEnderecoTelefone);
            request.setAttribute("RelatoriosForm", relForm);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private void relGeralAtivoInativoTurma(ActionForm form, HttpServletRequest request, Errors errors) {
        RelatoriosForm relForm = new RelatoriosForm();
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            //obter quantidade total por sexo
            int qtdFeminino = RelatoriosDao.getInstance().obterQtdEstudantePorSexo(conn, "feminino");
            int qtdMasculino = RelatoriosDao.getInstance().obterQtdEstudantePorSexo(conn, "masculino");
            int qtdTotal = qtdFeminino + qtdMasculino;

            request.setAttribute("qtdTotal", qtdTotal);
            request.setAttribute("qtdFeminino", qtdFeminino);
            request.setAttribute("qtdMasculino", qtdMasculino);

            //obter informacao geral por categoria
            RelatoriosForm listaCategoriaInfantil = RelatoriosDao.getInstance().obterInformacaoPorCategoria(conn, 1);
            RelatoriosForm listaCategoriaFundamental1 = RelatoriosDao.getInstance().obterInformacaoPorCategoria(conn, 2);
            RelatoriosForm listaCategoriaFundamental2 = RelatoriosDao.getInstance().obterInformacaoPorCategoria(conn, 3);
            RelatoriosForm listaCategoriaEnsinoMedio = RelatoriosDao.getInstance().obterInformacaoPorCategoria(conn, 4);

            request.setAttribute("listaCategoriaInfantil", listaCategoriaInfantil);
            request.setAttribute("listaCategoriaFundamental1", listaCategoriaFundamental1);
            request.setAttribute("listaCategoriaFundamental2", listaCategoriaFundamental2);
            request.setAttribute("listaCategoriaEnsinoMedio", listaCategoriaEnsinoMedio);

            //obter informacao geral por serie/turma
            RelatoriosForm listaInfantil1 = RelatoriosDao.getInstance().obterInformacaoPorSerie(conn, 11);
            RelatoriosForm listaInfantil2 = RelatoriosDao.getInstance().obterInformacaoPorSerie(conn, 12);
            RelatoriosForm listaInfantil3 = RelatoriosDao.getInstance().obterInformacaoPorSerie(conn, 13);
            RelatoriosForm listaAno1 = RelatoriosDao.getInstance().obterInformacaoPorSerie(conn, 1);
            RelatoriosForm listaAno2 = RelatoriosDao.getInstance().obterInformacaoPorSerie(conn, 2);
            RelatoriosForm listaAno3 = RelatoriosDao.getInstance().obterInformacaoPorSerie(conn, 3);
            RelatoriosForm listaAno4 = RelatoriosDao.getInstance().obterInformacaoPorSerie(conn, 4);
            RelatoriosForm listaAno5 = RelatoriosDao.getInstance().obterInformacaoPorSerie(conn, 5);
            RelatoriosForm listaAno6 = RelatoriosDao.getInstance().obterInformacaoPorSerie(conn, 6);
            RelatoriosForm listaAno7 = RelatoriosDao.getInstance().obterInformacaoPorSerie(conn, 7);
            RelatoriosForm listaAno8 = RelatoriosDao.getInstance().obterInformacaoPorSerie(conn, 8);
            RelatoriosForm listaAno9 = RelatoriosDao.getInstance().obterInformacaoPorSerie(conn, 9);
            RelatoriosForm listaSerie1 = RelatoriosDao.getInstance().obterInformacaoPorSerie(conn, 10);
            RelatoriosForm listaSerie2 = RelatoriosDao.getInstance().obterInformacaoPorSerie(conn, 20);
            RelatoriosForm listaSerie3 = RelatoriosDao.getInstance().obterInformacaoPorSerie(conn, 30);

            request.setAttribute("listaInfantil1", listaInfantil1);
            request.setAttribute("listaInfantil2", listaInfantil2);
            request.setAttribute("listaInfantil3", listaInfantil3);
            request.setAttribute("listaAno1", listaAno1);
            request.setAttribute("listaAno2", listaAno2);
            request.setAttribute("listaAno3", listaAno3);
            request.setAttribute("listaAno4", listaAno4);
            request.setAttribute("listaAno5", listaAno5);
            request.setAttribute("listaAno6", listaAno6);
            request.setAttribute("listaAno7", listaAno7);
            request.setAttribute("listaAno8", listaAno8);
            request.setAttribute("listaAno9", listaAno9);
            request.setAttribute("listaSerie1", listaSerie1);
            request.setAttribute("listaSerie2", listaSerie2);
            request.setAttribute("listaSerie3", listaSerie3);

            request.setAttribute("RelatoriosForm", relForm);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private void carregarAlunosPorSerie(ActionForm form, HttpServletRequest request, Errors errors) {
        RelatoriosForm relForm = (RelatoriosForm) form;
        Connection conn = null;
        try {
            NotaBimestreForm notaBimestreForm = new NotaBimestreForm();
            conn = connectionPool.getConnection();
            //obter lista de alunos por serie/ano
            String idSerieAno = request.getParameter("idSerieAno");
            notaBimestreForm.setIdSerieAno(Integer.parseInt(idSerieAno));
            AlunoForm alunoForm = new AlunoForm();
            List<AlunoForm> listaAlunos = alunoForm.obterAlunosPorSerie(conn, idSerieAno);
            request.setAttribute("listaAlunos", listaAlunos);
            relForm.setNotaBimestreForm(notaBimestreForm);
            relForm.setAlunoForm(alunoForm);
            request.setAttribute("RelatoriosForm", relForm);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }

    }

    private void relNotasPorAluno(ActionForm form, HttpServletRequest request, Errors errors) {
        NotaBimestreForm notaBimestreForm = new NotaBimestreForm();
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();
            
            //obter notas por ID do aluno
             String idAluno = request.getParameter("idAluno");
             List<NotaBimestreForm> listaNotas = NotaBimestreDao.getInstance().obterNotasPorAluno(conn, Integer.parseInt(idAluno));

             request.setAttribute("listaNotas", listaNotas);
             request.setAttribute("NotaBimestreForm", notaBimestreForm);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

}
