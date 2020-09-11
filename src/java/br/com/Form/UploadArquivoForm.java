/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.Form;

import br.com.abre.Util.IDRDate;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import org.apache.struts.upload.FormFile;

/**
 *
 * @author macuser
 */
public class UploadArquivoForm extends FormBasico {

    private int idImagem;
    private String nomeImagem;
    private String pathImagem;
    private String data;
    private FormFile myFile = null;

    public FormFile getMyFile() {
        return myFile;
    }

    public void setMyFile(FormFile file) {
        myFile = file;
    }

    public int getIdImagem() {
        return idImagem;
    }

    public void setIdImagem(int idImagem) {
        this.idImagem = idImagem;
    }

    public String getNomeImagem() {
        return nomeImagem;
    }

    public void setNomeImagem(String nomeImagem) {
        this.nomeImagem = nomeImagem;
    }

    public String getPathImagem() {
        return pathImagem;
    }

    public void setPathImagem(String pathImagem) {
        this.pathImagem = pathImagem;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    public void salvarImagem(Connection conn, String strFileName, String caminhoURL) throws SQLException {
        String query = "INSERT INTO img_upload (nome_arquivo, caminho, data) VALUES (?, ?, now())";
        PreparedStatement prep = conn.prepareStatement(query);
        prep.setString(1, strFileName);
        prep.setString(2, caminhoURL);
        prep.execute();
        prep.close();
    }

    public ArrayList<UploadArquivoForm> obterListaImagens(Connection conn) throws SQLException {
        ArrayList lista = new ArrayList();
        String query = "select * from img_upload order by id desc";
        PreparedStatement prep = conn.prepareStatement(query);
        ResultSet rs = prep.executeQuery();
        while (rs.next()) {
            UploadArquivoForm imgForm = new UploadArquivoForm();
            imgForm.setIdImagem(rs.getInt("id"));
            imgForm.setNomeImagem(rs.getString("nome_arquivo"));
            imgForm.setPathImagem(rs.getString("caminho"));
            imgForm.setData(IDRDate.formatSQLDate(rs.getString("data")));
            lista.add(imgForm);
        }
        rs.close();
        prep.close();

        return lista;
    }

    public String obterNomeImagemPorID(Connection conn, String idImagem) throws SQLException {
        String query = "select nome_arquivo from img_upload where id = ?";
        PreparedStatement prep = conn.prepareStatement(query);
        prep.setString(1, idImagem);
        ResultSet rs = prep.executeQuery();
        String nomeArquivo = null;
        if (rs.next()) {
            nomeArquivo = rs.getString("nome_arquivo");
        }
        rs.close();
        prep.close();
        return nomeArquivo;
    }

    public void excluirImagem(Connection conn, String idImagem) throws SQLException {
        String query = "delete from img_upload where id = ?";
        PreparedStatement prep = conn.prepareStatement(query);
        prep.setString(1, idImagem);
        prep.execute();
        prep.close();
    }

}
