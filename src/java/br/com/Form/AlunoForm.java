/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.Form;

import br.com.Util.Utilitario;
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
public class AlunoForm extends PessoaFisicaForm {

    private int idAluno;
    private String numeroIDAluno;
    private int serieAno;
    private String dsSerieAno;
    private String celularAluno;
    private String nomePai;
    private String celularPai;
    private String emailPai;
    private String escolaridadePai;
    private String nomeMae;
    private String celularMae;
    private String emailMae;
    private String escolaridadeMae;
    private boolean utilizacaoTransporte;
    private String linhaTransporte;
    private String horarioTransporte;
    private String dataMatricula;
    private String dataSaida;
    private String tipoAlimentacao;
    private String restricaoAlimentar;
    private String observacaoSaude;
    private String observacao;
    private String autorizacaoImagem;
    private NotaBimestreForm notaBimestre;
    List<RelatoriosForm> listaNotas;
    private int idHistorico;
    private String dataHistorico;
    private String assuntoHistorico;
    private String descricaoHistorico;
    private int idProfessorHistorico;
    private String nomeProfessor;
    private int ano;
    private int idItinerarioAluno;
    private String periodo;

    public String getPeriodo() {
        return periodo;
    }

    public void setPeriodo(String periodo) {
        this.periodo = periodo;
    }
    
    public int getIdItinerarioAluno() {
        return idItinerarioAluno;
    }

    public void setIdItinerarioAluno(int idItinerarioAluno) {
        this.idItinerarioAluno = idItinerarioAluno;
    }
    
    public int getAno() {
        return ano;
    }

    public void setAno(int ano) {
        this.ano = ano;
    }

    public int getIdHistorico() {
        return idHistorico;
    }

    public void setIdHistorico(int idHistorico) {
        this.idHistorico = idHistorico;
    }

    public String getNomeProfessor() {
        return nomeProfessor;
    }

    public void setNomeProfessor(String nomeProfessor) {
        this.nomeProfessor = nomeProfessor;
    }

    public int getIdProfessorHistorico() {
        return idProfessorHistorico;
    }

    public void setIdProfessorHistorico(int idProfessorHistorico) {
        this.idProfessorHistorico = idProfessorHistorico;
    }

    public String getAssuntoHistorico() {
        return assuntoHistorico;
    }

    public void setAssuntoHistorico(String assuntoHistorico) {
        this.assuntoHistorico = assuntoHistorico;
    }

    public String getDescricaoHistorico() {
        return descricaoHistorico;
    }

    public void setDescricaoHistorico(String descricaoHistorico) {
        this.descricaoHistorico = descricaoHistorico;
    }

    public String getDataHistorico() {
        return dataHistorico;
    }

    public void setDataHistorico(String dataHistorico) {
        this.dataHistorico = dataHistorico;
    }

    public List<RelatoriosForm> getListaNotas() {
        return listaNotas;
    }

    public void setListaNotas(List<RelatoriosForm> listaNotas) {
        this.listaNotas = listaNotas;
    }

    public NotaBimestreForm getNotaBimestre() {
        return notaBimestre;
    }

    public void setNotaBimestre(NotaBimestreForm notaBimestre) {
        this.notaBimestre = notaBimestre;
    }

    public int getIdAluno() {
        return idAluno;
    }

    public void setIdAluno(int idAluno) {
        this.idAluno = idAluno;
    }

    public String getNumeroIDAluno() {
        return numeroIDAluno;
    }

    public void setNumeroIDAluno(String numeroIDAluno) {
        this.numeroIDAluno = numeroIDAluno;
    }

    public int getSerieAno() {
        return serieAno;
    }

    public void setSerieAno(int serieAno) {
        this.serieAno = serieAno;
    }

    public String getDsSerieAno() {
        return dsSerieAno;
    }

    public void setDsSerieAno(String dsSerieAno) {
        this.dsSerieAno = dsSerieAno;
    }

    public String getCelularAluno() {
        return celularAluno;
    }

    public void setCelularAluno(String celularAluno) {
        this.celularAluno = celularAluno;
    }

