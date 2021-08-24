/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.Dao;

import br.com.Form.AlunoForm;
import br.com.Form.PautaForm;
import br.com.Form.PautaObsPerfilAlunoForm;
import br.com.Util.Utilitario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author macuser
 */
public class PautaDao {

    private static PautaDao pautaDao = null;

    public static final PautaDao getInstance() {
        if (pautaDao == null) {
            pautaDao = new PautaDao();
        }
        return pautaDao;
    }

    public void salvarPerfilAluno(Connection conn, PautaForm pautaForm) throws SQLException {
        String query = "INSERT INTO pauta_obs_aluno (id_aluno, id_professor, nr_bimestre, ano, id_serie_ano, "
                + " obs_qualidade, obs_participacao_aula, obs_realizacao_tarefa, obs_comportamento, obs_relacionamento, "
                + " obs_dificuldade, obs_precisa_reforco, obs_comportamento_reforco, obs_dica_professor, obs_outro_assunto, data) "
                + " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, now())";

        PreparedStatement prep = conn.prepareStatement(query);
        prep.setInt(1, pautaForm.getIdAluno());
        prep.setInt(2, pautaForm.getIdProfessor());
        prep.setInt(3, pautaForm.getNrBimestre());
        prep.setInt(4, pautaForm.getAno());
        prep.setInt(5, pautaForm.getIdSerieAno());
        prep.setString(6, pautaForm.getObsQualidade());
        prep.setString(7, pautaForm.getObsParticipacaoAula());
        prep.setString(8, pautaForm.getObsRealizacaoTarefa());
        prep.setString(9, pautaForm.getObsComportamento());
        prep.setString(10, pautaForm.getObsRelacionamento());
        prep.setString(11, pautaForm.getObsDificuldade());
        prep.setString(12, pautaForm.getObsPrecisaReforco());
        prep.setString(13, pautaForm.getObsComportamentoReforco());
        prep.setString(14, pautaForm.getObsDicaProfessor());
        prep.setString(15, pautaForm.getObsOutroAssunto());
        prep.execute();
        prep.close();

    }

    public List<AlunoForm> obterAlunosSemPerfilCadastrado(Connection conn, PautaForm pautaForm) throws SQLException {
        List<AlunoForm> listaAlunos = new ArrayList<>();
        StringBuilder sb = new StringBuilder();
        sb.append("select pf.id, pf.nome ");
        sb.append(" from pessoa_fisica pf, alunos a");
        sb.append(" left join pauta_obs_aluno p on a.id_pessoa_fisica = p.id_aluno");
        sb.append(" and p.ano = ?");
        sb.append(" and p.nr_bimestre = ?");
        sb.append(" where pf.id = a.id_pessoa_fisica");
        sb.append(" and a.serie_ano = ?");
        sb.append(" and pf.status = 1");
        sb.append(" and (p.id_professor != ? || p.id_professor is null)");
        sb.append(" order by pf.nome");
        PreparedStatement prep = conn.prepareStatement(sb.toString());
        prep.setInt(1, pautaForm.getAno());
        prep.setInt(2, pautaForm.getNrBimestre());
        prep.setInt(3, pautaForm.getIdSerieAno());
        prep.setInt(4, pautaForm.getIdProfessor());
        ResultSet rs = prep.executeQuery();
        while (rs.next()) {
            AlunoForm aForm = new AlunoForm();
            aForm.setIdAluno(rs.getInt("id"));
            aForm.setNome(rs.getString("nome"));
            listaAlunos.add(aForm);
        }
        rs.close();
        prep.close();

        return listaAlunos;
    }

