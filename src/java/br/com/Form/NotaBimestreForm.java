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
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author macuser
 */
public class NotaBimestreForm extends FormBasico {

    private int idNotaBimestre;
    private int idDisciplina;
    private String nomeDisciplina;
    private int idAluno;
    private String nomeAluno;
    private int nrBimestre;
    private int idSerieAno;
    private String dsSerieAno;
    private int ano;
    private int falta;
    private String notaMensal;
    private String notaBimestral;
    private String notaProducaoSala;
    private String mediaBimestre;
    private String categoriaEnsino;
    private PessoaFisicaForm professorForm;
    private DisciplinasForm disciplinasForm;
    private SerieAnoForm serieAnoForm;
    private AlunoForm alunoForm;
    private double media1Bimestre = -1.0;
    private double media2Bimestre = -1.0;
    private double media3Bimestre = -1.0;
    private double media4Bimestre = -1.0;
    private double mediaFinal;
    private double mediaRecupFinal;
    private int falta1Bimestre;
    private int falta2Bimestre;
    private int falta3Bimestre;
    private int falta4Bimestre;
    private int faltaTotal;
    private String dataEmissao;
    private int recuperacao;
    private boolean passouDisciplina;
    private boolean fezProvaRecupAnual = false;
    private String observacaoRecupAnual;
    private String resultadoFinal;

    public String getResultadoFinal() {
        return resultadoFinal;
    }

    public void setResultadoFinal(String resultadoFinal) {
        this.resultadoFinal = resultadoFinal;
    }
    
    public boolean isFezProvaRecupAnual() {
        return fezProvaRecupAnual;
    }

    public void setFezProvaRecupAnual(boolean fezProvaRecupAnual) {
        this.fezProvaRecupAnual = fezProvaRecupAnual;
    }

    public String getObservacaoRecupAnual() {
        return observacaoRecupAnual;
    }

    public void setObservacaoRecupAnual(String observacaoRecupAnual) {
        this.observacaoRecupAnual = observacaoRecupAnual;
    }
    
    public boolean isPassouDisciplina() {
        return passouDisciplina;
    }

    public void setPassouDisciplina(boolean passouDisciplina) {
        this.passouDisciplina = passouDisciplina;
    }
    
    public int getRecuperacao() {
        return recuperacao;
    }

    public void setRecuperacao(int recuperacao) {
        this.recuperacao = recuperacao;
    }
    
    public String getDataEmissao() {
        return dataEmissao;
    }

    public void setDataEmissao(String dataEmissao) {
        this.dataEmissao = dataEmissao;
    }

    public double getMedia1Bimestre() {
        return media1Bimestre;
    }

    public void setMedia1Bimestre(double media1Bimestre) {
        this.media1Bimestre = media1Bimestre;
    }

    public double getMedia2Bimestre() {
        return media2Bimestre;
    }

    public void setMedia2Bimestre(double media2Bimestre) {
        this.media2Bimestre = media2Bimestre;
    }

    public double getMedia3Bimestre() {
        return media3Bimestre;
    }

    public void setMedia3Bimestre(double media3Bimestre) {
        this.media3Bimestre = media3Bimestre;
    }

    public double getMedia4Bimestre() {
        return media4Bimestre;
    }

    public void setMedia4Bimestre(double media4Bimestre) {
        this.media4Bimestre = media4Bimestre;
    }

    public double getMediaFinal() {
        return mediaFinal;
    }

    public void setMediaFinal(double mediaFinal) {
        this.mediaFinal = mediaFinal;
    }

    public double getMediaRecupFinal() {
        return mediaRecupFinal;
    }

    public void setMediaRecupFinal(double mediaRecupFinal) {
        this.mediaRecupFinal = mediaRecupFinal;
    }

    public int getFalta1Bimestre() {
        return falta1Bimestre;
    }

    public void setFalta1Bimestre(int falta1Bimestre) {
        this.falta1Bimestre = falta1Bimestre;
    }

    public int getFalta2Bimestre() {
        return falta2Bimestre;
    }

    public void setFalta2Bimestre(int falta2Bimestre) {
        this.falta2Bimestre = falta2Bimestre;
    }

    public int getFalta3Bimestre() {
        return falta3Bimestre;
    }

    public void setFalta3Bimestre(int falta3Bimestre) {
        this.falta3Bimestre = falta3Bimestre;
    }

    public int getFalta4Bimestre() {
        return falta4Bimestre;
    }

    public void setFalta4Bimestre(int falta4Bimestre) {
        this.falta4Bimestre = falta4Bimestre;
    }

    public int getFaltaTotal() {
        return faltaTotal;
    }

    public void setFaltaTotal(int faltaTotal) {
        this.faltaTotal = faltaTotal;
    }

    public AlunoForm getAlunoForm() {
        return alunoForm;
    }

    public void setAlunoForm(AlunoForm alunoForm) {
        this.alunoForm = alunoForm;
    }

