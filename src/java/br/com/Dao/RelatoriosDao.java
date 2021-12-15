/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.Dao;

import br.com.Form.AlunoForm;
import br.com.Form.DisciplinasForm;
import br.com.Form.NotaBimestreForm;
import br.com.Form.RelatoriosForm;
import br.com.abre.Util.IDRDate;
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
public class RelatoriosDao {

    private static RelatoriosDao relatoriosDao = null;

    public static final RelatoriosDao getInstance() {
        if (relatoriosDao == null) {
            relatoriosDao = new RelatoriosDao();
        }
        return relatoriosDao;
    }

    public List<RelatoriosForm> obterListaTelefonesPais(Connection conn) throws SQLException {
        List<RelatoriosForm> listaTelefonesPais = new ArrayList<>();
        String query = "select d.categoria, d.descricao, pf.nome, pf.telefone_contato, pf.contato_emergencia, a.nome_mae, a.celular_mae, a.nome_pai, a.celular_pai"
                + " from"
                + " alunos a, pessoa_fisica pf, descricao_serie_ano d"
                + " where pf.id = a.id_pessoa_fisica"
                + " and a.serie_ano = d.id"
                + " and pf.status = 1"
                + " order by d.ordem, d.id, pf.nome";

        try ( PreparedStatement prep = conn.prepareStatement(query);  ResultSet rs = prep.executeQuery()) {
            while (rs.next()) {
                RelatoriosForm relForm = new RelatoriosForm();
                AlunoForm alunoForm = new AlunoForm();
                DisciplinasForm discForm = new DisciplinasForm();

                discForm.setCategoriaEnsino(rs.getString("categoria"));
                discForm.setDsCategoriaEnsino(rs.getString("descricao"));
                relForm.setDisciplinasForm(discForm);

                alunoForm.setNome(rs.getString("nome"));
                alunoForm.setTelefoneContato(rs.getString("telefone_contato"));
                alunoForm.setContatoEmergencia(rs.getString("contato_emergencia"));
                alunoForm.setNomeMae(rs.getString("nome_mae"));
                alunoForm.setCelularMae(rs.getString("celular_mae"));
                alunoForm.setNomePai(rs.getString("nome_pai"));
                alunoForm.setCelularPai(rs.getString("celular_pai"));
                relForm.setAlunoForm(alunoForm);

                listaTelefonesPais.add(relForm);
            }
        }

        return listaTelefonesPais;
    }

    public List<RelatoriosForm> obterListaAniversariantes(Connection conn) throws SQLException {
        List<RelatoriosForm> listaTelefonesPais = new ArrayList<>();
        String query = "select pf.nome, d.descricao, d.categoria, pf.data_nascimento, day(pf.data_nascimento) as dia, month(pf.data_nascimento) as mes"
                + " from alunos a, pessoa_fisica pf, descricao_serie_ano d"
                + " where pf.id = a.id_pessoa_fisica"
                + " and a.serie_ano = d.id"
                + " and pf.status = 1"
                + " order by mes, dia, pf.nome";

        try ( PreparedStatement prep = conn.prepareStatement(query);  ResultSet rs = prep.executeQuery()) {
            while (rs.next()) {
                RelatoriosForm relForm = new RelatoriosForm();
                AlunoForm alunoForm = new AlunoForm();
                DisciplinasForm discForm = new DisciplinasForm();

                discForm.setCategoriaEnsino(rs.getString("categoria"));
                discForm.setDsCategoriaEnsino(rs.getString("descricao"));
                relForm.setDisciplinasForm(discForm);

                alunoForm.setNome(rs.getString("nome"));
                alunoForm.setDataNascimento(IDRDate.formatSQLDate(rs.getString("data_nascimento")));
                relForm.setAlunoForm(alunoForm);

                listaTelefonesPais.add(relForm);
            }
        }

        return listaTelefonesPais;
    }