    public List<PautaForm> obterAlunosComPerfilCadastrado(Connection conn, PautaForm pautaForm) throws SQLException {
        List<PautaForm> listaAlunos = new ArrayList<>();
        StringBuilder sb = new StringBuilder();
        sb.append("select pf.nome, p.id_professor, p.id, p.id_aluno, p.nr_bimestre, p.ano, p.id_serie_ano, prof.nome as nome_professor ");
        sb.append(" from pauta_obs_aluno p, pessoa_fisica pf, pessoa_fisica prof");
        sb.append(" where p.id_aluno = pf.id");
        sb.append(" and p.id_professor = prof.id");
        sb.append(" and p.ano = ?");
        sb.append(" and p.nr_bimestre = ?");
        sb.append(" and p.id_serie_ano = ?");
        sb.append(" and pf.status = 1");
        sb.append(" order by pf.nome");
        PreparedStatement prep = conn.prepareStatement(sb.toString());
        prep.setInt(1, pautaForm.getAno());
        prep.setInt(2, pautaForm.getNrBimestre());
        prep.setInt(3, pautaForm.getIdSerieAno());
        ResultSet rs = prep.executeQuery();
        while (rs.next()) {
            PautaForm pautaF = new PautaForm();
            pautaF.setIdAluno(rs.getInt("id_aluno"));
            pautaF.setNomeAluno(rs.getString("nome"));
            pautaF.setIdPautaObsAluno(rs.getInt("id"));
            pautaF.setNrBimestre(rs.getInt("nr_bimestre"));
            pautaF.setAno(rs.getInt("ano"));
            pautaF.setNomeProfessor(rs.getString("nome_professor"));

            listaAlunos.add(pautaF);
        }
        rs.close();
        prep.close();

        return listaAlunos;
    }

    public PautaForm obterDadosPerfilAluno(Connection conn, int idPautaObsAluno) throws SQLException {
        PautaForm pautaForm = new PautaForm();
        String query = "select pf.nome, prof.nome as nome_professor, p.*"
                + " from pauta_obs_aluno p, pessoa_fisica pf, pessoa_fisica prof"
                + " where p.id_aluno = pf.id"
                + " and p.id_professor = prof.id"
                + " and p.id = ?";

        PreparedStatement prep = conn.prepareStatement(query);
        prep.setInt(1, idPautaObsAluno);
        ResultSet rs = prep.executeQuery();
        if (rs.next()) {
            pautaForm.setIdPautaObsAluno(rs.getInt("id"));
            pautaForm.setIdAluno(rs.getInt("id_aluno"));
            pautaForm.setNomeAluno(rs.getString("nome"));
            pautaForm.setNomeProfessor(rs.getString("nome_professor"));
            pautaForm.setNrBimestre(rs.getInt("nr_bimestre"));
            pautaForm.setAno(rs.getInt("ano"));
            pautaForm.setIdSerieAno(rs.getInt("id_serie_ano"));
            pautaForm.setObsQualidade(rs.getString("obs_qualidade"));
            pautaForm.setObsParticipacaoAula(rs.getString("obs_participacao_aula"));
            pautaForm.setObsRealizacaoTarefa(rs.getString("obs_realizacao_tarefa"));
            pautaForm.setObsComportamento(rs.getString("obs_comportamento"));
            pautaForm.setObsRelacionamento(rs.getString("obs_relacionamento"));
            pautaForm.setObsDificuldade(rs.getString("obs_dificuldade"));
            pautaForm.setObsPrecisaReforco(rs.getString("obs_precisa_reforco"));
            pautaForm.setObsComportamentoReforco(rs.getString("obs_comportamento_reforco"));
            pautaForm.setObsDicaProfessor(rs.getString("obs_dica_professor"));
            pautaForm.setObsOutroAssunto(rs.getString("obs_outro_assunto"));
        }
        rs.close();
        prep.close();

        return pautaForm;

    }