    public String getNomePai() {
        return nomePai;
    }

    public void setNomePai(String nomePai) {
        this.nomePai = nomePai;
    }

    public String getCelularPai() {
        return celularPai;
    }

    public void setCelularPai(String celularPai) {
        this.celularPai = celularPai;
    }

    public String getEmailPai() {
        return emailPai;
    }

    public void setEmailPai(String emailPai) {
        this.emailPai = emailPai;
    }

    public String getEscolaridadePai() {
        return escolaridadePai;
    }

    public void setEscolaridadePai(String escolaridadePai) {
        this.escolaridadePai = escolaridadePai;
    }

    public String getNomeMae() {
        return nomeMae;
    }

    public void setNomeMae(String nomeMae) {
        this.nomeMae = nomeMae;
    }

    public String getCelularMae() {
        return celularMae;
    }

    public void setCelularMae(String celularMae) {
        this.celularMae = celularMae;
    }

    public String getEmailMae() {
        return emailMae;
    }

    public void setEmailMae(String emailMae) {
        this.emailMae = emailMae;
    }

    public String getEscolaridadeMae() {
        return escolaridadeMae;
    }

    public void setEscolaridadeMae(String escolaridadeMae) {
        this.escolaridadeMae = escolaridadeMae;
    }

    public boolean isUtilizacaoTransporte() {
        return utilizacaoTransporte;
    }

    public void setUtilizacaoTransporte(boolean utilizacaoTransporte) {
        this.utilizacaoTransporte = utilizacaoTransporte;
    }

    public String getLinhaTransporte() {
        return linhaTransporte;
    }

    public void setLinhaTransporte(String linhaTransporte) {
        this.linhaTransporte = linhaTransporte;
    }

    public String getHorarioTransporte() {
        return horarioTransporte;
    }

    public void setHorarioTransporte(String horarioTransporte) {
        this.horarioTransporte = horarioTransporte;
    }

    public String getDataMatricula() {
        return dataMatricula;
    }

    public void setDataMatricula(String dataMatricula) {
        this.dataMatricula = dataMatricula;
    }

    public String getDataSaida() {
        return dataSaida;
    }

    public void setDataSaida(String dataSaida) {
        this.dataSaida = dataSaida;
    }

    public String getTipoAlimentacao() {
        return tipoAlimentacao;
    }

    public void setTipoAlimentacao(String tipoAlimentacao) {
        this.tipoAlimentacao = tipoAlimentacao;
    }

    public String getRestricaoAlimentar() {
        return restricaoAlimentar;
    }

    public void setRestricaoAlimentar(String restricaoAlimentar) {
        this.restricaoAlimentar = restricaoAlimentar;
    }

    public String getObservacaoSaude() {
        return observacaoSaude;
    }

    public void setObservacaoSaude(String observacaoSaude) {
        this.observacaoSaude = observacaoSaude;
    }

    public String getObservacao() {
        return observacao;
    }

    public void setObservacao(String observacao) {
        this.observacao = observacao;
    }

    public String getAutorizacaoImagem() {
        return autorizacaoImagem;
    }

    public void setAutorizacaoImagem(String autorizacaoImagem) {
        this.autorizacaoImagem = autorizacaoImagem;
    }

