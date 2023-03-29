<%-- 
    Document   : justificativa_falta_page
    Created on : 4 de nov de 2021, 18:35:26
    Author     : macuser
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<!DOCTYPE html>
<html lang="pt-br" class="js-disabled">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Escola Nikken</title>
        <link rel="shortcut icon" href="imagens/favico.png" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

        <style>
            body {
                margin:0;
                padding:0;
            }

        </style>
    </head>
    <body>
        <logic:present name="errors">
            <script>
                alert('<bean:write name="errors"/>');
            </script>
        </logic:present>
        <jsp:include page="topo.jsp"/>
        <div class="container-fluid">
            <div class="row p-3" style="background-color: #F4F4F4" >
                <div class="col-12 col-sm-1" align="center">
                    <a href="tela_interativa.jsp"><img src="imagens/bt_voltar_2.png" width="100px"/></a>
                </div>
                <div class="col-sm-10" align="center">
                    <h2>Justificativa de Falta(s) por Aluno</h2>
                </div>
                <div class="col-sm-1">&nbsp;</div>
            </div>
        </div>
        <html:form action="JustificativaFalta" name="JustificativaFaltaForm" type="br.com.Form.JustificativaFaltaForm" scope="request">

            <div class="form-group">
                <table border="0" align="center" style="margin-top: 20px;" width="60%">
                    <tr>
                        <td colspan="2">
                            <div class="col-lg-12">
                                <label for="usr">Série/Ano:</label>
                                <html:select name="JustificativaFaltaForm" property="idSerieAno" styleId="idSerieAno" styleClass="form-control form-control-sm" onchange="fCarregarAlunos()">
                                    <html:option value="">Selecione Série/Ano</html:option>
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
                                    <html:option value="10">1ª série</html:option>
                                    <html:option value="20">2ª série</html:option>
                                    <html:option value="30">3ª série</html:option>
                                </html:select>
                            </div>
                        </td>
                    </tr>
                    <logic:present name="listaAlunos" scope="session">
                        <tr>
                            <td colspan="2">
                                <div class="col-lg-12">
                                    <label for="usr">Aluno:</label>

                                    <html:select name="JustificativaFaltaForm" property="idAluno" styleId="idAluno" styleClass="form-control form-control-sm">
                                        <html:option value="0">Selecione</html:option>
                                        <html:options collection="listaAlunos" property="idAluno" labelProperty="nome"></html:options>
                                    </html:select>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <div class="col-lg-12">
                                    <label for="usr">Bimestre:</label>
                                    <html:select name="JustificativaFaltaForm" property="nrBimestre" styleId="nrBimestre" styleClass="form-control form-control-sm">
                                        <html:option value="0">Selecione</html:option>
                                        <html:option value="1">1º Bimestre</html:option>
                                        <html:option value="2">2º Bimestre</html:option>
                                        <html:option value="3">3º Bimestre</html:option>
                                        <html:option value="4">4º Bimestre</html:option>
                                    </html:select>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <div class="col-lg-12">
                                    <label for="usr">Data Falta:</label>
                                    <input type="date" class="form-control form-control-sm" name="dataFalta" id="dataFalta">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <div class="col-lg-12">
                                    <label for="usr">Descrição Justificativa:</label>
                                    <html:textarea name="JustificativaFaltaForm" property="descricao" styleId="descricao" styleClass="form-control form-control-sm" rows="8"/>
                                </div>
                            </td>
                        </tr>
                    </logic:present>
                    <tr>
                        <td colspan="2">&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <div class="col-lg-12">
                                <label for="usr">&nbsp;</label>
                                <input class="btn btn-sm btn-success" type="button" value="Salvar" onClick="fSalvar()">

                                <label for="usr">&nbsp;</label>
                                <input class="btn btn-sm btn-primary" type="button" value="Pesquisar" onClick="fPesquisar()">
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
            <logic:equal name="salvo" value="true">
                <div class="alert alert-info" id="myAlert" style="text-align: center">
                    <b><bean:write name="errors"/></b>
                </div>
            </logic:equal>
            <logic:equal name="salvo" value="false">
                <div class="alert alert-danger alert-dismissible" id="myAlert" style="text-align: center">
                    <b><bean:write name="errors"/></b>
                </div>
            </logic:equal>
        </html:form>
    </body>
</html>
<script language="javascript">
    function fCarregarAlunos() {
        document.JustificativaFaltaForm.action = "JustificativaFalta.do?action=carregarAlunosPorSerie";
        document.JustificativaFaltaForm.target = "_self";
        document.JustificativaFaltaForm.submit();
    }

    function fSalvar() {
        var idAluno = document.JustificativaFaltaForm.idAluno.value;
        var dataFalta = document.getElementById("dataFalta").value;
        if (idAluno === "0") {
            alert("Deve ser informado o Aluno(a) corretamente!!");
        } else if (dataFalta.length < 2) {
            alert("Deve ser informado a Data da Falta!!");
        } else {
            document.JustificativaFaltaForm.action = "JustificativaFalta.do?action=salvarJustificativa";
            document.JustificativaFaltaForm.target = "_self";
            document.JustificativaFaltaForm.submit();
        }
    }

    function fPesquisar() {
        document.JustificativaFaltaForm.action = "JustificativaFalta.do?action=pesquisar";
        document.JustificativaFaltaForm.target = "_blank";
        document.JustificativaFaltaForm.submit();
    }

</script>


