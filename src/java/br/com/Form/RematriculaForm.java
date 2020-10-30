/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.Form;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.apache.struts.upload.FormFile;

/**
 *
 * @author macuser
 */
public class RematriculaForm extends FormBasico {

    private AlunoForm alunoForm;
    private int idDocumento;
    private int idAluno;
    private FormFile zairyuCardAluno = null;
    private FormFile zairyuCardPai = null;
    private FormFile zairyuCardMae = null;
    private FormFile myNumberAluno = null;
    private FormFile myNumberPai = null;
    private FormFile myNumberMae = null;
    private FormFile passaporteAluno = null;
    private FormFile passaportePai = null;
    private FormFile passaporteMae = null;
    private FormFile historicoEscolar = null;
    private FormFile transferenciaEscolar = null;
    private FormFile cadernetaBancaria = null;
    private FormFile foto3x4 = null;
    private String docZairyuCardAluno;
    private String docZairyuCardPai;
    private String docZairyuCardMae;
    private String docMyNumberAluno;
    private String docMyNumberPai;
    private String docMyNumberMae;
    private String docPassaporteAluno;
    private String docPassaportePai;
    private String docPassaporteMae;
    private String docHistoricoEscolar;
    private String docTransferenciaEscolar;
    private String docCadernetaBancaria;
    private String docFoto3x4;

    public int getIdDocumento() {
        return idDocumento;
    }

    public void setIdDocumento(int idDocumento) {
        this.idDocumento = idDocumento;
    }

    public int getIdAluno() {
        return idAluno;
    }

    public void setIdAluno(int idAluno) {
        this.idAluno = idAluno;
    }

    public String getDocZairyuCardAluno() {
        return docZairyuCardAluno;
    }

    public void setDocZairyuCardAluno(String docZairyuCardAluno) {
        this.docZairyuCardAluno = docZairyuCardAluno;
    }

    public String getDocZairyuCardPai() {
        return docZairyuCardPai;
    }

    public void setDocZairyuCardPai(String docZairyuCardPai) {
        this.docZairyuCardPai = docZairyuCardPai;
    }

    public String getDocZairyuCardMae() {
        return docZairyuCardMae;
    }

    public void setDocZairyuCardMae(String docZairyuCardMae) {
        this.docZairyuCardMae = docZairyuCardMae;
    }

    public String getDocMyNumberAluno() {
        return docMyNumberAluno;
    }

    public void setDocMyNumberAluno(String docMyNumberAluno) {
        this.docMyNumberAluno = docMyNumberAluno;
    }

    public String getDocMyNumberPai() {
        return docMyNumberPai;
    }

    public void setDocMyNumberPai(String docMyNumberPai) {
        this.docMyNumberPai = docMyNumberPai;
    }

    public String getDocMyNumberMae() {
        return docMyNumberMae;
    }

    public void setDocMyNumberMae(String docMyNumberMae) {
        this.docMyNumberMae = docMyNumberMae;
    }

    public String getDocPassaporteAluno() {
        return docPassaporteAluno;
    }

    public void setDocPassaporteAluno(String docPassaporteAluno) {
        this.docPassaporteAluno = docPassaporteAluno;
    }

    public String getDocPassaportePai() {
        return docPassaportePai;
    }

    public void setDocPassaportePai(String docPassaportePai) {
        this.docPassaportePai = docPassaportePai;
    }

    public String getDocPassaporteMae() {
        return docPassaporteMae;
    }

    public void setDocPassaporteMae(String docPassaporteMae) {
        this.docPassaporteMae = docPassaporteMae;
    }

    public String getDocHistoricoEscolar() {
        return docHistoricoEscolar;
    }

    public void setDocHistoricoEscolar(String docHistoricoEscolar) {
        this.docHistoricoEscolar = docHistoricoEscolar;
    }

    public String getDocTransferenciaEscolar() {
        return docTransferenciaEscolar;
    }

    public void setDocTransferenciaEscolar(String docTransferenciaEscolar) {
        this.docTransferenciaEscolar = docTransferenciaEscolar;
    }

    public String getDocCadernetaBancaria() {
        return docCadernetaBancaria;
    }

    public void setDocCadernetaBancaria(String docCadernetaBancaria) {
        this.docCadernetaBancaria = docCadernetaBancaria;
    }

    public String getDocFoto3x4() {
        return docFoto3x4;
    }