    public PautaForm obterPerfilAlunoPorBimestre(Connection conn, int nrBimestre, int ano, int idAluno, int idSerieAno) throws SQLException {
        PautaForm pautaForm = new PautaForm();
        String query = "select * from pauta_obs_aluno where nr_bimestre = ? and ano = ? and id_aluno = ? and id_serie_ano = ?";
        PreparedStatement prep = conn.prepareStatement(query);
        prep.setInt(1, nrBimestre);
        prep.setInt(2, ano);
        prep.setInt(3, idAluno);
        prep.setInt(4, idSerieAno);
        ResultSet rs = prep.executeQuery();
        if (rs.next()) {
            pautaForm.setIdPautaObsAluno(rs.getInt("id"));
            pautaForm.setIdAluno(rs.getInt("id_aluno"));
            pautaForm.setNrBimestre(rs.getInt("nr_bimestre"));
            pautaForm.setAno(rs.getInt("ano"));
            pautaForm.setIdSerieAno(rs.getInt("id_serie_ano"));
            pautaForm.setObsQualidade(rs.getString("obs_qualidade"));
            pautaForm.setObsParticipacaoAula(rs.getString("obs_participacao_aula"));
            pautaForm.setObsRealizacaoTarefa(rs.getString("obs_realizacao_tarefa"));
            pautaForm.setObsComportamento(rs.getString("obs_comportamento"));
            pautaForm.setObsRelacionamento(rs.getString("obs_relacionamento"));
            pautaForm.setObsDificuldade(rs.getString("obs_dificuldade"));
            pautaForm.setObsPrecisaReforco(rs.getString("obs_precisa_reforco"));
            pautaForm.setObsComportamentoReforco(rs.getString("obs_comportamento_reforco"));
            pautaForm.setObsDicaProfessor(rs.getString("obs_dica_professor"));
            pautaForm.setObsOutroAssunto(rs.getString("obs_outro_assunto"));
        }
        rs.close();
        prep.close();

        return pautaForm;
    }

    public List<PautaObsPerfilAlunoForm> listaObsPorProfessor(Connection conn, int nrBimestre, int ano, int idAluno, int idSerieAno) throws SQLException {
        List<PautaObsPerfilAlunoForm> lista = new ArrayList<>();
        String query = "select pf.nome, p.*"
                + " from pauta_obs_aluno p, pessoa_fisica pf"
                + " where p.id_professor = pf.id"
                + " and p.nr_bimestre = ? and p.ano = ? and p.id_aluno = ? and p.id_serie_ano = ?";
        PreparedStatement prep = conn.prepareStatement(query);
        prep.setInt(1, nrBimestre);
        prep.setInt(2, ano);
        prep.setInt(3, idAluno);
        prep.setInt(4, idSerieAno);
        ResultSet rs = prep.executeQuery();
        while (rs.next()) {
            PautaObsPerfilAlunoForm pautaForm = new PautaObsPerfilAlunoForm();
            pautaForm.setNomeProfessor(rs.getString("nome"));
            pautaForm.setObsQualidade(rs.getString("obs_qualidade"));
            pautaForm.setObsParticipacaoAula(rs.getString("obs_participacao_aula"));
            pautaForm.setObsRealizacaoTarefa(rs.getString("obs_realizacao_tarefa"));
            pautaForm.setObsComportamento(rs.getString("obs_comportamento"));
            pautaForm.setObsRelacionamento(rs.getString("obs_relacionamento"));
            pautaForm.setObsDificuldade(rs.getString("obs_dificuldade"));
            pautaForm.setObsPrecisaReforco(rs.getString("obs_precisa_reforco"));
            pautaForm.setObsComportamentoReforco(rs.getString("obs_comportamento_reforco"));
            pautaForm.setObsDicaProfessor(rs.getString("obs_dica_professor"));
            pautaForm.setObsOutroAssunto(rs.getString("obs_outro_assunto"));

            lista.add(pautaForm);
        }
        rs.close();
        prep.close();

        return lista;
    }

