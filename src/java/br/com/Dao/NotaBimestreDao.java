/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.Dao;

import br.com.Form.AlunoForm;
import br.com.Form.DisciplinasForm;
import br.com.Form.NotaBimestreForm;
import br.com.Form.SerieAnoForm;
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
public final class NotaBimestreDao {

    private static NotaBimestreDao notaBimestre = null;

    public static final NotaBimestreDao getInstance() {
        if (notaBimestre == null) {
            notaBimestre = new NotaBimestreDao();
        }
        return notaBimestre;
    }

    public List<NotaBimestreForm> obterDisciplinasPorProfessor(Connection conn, String idProfessor) throws SQLException {
        List<NotaBimestreForm> listaDisciplinaPorProfessor = new ArrayList<>();
        String query = "select dp.id_disciplina, dp.categoria_ensino, dp.serie_ano, dp.id_professor,"
                + " d.nome_disciplina, d.peso_producao_sala, d.peso_prova_mensal, d.peso_prova_bimestral "
                + " from disciplina_professor dp, disciplina d"
                + " where dp.id_disciplina = d.id_disciplina"
                + " and dp.id_professor = ?"
                + " order by categoria_ensino, nome_disciplina, serie_ano";
        PreparedStatement prep = conn.prepareStatement(query);
        prep.setString(1, idProfessor);
        ResultSet rs = prep.executeQuery();
        while (rs.next()) {
            NotaBimestreForm notaBimestreForm = new NotaBimestreForm();
            notaBimestreForm.setIdDisciplina(rs.getInt("id_disciplina"));

            DisciplinasForm disciplinaForm = new DisciplinasForm();
            disciplinaForm.setCategoriaEnsino(rs.getString("categoria_ensino"));
            disciplinaForm.setNomeDisciplina(rs.getString("nome_disciplina"));
            disciplinaForm.setPesoProducaoSala(rs.getInt("peso_producao_sala"));
            disciplinaForm.setPesoProvaMensal(rs.getInt("peso_prova_mensal"));
            disciplinaForm.setPesoProvaBimestral(rs.getInt("peso_prova_bimestral"));

            SerieAnoForm serieForm = new SerieAnoForm();
            serieForm.setSerieAno(rs.getInt("serie_ano"));
            serieForm.setDsSerieAno(serieForm.obterDsSerieAnoPorID(conn, rs.getInt("serie_ano")));

            notaBimestreForm.setDisciplinasForm(disciplinaForm);
            notaBimestreForm.setSerieAnoForm(serieForm);

            listaDisciplinaPorProfessor.add(notaBimestreForm);
        }
        rs.close();
        prep.close();

        return listaDisciplinaPorProfessor;
    }

    public void lancarNota(Connection conn, NotaBimestreForm notaBimestreForm, int nrBimestre) throws SQLException {
        String query = "INSERT INTO nota_bimestre (id_disciplina, id_aluno, nr_bimestre, ano, nota_mensal, nota_bimestral, producao_sala, media, falta, serie_ano) "
                + " VALUES (?,?,?,?,?,?,?,?,?,?)";
        PreparedStatement prep = conn.prepareStatement(query);
        prep.setInt(1, notaBimestreForm.getIdDisciplina());
        prep.setInt(2, notaBimestreForm.getIdAluno());
        prep.setInt(3, notaBimestreForm.getNrBimestre());
        prep.setInt(4, notaBimestreForm.getAno());
        prep.setString(5, notaBimestreForm.getNotaMensal());
        prep.setString(6, notaBimestreForm.getNotaBimestral());
        prep.setString(7, notaBimestreForm.getNotaProducaoSala());
        prep.setString(8, notaBimestreForm.getMediaBimestre());
        prep.setInt(9, notaBimestreForm.getFalta());
        prep.setInt(10, notaBimestreForm.getIdSerieAno());
        prep.execute();
        prep.close();
    }

    public void excluirNota(Connection conn, int idNotaBimestre) throws SQLException {
        String query = "DELETE FROM nota_bimestre WHERE id=?";
        PreparedStatement prep = conn.prepareStatement(query);
        prep.setInt(1, idNotaBimestre);
        prep.execute();
        prep.close();
    }