    public void inserirAluno(Connection conn, AlunoForm alunoForm, int idPessoaFisica) throws SQLException {
        String query = "INSERT INTO alunos (id_pessoa_fisica, numero_id_aluno, serie_ano, celular_aluno, nome_pai, alimentacao, celular_pai, email_pai, escolaridade_pai,"
                + " nome_mae, celular_mae, email_mae, escolaridade_mae, linha_transporte, horario_transporte, restricao_alimentar, observacao_saude, ds_observacao,"
                + " data_matricula, autorizacao_imagem, periodo) "
                + " VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

        PreparedStatement prep = conn.prepareStatement(query);
        prep.setInt(1, idPessoaFisica);
        prep.setString(2, alunoForm.getNumeroIDAluno());
        prep.setInt(3, alunoForm.getSerieAno());
        prep.setString(4, alunoForm.getCelularAluno());
        prep.setString(5, alunoForm.getNomePai());
        prep.setString(6, alunoForm.getTipoAlimentacao());
        prep.setString(7, alunoForm.getCelularPai());
        prep.setString(8, alunoForm.getEmailPai());
        prep.setString(9, alunoForm.getEscolaridadePai());
        prep.setString(10, alunoForm.getNomeMae());
        prep.setString(11, alunoForm.getCelularMae());
        prep.setString(12, alunoForm.getEmailMae());
        prep.setString(13, alunoForm.getEscolaridadeMae());
        prep.setString(14, alunoForm.getLinhaTransporte());
        prep.setString(15, alunoForm.getHorarioTransporte());
        prep.setString(16, alunoForm.getRestricaoAlimentar());
        prep.setString(17, alunoForm.getObservacaoSaude());
        prep.setString(18, alunoForm.getObservacao());
        if (alunoForm.getDataMatricula() != null) {
            prep.setString(19, IDRDate.parseDataIso(alunoForm.getDataMatricula()));
        } else {
            prep.setString(19, null);
        }
        prep.setString(20, alunoForm.getAutorizacaoImagem());
        prep.setString(21, alunoForm.getPeriodo());
        prep.execute();
        prep.close();
    }

    public ArrayList<AlunoForm> obterListaAlunos(Connection conn, AlunoForm alunoForm) throws SQLException {
        ArrayList<AlunoForm> listaAlunos = new ArrayList<>();
        StringBuilder sb = new StringBuilder();
        sb.append("select pf.id, pf.nome, pf.data_nascimento, pf.sexo, pf.cidade, pf.provincia, a.id as id_aluno, a.serie_ano, pf.email, pf.status, a.numero_id_aluno ");
        sb.append(" from pessoa_fisica pf, alunos a");
        sb.append(" where pf.id = a.id_pessoa_fisica");
        if (alunoForm.getNome() != null && !("").equals(alunoForm.getNome())) {
            sb.append(" and pf.nome like '%").append(alunoForm.getNome()).append("%'");
        }
        if (alunoForm.getSexo() != null && !("").equals(alunoForm.getSexo())) {
            sb.append(" and pf.sexo = '").append(alunoForm.getSexo()).append("'");
        }
        if (alunoForm.getSerieAno() != 0) {
            sb.append(" and a.serie_ano = ").append(alunoForm.getSerieAno());
        }
        sb.append(" and pf.status = ").append(alunoForm.getStatus());
        sb.append(" order by pf.nome");

        PreparedStatement prep = conn.prepareStatement(sb.toString());
        ResultSet rs = prep.executeQuery();
        while (rs.next()) {
            AlunoForm aForm = new AlunoForm();
            aForm.setIdPF(rs.getInt("id"));
            aForm.setIdAluno(rs.getInt("id_aluno"));
            aForm.setNome(rs.getString("nome"));
            aForm.setNumeroIDAluno(rs.getString("numero_id_aluno"));
            aForm.setDataNascimento(IDRDate.formatSQLDate(rs.getString("data_nascimento")));
            aForm.setSexo(rs.getString("sexo"));
            aForm.setCidade(rs.getString("cidade"));
            aForm.setProvincia(rs.getString("provincia"));
            aForm.setEmail(rs.getString("email"));
            aForm.setSerieAno(rs.getInt("serie_ano"));
            aForm.setDsSerieAno(Utilitario.obterDescricaoSerieAno(aForm.getSerieAno()));
            aForm.setStatus(rs.getInt("status"));
            aForm.setDsStatus(Utilitario.obterDescricaoStatus(aForm.getStatus()));

            listaAlunos.add(aForm);
        }
        rs.close();
        prep.close();

        return listaAlunos;
    }

