<%-- 
    Document   : aluno_historico
    Created on : 20/07/2020, 23:18:40
    Author     : macuser
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<!DOCTYPE html>
<html class="js-disabled">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Escola Nikken - Histórico Aluno</title>
        <link rel="shortcut icon" href="imagens/favico.png" />
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <script language="javascript1.2" src="js/mizanscene.js"></script>
        <script type="text/javascript" src="js/JQuery/js/jquery-1.3.2.js"></script>

        <link rel="stylesheet" media="all" type="text/css" href="assets/css/fix.css" />
        <link rel="stylesheet" media="all" type="text/css" href="assets/css/style.css" />
        <style>
            body {
                margin:0;
                padding:0;
            }
        </style>
    </head>
    <body style="padding-bottom: 150px">
        <logic:present name="errors">
            <script>
                alert('<bean:write name="errors"/>');
            </script>
        </logic:present>
        <html:form action="Aluno" name="AlunoForm" type="br.com.Form.AlunoForm" scope="request">
            <jsp:include page="topo.jsp"/>

            <table border="0" align="center" style="margin-top: 20px; background-color: #ADD8E6" width="100%">
                <tr>
                    <td width="10%" style="padding-left: 50px">
                        <a href="tela_interativa.jsp"><img src="imagens/bt_voltar_2.png" width="100px"/></a>
                    </td>
                    <td width="80%" align="center">
                        <h1>Histórico do Aluno</h1>
                    </td>
                    <td width="10%">&nbsp;</td>
                </tr>
            </table>
            <div class="form-group">
                <table border="0" align="center" width="80%" class="table-condensed">
                    <tr style="background-color: #F4F4F4; color: #000080">
                        <td colspan="3">
                            <b>Dado do Aluno</b>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="col-lg-12">
                                <label for="usr">ID Aluno:</label>
                                <html:hidden name="AlunoForm" property="idPF"/>
                                <b><bean:write name="AlunoForm" property="idPF"/></b>
                            </div>
                        </td>
                        <td>
                            <div class="col-lg-12">
                                <label for="usr">Nome do aluno:</label>
                                <b><bean:write name="AlunoForm" property="nome"/></b>
                            </div>
                        </td>
                        <td>
                            <div class="col-lg-12">
                                <label for="usr">Série/Ano:</label>
                                <html:hidden name="AlunoForm" property="serieAno"/>
                                <html:select name="AlunoForm" property="serieAno" styleId="serieAno" styleClass="form-control" disabled="true">
                                    <html:option value="0">Selecione</html:option>
                                    <html:option value="11">Infantil I</html:option>
                                    <html:option value="12">Infantil II</html:option>
                                    <html:option value="13">Infantil III</html:option>
                                    <html:option value="1">1º ano</html:option>
                                    <html:option value="2">2º ano</html:option>
                                    <html:option value="3">3º ano</html:option>
                                    <html:option value="4">4º ano</html:option>
                                    <html:option value="5">5º ano</html:option>
                                    <html:option value="6">6º ano</html:option>
                                    <html:option value="7">7º ano</html:option>
                                    <html:option value="8">8º ano</html:option>
                                    <html:option value="9">9º ano</html:option>
                                    <html:option value="10">1ª série E.M.</html:option>
                                    <html:option value="20">2ª série E.M.</html:option>
                                    <html:option value="30">3ª série E.M.</html:option>
                                </html:select>
                            </div>
                        </td>

                    </tr>
                    <tr>
                        <td>
                            <div class="col-lg-12">
                                <label for="usr">Data: <span style="font-size: 12px; color: red"> (Informe a data da ocorrência)</span></label>
                                <html:text name="AlunoForm" property="dataHistorico" styleId="dataHistorico" styleClass="form-control" size="15" maxlength="10" onkeyup="formatarData(this);" onkeypress="return(validarConteudo(event, 'numero'))" onfocus="show('dataHistorico')" onblur="hide('dataHistorico')"/>
                            </div>
                        </td>
                        <td>
                            <div class="col-lg-12">
                                <label for="usr">Professor:</label>
                                <html:select name="AlunoForm" property="idProfessorHistorico" styleClass="form-control">
                                    <html:option value="0">Selecione</html:option>
                                    <html:options collection="listaProfessor" property="idPF" labelProperty="nome"></html:options>
                                </html:select>
                            </div>
                        </td>
                        <td>
                            <div class="col-lg-12">
                                <label for="usr">Assunto:</label>
                                <html:text name="AlunoForm" property="assuntoHistorico" styleId="assuntoHistorico" styleClass="form-control" />
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <div class="col-lg-12">
                                <label for="usr">Descrição:</label>
                                <html:textarea name="AlunoForm" property="descricaoHistorico" styleId="descricaoHistorico" styleClass="form-control" rows="7"/>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>


            <div align="center">
                <input class="btn btn-green" type="button" value="Salvar" onClick="fSalvar();">
                <br/>
            </div>

            <logic:equal name="cadastro" value="true">
                <br/>
                <div class="alert alert-info" id="myAlert" style="text-align: center">
                    <a href="#" class="close">&times;</a>
                    <b>Cadastro Realizado com Sucesso!</b>
                </div>
            </logic:equal>
            <logic:equal name="cadastro" value="false">
                <br/>
                <div class="alert alert-danger alert-dismissible" id="myAlert" style="text-align: center">
                    <a href="#" class="close">&times;</a>
                    <b>Erro no Cadastro. Favor verificar!</b>
                </div>
            </logic:equal>

            <logic:present name="listaHistoricoAluno" scope="request">
                <div>
                    &nbsp;
                </div>
                <div class="alert alert-success" id="myAlert" style="text-align: center">
                    <b>Lista Histórico do Aluno</b>
                </div>
                <table class="table" style="font-size: 11px">
                    <tr>
                        <td width="2%">&nbsp;</td>
                        <td><b>ID Aluno</b></td>
                        <td><b>Série/Ano</b></td>
                        <td><b>Data Ocorrido</b></td>
                        <td><b>Data Inserção</b></td>
                        <td><b>Professor</b></td>
                        <td><b>Assunto</b></td>
                        <td><b>Descrição</b></td>
                        <td>&nbsp;</td>
                        <td width="2%">&nbsp;</td>
                    </tr>
                    <logic:iterate id="lista" name="listaHistoricoAluno" scope="request">
                        <tr>
                            <td>&nbsp;</td>
                            <td><bean:write name="lista" property="idPF"/></td>
                            <td>
                                <logic:equal name="lista" property="serieAno" value="11">Infantil I</logic:equal>
                                <logic:equal name="lista" property="serieAno" value="12">Infantil II</logic:equal>
                                <logic:equal name="lista" property="serieAno" value="13">Infantil II</logic:equal>
                                <logic:equal name="lista" property="serieAno" value="1">1º ano</logic:equal>
                                <logic:equal name="lista" property="serieAno" value="2">2º ano</logic:equal>
                                <logic:equal name="lista" property="serieAno" value="3">3º ano</logic:equal>
                                <logic:equal name="lista" property="serieAno" value="4">4º ano</logic:equal>
                                <logic:equal name="lista" property="serieAno" value="5">5º ano</logic:equal>
                                <logic:equal name="lista" property="serieAno" value="6">6º ano</logic:equal>
                                <logic:equal name="lista" property="serieAno" value="7">7º ano</logic:equal>
                                <logic:equal name="lista" property="serieAno" value="8">8º ano</logic:equal>
                                <logic:equal name="lista" property="serieAno" value="9">9º ano</logic:equal>
                                <logic:equal name="lista" property="serieAno" value="10">1ª série E.M.</logic:equal>
                                <logic:equal name="lista" property="serieAno" value="20">2ª série E.M.</logic:equal>
                                <logic:equal name="lista" property="serieAno" value="30">3ª série E.M.</logic:equal>
                                <%--<bean:write name="lista" property="serieAno"/>--%>
                            </td>
                            <td><bean:write name="lista" property="dataHistorico"/></td>
                            <td><bean:write name="lista" property="dataCadastro"/></td>
                            <td><bean:write name="lista" property="nomeProfessor"/></td>
                            <td><bean:write name="lista" property="assuntoHistorico"/></td>
                            <td><bean:write name="lista" property="descricaoHistorico"/></td>
                            <td>
                                <input class="btn btn-danger" style="font-size: 11px" type="button" value="Excluir" onClick="fExcluir(<bean:write name="lista" property="idHistorico"/>);">
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                    </logic:iterate>
                </table>
            </logic:present>

        </html:form>
    </body>
</html>
<script language="javascript">
    function fSalvar() {
        var dataHistorico = document.AlunoForm.dataHistorico.value;
        var idProfessorHistorico = document.AlunoForm.idProfessorHistorico.value;
        var descricaoHistorico = document.AlunoForm.descricaoHistorico.value;

        if (dataHistorico.length < 2) {
            alert("Deve ser informado a data da Ocorrência!");
            document.getElementById('dataHistorico').focus();
        } else if (idProfessorHistorico === "0") {
            alert("Deve ser informado o professor!");
            document.getElementById('idProfessorHistorico').focus();
        } else if (descricaoHistorico.length < 2) {
            alert("Deve ser informado a descrição do ocorrido!");
            document.getElementById('descricaoHistorico').focus();
        } else {
            document.AlunoForm.action = "Aluno.do?action=salvarHistoricoAluno";
            document.AlunoForm.submit();
        }
    }

    function fExcluir(id) {
        if (confirm("Deseja realmente excluir esse Histórico??")) {
            document.AlunoForm.action = "Aluno.do?action=excluirHistoricoAluno&idHistorico=" + id;
            document.AlunoForm.submit();
        }
    }
</script>


