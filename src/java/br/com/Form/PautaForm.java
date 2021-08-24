/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.Form;

/**
 *
 * @author macuser
 */
public class PautaForm extends FormBasico {
    
    private int idPauta;
    private int idPautaObsAluno;
    private int idAluno;
    private String nomeAluno;
    private String nomePaiAluno;
    private String nomeMaeAluno;
    private int idProfessor;
    private String nomeProfessor;
    private int nrBimestre;
    private int ano;
    private int idSerieAno;
    private String dsSerieAno;
    private String obsQualidade;
    private String obsParticipacaoAula;
    private String obsRealizacaoTarefa;
    private String obsComportamento;
    private String obsRelacionamento;
    private String obsDificuldade;
    private String obsPrecisaReforco;
    private String obsComportamentoReforco;
    private String obsDicaProfessor;
    private String obsOutroAssunto;
    
    
    //dados do cadastro da pauta por bimestre
    private String pautaApresentacao;
    private String pautaBoletim;
    private String pautaRecadoPais;
    private String pautaRecadoGeral;
    private String pautaSugestao;
    private String pautaFinalizacao;
    private String espacoSugestao;

    public String getEspacoSugestao() {
        return espacoSugestao;
    }

    public void setEspacoSugestao(String espacoSugestao) {
        this.espacoSugestao = espacoSugestao;
    }
    
    public String getPautaApresentacao() {
        return pautaApresentacao;
    }

    public void setPautaApresentacao(String pautaApresentacao) {
        this.pautaApresentacao = pautaApresentacao;
    }

    public String getPautaBoletim() {
        return pautaBoletim;
    }

    public void setPautaBoletim(String pautaBoletim) {
        this.pautaBoletim = pautaBoletim;
    }

    public String getPautaRecadoPais() {
        return pautaRecadoPais;
    }

    public void setPautaRecadoPais(String pautaRecadoPais) {
        this.pautaRecadoPais = pautaRecadoPais;
    }

    public String getPautaRecadoGeral() {
        return pautaRecadoGeral;
    }

    public void setPautaRecadoGeral(String pautaRecadoGeral) {
        this.pautaRecadoGeral = pautaRecadoGeral;
    }

    public String getPautaSugestao() {
        return pautaSugestao;
    }

    public void setPautaSugestao(String pautaSugestao) {
        this.pautaSugestao = pautaSugestao;
    }

    public String getPautaFinalizacao() {
        return pautaFinalizacao;
    }

    public void setPautaFinalizacao(String pautaFinalizacao) {
        this.pautaFinalizacao = pautaFinalizacao;
    }
    
    public int getIdPauta() {
        return idPauta;
    }

    public void setIdPauta(int idPauta) {
        this.idPauta = idPauta;
    }

    public int getIdPautaObsAluno() {
        return idPautaObsAluno;
    }

    public void setIdPautaObsAluno(int idPautaObsAluno) {
        this.idPautaObsAluno = idPautaObsAluno;
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

    public String getNomePaiAluno() {
        return nomePaiAluno;
    }

    public void setNomePaiAluno(String nomePaiAluno) {
        this.nomePaiAluno = nomePaiAluno;
    }

    public String getNomeMaeAluno() {
        return nomeMaeAluno;
    }

    public void setNomeMaeAluno(String nomeMaeAluno) {
        this.nomeMaeAluno = nomeMaeAluno;
    }

    public int getIdProfessor() {
        return idProfessor;
    }

    public void setIdProfessor(int idProfessor) {
        this.idProfessor = idProfessor;
    }

    public String getNomeProfessor() {
        return nomeProfessor;
    }

    public void setNomeProfessor(String nomeProfessor) {
        this.nomeProfessor = nomeProfessor;
    }

    public int getNrBimestre() {
        return nrBimestre;
    }

    public void setNrBimestre(int nrBimestre) {
        this.nrBimestre = nrBimestre;
    }

    public int getAno() {
        return ano;
    }

    public void setAno(int ano) {
        this.ano = ano;
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

    public String getObsQualidade() {
        return obsQualidade;
    }

    public void setObsQualidade(String obsQualidade) {
        this.obsQualidade = obsQualidade;
    }

    public String getObsParticipacaoAula() {
        return obsParticipacaoAula;
    }

    public void setObsParticipacaoAula(String obsParticipacaoAula) {
        this.obsParticipacaoAula = obsParticipacaoAula;
    }

    public String getObsRealizacaoTarefa() {
        return obsRealizacaoTarefa;
    }

    public void setObsRealizacaoTarefa(String obsRealizacaoTarefa) {
        this.obsRealizacaoTarefa = obsRealizacaoTarefa;
    }

    public String getObsComportamento() {
        return obsComportamento;
    }

    public void setObsComportamento(String obsComportamento) {
        this.obsComportamento = obsComportamento;
    }

    public String getObsRelacionamento() {
        return obsRelacionamento;
    }

    public void setObsRelacionamento(String obsRelacionamento) {
        this.obsRelacionamento = obsRelacionamento;
    }

    public String getObsDificuldade() {
        return obsDificuldade;
    }

    public void setObsDificuldade(String obsDificuldade) {
        this.obsDificuldade = obsDificuldade;
    }

    public String getObsPrecisaReforco() {
        return obsPrecisaReforco;
    }

    public void setObsPrecisaReforco(String obsPrecisaReforco) {
        this.obsPrecisaReforco = obsPrecisaReforco;
    }

    public String getObsComportamentoReforco() {
        return obsComportamentoReforco;
    }

    public void setObsComportamentoReforco(String obsComportamentoReforco) {
        this.obsComportamentoReforco = obsComportamentoReforco;
    }

    public String getObsDicaProfessor() {
        return obsDicaProfessor;
    }

    public void setObsDicaProfessor(String obsDicaProfessor) {
        this.obsDicaProfessor = obsDicaProfessor;
    }

    public String getObsOutroAssunto() {
        return obsOutroAssunto;
    }

    public void setObsOutroAssunto(String obsOutroAssunto) {
        this.obsOutroAssunto = obsOutroAssunto;
    }
    
    
    
    
}