    public ArrayList<AlunoForm> obterListaAlunosComNotaPorAno(Connection conn, String idSerieAno, String ano) throws SQLException {
        ArrayList<AlunoForm> listaAlunos = new ArrayList<>();
        StringBuilder sb = new StringBuilder();
        sb.append("select pf.id, pf.nome, n.serie_ano, n.ano, a.numero_id_aluno ");
        sb.append(" from pessoa_fisica pf, alunos a, nota_bimestre n");
        sb.append(" where pf.id = a.id_pessoa_fisica");
        sb.append(" and a.id_pessoa_fisica = n.id_aluno");
        sb.append(" and n.serie_ano = ").append(idSerieAno);
        sb.append(" and n.ano = ").append(ano);
        sb.append(" and pf.status = 1");
        sb.append(" group by pf.id");
        sb.append(" order by pf.nome");

        PreparedStatement prep = conn.prepareStatement(sb.toString());
        ResultSet rs = prep.executeQuery();
        while (rs.next()) {
            AlunoForm aForm = new AlunoForm();
            aForm.setIdPF(rs.getInt("id"));
            aForm.setNome(rs.getString("nome"));
            aForm.setNumeroIDAluno(rs.getString("numero_id_aluno"));
            aForm.setSerieAno(rs.getInt("serie_ano"));
            aForm.setDsSerieAno(Utilitario.obterDescricaoSerieAno(aForm.getSerieAno()));
            aForm.setAno(rs.getInt("ano"));
            aForm.setDsStatus(Utilitario.obterDescricaoStatus(aForm.getStatus()));

            listaAlunos.add(aForm);
        }
        rs.close();
        prep.close();

        return listaAlunos;
    }

    public AlunoForm obterDadosAlunoPorID(Connection conn, String idPf) throws SQLException {
        String query = "select * "
                + " from pessoa_fisica pf, alunos a"
                + " where pf.id = a.id_pessoa_fisica"
                + " and pf.id = ?";
        PreparedStatement prep = conn.prepareStatement(query);
        prep.setString(1, idPf);
        ResultSet rs = prep.executeQuery();
        AlunoForm alunoForm = new AlunoForm();
        if (rs.next()) {
            alunoForm.setIdPF(rs.getInt("id"));
            alunoForm.setNome(rs.getString("nome"));
            alunoForm.setNumeroIDAluno(rs.getString("numero_id_aluno"));
            alunoForm.setDataNascimento(IDRDate.formatSQLDate(rs.getString("data_nascimento")));
            alunoForm.setNaturalidade(rs.getString("naturalidade"));
            alunoForm.setNacionalidade(rs.getString("nacionalidade"));
            alunoForm.setSexo(rs.getString("sexo"));
            alunoForm.setDsEndereco(rs.getString("endereco"));
            alunoForm.setProvincia(rs.getString("provincia"));
            alunoForm.setCidade(rs.getString("cidade"));
            alunoForm.setTelefoneContato(rs.getString("telefone_contato"));
            alunoForm.setContatoEmergencia(rs.getString("contato_emergencia"));
            alunoForm.setStatus(rs.getInt("status"));
            alunoForm.setTipoPerfil(rs.getString("tipo"));
            alunoForm.setEmail(rs.getString("email"));
            alunoForm.setSerieAno(rs.getInt("serie_ano"));
            alunoForm.setCelularAluno(rs.getString("celular_aluno"));
            alunoForm.setTipoAlimentacao(rs.getString("alimentacao"));
            alunoForm.setNomePai(rs.getString("nome_pai"));
            alunoForm.setCelularPai(rs.getString("celular_pai"));
            alunoForm.setEmailPai(rs.getString("email_pai"));
            alunoForm.setNomeMae(rs.getString("nome_mae"));
            alunoForm.setCelularMae(rs.getString("celular_mae"));
            alunoForm.setEmailMae(rs.getString("email_mae"));
            alunoForm.setLinhaTransporte(rs.getString("linha_transporte"));
            alunoForm.setHorarioTransporte(rs.getString("horario_transporte"));
            alunoForm.setDataMatricula(IDRDate.formatSQLDate(rs.getString("data_matricula")));
            alunoForm.setDataCadastro(IDRDate.formatSQLDate(rs.getString("data_cadastro")));
            alunoForm.setRestricaoAlimentar(rs.getString("restricao_alimentar"));
            alunoForm.setObservacaoSaude(rs.getString("observacao_saude"));
            alunoForm.setObservacao(rs.getString("ds_observacao"));
            alunoForm.setAutorizacaoImagem(rs.getString("autorizacao_imagem"));
            alunoForm.setPeriodo(rs.getString("periodo"));
        }
        rs.close();
        prep.close();

        return alunoForm;
    }

