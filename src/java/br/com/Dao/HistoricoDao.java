/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.Dao;

import br.com.Form.NotaBimestreForm;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author macuser
 */
public class HistoricoDao {

    private static HistoricoDao historicoCadastroAluno = null;

    public static final HistoricoDao getInstance() {
        if (historicoCadastroAluno == null) {
            historicoCadastroAluno = new HistoricoDao();
        }
        return historicoCadastroAluno;
    }

    public void salvarHistoricoCadastroAluno(Connection conn, int idAluno, int idProfessorSession, String nomeProfessorSession, String descricaoHistorico) throws SQLException {
        String query = "INSERT INTO historico_cadastro_aluno (id_aluno, id_professor_responsavel_cadastro, nome_professor_responsavel_cadastro, data_cadastro, descricao)"
                + " VALUES (?,?,?,now(),?)";
        PreparedStatement prep = conn.prepareStatement(query);
        prep.setInt(1, idAluno);
        prep.setInt(2, idProfessorSession);
        prep.setString(3, nomeProfessorSession);
        prep.setString(4, descricaoHistorico);
        prep.execute();
        prep.close();
    }

    public void salvarHistoricoLancamentoNota(Connection conn, NotaBimestreForm notaBimestreForm, int idProfessorSession, String nomeProfessorSession, String descricaoHistorico) throws SQLException {
        String query = "INSERT INTO historico_lancamento_nota (id_aluno, id_professor_responsavel_cadastro, nome_professor_responsavel_cadastro,"
                + " data_cadastro, descricao, id_disciplina, nr_bimestre, serie_ano, ano)"
                + " VALUES (?,?,?,now(),?,?,?,?,?);";

        PreparedStatement prep = conn.prepareStatement(query);
        prep.setInt(1, notaBimestreForm.getIdAluno());
        prep.setInt(2, idProfessorSession);
        prep.setString(3, nomeProfessorSession);
        prep.setString(4, descricaoHistorico);
        prep.setInt(5, notaBimestreForm.getIdDisciplina());
        prep.setInt(6, notaBimestreForm.getNrBimestre());
        prep.setInt(7, notaBimestreForm.getIdSerieAno());
        prep.setInt(8, notaBimestreForm.getAno());
        prep.execute();
        prep.close();
    }
}
