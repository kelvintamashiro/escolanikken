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
public class RelatoriosForm extends FormBasico {

    private AlunoForm alunoForm;
    private DisciplinasForm disciplinasForm;
    private NotaBimestreForm notaBimestreForm;
    private String dataInicio;
    private String dataFim;
    private int nrBimestre;
    private int qtdMelhoresNotas;
    private int ano;

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