    public void atualizarDadosAluno(Connection conn, AlunoForm alunoForm) throws SQLException {
        String query = "UPDATE alunos SET serie_ano=?, celular_aluno=?, nome_pai=?, alimentacao=?, celular_pai=?, email_pai=?, "
                + " nome_mae=?, celular_mae=?, email_mae=?, linha_transporte=?, horario_transporte=?, restricao_alimentar=?, observacao_saude=?, "
                + " ds_observacao=?, data_saida=?, numero_id_aluno=?, autorizacao_imagem=?, periodo=?"
                + " WHERE id_pessoa_fisica=?";
        PreparedStatement prep = conn.prepareStatement(query);
        prep.setInt(1, alunoForm.getSerieAno());
        prep.setString(2, alunoForm.getCelularAluno());
        prep.setString(3, alunoForm.getNomePai());
        prep.setString(4, alunoForm.getTipoAlimentacao());
        prep.setString(5, alunoForm.getCelularPai());
        prep.setString(6, alunoForm.getEmailPai());
        prep.setString(7, alunoForm.getNomeMae());
        prep.setString(8, alunoForm.getCelularMae());
        prep.setString(9, alunoForm.getEmailMae());
        prep.setString(10, alunoForm.getLinhaTransporte());
        prep.setString(11, alunoForm.getHorarioTransporte());
        prep.setString(12, alunoForm.getRestricaoAlimentar());
        prep.setString(13, alunoForm.getObservacaoSaude());
        prep.setString(14, alunoForm.getObservacao());
        if (alunoForm.getDataSaida() != null && !alunoForm.getDataSaida().equals("")) {
            prep.setString(15, IDRDate.parseDataIso(alunoForm.getDataSaida()));
        } else {
            prep.setString(15, null);
        }
        prep.setString(16, alunoForm.getNumeroIDAluno());
        prep.setString(17, alunoForm.getAutorizacaoImagem());
        prep.setString(18, alunoForm.getPeriodo());
        prep.setInt(19, alunoForm.getIdPF());
        prep.execute();
        prep.close();
    }

    public void atualizarDadosAlunoRematricula(Connection conn, AlunoForm alunoForm) throws SQLException {
        String query = "UPDATE alunos SET celular_aluno=?, alimentacao=?, nome_pai=?, celular_pai=?, email_pai=?, "
                + " nome_mae=?, celular_mae=?, email_mae=?, linha_transporte=?, horario_transporte = ?, restricao_alimentar=?, observacao_saude=?, "
                + " ds_observacao=?, autorizacao_imagem=?"
                + " WHERE id_pessoa_fisica=?";
        try ( PreparedStatement prep = conn.prepareStatement(query)) {
            prep.setString(1, alunoForm.getCelularAluno());
            prep.setString(2, alunoForm.getTipoAlimentacao());
            prep.setString(3, alunoForm.getNomePai());
            prep.setString(4, alunoForm.getCelularPai());
            prep.setString(5, alunoForm.getEmailPai());
            prep.setString(6, alunoForm.getNomeMae());
            prep.setString(7, alunoForm.getCelularMae());
            prep.setString(8, alunoForm.getEmailMae());
            prep.setString(9, alunoForm.getLinhaTransporte());
            prep.setString(10, alunoForm.getHorarioTransporte());
            prep.setString(11, alunoForm.getRestricaoAlimentar());
            prep.setString(12, alunoForm.getObservacaoSaude());
            prep.setString(13, alunoForm.getObservacao());
            prep.setString(14, alunoForm.getAutorizacaoImagem());
            prep.setInt(15, alunoForm.getIdAluno());
            prep.execute();
        }
    }

