/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.Form;

import java.util.List;

/**
 *
 * @author macuser
 */
public class DiarioClasseForm {
    
    private int idAluno;
    private String nomeAluno;
    private String dataAula;
    private List<ListaPresencaForm> listaPresenca;
    private String notaMensal;
    private String notaBimestral;
    private String notaProducaoSala;
    private String mediaBimestre;
    private int falta;

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
    
    public List<ListaPresencaForm> getListaPresenca() {
        return listaPresenca;
    }

    public void setListaPresenca(List<ListaPresencaForm> listaPresenca) {
        this.listaPresenca = listaPresenca;
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

    public String getDataAula() {
        return dataAula;
    }

    public void setDataAula(String dataAula) {
        this.dataAula = dataAula;
    }
    
    
    
    
}