    public List<RelatoriosForm> obterListaNotasPorAlunoAnoBimestre(Connection conn, int idPF, String ano, String nrBimestre, String categoriaEnsino) throws SQLException {
        List<RelatoriosForm> listaNotasPorAlunoAnoBimestre = new ArrayList<>();
        String query = "select d.categoria_ensino, d.nome_disciplina, n.id_disciplina, n.nr_bimestre, n.ano, n.nota_mensal,"
                + " n.nota_bimestral, n.producao_sala, n.media, n.serie_ano"
                + " from"
                + " disciplina d left join nota_bimestre n"
                + " on d.id_disciplina = n.id_disciplina"
                + " and n.id_aluno = ?"
                + " and n.nr_bimestre = ?"
                + " and n.ano = ?"
                + " where"
                + " d.categoria_ensino = ?"
                + " and n.id_disciplina not in (35)"
                + " order by d.nome_disciplina";
        PreparedStatement prep = conn.prepareStatement(query);
        prep.setInt(1, idPF);
        prep.setString(2, nrBimestre);
        prep.setString(3, ano);
        prep.setString(4, categoriaEnsino);
        ResultSet rs = prep.executeQuery();
        while (rs.next()) {
            RelatoriosForm relForm = new RelatoriosForm();
            NotaBimestreForm notaForm = new NotaBimestreForm();
            DisciplinasForm discForm = new DisciplinasForm();

            discForm.setCategoriaEnsino(rs.getString("categoria_ensino"));
            discForm.setNomeDisciplina(rs.getString("nome_disciplina"));
            notaForm.setIdDisciplina(rs.getInt("id_disciplina"));
            notaForm.setNrBimestre(rs.getInt("nr_bimestre"));
            notaForm.setAno(rs.getInt("ano"));
            notaForm.setNotaMensal(rs.getString("nota_mensal"));
            notaForm.setNotaBimestral(rs.getString("nota_bimestral"));
            notaForm.setNotaProducaoSala(rs.getString("producao_sala"));
            notaForm.setMediaBimestre(rs.getString("media"));
            notaForm.setIdSerieAno(rs.getInt("serie_ano"));
            relForm.setNotaBimestreForm(notaForm);
            relForm.setDisciplinasForm(discForm);

            listaNotasPorAlunoAnoBimestre.add(relForm);
        }
        rs.close();
        prep.close();

        return listaNotasPorAlunoAnoBimestre;
    }

    public List<RelatoriosForm> obterHistoricoLancamentoNotasPorData(Connection conn, RelatoriosForm relForm) throws SQLException {
        List<RelatoriosForm> historicoLancamentoNotas = new ArrayList<>();
        String query = "select h.id_aluno, pf.nome, h.id_professor_responsavel_cadastro, h.nome_professor_responsavel_cadastro,"
                + " h.data_cadastro, h.descricao, h.id_disciplina, h.nr_bimestre, h.serie_ano, h.ano, d.nome_disciplina, ds.descricao as ds_serie"
                + " from historico_lancamento_nota h, disciplina d, descricao_serie_ano ds, pessoa_fisica pf"
                + " where "
                + " h.id_disciplina = d.id_disciplina"
                + " and h.id_aluno = pf.id"
                + " and h.serie_ano = ds.id"
                + " and h.data_cadastro between ? and ?"
                + " order by h.data_cadastro desc";
        try ( PreparedStatement prep = conn.prepareStatement(query)) {
            prep.setString(1, IDRDate.parseDataIso(relForm.getDataInicio()));
            prep.setString(2, IDRDate.parseDataIso(relForm.getDataFim()));
            try ( ResultSet rs = prep.executeQuery()) {
                while (rs.next()) {
                    RelatoriosForm relatoriosForm = new RelatoriosForm();
                    AlunoForm alunoForm = new AlunoForm();
                    alunoForm.setIdAluno(rs.getInt("id_aluno"));
                    alunoForm.setNome(rs.getString("nome"));
                    alunoForm.setIdProfessorHistorico(rs.getInt("id_professor_responsavel_cadastro"));
                    alunoForm.setNomeProfessor(rs.getString("nome_professor_responsavel_cadastro"));
                    alunoForm.setDataCadastro(rs.getString("data_cadastro"));
                    alunoForm.setDescricaoHistorico(rs.getString("descricao"));
                    alunoForm.setDsSerieAno(rs.getString("ds_serie"));
                    relatoriosForm.setAlunoForm(alunoForm);

                    DisciplinasForm disciplinasForm = new DisciplinasForm();
                    disciplinasForm.setIdDisciplina(rs.getInt("id_disciplina"));
                    disciplinasForm.setNomeDisciplina(rs.getString("nome_disciplina"));
                    relatoriosForm.setDisciplinasForm(disciplinasForm);

                    relatoriosForm.setNrBimestre(rs.getInt("nr_bimestre"));
                    historicoLancamentoNotas.add(relatoriosForm);

                }
            }
        }
        return historicoLancamentoNotas;
    }