    public ArrayList<AlunoForm> obterListaAlunosPorSerieSemNotas(Connection conn, String idSerie, int anoVigente, String bimestre, int idDisciplina) throws SQLException {
        ArrayList<AlunoForm> listaAlunos = new ArrayList<>();
        String query = "select pf.id, pf.nome, a.serie_ano, nb.id_disciplina from pessoa_fisica pf, alunos a"
                + " left join nota_bimestre nb on a.id_pessoa_fisica = nb.id_aluno "
                + " and nb.ano = ? and nb.id_disciplina = ? and nb.nr_bimestre = ?"
                + " where pf.id = a.id_pessoa_fisica"
                + " and a.serie_ano = ?"
                + " and pf.status = 1"
                + " and nb.id_disciplina is null"
                + " order by pf.nome";

        PreparedStatement prep = conn.prepareStatement(query);
        prep.setInt(1, anoVigente);
        prep.setInt(2, idDisciplina);
        prep.setString(3, bimestre);
        prep.setString(4, idSerie);
        ResultSet rs = prep.executeQuery();
        while (rs.next()) {
            AlunoForm aForm = new AlunoForm();
            aForm.setIdPF(rs.getInt("id"));
            aForm.setNome(rs.getString("nome"));
            aForm.setSerieAno(rs.getInt("serie_ano"));
//            aForm.setDsSerieAno(Utilitario.obterDescricaoSerieAno(aForm.getSerieAno()));
//            aForm.setStatus(rs.getInt("status"));
//            aForm.setDsStatus(Utilitario.obterDescricaoStatus(aForm.getStatus()));
            listaAlunos.add(aForm);
        }
        rs.close();
        prep.close();

        return listaAlunos;
    }

    public ArrayList<AlunoForm> obterListaAlunosPorSerieComNotas(Connection conn, String idSerie, int anoVigente, String bimestre, int idDisciplina) throws SQLException {
        ArrayList<AlunoForm> listaAlunos = new ArrayList<>();
        String query = "select pf.id, pf.nome, nb.serie_ano, pf.status, nb.id as id_nota_bimestre, nb.nr_bimestre, "
                + " nb.falta, nb.ano, nb.nota_mensal, nb.nota_bimestral, nb.producao_sala, nb.media, nb.recuperacao "
                + " from pessoa_fisica pf,"
                + " alunos a left join nota_bimestre nb"
                + " on a.id_pessoa_fisica = nb.id_aluno and nb.nr_bimestre = ? and nb.ano = ?"
                + " where pf.id = a.id_pessoa_fisica"
                + " and pf.status = 1"
                + " and nb.serie_ano = ?"
                + " and nb.id_disciplina = ?"
                + " and nb.id_disciplina is not null"
                + " order by pf.nome";

        PreparedStatement prep = conn.prepareStatement(query);
        prep.setString(1, bimestre);
        prep.setInt(2, anoVigente);
        prep.setString(3, idSerie);
        prep.setInt(4, idDisciplina);
        ResultSet rs = prep.executeQuery();
        while (rs.next()) {
            AlunoForm aForm = new AlunoForm();
            aForm.setIdPF(rs.getInt("id"));
            aForm.setNome(rs.getString("nome"));
            aForm.setSerieAno(rs.getInt("serie_ano"));

            NotaBimestreForm notaBimestreForm = new NotaBimestreForm();
            notaBimestreForm.setIdNotaBimestre(rs.getInt("id_nota_bimestre"));
            notaBimestreForm.setNotaProducaoSala(rs.getString("producao_sala"));
            notaBimestreForm.setNotaMensal(rs.getString("nota_mensal"));
            notaBimestreForm.setNotaBimestral(rs.getString("nota_bimestral"));
            notaBimestreForm.setMediaBimestre(rs.getString("media"));
            notaBimestreForm.setNrBimestre(rs.getInt("nr_bimestre"));
            notaBimestreForm.setAno(rs.getInt("ano"));
            notaBimestreForm.setFalta(rs.getInt("falta"));
            notaBimestreForm.setRecuperacao(rs.getInt("recuperacao"));

            aForm.setNotaBimestre(notaBimestreForm);

            listaAlunos.add(aForm);
        }
        rs.close();
        prep.close();

        return listaAlunos;
    }