    public PessoaFisicaForm getProfessorForm() {
        return professorForm;
    }

    public void setProfessorForm(PessoaFisicaForm professorForm) {
        this.professorForm = professorForm;
    }

    public DisciplinasForm getDisciplinasForm() {
        return disciplinasForm;
    }

    public void setDisciplinasForm(DisciplinasForm disciplinasForm) {
        this.disciplinasForm = disciplinasForm;
    }

    public SerieAnoForm getSerieAnoForm() {
        return serieAnoForm;
    }

    public void setSerieAnoForm(SerieAnoForm serieAnoForm) {
        this.serieAnoForm = serieAnoForm;
    }

    public int getIdNotaBimestre() {
        return idNotaBimestre;
    }

    public void setIdNotaBimestre(int idNotaBimestre) {
        this.idNotaBimestre = idNotaBimestre;
    }

    public int getIdDisciplina() {
        return idDisciplina;
    }

    public void setIdDisciplina(int idDisciplina) {
        this.idDisciplina = idDisciplina;
    }

    public String getNomeDisciplina() {
        return nomeDisciplina;
    }

    public void setNomeDisciplina(String nomeDisciplina) {
        this.nomeDisciplina = nomeDisciplina;
    }

    public int getIdAluno() {
        return idAluno;
    }

    public void setIdAluno(int idAluno) {
        this.idAluno = idAluno;
    }

    public String getNomeAluno() {
        return nomeAluno;
    }

    public void setNomeAluno(String nomeAluno) {
        this.nomeAluno = nomeAluno;
    }

    public String getCategoriaEnsino() {
        return categoriaEnsino;
    }

    public void setCategoriaEnsino(String categoriaEnsino) {
        this.categoriaEnsino = categoriaEnsino;
    }

    public int getNrBimestre() {
        return nrBimestre;
    }

    public void setNrBimestre(int nrBimestre) {
        this.nrBimestre = nrBimestre;
    }

    public int getIdSerieAno() {
        return idSerieAno;
    }

    public void setIdSerieAno(int idSerieAno) {
        this.idSerieAno = idSerieAno;
    }

    public String getDsSerieAno() {
        return dsSerieAno;
    }

    public void setDsSerieAno(String dsSerieAno) {
        this.dsSerieAno = dsSerieAno;
    }

    public int getAno() {
        return ano;
    }

    public void setAno(int ano) {
        this.ano = ano;
    }

    public int getFalta() {
        return falta;
    }

    public void setFalta(int falta) {
        this.falta = falta;
    }

    public String getNotaMensal() {
        return notaMensal;
    }

    public void setNotaMensal(String notaMensal) {
        this.notaMensal = notaMensal;
    }

    public String getNotaBimestral() {
        return notaBimestral;
    }

    public void setNotaBimestral(String notaBimestral) {
        this.notaBimestral = notaBimestral;
    }

    public String getNotaProducaoSala() {
        return notaProducaoSala;
    }

    public void setNotaProducaoSala(String notaProducaoSala) {
        this.notaProducaoSala = notaProducaoSala;
    }

    public String getMediaBimestre() {
        return mediaBimestre;
    }

    public void setMediaBimestre(String mediaBimestre) {
        this.mediaBimestre = mediaBimestre;
    }

    public List<NotaBimestreForm> obterAnosNotasAluno(Connection conn, String idPF) throws SQLException {
        List<NotaBimestreForm> listaAno = new ArrayList<>();
        String query = "select n.ano, n.serie_ano, d.descricao "
                + " from nota_bimestre n, descricao_serie_ano d"
                + " where n.serie_ano = d.id "
                + " and n.id_aluno = ?"
                + " group by ano, serie_ano"
                + " order by ano";
        try (PreparedStatement prep = conn.prepareStatement(query)) {
            prep.setString(1, idPF);
            try (ResultSet rs = prep.executeQuery()) {
                while (rs.next()) {
                    NotaBimestreForm notaBimestreForm = new NotaBimestreForm();
                    notaBimestreForm.setAno(rs.getInt("ano"));
                    notaBimestreForm.setIdSerieAno(rs.getInt("serie_ano"));
                    notaBimestreForm.setDsSerieAno(rs.getString("descricao"));
                    listaAno.add(notaBimestreForm);
                }
            }
        }

        return listaAno;
    }

    public int obterSeriePorAnoEstudando(Connection conn, int idAluno, int ano) throws SQLException {
        int idSerie = 0;
        String query = "select distinct (nb.serie_ano) as serie_ano"
                + " from nota_bimestre nb"
                + " where nb.id_aluno = ?"
                + " and nb.ano = ?";
        try (PreparedStatement prep = conn.prepareStatement(query)) {
            prep.setInt(1, idAluno);
            prep.setInt(2, ano);
            try (ResultSet rs = prep.executeQuery()) {
                if(rs.next()){
                    idSerie = rs.getInt("serie_ano");
                }
            }
        }
        
        return idSerie;
    }

}