    public void atualizarPerfilAluno(Connection conn, PautaForm pautaForm) throws SQLException {
        String query = "UPDATE pauta_obs_aluno SET nr_bimestre=?, obs_qualidade=?, obs_participacao_aula=?, obs_realizacao_tarefa=?, "
                + " obs_comportamento=?, obs_relacionamento=?, obs_dificuldade=?, obs_precisa_reforco=?, obs_comportamento_reforco=?, "
                + " obs_dica_professor=?, obs_outro_assunto=? "
                + " WHERE id=?";

        PreparedStatement prep = conn.prepareStatement(query);
        prep.setInt(1, pautaForm.getNrBimestre());
        prep.setString(2, pautaForm.getObsQualidade());
        prep.setString(3, pautaForm.getObsParticipacaoAula());
        prep.setString(4, pautaForm.getObsRealizacaoTarefa());
        prep.setString(5, pautaForm.getObsComportamento());
        prep.setString(6, pautaForm.getObsRelacionamento());
        prep.setString(7, pautaForm.getObsDificuldade());
        prep.setString(8, pautaForm.getObsPrecisaReforco());
        prep.setString(9, pautaForm.getObsComportamentoReforco());
        prep.setString(10, pautaForm.getObsDicaProfessor());
        prep.setString(11, pautaForm.getObsOutroAssunto());
        prep.setInt(12, pautaForm.getIdPautaObsAluno());
        prep.execute();
        prep.close();

    }

    public void excluirPerfilAluno(Connection conn, int idPautaObsAluno) throws SQLException {
        String query = "DELETE FROM pauta_obs_aluno WHERE id=?";
        PreparedStatement prep = conn.prepareStatement(query);
        prep.setInt(1, idPautaObsAluno);
        prep.execute();
        prep.close();
    }

    public void salvarPautaBimestre(Connection conn, PautaForm pautaForm) throws SQLException {
        String query = "INSERT INTO pauta_bimestre (nr_bimestre, ano, apresentacao, boletim, recado_pais, recado_geral, sugestao, finalizacao, data) "
                + " VALUES (?, ?, ?, ?, ?, ?, ?, ?, now())";

        PreparedStatement prep = conn.prepareStatement(query);
        prep.setInt(1, pautaForm.getNrBimestre());
        prep.setInt(2, pautaForm.getAno());
        prep.setString(3, pautaForm.getPautaApresentacao());
        prep.setString(4, pautaForm.getPautaBoletim());
        prep.setString(5, pautaForm.getPautaRecadoPais());
        prep.setString(6, pautaForm.getPautaRecadoGeral());
        prep.setString(7, pautaForm.getPautaSugestao());
        prep.setString(8, pautaForm.getPautaFinalizacao());
        prep.execute();
        prep.close();

    }

    public List<PautaForm> obterPautasBimestrePorAno(Connection conn, int ano) throws SQLException {
        List<PautaForm> listaPautasBimestre = new ArrayList<>();
        String query = "select * from pauta_bimestre where ano = ? order by nr_bimestre";
        PreparedStatement prep = conn.prepareStatement(query);
        prep.setInt(1, ano);

        ResultSet rs = prep.executeQuery();
        while (rs.next()) {
            PautaForm pautaForm = new PautaForm();
            pautaForm.setIdPauta(rs.getInt("id_pauta"));
            pautaForm.setNrBimestre(rs.getInt("nr_bimestre"));
            pautaForm.setAno(rs.getInt("ano"));
            pautaForm.setPautaApresentacao(rs.getString("apresentacao"));
            pautaForm.setPautaBoletim(rs.getString("boletim"));
            pautaForm.setPautaRecadoPais(rs.getString("recado_pais"));
            pautaForm.setPautaRecadoGeral(rs.getString("recado_geral"));
            pautaForm.setPautaSugestao(rs.getString("sugestao"));
            pautaForm.setPautaFinalizacao(rs.getString("finalizacao"));
            listaPautasBimestre.add(pautaForm);
        }
        rs.close();
        prep.close();

        return listaPautasBimestre;

    }

