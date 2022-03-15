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
public class NotaItinerarioForm extends FormBasico {

    private int idNotaItinerario;
    private int idItinerario;
    private String nomeItinerario;
    private int idAluno;
    private String nomeAluno;
    private int nrBimestre;
    private int idSerieAno;
    private String dsSerieAno;
    private int ano;
    private int falta;
    private String notaBimestral;
    private String categoriaEnsino;
    private int idProfessor;
    private String nomeProfessor;
    private double notaBimestre1 = -1.0;
    private double notaBimestre2 = -1.0;
    private double notaBimestre3 = -1.0;
    private double notaBimestre4 = -1.0;
    private double mediaAnual;
    private int faltaBimestre1;
    private int faltaBimestre2;
    private int faltaBimestre3;
    private int faltaBimestre4;
    private int faltaTotal;

    public int getFaltaTotal() {
        return faltaTotal;
    }

    public void setFaltaTotal(int faltaTotal) {
        this.faltaTotal = faltaTotal;
    }
    
    public int getFaltaBimestre1() {
        return faltaBimestre1;
    }

    public void setFaltaBimestre1(int faltaBimestre1) {
        this.faltaBimestre1 = faltaBimestre1;
    }

    public int getFaltaBimestre2() {
        return faltaBimestre2;
    }

    public void setFaltaBimestre2(int faltaBimestre2) {
        this.faltaBimestre2 = faltaBimestre2;
    }

    public int getFaltaBimestre3() {
        return faltaBimestre3;
    }

    public void setFaltaBimestre3(int faltaBimestre3) {
        this.faltaBimestre3 = faltaBimestre3;
    }

    public int getFaltaBimestre4() {
        return faltaBimestre4;
    }

    public void setFaltaBimestre4(int faltaBimestre4) {
        this.faltaBimestre4 = faltaBimestre4;
    }
    
    public double getNotaBimestre1() {
        return notaBimestre1;
    }

    public void setNotaBimestre1(double notaBimestre1) {
        this.notaBimestre1 = notaBimestre1;
    }

    public double getNotaBimestre2() {
        return notaBimestre2;
    }

    public void setNotaBimestre2(double notaBimestre2) {
        this.notaBimestre2 = notaBimestre2;
    }

    public double getNotaBimestre3() {
        return notaBimestre3;
    }

    public void setNotaBimestre3(double notaBimestre3) {
        this.notaBimestre3 = notaBimestre3;
    }

    public double getNotaBimestre4() {
        return notaBimestre4;
    }

    public void setNotaBimestre4(double notaBimestre4) {
        this.notaBimestre4 = notaBimestre4;
    }

    public double getMediaAnual() {
        return mediaAnual;
    }

    public void setMediaAnual(double mediaAnual) {
        this.mediaAnual = mediaAnual;
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
    
    public String getCategoriaEnsino() {
        return categoriaEnsino;
    }

    public void setCategoriaEnsino(String categoriaEnsino) {
        this.categoriaEnsino = categoriaEnsino;
    }
    
    public int getIdNotaItinerario() {
        return idNotaItinerario;
    }

    public void setIdNotaItinerario(int idNotaItinerario) {
        this.idNotaItinerario = idNotaItinerario;
    }

    public int getIdItinerario() {
        return idItinerario;
    }

    public void setIdItinerario(int idItinerario) {
        this.idItinerario = idItinerario;
    }

    public String getNomeItinerario() {
        return nomeItinerario;
    }

    public void setNomeItinerario(String nomeItinerario) {
        this.nomeItinerario = nomeItinerario;
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

    public String getNotaBimestral() {
        return notaBimestral;
    }

    public void setNotaBimestral(String notaBimestral) {
        this.notaBimestral = notaBimestral;
    }

   

}