    public ArrayList<RelatoriosForm> obterMelhoresNotasPorBimestre(Connection conn, int serieAno, String qtdMelhoresNotas, String ano, String nrBimestre) throws SQLException {
        ArrayList<RelatoriosForm> listaMelhoresMedias = new ArrayList<>();
        String query = "select n.id_aluno, SUM(n.media), CAST(AVG(n.media) AS DECIMAL(10,2)) as media_total, pf.nome, n.serie_ano, d.descricao"
                + " from nota_bimestre n, pessoa_fisica pf, descricao_serie_ano d"
                + " where "
                + " n.id_aluno = pf.id"
                + " and n.serie_ano = d.id"
                + " and n.ano = ?"
                + " and n.nr_bimestre = ?"
                + " and n.serie_ano = ?"
                + " and n.id_disciplina not in (35)"
                + " group by n.id_aluno"
                + " order by n.serie_ano, media_total desc"
                + " limit " + qtdMelhoresNotas;
        try ( PreparedStatement prep = conn.prepareStatement(query)) {
            prep.setString(1, ano);
            prep.setString(2, nrBimestre);
            prep.setInt(3, serieAno);
            try ( ResultSet rs = prep.executeQuery()) {
                while (rs.next()) {
                    RelatoriosForm relForm = new RelatoriosForm();
                    AlunoForm alunoForm = new AlunoForm();
                    alunoForm.setIdAluno(rs.getInt("id_aluno"));
                    alunoForm.setNome(rs.getString("nome"));
                    alunoForm.setDsSerieAno(rs.getString("descricao"));
                    relForm.setAlunoForm(alunoForm);

                    NotaBimestreForm notaForm = new NotaBimestreForm();
                    notaForm.setMediaBimestre(rs.getString("media_total"));
                    relForm.setNotaBimestreForm(notaForm);

                    listaMelhoresMedias.add(relForm);
                }
            }
        }

        return listaMelhoresMedias;
    }

    public List<RelatoriosForm> obterListaEnderecoTelefone(Connection conn) throws SQLException {
        List<RelatoriosForm> listaTelefonesPais = new ArrayList<>();
        String query = "select d.categoria, d.descricao, pf.nome, pf.sexo, pf.provincia, pf.cidade, pf.endereco, a.nome_mae, a.celular_mae,"
                + " a.nome_pai, a.celular_pai, pf.telefone_contato, pf.contato_emergencia, a.linha_transporte, a.horario_transporte"
                + " from pessoa_fisica pf, alunos a, descricao_serie_ano d"
                + " where pf.id = a.id_pessoa_fisica"
                + " and a.serie_ano = d.id"
                + " and pf.status = 1"
                + " order by d.ordem, d.id, pf.nome";

        try ( PreparedStatement prep = conn.prepareStatement(query);  ResultSet rs = prep.executeQuery()) {
            while (rs.next()) {
                RelatoriosForm relForm = new RelatoriosForm();
                AlunoForm alunoForm = new AlunoForm();
                DisciplinasForm discForm = new DisciplinasForm();

                discForm.setCategoriaEnsino(rs.getString("categoria"));
                discForm.setDsCategoriaEnsino(rs.getString("descricao"));
                relForm.setDisciplinasForm(discForm);

                alunoForm.setNome(rs.getString("nome"));
                alunoForm.setSexo(rs.getString("sexo"));
                alunoForm.setProvincia(rs.getString("provincia"));
                alunoForm.setCidade(rs.getString("cidade"));
                alunoForm.setDsEndereco(rs.getString("endereco"));
                alunoForm.setNomeMae(rs.getString("nome_mae"));
                alunoForm.setCelularMae(rs.getString("celular_mae"));
                alunoForm.setNomePai(rs.getString("nome_pai"));
                alunoForm.setCelularPai(rs.getString("celular_pai"));
                alunoForm.setTelefoneContato(rs.getString("telefone_contato"));
                alunoForm.setContatoEmergencia(rs.getString("contato_emergencia"));
                alunoForm.setLinhaTransporte(rs.getString("linha_transporte"));
                alunoForm.setHorarioTransporte(rs.getString("horario_transporte"));
                relForm.setAlunoForm(alunoForm);

                listaTelefonesPais.add(relForm);
            }
        }

        return listaTelefonesPais;
    }

