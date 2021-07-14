/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.Form;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author macuser
 */
public class RelatoriosForm extends FormBasico {

    private AlunoForm alunoForm;
    private List<AlunoForm> listaAlunos;
    private DisciplinasForm disciplinasForm;
    private NotaBimestreForm notaBimestreForm;
    private List<NotaBimestreForm> listaNotaBimestreForm;
    private String dataInicio;
    private String dataFim;
    private int nrBimestre;
    private int qtdMelhoresNotas;
    private int ano;
    private int qtdMasculino;
    private int qtdFeminino;
    private int qtdAmbosSexo;
    private String nomeSerieAno;
    private String nomeAluno;
    private String nomeDisciplina;
    private int qtdFaltas;

    public String getNomeAluno() {
        return nomeAluno;
    }

    public void setNomeAluno(String nomeAluno) {
        this.nomeAluno = nomeAluno;
    }

    public String getNomeDisciplina() {
        return nomeDisciplina;
    }

    public void setNomeDisciplina(String nomeDisciplina) {
        this.nomeDisciplina = nomeDisciplina;
    }

    public int getQtdFaltas() {
        return qtdFaltas;
    }

    public void setQtdFaltas(int qtdFaltas) {
        this.qtdFaltas = qtdFaltas;
    }
    
    public List<NotaBimestreForm> getListaNotaBimestreForm() {
        return listaNotaBimestreForm;
    }

    public void setListaNotaBimestreForm(List<NotaBimestreForm> listaNotaBimestreForm) {
        this.listaNotaBimestreForm = listaNotaBimestreForm;
    }
    
    public List<AlunoForm> getListaAlunos() {
        return listaAlunos;
    }

    public void setListaAlunos(List<AlunoForm> listaAlunos) {
        this.listaAlunos = listaAlunos;
    }

    public String getNomeSerieAno() {
        return nomeSerieAno;
    }

    public void setNomeSerieAno(String nomeSerieAno) {
        this.nomeSerieAno = nomeSerieAno;
    }

    public int getQtdAmbosSexo() {
        return qtdAmbosSexo;
    }

    public void setQtdAmbosSexo(int qtdAmbosSexo) {
        this.qtdAmbosSexo = qtdAmbosSexo;
    }

    public int getQtdMasculino() {
        return qtdMasculino;
    }

    public void setQtdMasculino(int qtdMasculino) {
        this.qtdMasculino = qtdMasculino;
    }

    public int getQtdFeminino() {
        return qtdFeminino;
    }

    public void setQtdFeminino(int qtdFeminino) {
        this.qtdFeminino = qtdFeminino;
    }

    public int getAno() {
        return ano;
    }

    public void setAno(int ano) {
        this.ano = ano;
    }

    public int getQtdMelhoresNotas() {
        return qtdMelhoresNotas;
    }

    public void setQtdMelhoresNotas(int qtdMelhoresNotas) {
        this.qtdMelhoresNotas = qtdMelhoresNotas;
    }

    public int getNrBimestre() {
        return nrBimestre;
    }

    public void setNrBimestre(int nrBimestre) {
        this.nrBimestre = nrBimestre;
    }

    public String getDataInicio() {
        return dataInicio;
    }

    public void setDataInicio(String dataInicio) {
        this.dataInicio = dataInicio;
    }

    public String getDataFim() {
        return dataFim;
    }

    public void setDataFim(String dataFim) {
        this.dataFim = dataFim;
    }

    public NotaBimestreForm getNotaBimestreForm() {
        return notaBimestreForm;
    }

    public void setNotaBimestreForm(NotaBimestreForm notaBimestreForm) {
        this.notaBimestreForm = notaBimestreForm;
    }

    public AlunoForm getAlunoForm() {
        return alunoForm;
    }

    public void setAlunoForm(AlunoForm alunoForm) {
        this.alunoForm = alunoForm;
    }

    public DisciplinasForm getDisciplinasForm() {
        return disciplinasForm;
    }

    public void setDisciplinasForm(DisciplinasForm disciplinasForm) {
        this.disciplinasForm = disciplinasForm;
    }


}
