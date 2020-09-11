/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.Action;

import br.com.Form.UploadArquivoForm;
import br.com.abre.Util.Errors;
import br.com.abre.Util.IDRUtil;
import br.com.abre.Util.ImageUtils;
import java.awt.Image;
import java.io.File;
import java.io.FileOutputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Connection;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.ImageIcon;
import org.apache.commons.fileupload.FileUpload;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.upload.FormFile;

/**
 *
 * @author macuser
 */
public class UploadArquivoAction extends IDRAction {

    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response, Errors errors, String action) {
        String forward = action;
        if (action.equals("pageCardapio")) {
            this.pageCardapio(form, request, errors);
        } else if (action.equals("enviarCardapio")) {
            this.enviarCardapio(form, request, errors);
        } else if (action.equals("listarImagens")) {
            this.listarImagens(form, request, errors);
        } else if (action.equals("excluir")) {
            this.excluir(form, request, errors);
        } else if (action.equals("visualizarCardapio")) {
            this.visualizarCardapio(form, request, errors);
        }

        return mapping.findForward(forward);
    }

    private void pageCardapio(ActionForm form, HttpServletRequest request, Errors errors) {
        UploadArquivoForm uploadForm = new UploadArquivoForm();
        request.setAttribute("UploadArquivoForm", uploadForm);
    }

    private void enviarCardapio(ActionForm form, HttpServletRequest request, Errors errors) {
        boolean isMultipart = FileUpload.isMultipartContent(request);
        boolean uploadDone = false;
        String path = getServlet().getServletContext().getRealPath("/") + "img_cardapio";
        String strFileName = null;

        try {
            if (isMultipart) {
                UploadArquivoForm uploadForm = (UploadArquivoForm) form;
                FormFile formFile = uploadForm.getMyFile();

//                strFileName = formFile.getFileName().trim();
                strFileName = uploadForm.getNomeImagem() + "_cardapio.jpg";
                System.out.println("caminho: " + path + "; nome: " + strFileName);

                //create the upload folder if not exists
                File folder = new File(path);
                if (!folder.exists()) {
                    folder.mkdirs();
                }

                if (!("").equals(strFileName)) {
                    File newFile = new File(path, strFileName);
                    if (!newFile.exists()) {
                        FileOutputStream fos = new FileOutputStream(newFile);
                        fos.write(formFile.getFileData());
                        fos.flush();
                        fos.close();
                    }
                }
                uploadDone = true;

            } else {
                errors.error("Ocorreu um erro ao Enviar Imagem!!");
            }

            if (uploadDone == true) {
                //salvar o caminho e o nome do arquivo no banco de dados
                String caminhoURL = path + "/" + strFileName;
                UploadArquivoForm imgForm = new UploadArquivoForm();
                Connection conn = null;
                try {
                    conn = connectionPool.getConnection();
                    imgForm.salvarImagem(conn, strFileName, caminhoURL);
                    request.setAttribute("uploadDone", uploadDone);
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void listarImagens(ActionForm form, HttpServletRequest request, Errors errors) {
        UploadArquivoForm imgForm = new UploadArquivoForm();
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();
            ArrayList<UploadArquivoForm> listaImagens = imgForm.obterListaImagens(conn);
            request.setAttribute("listaImagens", listaImagens);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private void excluir(ActionForm form, HttpServletRequest request, Errors errors) {
        UploadArquivoForm imgForm = new UploadArquivoForm();
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();
            String idImagem = request.getParameter("idImagem");
            String path = getServlet().getServletContext().getRealPath("/") + "img_cardapio";
            String strFileName = imgForm.obterNomeImagemPorID(conn, idImagem);
            String caminhoFull = path + "/" + strFileName;
            System.out.println(caminhoFull);

            try {
                Path fileToDeletePath = Paths.get(caminhoFull);
                Files.delete(fileToDeletePath);
            } catch (Exception ex) {
                ex.printStackTrace();
            }
            imgForm.excluirImagem(conn, idImagem);
            this.listarImagens(form, request, errors);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private void visualizarCardapio(ActionForm form, HttpServletRequest request, Errors errors) {
        UploadArquivoForm imgForm = new UploadArquivoForm();
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();
            ArrayList<UploadArquivoForm> listaImagens = imgForm.obterListaImagens(conn);
            request.setAttribute("listaImagens", listaImagens);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

}