    public RelatoriosForm obterInformacaoPorCategoria(Connection conn, int idCategoria) throws SQLException {
        String query = "select pf.nome, pf.sexo, a.serie_ano, d.descricao"
                + " from pessoa_fisica pf, alunos a, ano_vigente ano, descricao_serie_ano d"
                + " where pf.id = a.id_pessoa_fisica"
                + " and a.ano_vigente = ano.ano_vigente"
                + " and a.serie_ano = d.id"
                + " and d.ordem = ?"
                + " and pf.status = 1"
                + " order by d.ordem, d.id, pf.nome";

        PreparedStatement prep = conn.prepareStatement(query);
        prep.setInt(1, idCategoria);
        ResultSet rs = prep.executeQuery();
        int qtdMasc = 0;
        int qtdFem = 0;
        RelatoriosForm relatoriosForm = new RelatoriosForm();
        while (rs.next()) {

            AlunoForm alunoForm = new AlunoForm();
            alunoForm.setNome(rs.getString("nome"));
            alunoForm.setSexo(rs.getString("sexo"));
            if (alunoForm.getSexo().equals("feminino")) {
                qtdFem += 1;
            } else {
                qtdMasc += 1;
            }
            relatoriosForm.setAlunoForm(alunoForm);
        }
        rs.close();
        prep.close();

        relatoriosForm.setQtdFeminino(qtdFem);
        relatoriosForm.setQtdMasculino(qtdMasc);
        relatoriosForm.setQtdAmbosSexo(qtdMasc + qtdFem);

        return relatoriosForm;
    }

    public RelatoriosForm obterInformacaoPorSerie(Connection conn, int idSerieAno) throws SQLException {
        String query = "select pf.nome, pf.sexo, a.serie_ano, d.descricao"
                + " from pessoa_fisica pf, alunos a, ano_vigente ano, descricao_serie_ano d"
                + " where pf.id = a.id_pessoa_fisica"
                + " and a.ano_vigente = ano.ano_vigente"
                + " and a.serie_ano = d.id"
                + " and a.serie_ano = ?"
                + " and pf.status = 1"
                + " order by d.ordem, d.id, pf.nome";

        PreparedStatement prep = conn.prepareStatement(query);
        prep.setInt(1, idSerieAno);
        ResultSet rs = prep.executeQuery();
        int qtdMasc = 0;
        int qtdFem = 0;
        RelatoriosForm relatoriosForm = new RelatoriosForm();
        while (rs.next()) {
            AlunoForm alunoForm = new AlunoForm();
            alunoForm.setNome(rs.getString("nome"));
            alunoForm.setSexo(rs.getString("sexo"));
            if (alunoForm.getSexo().equals("feminino")) {
                qtdFem += 1;
            } else {
                qtdMasc += 1;
            }
            relatoriosForm.setAlunoForm(alunoForm);
        }
        rs.close();
        prep.close();

        relatoriosForm.setQtdFeminino(qtdFem);
        relatoriosForm.setQtdMasculino(qtdMasc);
        relatoriosForm.setQtdAmbosSexo(qtdMasc + qtdFem);

        return relatoriosForm;
    }

    public int obterQtdEstudantePorSexo(Connection conn, String sexo) throws SQLException {
        int qtdPorSexo = 0;
        String query = "select count(*) as qtdTotal"
                + " from pessoa_fisica pf, alunos a, ano_vigente ano"
                + " where pf.id = a.id_pessoa_fisica"
                + " and a.ano_vigente = ano.ano_vigente"
                + " and pf.sexo = ?"
                + " and pf.status = 1";
        PreparedStatement prep = conn.prepareStatement(query);
        prep.setString(1, sexo);
        ResultSet rs = prep.executeQuery();
        if (rs.next()) {
            qtdPorSexo = rs.getInt("qtdTotal");
        }
        rs.close();
        prep.close();

        return qtdPorSexo;
    }