    public void recuperouNota(Connection conn, int idNotaBimestre) throws SQLException {
        String query = "UPDATE nota_bimestre SET media = 6.0, recuperacao = 1 WHERE id=?";
        PreparedStatement prep = conn.prepareStatement(query);
        prep.setInt(1, idNotaBimestre);
        prep.execute();
        prep.close();
    }

    public List<NotaBimestreForm> obterNotasSerieBimestreAno(Connection conn, NotaBimestreForm notaBimestreForm, int nrBimestre) throws SQLException {
        List<NotaBimestreForm> listaNotas = new ArrayList<>();
        String query = "select pf.nome, n.ano, n.nr_bimestre, d.nome_disciplina, n.nota_mensal,"
                + " n.nota_bimestral, n.producao_sala, n.media, n.falta, n.serie_ano"
                + " from nota_bimestre n, pessoa_fisica pf, disciplina d"
                + " where n.id_aluno = pf.id"
                + " and n.id_disciplina = d.id_disciplina"
                + " and n.id_aluno = ?"
                + " and n.ano = ?"
                + " and n.nr_bimestre = ?"
                + " order by n.nr_bimestre, d.nome_disciplina";

        PreparedStatement prep = conn.prepareStatement(query);
        prep.setInt(1, notaBimestreForm.getIdAluno());
        prep.setInt(2, notaBimestreForm.getAno());
        prep.setInt(3, nrBimestre);
        ResultSet rs = prep.executeQuery();
        while (rs.next()) {
            NotaBimestreForm notaForm = new NotaBimestreForm();

            DisciplinasForm disciplinasForm = new DisciplinasForm();
            disciplinasForm.setNomeDisciplina(rs.getString("nome_disciplina"));
            notaForm.setDisciplinasForm(disciplinasForm);

            AlunoForm alunoForm = new AlunoForm();
            alunoForm.setNome(rs.getString("nome"));
            notaForm.setAlunoForm(alunoForm);

            notaForm.setAno(rs.getInt("ano"));
            notaForm.setNrBimestre(rs.getInt("nr_bimestre"));
            notaForm.setIdSerieAno(rs.getInt("serie_ano"));
            notaForm.setFalta(rs.getInt("falta"));
            notaForm.setMediaBimestre(rs.getString("media"));

            listaNotas.add(notaForm);

        }
        rs.close();
        prep.close();

        return listaNotas;
    }

    public List<NotaBimestreForm> obterAlunosSerieAnoComNota(Connection conn, NotaBimestreForm notaBimestreForm) throws SQLException {
        List<NotaBimestreForm> listaAlunosSerieAnoComNota = new ArrayList<>();
        String query = "select pf.nome, n.id, n.id_aluno, n.ano, n.nr_bimestre, n.serie_ano, d.descricao"
                + " from nota_bimestre n, pessoa_fisica pf, descricao_serie_ano d"
                + " where n.id_aluno = pf.id"
                + " and n.serie_ano = d.id"
                + " and n.ano = ?"
                + " and n.serie_ano = ?"
                + " group by id_aluno"
                + " order by pf.nome";

        PreparedStatement prep = conn.prepareStatement(query);
        prep.setInt(1, notaBimestreForm.getAno());
        prep.setInt(2, notaBimestreForm.getIdSerieAno());
        ResultSet rs = prep.executeQuery();
        while (rs.next()) {
            NotaBimestreForm notaForm = new NotaBimestreForm();

            AlunoForm alunoForm = new AlunoForm();
            alunoForm.setNome(rs.getString("nome"));
            notaForm.setAlunoForm(alunoForm);

            SerieAnoForm serieAnoForm = new SerieAnoForm();
            serieAnoForm.setDsSerieAno(rs.getString("descricao"));
            notaForm.setSerieAnoForm(serieAnoForm);

            notaForm.setIdNotaBimestre(rs.getInt("id"));
            notaForm.setAno(rs.getInt("ano"));
            notaForm.setNrBimestre(rs.getInt("nr_bimestre"));
            notaForm.setIdSerieAno(rs.getInt("serie_ano"));
            notaForm.setIdAluno(rs.getInt("id_aluno"));

            listaAlunosSerieAnoComNota.add(notaForm);

        }
        rs.close();
        prep.close();

        return listaAlunosSerieAnoComNota;
    }

