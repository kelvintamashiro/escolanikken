/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.Action;

import br.com.Form.AlunoForm;
import br.com.Form.PessoaFisicaForm;
import br.com.Form.RematriculaForm;
import br.com.Util.Utilitario;
import br.com.abre.Util.Errors;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Connection;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileUpload;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.upload.FormFile;

/**
 *
 * @author macuser
 */
public class RematriculaAction extends IDRAction {

    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response, Errors errors, String action) {
        String forward = action;
        if (action.equals("page")) {
            return page(mapping, form, request, errors);
        } else if (action.equals("atualizarInformacoes")) {
            this.atualizarInformacoes(form, request, errors);
        } else if (action.equals("pageDocZairyu")) {
            return pageDocZairyu(mapping, form, request, errors);
        } else if (action.equals("pageDocZairyuEscola")) {
            this.pageDocZairyuEscola(form, request, errors);
        } else if (action.equals("salvarDocZairyu") || action.equals("salvarDocMyNumber") || action.equals("salvarDocPassaporte") || action.equals("salvarDocumentosEscolares")) {
            this.salvarDocumentosAluno(form, request, errors);
        } else if (action.equals("excluirDocZairyu") || action.equals("excluirDocMyNumber") || action.equals("excluirDocPassaporte") || action.equals("excluirDocumentosEscolares")) {
            this.excluirDocumentoAluno(form, request, errors);
        } else if (action.equals("pageDocMyNumber")) {
            return pageDocMyNumber(mapping, form, request, errors);
        } else if (action.equals("pageDocPassaporte")) {
            return pageDocPassaporte(mapping, form, request, errors);
        } else if (action.equals("pageDocumentosEscolares")) {
            return pageDocumentosEscolares(mapping, form, request, errors);
        }

        return mapping.findForward(forward);
    }

    private ActionForward page(ActionMapping mapping, ActionForm form, HttpServletRequest request, Errors errors) {
        RematriculaForm rematriculaForm = new RematriculaForm();
        String strForward = "";
        HttpSession session = request.getSession();
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();
            String idPf = request.getParameter("idPF");
            Integer idAluno = null;
            if (idPf != null && !idPf.equals("")) {
                idAluno = Integer.parseInt(idPf);
            }

            //verificar se o ID é o mesmo que esta na sessao
            Object idPfSession = session.getAttribute("idPF");
            if (idAluno != idPfSession) {
                //erro, deve redirecionar para fora
                strForward = "fwrError";

            } else {
                strForward = "page";

                //carregar dados do aluno por ID
                AlunoForm alunoForm = new AlunoForm();
                alunoForm = alunoForm.obterDadosAlunoPorID(conn, idPf);

                rematriculaForm.setAlunoForm(alunoForm);
                request.setAttribute("RematriculaForm", rematriculaForm);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
        return mapping.findForward(strForward);
    }

    private void atualizarInformacoes(ActionForm form, HttpServletRequest request, Errors errors) {
        RematriculaForm rematriculaForm = (RematriculaForm) form;
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            AlunoForm alunoForm = new AlunoForm();
            alunoForm.setIdAluno(Integer.parseInt(request.getParameter("idPF")));
            alunoForm.setIdPF(Integer.parseInt(request.getParameter("idPF")));
            alunoForm.setNome(request.getParameter("nome"));
            alunoForm.setSexo(request.getParameter("sexo"));
            alunoForm.setDataNascimento(request.getParameter("dataNascimento"));
            alunoForm.setCelularAluno(request.getParameter("celularAluno"));
            alunoForm.setNaturalidade(request.getParameter("naturalidade"));
            alunoForm.setNacionalidade(request.getParameter("nacionalidade"));
            alunoForm.setAutorizacaoImagem(request.getParameter("autorizacaoImagem"));
            alunoForm.setDsEndereco(request.getParameter("dsEndereco"));
            alunoForm.setProvincia(request.getParameter("provincia"));
            alunoForm.setCidade(request.getParameter("cidade"));
            alunoForm.setNomeMae(request.getParameter("nomeMae"));
            alunoForm.setEmailMae(request.getParameter("emailMae"));
            alunoForm.setCelularMae(request.getParameter("celularMae"));
            alunoForm.setNomePai(request.getParameter("nomePai"));
            alunoForm.setEmailPai(request.getParameter("emailPai"));
            alunoForm.setCelularPai(request.getParameter("celularPai"));
            alunoForm.setContatoEmergencia(request.getParameter("contatoEmergencia"));
            alunoForm.setTelefoneContato(request.getParameter("telefoneContato"));
            alunoForm.setRestricaoAlimentar(request.getParameter("restricaoAlimentar"));
            alunoForm.setObservacaoSaude(request.getParameter("observacaoSaude"));
            alunoForm.setTipoAlimentacao(request.getParameter("tipoAlimentacao"));
            alunoForm.setLinhaTransporte(request.getParameter("linhaTransporte"));
            alunoForm.setObservacao(request.getParameter("observacao"));

            rematriculaForm.setAlunoForm(alunoForm);

            //atualizar informacoes do aluno
            //atualizar dados pessoa_fisica
            PessoaFisicaForm pfForm = new PessoaFisicaForm();
            alunoForm.setTipoPerfil("aluno");
            alunoForm.setStatus(1);
            pfForm.atualizarPessoaFisica(conn, alunoForm);

            alunoForm.atualizarDadosAlunoRematricula(conn, alunoForm);

            errors.error("Atualização realizada com Sucesso!");

            request.setAttribute("RematriculaForm", rematriculaForm);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private ActionForward pageDocZairyu(ActionMapping mapping, ActionForm form, HttpServletRequest request, Errors errors) {
        RematriculaForm rematriculaForm = new RematriculaForm();
        String strForward = "";
        HttpSession session = request.getSession();
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();
            String idPf = request.getParameter("idPF");
            Integer idAluno = null;
            if (idPf != null && !idPf.equals("")) {
                idAluno = Integer.parseInt(idPf);
            }
            //verificar se o ID é o mesmo que esta na sessao
            Object idPfSession = session.getAttribute("idPF");
            if (idAluno != idPfSession) {
                //erro, deve redirecionar para fora
                strForward = "fwrError";

            } else {
                strForward = "pageDocZairyu";

                //carregar dados do aluno por ID
                rematriculaForm = rematriculaForm.obterDocumentosAluno(conn, idPf);
                AlunoForm alunoForm = new AlunoForm();
                alunoForm = alunoForm.obterDadosAlunoPorID(conn, idPf);
                rematriculaForm.setAlunoForm(alunoForm);
                request.setAttribute("RematriculaForm", rematriculaForm);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
        return mapping.findForward(strForward);
    }

    private void pageDocZairyuEscola(ActionForm form, HttpServletRequest request, Errors errors) {
        RematriculaForm rematriculaForm = new RematriculaForm();
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();
            String idPf = request.getParameter("idPF");

            //carregar dados do aluno por ID
            rematriculaForm = rematriculaForm.obterDocumentosAluno(conn, idPf);
            AlunoForm alunoForm = new AlunoForm();
            alunoForm = alunoForm.obterDadosAlunoPorID(conn, idPf);
            rematriculaForm.setAlunoForm(alunoForm);
            request.setAttribute("RematriculaForm", rematriculaForm);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private ActionForward pageDocMyNumber(ActionMapping mapping, ActionForm form, HttpServletRequest request, Errors errors) {
        RematriculaForm rematriculaForm = new RematriculaForm();
        String strForward = "";
        HttpSession session = request.getSession();
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();
            String idPf = request.getParameter("idPF");
            Integer idAluno = null;
            if (idPf != null && !idPf.equals("")) {
                idAluno = Integer.parseInt(idPf);
            }
            //verificar se o ID é o mesmo que esta na sessao
            Object idPfSession = session.getAttribute("idPF");
            if (idAluno != idPfSession) {
                //erro, deve redirecionar para fora
                strForward = "fwrError";

            } else {
                strForward = "pageDocMyNumber";

                //carregar dados do aluno por ID
                rematriculaForm = rematriculaForm.obterDocumentosAluno(conn, idPf);
                AlunoForm alunoForm = new AlunoForm();
                alunoForm = alunoForm.obterDadosAlunoPorID(conn, idPf);
                rematriculaForm.setAlunoForm(alunoForm);
                request.setAttribute("RematriculaForm", rematriculaForm);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
        return mapping.findForward(strForward);
    }

    private ActionForward pageDocPassaporte(ActionMapping mapping, ActionForm form, HttpServletRequest request, Errors errors) {
        RematriculaForm rematriculaForm = new RematriculaForm();
        String strForward = "";
        HttpSession session = request.getSession();
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();
            String idPf = request.getParameter("idPF");
            Integer idAluno = null;
            if (idPf != null && !idPf.equals("")) {
                idAluno = Integer.parseInt(idPf);
            }
            //verificar se o ID é o mesmo que esta na sessao
            Object idPfSession = session.getAttribute("idPF");
            if (idAluno != idPfSession) {
                //erro, deve redirecionar para fora
                strForward = "fwrError";

            } else {
                strForward = "pageDocPassaporte";

                //carregar dados do aluno por ID
                rematriculaForm = rematriculaForm.obterDocumentosAluno(conn, idPf);
                AlunoForm alunoForm = new AlunoForm();
                alunoForm = alunoForm.obterDadosAlunoPorID(conn, idPf);
                rematriculaForm.setAlunoForm(alunoForm);
                request.setAttribute("RematriculaForm", rematriculaForm);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
        return mapping.findForward(strForward);
    }

    private ActionForward pageDocumentosEscolares(ActionMapping mapping, ActionForm form, HttpServletRequest request, Errors errors) {
        RematriculaForm rematriculaForm = new RematriculaForm();
        String strForward = "";
        HttpSession session = request.getSession();
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();
            String idPf = request.getParameter("idPF");
            Integer idAluno = null;
            if (idPf != null && !idPf.equals("")) {
                idAluno = Integer.parseInt(idPf);
            }

            //verificar se o ID é o mesmo que esta na sessao
            Object idPfSession = session.getAttribute("idPF");
            if (idAluno != idPfSession) {
                //erro, deve redirecionar para fora
                strForward = "fwrError";

            } else {
                strForward = "pageDocumentosEscolares";

                //carregar dados do aluno por ID
                rematriculaForm = rematriculaForm.obterDocumentosAluno(conn, idPf);
                AlunoForm alunoForm = new AlunoForm();
                alunoForm = alunoForm.obterDadosAlunoPorID(conn, idPf);
                rematriculaForm.setAlunoForm(alunoForm);
                request.setAttribute("RematriculaForm", rematriculaForm);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
        return mapping.findForward(strForward);
    }

    private void salvarDocumentosAluno(ActionForm form, HttpServletRequest request, Errors errors) {
        Connection conn = null;
        boolean isMultipart = FileUpload.isMultipartContent(request);
        String path = getServlet().getServletContext().getRealPath("/") + "documentos_aluno";
        RematriculaForm rematriculaForm = (RematriculaForm) form;
        String idPf = request.getParameter("idPF");
        try {
            conn = connectionPool.getConnection();
            AlunoForm alunoForm = new AlunoForm();
            alunoForm.setIdAluno(Integer.parseInt(idPf));
            alunoForm.setIdPF(Integer.parseInt(idPf));
            rematriculaForm.setAlunoForm(alunoForm);
            if (isMultipart) {

                File folder = new File(path);
                if (!folder.exists()) {
                    folder.mkdirs();
                }
                String strFileNameZairyuAluno = "";
                String strFileNameZairyuPai = "";
                String strFileNameZairyuMae = "";
                String strFileNameMyNumberAluno = "";
                String strFileNameMyNumberPai = "";
                String strFileNameMyNumberMae = "";
                String strFileNamePassaporteAluno = "";
                String strFileNamePassaportePai = "";
                String strFileNamePassaporteMae = "";
                String strFileNameHistoricoEscolar = "";
                String strFileNameTransferenciaEscolar = "";
                String strFileNameCadernetaBancaria = "";
                String strFileNameFoto3x4 = "";

                //zairyuCardAluno
                if (rematriculaForm.getZairyuCardAluno() != null && !rematriculaForm.getZairyuCardAluno().getFileName().equals("")) {
                    FormFile formFileZairyuAluno = rematriculaForm.getZairyuCardAluno();
                    String nome = formFileZairyuAluno.getFileName();
                    String[] nomeSplit = nome.split("\\.");
                    String tipoFile = nomeSplit[1];
                    strFileNameZairyuAluno = idPf + "_" + "zairyuCardAluno." + tipoFile;
//                    strFileNameZairyuAluno = idPf + "_" + "zairyuCardAluno_" + formFileZairyuAluno.getFileName();

                    System.out.println("caminho: " + path + "; nome: " + strFileNameZairyuAluno);
                    if (!("").equals(strFileNameZairyuAluno)) {
                        File newFile = new File(path, strFileNameZairyuAluno);
                        FileOutputStream fos = new FileOutputStream(newFile);
                        fos.write(formFileZairyuAluno.getFileData());
                        fos.flush();
                        fos.close();
                    }
                }

                //zairyuCardPai
                if (rematriculaForm.getZairyuCardPai() != null && !rematriculaForm.getZairyuCardPai().getFileName().equals("")) {
                    FormFile formFileZairyuPai = rematriculaForm.getZairyuCardPai();
                    String nome = formFileZairyuPai.getFileName();
                    String[] nomeSplit = nome.split("\\.");
                    String tipoFile = nomeSplit[1];
                    strFileNameZairyuPai = idPf + "_" + "zairyuCardPai." + tipoFile;
                    System.out.println("caminho: " + path + "; nome: " + strFileNameZairyuPai);
                    if (!("").equals(strFileNameZairyuPai)) {
                        File newFile = new File(path, strFileNameZairyuPai);
                        FileOutputStream fos = new FileOutputStream(newFile);
                        fos.write(formFileZairyuPai.getFileData());
                        fos.flush();
                        fos.close();
                    }
                }

                //zairyuCardMae
                if (rematriculaForm.getZairyuCardMae() != null && !rematriculaForm.getZairyuCardMae().getFileName().equals("")) {
                    FormFile formFileZairyuMae = rematriculaForm.getZairyuCardMae();
                    String nome = formFileZairyuMae.getFileName();
                    String[] nomeSplit = nome.split("\\.");
                    String tipoFile = nomeSplit[1];
                    strFileNameZairyuMae = idPf + "_" + "zairyuCardMae." + tipoFile;
                    System.out.println("caminho: " + path + "; nome: " + strFileNameZairyuMae);
                    if (!("").equals(strFileNameZairyuMae)) {
                        File newFile = new File(path, strFileNameZairyuMae);
                        FileOutputStream fos = new FileOutputStream(newFile);
                        fos.write(formFileZairyuMae.getFileData());
                        fos.flush();
                        fos.close();
                    }
                }

                //myNumberAluno
                if (rematriculaForm.getMyNumberAluno() != null && !rematriculaForm.getMyNumberAluno().getFileName().equals("")) {
                    FormFile formFileMyNumberAluno = rematriculaForm.getMyNumberAluno();
                    String nome = formFileMyNumberAluno.getFileName();
                    String[] nomeSplit = nome.split("\\.");
                    String tipoFile = nomeSplit[1];
                    strFileNameMyNumberAluno = idPf + "_" + "myNumberAluno." + tipoFile;
                    System.out.println("caminho: " + path + "; nome: " + strFileNameMyNumberAluno);
                    if (!("").equals(strFileNameMyNumberAluno)) {
                        File newFile = new File(path, strFileNameMyNumberAluno);
                        FileOutputStream fos = new FileOutputStream(newFile);
                        fos.write(formFileMyNumberAluno.getFileData());
                        fos.flush();
                        fos.close();
                    }
                }

                //myNumberPai
                if (rematriculaForm.getMyNumberPai() != null && !rematriculaForm.getMyNumberPai().getFileName().equals("")) {
                    FormFile formFileMyNumberPai = rematriculaForm.getMyNumberPai();
                    String nome = formFileMyNumberPai.getFileName();
                    String[] nomeSplit = nome.split("\\.");
                    String tipoFile = nomeSplit[1];
                    strFileNameMyNumberPai = idPf + "_" + "myNumberPai." + tipoFile;
                    System.out.println("caminho: " + path + "; nome: " + strFileNameMyNumberPai);
                    if (!("").equals(strFileNameMyNumberPai)) {
                        File newFile = new File(path, strFileNameMyNumberPai);
                        FileOutputStream fos = new FileOutputStream(newFile);
                        fos.write(formFileMyNumberPai.getFileData());
                        fos.flush();
                        fos.close();
                    }
                }

                //myNumberMae
                if (rematriculaForm.getMyNumberMae() != null && !rematriculaForm.getMyNumberMae().getFileName().equals("")) {
                    FormFile formFileMyNumberMae = rematriculaForm.getMyNumberMae();
                    String nome = formFileMyNumberMae.getFileName();
                    String[] nomeSplit = nome.split("\\.");
                    String tipoFile = nomeSplit[1];
                    strFileNameMyNumberMae = idPf + "_" + "myNumberMae." + tipoFile;
                    System.out.println("caminho: " + path + "; nome: " + strFileNameMyNumberMae);
                    if (!("").equals(strFileNameMyNumberMae)) {
                        File newFile = new File(path, strFileNameMyNumberMae);
                        FileOutputStream fos = new FileOutputStream(newFile);
                        fos.write(formFileMyNumberMae.getFileData());
                        fos.flush();
                        fos.close();
                    }
                }

                //passaporteAluno
                if (rematriculaForm.getPassaporteAluno() != null && !rematriculaForm.getPassaporteAluno().getFileName().equals("")) {
                    FormFile formFilePassaporteAluno = rematriculaForm.getPassaporteAluno();
                    String nome = formFilePassaporteAluno.getFileName();
                    String[] nomeSplit = nome.split("\\.");
                    String tipoFile = nomeSplit[1];
                    strFileNamePassaporteAluno = idPf + "_" + "passaporteAluno." + tipoFile;
                    System.out.println("caminho: " + path + "; nome: " + strFileNamePassaporteAluno);
                    if (!("").equals(strFileNamePassaporteAluno)) {
                        File newFile = new File(path, strFileNamePassaporteAluno);
                        FileOutputStream fos = new FileOutputStream(newFile);
                        fos.write(formFilePassaporteAluno.getFileData());
                        fos.flush();
                        fos.close();
                    }
                }

                //passaportePai
                if (rematriculaForm.getPassaportePai() != null && !rematriculaForm.getPassaportePai().getFileName().equals("")) {
                    FormFile formFilePassaportePai = rematriculaForm.getPassaportePai();
                    String nome = formFilePassaportePai.getFileName();
                    String[] nomeSplit = nome.split("\\.");
                    String tipoFile = nomeSplit[1];
                    strFileNamePassaportePai = idPf + "_" + "passaportePai." + tipoFile;
                    System.out.println("caminho: " + path + "; nome: " + strFileNamePassaportePai);
                    if (!("").equals(strFileNamePassaportePai)) {
                        File newFile = new File(path, strFileNamePassaportePai);
                        FileOutputStream fos = new FileOutputStream(newFile);
                        fos.write(formFilePassaportePai.getFileData());
                        fos.flush();
                        fos.close();
                    }
                }

                //passaporteMae
                if (rematriculaForm.getPassaporteMae() != null && !rematriculaForm.getPassaporteMae().getFileName().equals("")) {
                    FormFile formFilePassaporteMae = rematriculaForm.getPassaporteMae();
                    String nome = formFilePassaporteMae.getFileName();
                    String[] nomeSplit = nome.split("\\.");
                    String tipoFile = nomeSplit[1];
                    strFileNamePassaporteMae = idPf + "_" + "passaporteMae." + tipoFile;
                    System.out.println("caminho: " + path + "; nome: " + strFileNamePassaporteMae);
                    if (!("").equals(strFileNamePassaporteMae)) {
                        File newFile = new File(path, strFileNamePassaporteMae);
                        FileOutputStream fos = new FileOutputStream(newFile);
                        fos.write(formFilePassaporteMae.getFileData());
                        fos.flush();
                        fos.close();
                    }
                }

                //historicoEscolar
                if (rematriculaForm.getHistoricoEscolar() != null && !rematriculaForm.getHistoricoEscolar().getFileName().equals("")) {
                    FormFile formFileHistoricoEscolar = rematriculaForm.getHistoricoEscolar();
                    String nome = formFileHistoricoEscolar.getFileName();
                    String[] nomeSplit = nome.split("\\.");
                    String tipoFile = nomeSplit[1];
                    strFileNameHistoricoEscolar = idPf + "_" + "historicoEscolar." + tipoFile;
                    System.out.println("caminho: " + path + "; nome: " + strFileNameHistoricoEscolar);
                    if (!("").equals(strFileNameHistoricoEscolar)) {
                        File newFile = new File(path, strFileNameHistoricoEscolar);
                        FileOutputStream fos = new FileOutputStream(newFile);
                        fos.write(formFileHistoricoEscolar.getFileData());
                        fos.flush();
                        fos.close();
                    }
                }

                //transferenciaEscolar
                if (rematriculaForm.getTransferenciaEscolar() != null && !rematriculaForm.getTransferenciaEscolar().getFileName().equals("")) {
                    FormFile formFileTransferenciaEscolar = rematriculaForm.getTransferenciaEscolar();
                    String nome = formFileTransferenciaEscolar.getFileName();
                    String[] nomeSplit = nome.split("\\.");
                    String tipoFile = nomeSplit[1];
                    strFileNameTransferenciaEscolar = idPf + "_" + "transferenciaEscolar." + tipoFile;
                    System.out.println("caminho: " + path + "; nome: " + strFileNameTransferenciaEscolar);
                    if (!("").equals(strFileNameTransferenciaEscolar)) {
                        File newFile = new File(path, strFileNameTransferenciaEscolar);
                        FileOutputStream fos = new FileOutputStream(newFile);
                        fos.write(formFileTransferenciaEscolar.getFileData());
                        fos.flush();
                        fos.close();
                    }
                }

                //cadernetaBancaria
                if (rematriculaForm.getCadernetaBancaria() != null && !rematriculaForm.getCadernetaBancaria().getFileName().equals("")) {
                    FormFile formFileCadernetaBancaria = rematriculaForm.getCadernetaBancaria();
                    String nome = formFileCadernetaBancaria.getFileName();
                    String[] nomeSplit = nome.split("\\.");
                    String tipoFile = nomeSplit[1];
                    strFileNameCadernetaBancaria = idPf + "_" + "cadernetaBancaria." + tipoFile;
                    System.out.println("caminho: " + path + "; nome: " + strFileNameCadernetaBancaria);
                    if (!("").equals(strFileNameCadernetaBancaria)) {
                        File newFile = new File(path, strFileNameCadernetaBancaria);
                        FileOutputStream fos = new FileOutputStream(newFile);
                        fos.write(formFileCadernetaBancaria.getFileData());
                        fos.flush();
                        fos.close();
                    }
                }

                //foto3x4
                if (rematriculaForm.getFoto3x4() != null && !rematriculaForm.getFoto3x4().getFileName().equals("")) {
                    FormFile formFileFoto3x4 = rematriculaForm.getFoto3x4();
                    String nome = formFileFoto3x4.getFileName();
                    String[] nomeSplit = nome.split("\\.");
                    String tipoFile = nomeSplit[1];
                    strFileNameFoto3x4 = idPf + "_" + "foto3x4." + tipoFile;
                    System.out.println("caminho: " + path + "; nome: " + strFileNameFoto3x4);
                    if (!("").equals(strFileNameFoto3x4)) {
                        File newFile = new File(path, strFileNameFoto3x4);
                        FileOutputStream fos = new FileOutputStream(newFile);
                        fos.write(formFileFoto3x4.getFileData());
                        fos.flush();
                        fos.close();
                    }
                }

                //incluir ou alterar na tabela documentos_aluno
                rematriculaForm.incluirAlterarDocumentos(conn, idPf, strFileNameZairyuAluno, strFileNameZairyuPai, strFileNameZairyuMae, strFileNameMyNumberAluno,
                        strFileNameMyNumberPai, strFileNameMyNumberMae, strFileNamePassaporteAluno, strFileNamePassaportePai, strFileNamePassaporteMae,
                        strFileNameHistoricoEscolar, strFileNameTransferenciaEscolar, strFileNameCadernetaBancaria, strFileNameFoto3x4);
                request.setAttribute("enviadoSucesso", "true");

            } else {
                errors.error("Ocorreu um erro ao Enviar Imagem!!");
                request.setAttribute("enviadoSucesso", "false");
            }

            //carregar dados do aluno por ID
            rematriculaForm = rematriculaForm.obterDocumentosAluno(conn, idPf);
            alunoForm = alunoForm.obterDadosAlunoPorID(conn, idPf);
            rematriculaForm.setAlunoForm(alunoForm);
            request.setAttribute("RematriculaForm", rematriculaForm);

            errors.error("Envio dos documentos realizado com Sucesso!");

            request.setAttribute("RematriculaForm", rematriculaForm);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("enviadoSucesso", "false");
        } finally {
            connectionPool.free(conn);
        }
    }

    private void excluirDocumentoAluno(ActionForm form, HttpServletRequest request, Errors errors) {
        RematriculaForm rematriculaForm = (RematriculaForm) form;
        Connection conn = null;
        String idPf = request.getParameter("idPF");
        try {
            conn = connectionPool.getConnection();

            String tipoDocumento = request.getParameter("tipoDocumento");
            String idDocumento = request.getParameter("idDocumento");

            //obter nome do arquivo para excluir do servidor
            //excluir documento especifico do aluno
            String nomeArquivoDoc = "";
            switch (tipoDocumento) {
                case "docZairyuCardAluno":
                    nomeArquivoDoc = rematriculaForm.obterNomeDocumentoAluno(conn, idDocumento, "zairyu_card_aluno");
                    this.excluir(conn, idDocumento, nomeArquivoDoc, "zairyu_card_aluno");
                    break;
                case "docZairyuCardPai":
                    nomeArquivoDoc = rematriculaForm.obterNomeDocumentoAluno(conn, idDocumento, "zairyu_card_pai");
                    this.excluir(conn, idDocumento, nomeArquivoDoc, "zairyu_card_pai");
                    break;
                case "docZairyuCardMae":
                    nomeArquivoDoc = rematriculaForm.obterNomeDocumentoAluno(conn, idDocumento, "zairyu_card_mae");
                    this.excluir(conn, idDocumento, nomeArquivoDoc, "zairyu_card_mae");
                    break;
                case "docMyNumberAluno":
                    nomeArquivoDoc = rematriculaForm.obterNomeDocumentoAluno(conn, idDocumento, "my_number_aluno");
                    this.excluir(conn, idDocumento, nomeArquivoDoc, "my_number_aluno");
                    break;
                case "docMyNumberPai":
                    nomeArquivoDoc = rematriculaForm.obterNomeDocumentoAluno(conn, idDocumento, "my_number_pai");
                    this.excluir(conn, idDocumento, nomeArquivoDoc, "my_number_pai");
                    break;
                case "docMyNumberMae":
                    nomeArquivoDoc = rematriculaForm.obterNomeDocumentoAluno(conn, idDocumento, "my_number_mae");
                    this.excluir(conn, idDocumento, nomeArquivoDoc, "my_number_mae");
                    break;
                case "docPassaporteAluno":
                    nomeArquivoDoc = rematriculaForm.obterNomeDocumentoAluno(conn, idDocumento, "passaporte_aluno");
                    this.excluir(conn, idDocumento, nomeArquivoDoc, "passaporte_aluno");
                    break;
                case "docPassaportePai":
                    nomeArquivoDoc = rematriculaForm.obterNomeDocumentoAluno(conn, idDocumento, "passaporte_pai");
                    this.excluir(conn, idDocumento, nomeArquivoDoc, "passaporte_pai");
                    break;
                case "docPassaporteMae":
                    nomeArquivoDoc = rematriculaForm.obterNomeDocumentoAluno(conn, idDocumento, "passaporte_mae");
                    this.excluir(conn, idDocumento, nomeArquivoDoc, "passaporte_mae");
                    break;
                case "docHistoricoEscolar":
                    nomeArquivoDoc = rematriculaForm.obterNomeDocumentoAluno(conn, idDocumento, "historico_escolar");
                    this.excluir(conn, idDocumento, nomeArquivoDoc, "historico_escolar");
                    break;
                case "docTransferenciaEscolar":
                    nomeArquivoDoc = rematriculaForm.obterNomeDocumentoAluno(conn, idDocumento, "transferencia_escolar");
                    this.excluir(conn, idDocumento, nomeArquivoDoc, "transferencia_escolar");
                    break;
                case "docCadernetaBancaria":
                    nomeArquivoDoc = rematriculaForm.obterNomeDocumentoAluno(conn, idDocumento, "caderneta_bancaria");
                    this.excluir(conn, idDocumento, nomeArquivoDoc, "caderneta_bancaria");
                    break;
                case "docFoto3x4":
                    nomeArquivoDoc = rematriculaForm.obterNomeDocumentoAluno(conn, idDocumento, "foto3_4");
                    this.excluir(conn, idDocumento, nomeArquivoDoc, "foto3_4");
                    break;
                default:
                    System.out.println("sem nenhum documento");
                    break;
            }

            //carregar dados do aluno por ID
            rematriculaForm = rematriculaForm.obterDocumentosAluno(conn, idPf);
            AlunoForm alunoForm = new AlunoForm();
            alunoForm = alunoForm.obterDadosAlunoPorID(conn, idPf);
            rematriculaForm.setAlunoForm(alunoForm);
            request.setAttribute("RematriculaForm", rematriculaForm);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private void excluir(Connection conn, String idDocumento, String nomeArquivoDoc, String tipoDocumento) throws IOException {
        try {
            String path = getServlet().getServletContext().getRealPath("/") + "documentos_aluno";
            String pathDoc = path + "/" + nomeArquivoDoc;
            Path fileToDeletePath = Paths.get(pathDoc);
            Files.delete(fileToDeletePath);

            RematriculaForm rematriculaForm = new RematriculaForm();
            rematriculaForm.excluirDocumentoAluno(conn, idDocumento, tipoDocumento);

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