    public List<AlunoForm> obterAlunosPorSerie(Connection conn, String idSerieAno) throws SQLException {
        List<AlunoForm> listaAlunos = new ArrayList<>();
        StringBuilder sb = new StringBuilder();
        sb.append("select pf.id, pf.nome, pf.data_nascimento, pf.sexo, pf.cidade, pf.provincia, a.serie_ano, pf.email, pf.status, a.numero_id_aluno ");
        sb.append(" from pessoa_fisica pf, alunos a");
        sb.append(" where pf.id = a.id_pessoa_fisica");
        sb.append(" and a.serie_ano = ").append(idSerieAno);
        sb.append(" and pf.status = 1");
        sb.append(" order by pf.nome");
        PreparedStatement prep = conn.prepareStatement(sb.toString());
        ResultSet rs = prep.executeQuery();
        while (rs.next()) {
            AlunoForm aForm = new AlunoForm();
            aForm.setIdAluno(rs.getInt("id"));
            aForm.setNome(rs.getString("nome"));
            aForm.setSerieAno(rs.getInt("serie_ano"));
            aForm.setDsSerieAno(Utilitario.obterDescricaoSerieAno(aForm.getSerieAno()));
            listaAlunos.add(aForm);
        }
        rs.close();
        prep.close();

        return listaAlunos;
    }

    public void salvarHistoricoAluno(Connection conn, AlunoForm alunoForm) throws SQLException {
        String query = "INSERT INTO alunos_historico (id_aluno, id_serie_historico, data_ocorrido, id_professor, descricao, assunto, data_insercao) "
                + " VALUES (?,?,?,?,?,?,now())";

        PreparedStatement prep = conn.prepareStatement(query);
        prep.setInt(1, alunoForm.getIdPF());
        prep.setInt(2, alunoForm.getSerieAno());
        prep.setString(3, IDRDate.parseDataIso(alunoForm.getDataHistorico()));
        prep.setInt(4, alunoForm.getIdProfessorHistorico());
        prep.setString(5, alunoForm.getDescricaoHistorico());
        prep.setString(6, alunoForm.getAssuntoHistorico());
        prep.execute();
        prep.close();
    }

    public List<AlunoForm> obterListaHistoricoAluno(Connection conn, int idPF) throws SQLException {
        List<AlunoForm> listaAlunos = new ArrayList<>();
        String query = "select a.id, a.id_aluno, a.id_serie_historico, a.data_ocorrido, a.data_insercao, a.descricao, a.assunto, a.id_professor, pf.nome"
                + " from alunos_historico a, pessoa_fisica pf"
                + " where a.id_professor = pf.id"
                + " and id_aluno = ?"
                + " order by a.id desc";

        PreparedStatement prep = conn.prepareStatement(query);
        prep.setInt(1, idPF);
        ResultSet rs = prep.executeQuery();
        while (rs.next()) {
            AlunoForm aForm = new AlunoForm();
            aForm.setIdHistorico(rs.getInt("id"));
            aForm.setIdPF(rs.getInt("id_aluno"));
            aForm.setSerieAno(rs.getInt("id_serie_historico"));
            aForm.setDataHistorico(IDRDate.formatSQLDate(rs.getString("data_ocorrido")));
            aForm.setDataCadastro(IDRDate.formatSQLDate(rs.getString("data_insercao")));
            aForm.setDescricaoHistorico(rs.getString("descricao"));
            aForm.setAssuntoHistorico(rs.getString("assunto"));
            aForm.setIdProfessorHistorico(rs.getInt("id_professor"));
            aForm.setNomeProfessor(rs.getString("nome"));

            listaAlunos.add(aForm);
        }
        rs.close();
        prep.close();

        return listaAlunos;
    }

    public void excluirHistoricoAluno(Connection conn, AlunoForm alunoForm) throws SQLException {
        String query = "DELETE FROM alunos_historico WHERE id=?";
        PreparedStatement prep = conn.prepareStatement(query);
        prep.setInt(1, alunoForm.getIdHistorico());
        prep.execute();
        prep.close();
    }

