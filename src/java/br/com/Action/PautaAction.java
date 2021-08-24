/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.Action;

import static br.com.Action.IDRAction.connectionPool;
import br.com.Dao.PautaDao;
import br.com.Form.AlunoForm;
import br.com.Form.PautaForm;
import br.com.Form.PautaObsPerfilAlunoForm;
import br.com.Util.Utilitario;
import java.sql.Connection;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import br.com.abre.Util.Errors;

/**
 *
 * @author macuser
 */
public class PautaAction extends IDRAction {

    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response, Errors errors, String action) {
        String forward = action;
        if (action.equals("pagePerfilAluno")) {
            this.pagePerfilAluno(form, request, errors);
        } else if (action.equals("carregarAlunosPorSerie")) {
            this.carregarAlunosPorSerie(form, request, errors);
        } else if (action.equals("salvarPerfilAluno")) {
            this.salvarPerfilAluno(form, request, errors);
        } else if (action.equals("excluirPerfilAluno")) {
            this.excluirPerfilAluno(form, request, errors);
        } else if (action.equals("visualizarPerfilAluno")) {
            this.visualizarPerfilAluno(form, request, errors);
        } else if (action.equals("atualizarPerfilAluno")) {
            this.atualizarPerfilAluno(form, request, errors);
        } else if (action.equals("pageCriarPautaBimestre")) {
            this.pageCriarPautaBimestre(form, request, errors);
        } else if (action.equals("salvarPautaBimestre")) {
            this.salvarPautaBimestre(form, request, errors);
        } else if (action.equals("excluirPautaBimestre")) {
            this.excluirPautaBimestre(form, request, errors);
        } else if (action.equals("editarPautaBimestre")) {
            this.editarPautaBimestre(form, request, errors);
        } else if (action.equals("atualizarPautaBimestre")) {
            this.atualizarPautaBimestre(form, request, errors);
        } else if (action.equals("pagePautaAlunoBimestre")) {
            this.pagePautaAlunoBimestre(form, request, errors);
        } else if (action.equals("carregarAlunosPorSeriePauta")) {
            this.carregarAlunosPorSeriePauta(form, request, errors);
        } else if (action.equals("montarPautaAluno")) {
            this.montarPautaAluno(form, request, errors);
        } else if (action.equals("salvarPautaAluno")) {
            this.salvarPautaAluno(form, request, errors);
        } else if (action.equals("excluirPautaCadastrada")) {
            this.excluirPautaCadastrada(form, request, errors);
        } else if (action.equals("visualizarPautaCadastrada")) {
            this.visualizarPautaCadastrada(form, request, errors);
        }

        return mapping.findForward(forward);
    }

    private void pagePerfilAluno(ActionForm form, HttpServletRequest request, Errors errors) {
        PautaForm pautaForm = new PautaForm();
        HttpSession session = request.getSession(true);
        session.removeAttribute("listaAlunos");
        session.removeAttribute("listaAlunosJaCadastrado");
        request.setAttribute("PautaForm", pautaForm);
    }

    private void carregarAlunosPorSerie(ActionForm form, HttpServletRequest request, Errors errors) {
        PautaForm pautaForm = (PautaForm) form;
        Connection conn = null;
        HttpSession session = request.getSession(true);
        try {
            conn = connectionPool.getConnection();
            String idSerieAno = request.getParameter("idSerieAno");
            pautaForm.setIdSerieAno(Integer.parseInt(idSerieAno));

            Integer idProfessorSession = (Integer) session.getAttribute("idPF");
            int ano = Utilitario.obterAnoVigente(conn);

            pautaForm.setIdProfessor(idProfessorSession);
            pautaForm.setAno(ano);

            //carregar lista de alunos por serie/bimestre que ainda nao tiveram perfil cadastrada por professor
//            List<AlunoForm> listaAlunos = PautaDao.getInstance().obterAlunosSemPerfilCadastrado(conn, pautaForm);
            AlunoForm alunoForm = new AlunoForm();
            List<AlunoForm> listaAlunos = alunoForm.obterAlunosPorSerie(conn, idSerieAno);
            session.setAttribute("listaAlunos", listaAlunos);

            //carregar lista de alunos por serie/bimestre que ja tiver perfil cadastrado por professor
            List<PautaForm> listaAlunosJaCadastrado = PautaDao.getInstance().obterAlunosComPerfilCadastrado(conn, pautaForm);
            session.setAttribute("listaAlunosJaCadastrado", listaAlunosJaCadastrado);

            request.setAttribute("PautaForm", pautaForm);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private void salvarPerfilAluno(ActionForm form, HttpServletRequest request, Errors errors) {
        PautaForm pautaForm = (PautaForm) form;
        Connection conn = null;
        HttpSession session = request.getSession(true);
        try {
            conn = connectionPool.getConnection();

            Integer idProfessorSession = (Integer) session.getAttribute("idPF");
            int ano = Utilitario.obterAnoVigente(conn);

            pautaForm.setIdProfessor(idProfessorSession);
            pautaForm.setAno(ano);
            //salvar na tabela pauta_obs_aluno
            PautaDao.getInstance().salvarPerfilAluno(conn, pautaForm);

            this.carregarAlunosPorSerie(form, request, errors);
            request.setAttribute("PautaForm", pautaForm);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private void excluirPerfilAluno(ActionForm form, HttpServletRequest request, Errors errors) {
        PautaForm pautaForm = (PautaForm) form;
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            PautaDao.getInstance().excluirPerfilAluno(conn, pautaForm.getIdPautaObsAluno());
            errors.error("Dado Excluído com Sucesso!!");

            this.carregarAlunosPorSerie(form, request, errors);
            request.setAttribute("PautaForm", pautaForm);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private void visualizarPerfilAluno(ActionForm form, HttpServletRequest request, Errors errors) {
        PautaForm pautaForm = (PautaForm) form;
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            pautaForm = PautaDao.getInstance().obterDadosPerfilAluno(conn, pautaForm.getIdPautaObsAluno());

            request.setAttribute("PautaForm", pautaForm);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private void atualizarPerfilAluno(ActionForm form, HttpServletRequest request, Errors errors) {
        PautaForm pautaForm = (PautaForm) form;
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            PautaDao.getInstance().atualizarPerfilAluno(conn, pautaForm);

            errors.error("Dados atualizados com Sucesso!!");
            pautaForm = PautaDao.getInstance().obterDadosPerfilAluno(conn, pautaForm.getIdPautaObsAluno());

            request.setAttribute("PautaForm", pautaForm);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private void pageCriarPautaBimestre(ActionForm form, HttpServletRequest request, Errors errors) {
        PautaForm pautaForm = new PautaForm();
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            int ano = Utilitario.obterAnoVigente(conn);
            pautaForm.setAno(ano);

            //carregar as pautas criadas por bimestre e ano
            List<PautaForm> listaPautasBimestre = PautaDao.getInstance().obterPautasBimestrePorAno(conn, pautaForm.getAno());
            request.setAttribute("listaPautasBimestre", listaPautasBimestre);

            request.setAttribute("PautaForm", pautaForm);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private void salvarPautaBimestre(ActionForm form, HttpServletRequest request, Errors errors) {
        PautaForm pautaForm = (PautaForm) form;
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            int ano = Utilitario.obterAnoVigente(conn);
            pautaForm.setAno(ano);

            //verificar se ja existe pauta cadastrada para o bimestre e o ano
            boolean isExistePauta = PautaDao.getInstance().isExistePautaBimestre(conn, pautaForm.getNrBimestre(), pautaForm.getAno());
            if (!isExistePauta) {
                PautaDao.getInstance().salvarPautaBimestre(conn, pautaForm);
                errors.error("Pauta Cadastrada com Sucesso!!");
                this.pageCriarPautaBimestre(form, request, errors);
            } else {
                errors.error("Já existe Pauta Cadastrada para esse Bimestre!!");
            }

            request.setAttribute("PautaForm", pautaForm);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private void excluirPautaBimestre(ActionForm form, HttpServletRequest request, Errors errors) {
        PautaForm pautaForm = (PautaForm) form;
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            //excluir pauta_bimestre
            PautaDao.getInstance().excluirPautaBimestre(conn, pautaForm.getIdPauta());
            this.pageCriarPautaBimestre(form, request, errors);

            request.setAttribute("PautaForm", pautaForm);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private void editarPautaBimestre(ActionForm form, HttpServletRequest request, Errors errors) {
        PautaForm pautaForm = (PautaForm) form;
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            //excluir pauta_bimestre
            pautaForm = PautaDao.getInstance().obterPautaBimestrePorID(conn, pautaForm.getIdPauta());

            request.setAttribute("PautaForm", pautaForm);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private void atualizarPautaBimestre(ActionForm form, HttpServletRequest request, Errors errors) {
        PautaForm pautaForm = (PautaForm) form;
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            //atualizar pauta_bimestre
            PautaDao.getInstance().atualizarPautaBimestre(conn, pautaForm);
            errors.error("Pauta Atualizada com Sucesso!!");

            request.setAttribute("PautaForm", pautaForm);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private void pagePautaAlunoBimestre(ActionForm form, HttpServletRequest request, Errors errors) {
        PautaForm pautaForm = new PautaForm();
        HttpSession session = request.getSession(true);
        session.removeAttribute("listaAlunos");
        session.removeAttribute("listaAlunosJaCadastrado");
        session.removeAttribute("listaPautaJaCadastrada");
        request.setAttribute("PautaForm", pautaForm);
    }

    private void carregarAlunosPorSeriePauta(ActionForm form, HttpServletRequest request, Errors errors) {
        PautaForm pautaForm = (PautaForm) form;
        Connection conn = null;
        HttpSession session = request.getSession(true);
        try {
            conn = connectionPool.getConnection();
            String idSerieAno = request.getParameter("idSerieAno");
            pautaForm.setIdSerieAno(Integer.parseInt(idSerieAno));

            Integer idProfessorSession = (Integer) session.getAttribute("idPF");
            int ano = Utilitario.obterAnoVigente(conn);

            pautaForm.setIdProfessor(idProfessorSession);
            pautaForm.setAno(ano);

            //carregar pautas cadastradas por bimestre
            List<PautaForm> listaPautasCadastradas = PautaDao.getInstance().obterPautasAlunoCadastrada(conn, idSerieAno, pautaForm.getNrBimestre(), ano);
            request.setAttribute("listaPautasCadastradas", listaPautasCadastradas);

            //carregar lista de alunos por serie/bimestre que ainda nao tiveram perfil cadastrada por professor
            AlunoForm alunoForm = new AlunoForm();
            List<AlunoForm> listaAlunos = alunoForm.obterAlunosPorSerie(conn, idSerieAno);
            session.setAttribute("listaAlunos", listaAlunos);

            request.setAttribute("PautaForm", pautaForm);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private void montarPautaAluno(ActionForm form, HttpServletRequest request, Errors errors) {
        PautaForm pautaForm = (PautaForm) form;
        Connection conn = null;
        HttpSession session = request.getSession(true);
        try {
            conn = connectionPool.getConnection();

            int idAluno = Integer.parseInt(request.getParameter("idAluno"));
            int idSerieAno = Integer.parseInt(request.getParameter("idSerieAno"));
            String dsSerieAno = Utilitario.obterDescricaoSerieAno(idSerieAno);

            //obter dados da pauta por bimestre
            int ano = Utilitario.obterAnoVigente(conn);
            pautaForm = PautaDao.getInstance().obterPautaPorBimestre(conn, pautaForm.getNrBimestre(), ano);

            //obter dados da pauta_obs_aluno por bimestre, ano e mostrar o professor
            List<PautaObsPerfilAlunoForm> listaObsPerfil = PautaDao.getInstance().listaObsPorProfessor(conn, pautaForm.getNrBimestre(), ano, idAluno, idSerieAno);
            request.setAttribute("listaObsPerfil", listaObsPerfil);

            pautaForm.setDsSerieAno(dsSerieAno);

            Integer idProfessorSession = (Integer) session.getAttribute("idPF");
            pautaForm.setIdProfessor(idProfessorSession);

            //obter dados do estudante
            AlunoForm alunoForm = new AlunoForm();
            alunoForm = alunoForm.obterDadosAlunoPorID(conn, String.valueOf(idAluno));
            pautaForm.setIdAluno(idAluno);
            pautaForm.setIdSerieAno(idSerieAno);
            pautaForm.setNomeAluno(alunoForm.getNome());
            pautaForm.setNomeMaeAluno(alunoForm.getNomeMae());
            pautaForm.setNomePaiAluno(alunoForm.getNomePai());

            request.setAttribute("PautaForm", pautaForm);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private void salvarPautaAluno(ActionForm form, HttpServletRequest request, Errors errors) {
        PautaForm pautaForm = (PautaForm) form;
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            //verificar se ja existe cadastrado pauta por aluno, bimestre e ano
            boolean isExistePautaAlunoBimestreAno = PautaDao.getInstance().isExistePautaAlunoBimestreAno(conn, pautaForm);
            if (isExistePautaAlunoBimestreAno) {
                errors.error("Já existe Pauta Cadastrada para esse Aluno nesse bimestre e ano!!");
            } else {
                //salvar os dados da pauta
                PautaDao.getInstance().salvarPautaAlunoBimestre(conn, pautaForm);
                errors.error("Salvo com sucesso!!");
            }
            this.montarPautaAluno(form, request, errors);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private void excluirPautaCadastrada(ActionForm form, HttpServletRequest request, Errors errors) {
        PautaForm pautaForm = (PautaForm) form;
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            //excluir pauta_bimestre
            PautaDao.getInstance().excluirPautaBimestreAluno(conn, pautaForm.getIdPauta());
            this.pagePautaAlunoBimestre(form, request, errors);
            pautaForm.setNrBimestre(0);

            request.setAttribute("PautaForm", pautaForm);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private void visualizarPautaCadastrada(ActionForm form, HttpServletRequest request, Errors errors) {
        PautaForm pautaForm = (PautaForm) form;
        Connection conn = null;
        HttpSession session = request.getSession(true);
        try {
            conn = connectionPool.getConnection();

            //obter dados da pauta_bimestre_aluno
            PautaForm dadosPauta = PautaDao.getInstance().obterDadosPautaCadastrada(conn, pautaForm.getIdPauta());

            int idAluno = dadosPauta.getIdAluno();
            int idSerieAno = dadosPauta.getIdSerieAno();
            String dsSerieAno = Utilitario.obterDescricaoSerieAno(idSerieAno);

            //obter dados da pauta por bimestre
            int ano = Utilitario.obterAnoVigente(conn);
            pautaForm = PautaDao.getInstance().obterPautaPorBimestre(conn, pautaForm.getNrBimestre(), ano);

            //obter dados da pauta_obs_aluno por bimestre, ano e mostrar o professor
            List<PautaObsPerfilAlunoForm> listaObsPerfil = PautaDao.getInstance().listaObsPorProfessor(conn, pautaForm.getNrBimestre(), ano, idAluno, idSerieAno);
            request.setAttribute("listaObsPerfil", listaObsPerfil);

            pautaForm.setDsSerieAno(dsSerieAno);

            //obter dados do estudante
            AlunoForm alunoForm = new AlunoForm();
            alunoForm = alunoForm.obterDadosAlunoPorID(conn, String.valueOf(idAluno));
            pautaForm.setIdAluno(idAluno);
            pautaForm.setIdSerieAno(idSerieAno);
            pautaForm.setNomeAluno(alunoForm.getNome());
            pautaForm.setNomeMaeAluno(alunoForm.getNomeMae());
            pautaForm.setNomePaiAluno(alunoForm.getNomePai());
            pautaForm.setEspacoSugestao(dadosPauta.getEspacoSugestao());

            request.setAttribute("PautaForm", pautaForm);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

}