    public String obterCategoriaEnsinoPorSerie(int idSerieAno) {
        String categoriaEnsino = "";

        if (idSerieAno <= 5) { //1,2,3,4,5 ano
            categoriaEnsino = "EF1";
        } else if (idSerieAno > 5 && idSerieAno <= 9) { //6,7,8,9 ano
            categoriaEnsino = "EF2";
        } else { //1,2,3 serie
            categoriaEnsino = "EM";
        }

        return categoriaEnsino;
    }

    public NotaBimestreForm obterNotasFaltasPorDisciplinaAluno(Connection conn, int idDisciplina, int ano, int idAluno, int serieAno) throws SQLException {
        String query = "select pf.nome, n.ano, n.nr_bimestre, d.id_disciplina, d.nome_disciplina,"
                + " n.media, n.falta, n.serie_ano"
                + " from nota_bimestre n, pessoa_fisica pf, disciplina d "
                + " where n.id_aluno = pf.id"
                + " and n.id_disciplina = d.id_disciplina"
                + " and n.id_aluno = ?"
                + " and n.ano = ?"
                + " and n.id_disciplina = ?"
                + " and n.serie_ano = ?"
                + " order by n.nr_bimestre, d.nome_disciplina";
        PreparedStatement prep = conn.prepareStatement(query);
        prep.setInt(1, idAluno);
        prep.setInt(2, ano);
        prep.setInt(3, idDisciplina);
        prep.setInt(4, serieAno);
        ResultSet rs = prep.executeQuery();
        NotaBimestreForm notaBimestreForm = new NotaBimestreForm();
        while (rs.next()) {
            DisciplinasForm disciplinasForm = new DisciplinasForm();
            disciplinasForm.setNomeDisciplina(rs.getString("nome_disciplina"));
            disciplinasForm.setIdDisciplina(rs.getInt("id_disciplina"));
            notaBimestreForm.setDisciplinasForm(disciplinasForm);
            int nrBimestre = rs.getInt("nr_bimestre");
            switch (nrBimestre) {
                case 1:
                    notaBimestreForm.setMedia1Bimestre(rs.getDouble("media"));
                    notaBimestreForm.setFalta1Bimestre(rs.getInt("falta"));
                    break;
                case 2:
                    notaBimestreForm.setMedia2Bimestre(rs.getDouble("media"));
                    notaBimestreForm.setFalta2Bimestre(rs.getInt("falta"));
                    break;
                case 3:
                    notaBimestreForm.setMedia3Bimestre(rs.getDouble("media"));
                    notaBimestreForm.setFalta3Bimestre(rs.getInt("falta"));
                    break;
                case 4:
                    notaBimestreForm.setMedia4Bimestre(rs.getDouble("media"));
                    notaBimestreForm.setFalta4Bimestre(rs.getInt("falta"));
                    break;
                default:
                    break;
            }

        }
        rs.close();
        prep.close();

        return notaBimestreForm;
    }

    public NotaBimestreForm obterNotaPorID(Connection conn, int idNotaBimestre) throws SQLException {
        NotaBimestreForm notaBimestreForm = new NotaBimestreForm();
        String query = "select * from nota_bimestre where id = ?";
        try (PreparedStatement prep = conn.prepareStatement(query)) {
            prep.setInt(1, idNotaBimestre);
            try (ResultSet rs = prep.executeQuery()) {
                if (rs.next()) {
                    notaBimestreForm.setIdNotaBimestre(rs.getInt("id"));
                    notaBimestreForm.setIdDisciplina(rs.getInt("id_disciplina"));
                    notaBimestreForm.setIdAluno(rs.getInt("id_aluno"));
                    notaBimestreForm.setNrBimestre(rs.getInt("nr_bimestre"));
                    notaBimestreForm.setAno(rs.getInt("ano"));
                    notaBimestreForm.setIdSerieAno(rs.getInt("serie_ano"));
                    notaBimestreForm.setFalta(rs.getInt("falta"));
                    notaBimestreForm.setMediaBimestre(rs.getString("media"));
                    notaBimestreForm.setNotaMensal(rs.getString("nota_mensal"));
                    notaBimestreForm.setNotaBimestral(rs.getString("nota_bimestral"));
                    notaBimestreForm.setNotaProducaoSala(rs.getString("producao_sala"));
                }
            }
        }

        return notaBimestreForm;
    }
}
