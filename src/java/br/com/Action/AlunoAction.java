/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.Action;

import br.com.Dao.HistoricoDao;
import br.com.Form.AlunoForm;
import br.com.Form.PessoaFisicaForm;
import br.com.Util.EnvioEmail;
import br.com.Util.GeradorSenha;
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
public class AlunoAction extends IDRAction {

    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response, Errors errors, String action) {
        String forward = action;
        if (action.equals("pageCadastrar")) {
            this.pageCadastrar(form, request, errors);
        } else if (action.equals("cadastrar")) {
            this.cadastrar(form, request, errors);
        } else if (action.equals("pageConsultar")) {
            this.pageCadastrar(form, request, errors);
        } else if (action.equals("consultar")) {
            this.consultar(form, request, errors);
        } else if (action.equals("pageAtualizar")) {
            this.pageAtualizar(form, request, errors);
        } else if (action.equals("atualizar")) {
            this.atualizar(form, request, errors);
        } else if (action.equals("pageHistoricoAluno")) {
            this.pageHistoricoAluno(form, request, errors);
        } else if (action.equals("salvarHistoricoAluno")) {
            this.salvarHistoricoAluno(form, request, errors);
        } else if (action.equals("excluirHistoricoAluno")) {
            this.excluirHistoricoAluno(form, request, errors);
        }

        return mapping.findForward(forward);
    }

    private void pageCadastrar(ActionForm form, HttpServletRequest request, Errors errors) {
        AlunoForm alunoForm = new AlunoForm();
        request.setAttribute("AlunoForm", alunoForm);
    }

    private void cadastrar(ActionForm form, HttpServletRequest request, Errors errors) {
        AlunoForm alunoForm = (AlunoForm) form;
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            //verificar se o estudante ja se encontra cadastrado
            PessoaFisicaForm pfForm = new PessoaFisicaForm();
            boolean isExisteAluno = pfForm.verificarEmailPessoaFisicaCadastrado(conn, alunoForm.getEmail());
//            boolean isExisteAluno = pfForm.verificarNomePessoaFisicaCadastrado(conn, alunoForm.getNome());
            if (isExisteAluno) {
                errors.error("Esse E-MAIL já se encontra cadastrado na base de dados!! Favor verificar");
            } else {
                GeradorSenha geradorSenha = new GeradorSenha();
                String senha = geradorSenha.gerarSenha(5);
                alunoForm.setPassword(senha);
                //cadastrar na base de dados nas tabelas pessoa_fisica
                alunoForm.setStatus(1);
                alunoForm.setTipoPerfil("aluno");
                int idWpUser = pfForm.inserirWpUsers(conn, alunoForm);
                if (idWpUser != 0) {
                    //cadastrar na tabela pessoa fisica
                    int idPessoaFisica = pfForm.inserirPessoaFisica(conn, alunoForm, idWpUser);
                    //cadastrar na tabela alunos com o idPessoaFisica
                    alunoForm.inserirAluno(conn, alunoForm, idPessoaFisica);

                    //salvar no historico_cadastro_aluno
                    HttpSession session = request.getSession(true);
                    try {
                        Integer idProfessorSession = (Integer) session.getAttribute("idPF");
                        String nomeProfessorSession = (String) session.getAttribute("nome");
                        String descricaoHistorico = "Cadastro do aluno realizado";
                        HistoricoDao.getInstance().salvarHistoricoCadastroAluno(conn, idPessoaFisica, idProfessorSession, nomeProfessorSession, descricaoHistorico);
                    } catch (Exception ex) {
                        ex.printStackTrace();
                    }

                }

                //se o email ja se encontra cadastrado uma vez para outro aluno, ele nao irá enviar novamente a senha
//                boolean isExisteEmailCadastrado = pfForm.verificarEmailPessoaFisicaCadastrado(conn, alunoForm.getEmail());
//                if (!isExisteEmailCadastrado) {
                //enviar email com a senha gerada
                try {
                    StringBuilder sb = new StringBuilder();

                    sb.append("Olá ").append(alunoForm.getNome());
                    sb.append("<br/><br/>");
                    sb.append("<b>Seja bem vindo ao Portal NIKKEN</b>");
                    sb.append("<br/>");
                    sb.append("Nessa área você poderá acessar para consultar o boletim e receber alguns comunicados. ");
                    sb.append("<br/>");
                    sb.append("Segue os dados de acesso: ");
                    sb.append("<br/><br/>");
                    sb.append("Site: www.escolanikken.com");
                    sb.append("<br/>");
                    sb.append("Login: ").append(alunoForm.getEmail());
                    sb.append("<br/>");
                    sb.append("Senha: ").append(senha);
                    sb.append("<br/>");
                    sb.append("<br/>");
                    sb.append("Atenciosamente,");
                    sb.append("<br/>");
                    sb.append("Escola Nikken");

                    EnvioEmail envio = new EnvioEmail();
//                    envio.enviarEmail("kelvin@mitsistemas.com.br", sb.toString(), "Dados de Acesso ao Portal Nikken");
                        envio.enviarEmail(alunoForm.getEmail(), sb.toString(), "Dados de Acesso ao Portal Nikken");
                } catch (Exception e) {
                    e.printStackTrace();
                }
//                }
                errors.error("Cadastro do Aluno Realizado com Sucesso!");
                request.setAttribute("cadastro", "true");
                alunoForm = new AlunoForm();
                request.setAttribute("AlunoForm", alunoForm);

            }
        } catch (Exception e) {
            e.printStackTrace();
            errors.error("Erro no Cadastro. Favor verificar!");
            request.setAttribute("cadastro", "false");
        } finally {
            connectionPool.free(conn);
        }
    }

    private void consultar(ActionForm form, HttpServletRequest request, Errors errors) {
        AlunoForm alunoForm = (AlunoForm) form;
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            ArrayList<AlunoForm> listaAlunos = alunoForm.obterListaAlunos(conn, alunoForm);
            if (listaAlunos.size() > 0) {
                request.setAttribute("listaAlunos", listaAlunos);
            }
//            alunoForm = new AlunoForm();
            request.setAttribute("AlunoForm", alunoForm);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private void pageAtualizar(ActionForm form, HttpServletRequest request, Errors errors) {
        AlunoForm alunoForm = new AlunoForm();
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            String idPf = request.getParameter("idPF");

            AlunoForm dadosAluno = alunoForm.obterDadosAlunoPorID(conn, idPf);

            request.setAttribute("AlunoForm", dadosAluno);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private void atualizar(ActionForm form, HttpServletRequest request, Errors errors) {
        AlunoForm alunoForm = (AlunoForm) form;
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            //atualizar dados pessoa_fisica
            PessoaFisicaForm pfForm = new PessoaFisicaForm();
            alunoForm.setTipoPerfil("aluno");
            pfForm.atualizarPessoaFisica(conn, alunoForm);

            //atualizar dados do aluno
            alunoForm.atualizarDadosAluno(conn, alunoForm);

            errors.error("Atualização realizada com Sucesso!");
            request.setAttribute("atualizar", "true");
            request.setAttribute("AlunoForm", alunoForm);

            //salvar no historico_cadastro_aluno
            HttpSession session = request.getSession(true);
            try {
                Integer idProfessorSession = (Integer) session.getAttribute("idPF");
                String nomeProfessorSession = (String) session.getAttribute("nome");
                String descricaoHistorico = "Alteração no Cadastro do aluno";
                HistoricoDao.getInstance().salvarHistoricoCadastroAluno(conn, alunoForm.getIdPF(), idProfessorSession, nomeProfessorSession, descricaoHistorico);
            } catch (Exception ex) {
                ex.printStackTrace();
            }

        } catch (Exception e) {
            errors.error("Erro na Atualização. Favor verificar!");
            request.setAttribute("atualizar", "false");
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private void pageHistoricoAluno(ActionForm form, HttpServletRequest request, Errors errors) {
        AlunoForm alunoForm = new AlunoForm();
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();
            String idPf = request.getParameter("idPF");
            AlunoForm dadosAluno = alunoForm.obterDadosAlunoPorID(conn, idPf);

            //obter lista de professores
            PessoaFisicaForm professorForm = new PessoaFisicaForm();
            professorForm.setStatus(1);
            PessoaFisicaForm[] listaProfessor = professorForm.obterListaTodosProfessores(conn, professorForm);
            if (listaProfessor.length > 0) {
                request.setAttribute("listaProfessor", listaProfessor);
            }

            //obter historico do aluno
            List<AlunoForm> listaHistoricoAluno = alunoForm.obterListaHistoricoAluno(conn, dadosAluno.getIdPF());
            if (listaHistoricoAluno.size() > 0) {
                request.setAttribute("listaHistoricoAluno", listaHistoricoAluno);
            }

            request.setAttribute("AlunoForm", dadosAluno);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private void salvarHistoricoAluno(ActionForm form, HttpServletRequest request, Errors errors) {
        AlunoForm alunoForm = (AlunoForm) form;
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            //salvar na tabela alunos_historico
            alunoForm.salvarHistoricoAluno(conn, alunoForm);

            this.pageHistoricoAluno(alunoForm, request, errors);

            alunoForm = new AlunoForm();

            errors.error("Atualização realizada com Sucesso!");
            request.setAttribute("atualizar", "true");
            request.setAttribute("AlunoForm", alunoForm);
        } catch (Exception e) {
            errors.error("Erro na Atualização. Favor verificar!");
            request.setAttribute("atualizar", "false");
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private void excluirHistoricoAluno(ActionForm form, HttpServletRequest request, Errors errors) {
        AlunoForm alunoForm = (AlunoForm) form;
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            //excluir na tabela alunos_historico
            alunoForm.excluirHistoricoAluno(conn, alunoForm);

            this.pageHistoricoAluno(alunoForm, request, errors);

            request.setAttribute("AlunoForm", alunoForm);
        } catch (Exception e) {
            errors.error("Erro na Atualização. Favor verificar!");
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

}
