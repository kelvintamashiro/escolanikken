<%-- 
    Document   : rel_notas_aluno_page
    Created on : 8 de mar de 2021, 21:51:01
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
        <jsp:include page="topo.jsp"/>
        <div class="container-fluid">
            <div class="row p-3" style="background-color: #F4F4F4" >
                <div class="col-12 col-sm-1" align="center">
                    <a href="relatorio.jsp"><img src="imagens/bt_voltar_2.png" width="100px"/></a>
                </div>
                <div class="col-sm-10" align="center">
                    <h2>Relatório Notas por Aluno</h2>
                </div>
                <div class="col-sm-1">&nbsp;</div>
            </div>
        </div>
        <html:form action="Relatorios" name="RelatoriosForm" type="br.com.Form.RelatoriosForm" scope="request">

            <div class="form-group">
                <table border="0" align="center" style="margin-top: 20px;" width="50%">
                    <tr>
                        <td>
                            <div class="col-lg-12">
                                <label for="usr">Série/Ano:</label>
                                <bean:define id="notaBimestreForm" name="RelatoriosForm" property="notaBimestreForm"/>
                                <html:select name="notaBimestreForm" property="idSerieAno" styleId="idSerieAno" styleClass="form-control form-control-sm" onchange="fCarregarAlunos()">
                                    <html:option value="">Selecione Série/Ano</html:option>
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
                    <tr>
                        <td>
                            <div class="col-lg-12">
                                <label for="usr">Aluno:</label>
                                <logic:present name="listaAlunos" scope="request">
                                    <bean:define id="alunoForm" name="RelatoriosForm" property="alunoForm"/>
                                    <html:select name="alunoForm" property="idAluno" styleId="idAluno" styleClass="form-control form-control-sm">
                                        <html:option value="0">Selecione</html:option>
                                        <html:options collection="listaAlunos" property="idAluno" labelProperty="nome"></html:options>
                                    </html:select>
                                </logic:present>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="col-lg-12">
                                <label for="usr">&nbsp;</label><br/>
                                <input class="btn btn-sm btn-success" type="button" value="Pesquisar" onClick="fPesquisar()">
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </html:form>
    </body>
</html>
<script language="javascript">
    function fCarregarAlunos() {
        document.RelatoriosForm.action = "Relatorios.do?action=carregarAlunosPorSerie";
        document.RelatoriosForm.target = "_self";
        document.RelatoriosForm.submit();
    }

    function fPesquisar() {
        var idSerieAno = document.RelatoriosForm.idSerieAno.value;
        var idAluno = document.getElementById("idAluno").value;
        if (idSerieAno.length < 1 || idAluno === "0") {
            alert("Deve ser informado a Série/Ano e o Aluno(a) corretamente!!")
        } else {
            document.RelatoriosForm.action = "Relatorios.do?action=relNotasPorAluno";
            document.RelatoriosForm.target = "_blank";
            document.RelatoriosForm.submit();
        }
    }
</script>