    public boolean isExistePautaBimestre(Connection conn, int nrBimestre, int ano) throws SQLException {
        boolean isExiste = false;
        String query = "select * from pauta_bimestre where nr_bimestre = ? and ano = ?";
        PreparedStatement prep = conn.prepareStatement(query);
        prep.setInt(1, nrBimestre);
        prep.setInt(2, ano);
        ResultSet rs = prep.executeQuery();
        if (rs.next()) {
            isExiste = true;
        }
        rs.close();
        prep.close();

        return isExiste;
    }

    public void excluirPautaBimestre(Connection conn, int idPauta) throws SQLException {
        String query = "DELETE FROM pauta_bimestre WHERE id_pauta=?";
        PreparedStatement prep = conn.prepareStatement(query);
        prep.setInt(1, idPauta);
        prep.execute();
        prep.close();
    }

    public PautaForm obterPautaBimestrePorID(Connection conn, int idPauta) throws SQLException {
        PautaForm pautaForm = new PautaForm();
        String query = "select * from pauta_bimestre where id_pauta = ?";
        PreparedStatement prep = conn.prepareStatement(query);
        prep.setInt(1, idPauta);

        ResultSet rs = prep.executeQuery();
        while (rs.next()) {
            pautaForm.setIdPauta(rs.getInt("id_pauta"));
            pautaForm.setNrBimestre(rs.getInt("nr_bimestre"));
            pautaForm.setAno(rs.getInt("ano"));
            pautaForm.setPautaApresentacao(rs.getString("apresentacao"));
            pautaForm.setPautaBoletim(rs.getString("boletim"));
            pautaForm.setPautaRecadoPais(rs.getString("recado_pais"));
            pautaForm.setPautaRecadoGeral(rs.getString("recado_geral"));
            pautaForm.setPautaSugestao(rs.getString("sugestao"));
            pautaForm.setPautaFinalizacao(rs.getString("finalizacao"));
        }
        rs.close();
        prep.close();

        return pautaForm;
    }

    public void atualizarPautaBimestre(Connection conn, PautaForm pautaForm) throws SQLException {
        String query = "UPDATE pauta_bimestre SET nr_bimestre=?, apresentacao=?, boletim=?, recado_pais=?, recado_geral=?, sugestao=? WHERE id_pauta=?";
        PreparedStatement prep = conn.prepareStatement(query);
        prep.setInt(1, pautaForm.getNrBimestre());
        prep.setString(2, pautaForm.getPautaApresentacao());
        prep.setString(3, pautaForm.getPautaBoletim());
        prep.setString(4, pautaForm.getPautaRecadoPais());
        prep.setString(5, pautaForm.getPautaRecadoGeral());
        prep.setString(6, pautaForm.getPautaSugestao());
        prep.setInt(7, pautaForm.getIdPauta());
        prep.execute();
        prep.close();
    }

    public PautaForm obterPautaPorBimestre(Connection conn, int nrBimestre, int ano) throws SQLException {
        PautaForm pautaForm = new PautaForm();
        String query = "select * from pauta_bimestre where nr_bimestre = ? and ano = ?";
        PreparedStatement prep = conn.prepareStatement(query);
        prep.setInt(1, nrBimestre);
        prep.setInt(2, ano);
        ResultSet rs = prep.executeQuery();
        while (rs.next()) {
            pautaForm.setIdPauta(rs.getInt("id_pauta"));
            pautaForm.setNrBimestre(rs.getInt("nr_bimestre"));
            pautaForm.setAno(rs.getInt("ano"));
            pautaForm.setPautaApresentacao(rs.getString("apresentacao"));
            pautaForm.setPautaBoletim(rs.getString("boletim"));
            pautaForm.setPautaRecadoPais(rs.getString("recado_pais"));
            pautaForm.setPautaRecadoGeral(rs.getString("recado_geral"));
            pautaForm.setPautaSugestao(rs.getString("sugestao"));
            pautaForm.setPautaFinalizacao(rs.getString("finalizacao"));
        }
        rs.close();
        prep.close();

        return pautaForm;
    }