    public void setDocFoto3x4(String docFoto3x4) {
        this.docFoto3x4 = docFoto3x4;
    }

    public AlunoForm getAlunoForm() {
        return alunoForm;
    }

    public void setAlunoForm(AlunoForm alunoForm) {
        this.alunoForm = alunoForm;
    }

    public FormFile getZairyuCardPai() {
        return zairyuCardPai;
    }

    public void setZairyuCardPai(FormFile zairyuCardPai) {
        this.zairyuCardPai = zairyuCardPai;
    }

    public FormFile getZairyuCardMae() {
        return zairyuCardMae;
    }

    public void setZairyuCardMae(FormFile zairyuCardMae) {
        this.zairyuCardMae = zairyuCardMae;
    }

    public FormFile getZairyuCardAluno() {
        return zairyuCardAluno;
    }

    public void setZairyuCardAluno(FormFile zairyuCardAluno) {
        this.zairyuCardAluno = zairyuCardAluno;
    }

    public FormFile getMyNumberPai() {
        return myNumberPai;
    }

    public void setMyNumberPai(FormFile myNumberPai) {
        this.myNumberPai = myNumberPai;
    }

    public FormFile getMyNumberMae() {
        return myNumberMae;
    }

    public void setMyNumberMae(FormFile myNumberMae) {
        this.myNumberMae = myNumberMae;
    }

    public FormFile getMyNumberAluno() {
        return myNumberAluno;
    }

    public void setMyNumberAluno(FormFile myNumberAluno) {
        this.myNumberAluno = myNumberAluno;
    }

    public FormFile getPassaportePai() {
        return passaportePai;
    }

    public void setPassaportePai(FormFile passaportePai) {
        this.passaportePai = passaportePai;
    }

    public FormFile getPassaporteMae() {
        return passaporteMae;
    }

    public void setPassaporteMae(FormFile passaporteMae) {
        this.passaporteMae = passaporteMae;
    }

    public FormFile getPassaporteAluno() {
        return passaporteAluno;
    }

    public void setPassaporteAluno(FormFile passaporteAluno) {
        this.passaporteAluno = passaporteAluno;
    }

    public FormFile getHistoricoEscolar() {
        return historicoEscolar;
    }

    public void setHistoricoEscolar(FormFile historicoEscolar) {
        this.historicoEscolar = historicoEscolar;
    }

    public FormFile getTransferenciaEscolar() {
        return transferenciaEscolar;
    }

    public void setTransferenciaEscolar(FormFile transferenciaEscolar) {
        this.transferenciaEscolar = transferenciaEscolar;
    }

    public FormFile getCadernetaBancaria() {
        return cadernetaBancaria;
    }

    public void setCadernetaBancaria(FormFile cadernetaBancaria) {
        this.cadernetaBancaria = cadernetaBancaria;
    }

    public FormFile getFoto3x4() {
        return foto3x4;
    }

    public void setFoto3x4(FormFile foto3x4) {
        this.foto3x4 = foto3x4;
    }

