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

    public int obterFaltasListaPresenca(Connection conn, int idDisciplina, int ano, int idAluno, int serieAno, int nrBimestre) throws SQLException {
        int qtdFalta = -1;
        String query = "select SUM(l.qtd_falta) as qtd_falta"
                + " from lista_presenca l "
                + " where l.id_aluno = ?"
                + " and l.id_serie = ?"
                + " and l.nr_bimestre = ?"
                + " and l.id_disciplina = ?"
                + " and l.ano = ?"
                + " group by l.id_aluno";
        PreparedStatement prep = conn.prepareStatement(query);
        prep.setInt(1, idAluno);
        prep.setInt(2, serieAno);
        prep.setInt(3, nrBimestre);
        prep.setInt(4, idDisciplina);
        prep.setInt(5, ano);
        ResultSet rs = prep.executeQuery();
        if (rs.next()) {
            qtdFalta = rs.getInt("qtd_falta");
        }
        rs.close();
        prep.close();

        return qtdFalta;
    }

    public void lancarNota(Connection conn, NotaBimestreForm notaBimestreForm, int nrBimestre) throws SQLException {
        String query = "INSERT INTO nota_bimestre (id_disciplina, id_aluno, nr_bimestre, ano, nota_mensal, nota_bimestral, producao_sala, media, serie_ano) "
                + " VALUES (?,?,?,?,?,?,?,?,?)";
        PreparedStatement prep = conn.prepareStatement(query);
        prep.setInt(1, notaBimestreForm.getIdDisciplina());
        prep.setInt(2, notaBimestreForm.getIdAluno());
        prep.setInt(3, notaBimestreForm.getNrBimestre());
        prep.setInt(4, notaBimestreForm.getAno());
        prep.setString(5, notaBimestreForm.getNotaMensal());
        prep.setString(6, notaBimestreForm.getNotaBimestral());
        prep.setString(7, notaBimestreForm.getNotaProducaoSala());
        prep.setString(8, notaBimestreForm.getMediaBimestre());
//        prep.setInt(9, notaBimestreForm.getFalta());
        prep.setInt(9, notaBimestreForm.getIdSerieAno());
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
                + " and n.id_disciplina not in (35)"
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
        } else if (idSerieAno >= 11 && idSerieAno <= 13) {
            categoriaEnsino = "INF";
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
            int qtdFalta = this.obterFaltasListaPresenca(conn, idDisciplina, ano, idAluno, serieAno, nrBimestre);
            switch (nrBimestre) {
                case 1:
                    String mediaBim1 = rs.getString("media");
                    if (mediaBim1 != null && !mediaBim1.equals("")) {
                        notaBimestreForm.setMedia1Bimestre(rs.getDouble("media"));
                    }
                    if (qtdFalta > 0) {
                        notaBimestreForm.setFalta1Bimestre(qtdFalta);
                    } else {
                        notaBimestreForm.setFalta1Bimestre(rs.getInt("falta"));
                    }
                    break;
                case 2:
                    String mediaBim2 = rs.getString("media");
                    if (mediaBim2 != null && !mediaBim2.equals("")) {
                        notaBimestreForm.setMedia2Bimestre(rs.getDouble("media"));
                    }
                    if (qtdFalta > 0) {
                        notaBimestreForm.setFalta2Bimestre(qtdFalta);
                    } else {
                        notaBimestreForm.setFalta2Bimestre(rs.getInt("falta"));
                    }
                    break;
                case 3:
                    String mediaBim3 = rs.getString("media");
                    if (mediaBim3 != null && !mediaBim3.equals("")) {
                        notaBimestreForm.setMedia3Bimestre(rs.getDouble("media"));
                    }
                    if (qtdFalta > 0) {
                        notaBimestreForm.setFalta3Bimestre(qtdFalta);
                    } else {
                        notaBimestreForm.setFalta3Bimestre(rs.getInt("falta"));
                    }
                    break;
                case 4:
                    String mediaBim4 = rs.getString("media");
                    if (mediaBim4 != null && !mediaBim4.equals("")) {
                        notaBimestreForm.setMedia4Bimestre(rs.getDouble("media"));
                    }
                    if (qtdFalta > 0) {
                        notaBimestreForm.setFalta4Bimestre(qtdFalta);
                    } else {
                        notaBimestreForm.setFalta4Bimestre(rs.getInt("falta"));
                    }
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
        String query = "select n.id, n.id_disciplina, n.id_aluno, n.nr_bimestre, n.ano, n.serie_ano, n.falta,"
                + " n.media, n.nota_mensal, n.nota_bimestral, n.producao_sala, d.nome_disciplina, pf.nome, ds.descricao, ds.categoria "
                + " from nota_bimestre n, disciplina d, pessoa_fisica pf, descricao_serie_ano ds"
                + " where n.id_disciplina = d.id_disciplina "
                + " and n.id_aluno = pf.id"
                + " and n.serie_ano = ds.id"
                + " and n.id = ?";
        try ( PreparedStatement prep = conn.prepareStatement(query)) {
            prep.setInt(1, idNotaBimestre);
            try ( ResultSet rs = prep.executeQuery()) {
                if (rs.next()) {
                    notaBimestreForm.setIdNotaBimestre(rs.getInt("id"));
                    notaBimestreForm.setIdDisciplina(rs.getInt("id_disciplina"));
                    notaBimestreForm.setNomeDisciplina(rs.getString("nome_disciplina"));
                    notaBimestreForm.setIdAluno(rs.getInt("id_aluno"));
                    notaBimestreForm.setNrBimestre(rs.getInt("nr_bimestre"));
                    notaBimestreForm.setAno(rs.getInt("ano"));
                    notaBimestreForm.setIdSerieAno(rs.getInt("serie_ano"));
                    notaBimestreForm.setFalta(rs.getInt("falta"));
                    notaBimestreForm.setMediaBimestre(rs.getString("media"));
                    notaBimestreForm.setNotaMensal(rs.getString("nota_mensal"));
                    notaBimestreForm.setNotaBimestral(rs.getString("nota_bimestral"));
                    notaBimestreForm.setNotaProducaoSala(rs.getString("producao_sala"));
                    notaBimestreForm.setDsSerieAno(rs.getString("descricao"));
                    notaBimestreForm.setCategoriaEnsino(rs.getString("categoria"));
                    notaBimestreForm.setNomeAluno(rs.getString("nome"));
                }
            }
        }

        return notaBimestreForm;
    }

    public List<NotaBimestreForm> obterListaMediaAnualPorAluno(Connection conn, int idPF, int idSerieAno, int anoVigente) throws SQLException {
        List<NotaBimestreForm> listaNotasAlunos = new ArrayList();
        String query = "select sum(n.media) as totalMedia, n.serie_ano, n.ano, d.id_disciplina, d.nome_disciplina, n.id_aluno, pf.nome"
                + " from nota_bimestre n, disciplina d, pessoa_fisica pf "
                + " where n.id_disciplina = d.id_disciplina"
                + " and n.id_aluno = pf.id"
                + " and n.serie_ano = ?"
                + " and n.id_aluno = ?"
                + " and n.ano = ?"
                + " group by n.id_disciplina"
                + " order by d.nome_disciplina";

        PreparedStatement prep = conn.prepareStatement(query);
        prep.setInt(1, idSerieAno);
        prep.setInt(2, idPF);
        prep.setInt(3, anoVigente);
        ResultSet rs = prep.executeQuery();
        while (rs.next()) {
            NotaBimestreForm notaBimestreForm = new NotaBimestreForm();
            double mediaAnual = rs.getDouble("totalMedia") / 4;
            double mediaArredondada = Math.round(mediaAnual / 0.5) * 0.5;
            notaBimestreForm.setIdDisciplina(rs.getInt("id_disciplina"));
            notaBimestreForm.setNomeDisciplina(rs.getString("nome_disciplina"));
            notaBimestreForm.setIdAluno(rs.getInt("id_aluno"));
            notaBimestreForm.setNomeAluno(rs.getString("nome"));
            notaBimestreForm.setMediaFinal(mediaArredondada);

            if (mediaArredondada < 6.0) {
                listaNotasAlunos.add(notaBimestreForm);
            }
        }
        rs.close();
        prep.close();

        return listaNotasAlunos;
    }

    public NotaBimestreForm obterNotaPorAlunoDiscBimestre(Connection conn, int idSerieAno, int nrBimestre, int idDisciplina, int idAluno) throws SQLException {
        NotaBimestreForm notaBimestreForm = new NotaBimestreForm();
        String query = "select n.nota_mensal,  n.nota_bimestral, n.producao_sala, n.media, n.falta"
                + " from nota_bimestre n, ano_vigente av "
                + " where n.ano = av.ano_vigente"
                + " and n.serie_ano = ?"
                + " and n.nr_bimestre = ?"
                + " and n.id_disciplina = ?"
                + " and n.id_aluno = ?";
        try ( PreparedStatement prep = conn.prepareStatement(query)) {
            prep.setInt(1, idSerieAno);
            prep.setInt(2, nrBimestre);
            prep.setInt(3, idDisciplina);
            prep.setInt(4, idAluno);
            try ( ResultSet rs = prep.executeQuery()) {
                if (rs.next()) {
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

    public void atualizarNota(Connection conn, NotaBimestreForm notaBimestreForm) throws SQLException {
        String query = "UPDATE nota_bimestre SET nota_mensal=?, nota_bimestral=?, producao_sala=?, media=? WHERE id=?";
        PreparedStatement prep = conn.prepareStatement(query);
        prep.setString(1, notaBimestreForm.getNotaMensal());
        prep.setString(2, notaBimestreForm.getNotaBimestral());
        prep.setString(3, notaBimestreForm.getNotaProducaoSala());
        prep.setString(4, notaBimestreForm.getMediaBimestre());
        prep.setInt(5, notaBimestreForm.getIdNotaBimestre());
        prep.execute();
        prep.close();
    }

    public List<NotaBimestreForm> obterNotasPorAluno(Connection conn, int idAluno) throws SQLException {
        List<NotaBimestreForm> listaNotas = new ArrayList<>();
        String query = "select d.categoria_ensino, d.id_disciplina, d.nome_disciplina, ds.descricao,"
                + " n.nr_bimestre, n.nota_mensal, n.nota_bimestral, n.producao_sala, n.media, n.ano, n.serie_ano, pf.nome"
                + " from nota_bimestre n, disciplina d, ano_vigente a, descricao_serie_ano ds, pessoa_fisica pf "
                + " where n.id_disciplina = d.id_disciplina"
                + " and n.ano = a.ano_vigente"
                + " and n.serie_ano = ds.id"
                + " and n.id_aluno = pf.id"
                + " and n.id_aluno = ?"
                + " order by n.nr_bimestre, d.nome_disciplina";
        PreparedStatement prep = conn.prepareStatement(query);
        prep.setInt(1, idAluno);
        ResultSet rs = prep.executeQuery();
        while (rs.next()) {
            NotaBimestreForm notaForm = new NotaBimestreForm();
            notaForm.setNomeAluno(rs.getString("nome"));
            notaForm.setCategoriaEnsino(rs.getString("categoria_ensino"));
            notaForm.setIdDisciplina(rs.getInt("id_disciplina"));
            notaForm.setNomeDisciplina(rs.getString("nome_disciplina"));
            notaForm.setDsSerieAno(rs.getString("descricao"));
            notaForm.setNrBimestre(rs.getInt("nr_bimestre"));
            notaForm.setMediaBimestre(rs.getString("media"));
            notaForm.setNotaMensal(rs.getString("nota_mensal"));
            notaForm.setNotaBimestral(rs.getString("nota_bimestral"));
            notaForm.setNotaProducaoSala(rs.getString("producao_sala"));
            notaForm.setAno(rs.getInt("ano"));
            notaForm.setIdSerieAno(rs.getInt("serie_ano"));
            int qtdFalta = this.obterFaltasListaPresenca(conn, notaForm.getIdDisciplina(), notaForm.getAno(), idAluno, notaForm.getIdSerieAno(), notaForm.getNrBimestre());
            notaForm.setFalta(qtdFalta);
            
            listaNotas.add(notaForm);
        }
        rs.close();
        prep.close();
        
        return listaNotas;
    }
}