    public NotaBimestreForm obterMediasBimestraisPorAlunoDisciplina(Connection conn, int idAluno, int idDisciplina, String ano) throws SQLException {
        String query = "select pf.nome, n.id_aluno, n.id_disciplina, d.nome_disciplina, n.media, n.nr_bimestre"
                + " from nota_bimestre n, disciplina d, pessoa_fisica pf"
                + " where n.id_disciplina = d.id_disciplina"
                + " and n.id_aluno = pf.id"
                + " and n.id_aluno = ?"
                + " and n.id_disciplina = ?"
                + " and n.ano = ?"
                + " order by n.nr_bimestre";
        PreparedStatement prep = conn.prepareStatement(query);
        prep.setInt(1, idAluno);
        prep.setInt(2, idDisciplina);
        prep.setString(3, ano);
        ResultSet rs = prep.executeQuery();
        NotaBimestreForm notaBimestreForm = new NotaBimestreForm();
        while (rs.next()) {
            notaBimestreForm.setIdAluno(rs.getInt("id_aluno"));
            notaBimestreForm.setNomeAluno(rs.getString("nome"));
            notaBimestreForm.setIdDisciplina(rs.getInt("id_disciplina"));
            notaBimestreForm.setNomeDisciplina(rs.getString("nome_disciplina"));
            int nrBimestre = rs.getInt("nr_bimestre");
            switch (nrBimestre) {
                case 1:
                    String mediaBim1 = rs.getString("media");
                    if (mediaBim1 != null && !mediaBim1.equals("")) {
                        notaBimestreForm.setMedia1Bimestre(rs.getDouble("media"));
                    }
                    break;
                case 2:
                    String mediaBim2 = rs.getString("media");
                    if (mediaBim2 != null && !mediaBim2.equals("")) {
                        notaBimestreForm.setMedia2Bimestre(rs.getDouble("media"));
                    }
                    break;
                case 3:
                    String mediaBim3 = rs.getString("media");
                    if (mediaBim3 != null && !mediaBim3.equals("")) {
                        notaBimestreForm.setMedia3Bimestre(rs.getDouble("media"));
                    }
                    break;
                case 4:
                    String mediaBim4 = rs.getString("media");
                    if (mediaBim4 != null && !mediaBim4.equals("")) {
                        notaBimestreForm.setMedia4Bimestre(rs.getDouble("media"));
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

    public List<RelatoriosForm> obterListaFaltasPorBimestre(Connection conn, String idSerieAno, String nrBimestre, String ano) throws SQLException {
        List<RelatoriosForm> listaRelFaltas = new ArrayList<>();
        String query = "select d.nome_disciplina, pf.nome, SUM(l.qtd_falta) as qtd_faltas, SUM(l.qtd_aula) as qtd_aulas,"
                + " l.nr_bimestre, l.ano"
                + " from lista_presenca l , disciplina d, pessoa_fisica pf"
                + " where l.id_disciplina = d.id_disciplina"
                + " and l.id_aluno = pf.id"
                + " and l.id_serie = ?"
                + " and l.nr_bimestre = ?"
                + " and l.ano = ?"
                + " group by l.id_disciplina, l.id_aluno"
                + " order by d.nome_disciplina, pf.nome";
        
        PreparedStatement prep = conn.prepareStatement(query);
        prep.setString(1, idSerieAno);
        prep.setString(2, nrBimestre);
        prep.setString(3, ano);
        ResultSet rs = prep.executeQuery();
        while(rs.next()) {
            RelatoriosForm relForm = new RelatoriosForm();
            relForm.setNomeDisciplina(rs.getString("nome_disciplina"));
            relForm.setNomeAluno(rs.getString("nome"));
            relForm.setQtdFaltas(rs.getInt("qtd_faltas"));
            relForm.setQtdAulas(rs.getInt("qtd_aulas"));
            relForm.setNrBimestre(rs.getInt("nr_bimestre"));
            relForm.setAno(rs.getInt("ano"));
            listaRelFaltas.add(relForm);
        }
        rs.close();
        prep.close();
        
        return listaRelFaltas;
        
    }

}