    public void incluirAlterarDocumentos(Connection conn, String idPf, String strFileNameZairyuAluno, String strFileNameZairyuPai,
            String strFileNameZairyuMae, String strFileNameMyNumberAluno, String strFileNameMyNumberPai, String strFileNameMyNumberMae,
            String strFileNamePassaporteAluno, String strFileNamePassaportePai, String strFileNamePassaporteMae, String strFileNameHistoricoEscolar,
            String strFileNameTransferenciaEscolar, String strFileNameCadernetaBancaria, String strFileNameFoto3x4) throws SQLException {

        //verificiar se ja existe algum dado para o aluno
        boolean isExisteDocumentoAluno = false;
        String querySelect = "select * from documentos_aluno where id_aluno = ?";
        PreparedStatement prepSelect = conn.prepareStatement(querySelect);
        prepSelect.setString(1, idPf);
        ResultSet rs = prepSelect.executeQuery();
        RematriculaForm remForm = new RematriculaForm();
        if (rs.next()) {
            isExisteDocumentoAluno = true;
            remForm.setIdDocumento(rs.getInt("id"));
            remForm.setDocZairyuCardAluno(rs.getString("zairyu_card_aluno"));
            remForm.setDocZairyuCardPai(rs.getString("zairyu_card_pai"));
            remForm.setDocZairyuCardMae(rs.getString("zairyu_card_mae"));
            remForm.setDocMyNumberAluno(rs.getString("my_number_aluno"));
            remForm.setDocMyNumberPai(rs.getString("my_number_pai"));
            remForm.setDocMyNumberMae(rs.getString("my_number_mae"));
            remForm.setDocPassaporteAluno(rs.getString("passaporte_aluno"));
            remForm.setDocPassaportePai(rs.getString("passaporte_pai"));
            remForm.setDocPassaporteMae(rs.getString("passaporte_mae"));
            remForm.setDocHistoricoEscolar(rs.getString("historico_escolar"));
            remForm.setDocTransferenciaEscolar(rs.getString("transferencia_escolar"));
            remForm.setDocCadernetaBancaria(rs.getString("caderneta_bancaria"));
            remForm.setDocFoto3x4(rs.getString("foto3_4"));
        }
        rs.close();
        prepSelect.close();

        if (isExisteDocumentoAluno) {
            //verificar aqui se os campos estao vindo vazio, pq se tiver nao pode atualizar pra subtituir o antigo

            String queryUpdate = "UPDATE documentos_aluno SET zairyu_card_aluno=?, zairyu_card_pai=?, zairyu_card_mae=?, my_number_aluno=?,"
                    + " my_number_pai=?, my_number_mae=?, passaporte_aluno=?, passaporte_pai=?, passaporte_mae=?, historico_escolar=?, "
                    + " transferencia_escolar=?, caderneta_bancaria=?, foto3_4=?"
                    + " WHERE id=?";
            PreparedStatement prepUpdate = conn.prepareStatement(queryUpdate);
            if (!strFileNameZairyuAluno.equals("")) {
                prepUpdate.setString(1, strFileNameZairyuAluno);
            } else {
                prepUpdate.setString(1, remForm.getDocZairyuCardAluno());
            }
            if (!strFileNameZairyuPai.equals("")) {
                prepUpdate.setString(2, strFileNameZairyuPai);
            } else {
                prepUpdate.setString(2, remForm.getDocZairyuCardPai());
            }
            if (!strFileNameZairyuMae.equals("")) {
                prepUpdate.setString(3, strFileNameZairyuMae);
            } else {
                prepUpdate.setString(3, remForm.getDocZairyuCardMae());
            }
            if (!strFileNameMyNumberAluno.equals("")) {
                prepUpdate.setString(4, strFileNameMyNumberAluno);
            } else {
                prepUpdate.setString(4, remForm.getDocMyNumberAluno());
            }
            if (!strFileNameMyNumberPai.equals("")) {
                prepUpdate.setString(5, strFileNameMyNumberPai);
            } else {
                prepUpdate.setString(5, remForm.getDocMyNumberPai());
            }
            if (!strFileNameMyNumberMae.equals("")) {
                prepUpdate.setString(6, strFileNameMyNumberMae);
            } else {
                prepUpdate.setString(6, remForm.getDocMyNumberMae());
            }
            if (!strFileNamePassaporteAluno.equals("")) {
                prepUpdate.setString(7, strFileNamePassaporteAluno);
            } else {
                prepUpdate.setString(7, remForm.getDocPassaporteAluno());
            }
            if (!strFileNamePassaportePai.equals("")) {
                prepUpdate.setString(8, strFileNamePassaportePai);
            } else {
                prepUpdate.setString(8, remForm.getDocPassaportePai());
            }
            if (!strFileNamePassaporteMae.equals("")) {
                prepUpdate.setString(9, strFileNamePassaporteMae);
            } else {
                prepUpdate.setString(9, remForm.getDocPassaporteMae());
            }
            if (!strFileNameHistoricoEscolar.equals("")) {
                prepUpdate.setString(10, strFileNameHistoricoEscolar);
            } else {
                prepUpdate.setString(10, remForm.getDocHistoricoEscolar());
            }
            if (!strFileNameTransferenciaEscolar.equals("")) {
                prepUpdate.setString(11, strFileNameTransferenciaEscolar);
            } else {
                prepUpdate.setString(11, remForm.getDocTransferenciaEscolar());
            }
            if (!strFileNameCadernetaBancaria.equals("")) {
                prepUpdate.setString(12, strFileNameCadernetaBancaria);
            } else {
                prepUpdate.setString(12, remForm.getDocCadernetaBancaria());
            }
            if (!strFileNameFoto3x4.equals("")) {
                prepUpdate.setString(13, strFileNameFoto3x4);
            } else {
                prepUpdate.setString(13, remForm.getDocFoto3x4());
            }

            prepUpdate.setInt(14, remForm.getIdDocumento());
            prepUpdate.execute();
            prepUpdate.close();

        } else {
            String queryInsert = "INSERT INTO documentos_aluno (id_aluno, zairyu_card_aluno, zairyu_card_pai, zairyu_card_mae, my_number_aluno, my_number_pai, my_number_mae,"
                    + " passaporte_aluno, passaporte_pai, passaporte_mae, historico_escolar, transferencia_escolar, caderneta_bancaria, foto3_4) "
                    + " VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            try (PreparedStatement prepInsert = conn.prepareStatement(queryInsert)) {
                prepInsert.setString(1, idPf);
                prepInsert.setString(2, strFileNameZairyuAluno);
                prepInsert.setString(3, strFileNameZairyuPai);
                prepInsert.setString(4, strFileNameZairyuMae);
                prepInsert.setString(5, strFileNameMyNumberAluno);
                prepInsert.setString(6, strFileNameMyNumberPai);
                prepInsert.setString(7, strFileNameMyNumberMae);
                prepInsert.setString(8, strFileNamePassaporteAluno);
                prepInsert.setString(9, strFileNamePassaportePai);
                prepInsert.setString(10, strFileNamePassaporteMae);
                prepInsert.setString(11, strFileNameHistoricoEscolar);
                prepInsert.setString(12, strFileNameTransferenciaEscolar);
                prepInsert.setString(13, strFileNameCadernetaBancaria);
                prepInsert.setString(14, strFileNameFoto3x4);
                prepInsert.execute();
            }
        }

    }

    public RematriculaForm obterDocumentosAluno(Connection conn, String idPf) throws SQLException {
        RematriculaForm rematriculaForm = new RematriculaForm();
        String query = "select * from documentos_aluno where id_aluno = ?";
        try (PreparedStatement prep = conn.prepareStatement(query)) {
            prep.setString(1, idPf);
            try (ResultSet rs = prep.executeQuery()) {
                if (rs.next()) {
                    rematriculaForm.setIdDocumento(rs.getInt("id"));
                    rematriculaForm.setIdAluno(rs.getInt("id_aluno"));
                    rematriculaForm.setDocZairyuCardAluno(rs.getString("zairyu_card_aluno"));
                    rematriculaForm.setDocZairyuCardPai(rs.getString("zairyu_card_pai"));
                    rematriculaForm.setDocZairyuCardMae(rs.getString("zairyu_card_mae"));
                    rematriculaForm.setDocMyNumberAluno(rs.getString("my_number_aluno"));
                    rematriculaForm.setDocMyNumberPai(rs.getString("my_number_pai"));
                    rematriculaForm.setDocMyNumberMae(rs.getString("my_number_mae"));
                    rematriculaForm.setDocPassaporteAluno(rs.getString("passaporte_aluno"));
                    rematriculaForm.setDocPassaportePai(rs.getString("passaporte_pai"));
                    rematriculaForm.setDocPassaporteMae(rs.getString("passaporte_mae"));
                    rematriculaForm.setDocHistoricoEscolar(rs.getString("historico_escolar"));
                    rematriculaForm.setDocTransferenciaEscolar(rs.getString("transferencia_escolar"));
                    rematriculaForm.setDocCadernetaBancaria(rs.getString("caderneta_bancaria"));
                    rematriculaForm.setDocFoto3x4(rs.getString("foto3_4"));

                }
            }
        }

        return rematriculaForm;
    }

    public String obterNomeDocumentoAluno(Connection conn, String idDocumento, String tipoDocumento) throws SQLException {
        String query = "select " + tipoDocumento + " from documentos_aluno where id = ?";
        PreparedStatement prep = conn.prepareStatement(query);
        prep.setString(1, idDocumento);
        ResultSet rs = prep.executeQuery();
        String nomeDocumento = "";
        if (rs.next()) {
            nomeDocumento = rs.getString(tipoDocumento);
        }
        rs.close();
        prep.close();

        return nomeDocumento;
    }

    public void excluirDocumentoAluno(Connection conn, String idDocumento, String tipoDocumento) throws SQLException {
        String query = "UPDATE documentos_aluno SET " + tipoDocumento + " = NULL WHERE id=?";
        try (PreparedStatement prep = conn.prepareStatement(query)) {
            prep.setString(1, idDocumento);
            prep.execute();
        }
    }

}