    public List<AlunoForm> obterListaAlunosAvisos(Connection conn, int idComunicado) throws SQLException {
        List<AlunoForm> listaAlunosAvisos = new ArrayList<>();
        String query = "select c.*, pf.nome, d.descricao"
                + " from comunicados c, pessoa_fisica pf, descricao_serie_ano d"
                + " where c.id_pessoa = pf.id"
                + " and c.serie_ano = d.id"
                + " and c.id_comunicado_gerenciamento = ?"
                + " order by pf.nome";
        try ( PreparedStatement prep = conn.prepareStatement(query)) {
            prep.setInt(1, idComunicado);
            try ( ResultSet rs = prep.executeQuery()) {
                while (rs.next()) {
                    AlunoForm alunoForm = new AlunoForm();
                    alunoForm.setNome(rs.getString("nome"));
                    alunoForm.setDsSerieAno(rs.getString("descricao"));
                    listaAlunosAvisos.add(alunoForm);
                }
            }
        }

        return listaAlunosAvisos;

    }

    public List<AlunoForm> obterAlunosPorSerieSemVinculoItinerario(Connection conn, String idSerieAno, int idItinerario) throws SQLException {
        List<AlunoForm> listaAlunos = new ArrayList<>();
        StringBuilder sb = new StringBuilder();
        sb.append("select pf.id, pf.nome, pf.data_nascimento, pf.sexo, pf.cidade, pf.provincia, a.serie_ano, pf.email, pf.status, a.numero_id_aluno ");
        sb.append(" from pessoa_fisica pf, alunos a left join itinerario_alunos i");
        sb.append(" on a.id_pessoa_fisica = i.id_aluno and i.id_itinerario = ").append(idItinerario);
        sb.append(" where pf.id = a.id_pessoa_fisica");
        sb.append(" and a.serie_ano = ").append(idSerieAno);
        sb.append(" and pf.status = 1");
        sb.append(" and i.id_aluno is null");
        sb.append(" order by pf.nome");
        PreparedStatement prep = conn.prepareStatement(sb.toString());
        ResultSet rs = prep.executeQuery();
        while (rs.next()) {
            AlunoForm aForm = new AlunoForm();
            aForm.setIdAluno(rs.getInt("id"));
            aForm.setNome(rs.getString("nome"));
            aForm.setSerieAno(rs.getInt("serie_ano"));
            listaAlunos.add(aForm);
        }
        rs.close();
        prep.close();

        return listaAlunos;
    }
    public List<AlunoForm> obterAlunosPorSerieComVinculoItinerario(Connection conn, String idSerieAno, int idItinerario) throws SQLException {
        List<AlunoForm> listaAlunos = new ArrayList<>();
        StringBuilder sb = new StringBuilder();
        sb.append("select pf.id, pf.nome, pf.data_nascimento, pf.sexo, pf.cidade, pf.provincia, a.serie_ano, pf.email, pf.status, a.numero_id_aluno, i.id as itinerario_aluno ");
        sb.append(" from pessoa_fisica pf, alunos a left join itinerario_alunos i");
        sb.append(" on a.id_pessoa_fisica = i.id_aluno and i.id_itinerario = ").append(idItinerario);
        sb.append(" where pf.id = a.id_pessoa_fisica");
        sb.append(" and a.serie_ano = ").append(idSerieAno);
        sb.append(" and pf.status = 1");
        sb.append(" and i.id_aluno is not null");
        sb.append(" order by pf.nome");
        PreparedStatement prep = conn.prepareStatement(sb.toString());
        ResultSet rs = prep.executeQuery();
        while (rs.next()) {
            AlunoForm aForm = new AlunoForm();
            aForm.setIdAluno(rs.getInt("id"));
            aForm.setNome(rs.getString("nome"));
            aForm.setSerieAno(rs.getInt("serie_ano"));
            aForm.setIdItinerarioAluno(rs.getInt("itinerario_aluno"));
            listaAlunos.add(aForm);
        }
        rs.close();
        prep.close();

        return listaAlunos;
    }
}