    public boolean isExistePautaAlunoBimestreAno(Connection conn, PautaForm pautaForm) throws SQLException {
        String query = "select * from pauta_bimestre_aluno where id_aluno = ? and nr_bimestre = ? and ano = ?";
        PreparedStatement prep = conn.prepareStatement(query);
        prep.setInt(1, pautaForm.getIdAluno());
        prep.setInt(2, pautaForm.getNrBimestre());
        prep.setInt(3, pautaForm.getAno());
        ResultSet rs = prep.executeQuery();
        if (rs.next()) {
            return true;
        }
        rs.close();
        prep.close();

        return false;

    }

    public void salvarPautaAlunoBimestre(Connection conn, PautaForm pautaForm) throws SQLException {
        String query = "INSERT INTO pauta_bimestre_aluno (id_aluno, nr_bimestre, ano, id_serie_ano, ds_sugestao, data, id_usuario_save) VALUES (?, ?, ?, ?, ?, now(), ?)";
        PreparedStatement prep = conn.prepareStatement(query);
        prep.setInt(1, pautaForm.getIdAluno());
        prep.setInt(2, pautaForm.getNrBimestre());
        prep.setInt(3, pautaForm.getAno());
        prep.setInt(4, pautaForm.getIdSerieAno());
        prep.setString(5, pautaForm.getEspacoSugestao());
        prep.setInt(6, pautaForm.getIdProfessor());
        prep.execute();
        prep.close();
    }

    public List<PautaForm> obterPautasAlunoCadastrada(Connection conn, String idSerieAno, int nrBimestre, int ano) throws SQLException {
        List<PautaForm> listaPautasCadastradas = new ArrayList<>();
        String query = "select p.*, pf.nome "
                + " from pauta_bimestre_aluno p, pessoa_fisica pf"
                + " where p.id_aluno = pf.id"
                + " and p.id_serie_ano = ?"
                + " and p.nr_bimestre = ?"
                + " and p.ano = ?";
        PreparedStatement prep = conn.prepareStatement(query);
        prep.setString(1, idSerieAno);
        prep.setInt(2, nrBimestre);
        prep.setInt(3, ano);

        ResultSet rs = prep.executeQuery();
        while (rs.next()) {
            PautaForm pautaForm = new PautaForm();
            pautaForm.setIdPauta(rs.getInt("id"));
            pautaForm.setNrBimestre(rs.getInt("nr_bimestre"));
            pautaForm.setAno(rs.getInt("ano"));
            pautaForm.setIdSerieAno(rs.getInt("id_serie_ano"));
            pautaForm.setIdAluno(rs.getInt("id_aluno"));
            pautaForm.setNomeAluno(rs.getString("nome"));
            listaPautasCadastradas.add(pautaForm);
        }
        rs.close();
        prep.close();

        return listaPautasCadastradas;
    }

    public void excluirPautaBimestreAluno(Connection conn, int idPauta) throws SQLException {
        String query = "DELETE FROM pauta_bimestre_aluno WHERE id=?";
        PreparedStatement prep = conn.prepareStatement(query);
        prep.setInt(1, idPauta);
        prep.execute();
        prep.close();
    }

    public PautaForm obterDadosPautaCadastrada(Connection conn, int idPauta) throws SQLException {
        String query = "select * from pauta_bimestre_aluno p where p.id = ?";
        PreparedStatement prep = conn.prepareStatement(query);
        prep.setInt(1, idPauta);
        ResultSet rs = prep.executeQuery();
            PautaForm pautaForm = new PautaForm();
        if(rs.next()) {
            pautaForm.setIdPauta(rs.getInt("id"));
            pautaForm.setIdAluno(rs.getInt("id_aluno"));
            pautaForm.setNrBimestre(rs.getInt("nr_bimestre"));
            pautaForm.setAno(rs.getInt("ano"));
            pautaForm.setIdSerieAno(rs.getInt("id_serie_ano"));
            pautaForm.setEspacoSugestao(rs.getString("ds_sugestao"));
        }
        rs.close();
        prep.close();
        
        return pautaForm;
    }

}
