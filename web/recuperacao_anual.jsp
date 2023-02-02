<%-- 
    Document   : recuperacao_anual
    Created on : 9/dez/2020, 20:12:32
    Author     : macuser
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<!DOCTYPE html>
<html class="js-disabled">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Escola Nikken - Recuperação Anual</title>
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
    <body>
        <logic:present name="errors">
            <script>
                alert('<bean:write name="errors"/>');
            </script>
        </logic:present>
        <html:form action="RecuperacaoAnual" name="RecuperacaoAnualForm" type="br.com.Form.RecuperacaoAnualForm" scope="request">
            <jsp:include page="topo.jsp"/>

            <table border="0" align="center" style="margin-top: 20px; background-color: #ADD8E6" width="100%">
                <tr>
                    <td width="10%" style="padding-left: 50px">
                        <a href="tela_interativa.jsp"><img src="imagens/bt_voltar_2.png" width="100px"/></a>
                    </td>
                    <td width="80%" align="center">
                        <h1>Recuperação Anual</h1>
                    </td>
                    <td width="10%">&nbsp;</td>
                </tr>
            </table>

            <div class="form-group">
                <table border="0" align="center" style="margin-top: 20px;" width="80%">
                    <tr>
                        <td width="25%">
                            <div class="col-lg-12">
                                <label for="usr">Série/Ano:</label>
                                <%--<html:hidden name="serieAno" property="serieAno"/>--%>
                                <html:select name="RecuperacaoAnualForm" property="idSerieAno" styleId="idSerieAno" styleClass="form-control">
                                    <html:option value="">Selecione Série/Ano</html:option>
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
                        <td width="25%">
                            <div class="col-lg-12">
                                <label for="usr">Ano letivo:</label>
                                <html:select name="RecuperacaoAnualForm" property="ano" styleId="ano" styleClass="form-control">
                                    <html:option value="2023">2023</html:option>
                                    <html:option value="2022">2022</html:option>
                                    <html:option value="2021">2021</html:option>
                                    <html:option value="2020">2020</html:option>
                                </html:select>
                            </div>
                        </td>
                        <td width="25%">
                            <div class="col-lg-12">
                                <label for="usr">&nbsp;</label>
                                <input class="btn btn-green" type="button" value="Pesquisar" onClick="fPesquisar()">
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
            <logic:present name="listaAlunosDisciplinaRecupAnual" scope="request">
                <div class="form-group">
                    <table border="0" class="table-condensed" align="center" style="margin-top: 20px;" width="90%">
                        <tr>
                            <td width="10%">&nbsp;</td>
                            <td><b>Aluno</b></td>
                            <td><b>Disciplina</b></td>
                            <td align="center"><b>Média Anual</b>(Soma das Médias Bim. / 4)</td>
                            <!--<td width="10%"><b>Nota Recup. Final</b></td>-->
                            <td width="10%">&nbsp;</td>
                            <td width="10%">&nbsp;</td>
                        </tr>

                        <logic:iterate name="listaAlunosDisciplinaRecupAnual" id="listaTotal" scope="request">
                            <tr>
                                <td width="10%">&nbsp;</td>
                                <td><bean:write name="listaTotal" property="nomeAluno"/></td>
                                <td><bean:write name="listaTotal" property="nomeDisciplina"/></td>
                                <td align="center"><bean:write name="listaTotal" property="mediaAnual"/></td>
                                <!--                                <td>
                                                                    <input class="nota form-control" name="notaRecuperacao" id="notaRecuperacao" type="text" min="0" max="10" />
                                                                </td>-->
                                <td width="10%">
                                    <input class="btn btn-info" type="button" value="Incluir Nota" onClick="fIncluirNotaPage(<bean:write name="listaTotal" property="idAluno"/>, <bean:write name="listaTotal" property="idDisciplina"/>, '<bean:write name="listaTotal" property="mediaAnual"/>', '<bean:write name="listaTotal" property="nomeDisciplina"/>', '<bean:write name="listaTotal" property="nomeAluno"/>');">
                                    <!--<input class="btn btn-info" type="button" value="Salvar" onClick="fSalvarNota(<bean:write name="listaTotal" property="idAluno"/>, <bean:write name="listaTotal" property="idDisciplina"/>, '<bean:write name="listaTotal" property="mediaAnual"/>');">-->
                                </td>
                                <td width="10%">&nbsp;</td>
                            </tr>
                        </logic:iterate>
                    </table>
                </div>
            </logic:present>
            <script type="text/javascript">
                var notas = document.getElementsByClassName("nota");

                var onNotaInput = function (event) {
                    var regexp = new RegExp("[^0-9]", "g");
                    var value = event.target.value.replace(regexp, "");
                    value = parseInt(value) / 10;
                    if (value >= event.target.min && value <= event.target.max) {
                        event.target.dataset.value = value;
                    } else {
                        value = parseFloat(event.target.dataset.value);
                    }
                    if (isNaN(value)) {
                        value = 0;
                    }

                    event.target.value = value.toLocaleString(undefined, {minimumFractionDigits: 1});
                };

                [].forEach.call(notas, function (nota) {
                    nota.addEventListener("input", onNotaInput);
                });
            </script>


            <hr/>
            <div class="form-group">
                <table border="0" class="table-condensed" align="center" style="background-color: #F5F5DC" width="90%">
                    <logic:present name="listaNotasAlunosComNotas" scope="request">
                        <tr>
                            <td align="center" style="font-size: 20px" colspan="7">
                                <b>NOTAS LANÇADAS</b>
                            </td>
                        </tr>
                        <tr>
                            <td width="10%">&nbsp;</td>
                            <td><b>Aluno</b><br/>&nbsp;</td>
                            <td><b>Disciplina</b><br/>&nbsp;</td>
                            <td align="center"><b>Nota Recup. Final</b><br/>&nbsp;</td>
                            <td align="center"><b>Média Anual</b><br/>
                                <span style="font-size: 11px">(Soma das Médias Bim. / 4)</span>
                            </td>
                            <td align="center"><b>Média Final</b><br/>
                                <span style="font-size: 11px"> (Média Anual + Recuperação Anual) / 2</span>
                            </td>
                            <td width="10%">&nbsp;</td>
                            <td width="10%">&nbsp;</td>
                        </tr>
                        <logic:iterate name="listaNotasAlunosComNotas" id="lista" scope="request">
                            <tr>
                                <td width="10%">&nbsp;</td>
                                <td><bean:write name="lista" property="nomeAluno"/></td>
                                <td><bean:write name="lista" property="nomeDisciplina"/></td>
                                <td align="center"><bean:write name="lista" property="notaRecuperacao"/></td>
                                <td align="center"><bean:write name="lista" property="mediaAnual"/></td>
                                <td align="center"><b><bean:write name="lista" property="mediaFinal"/></b></td>
                                <td width="10%">
                                    <logic:equal name="tipoPerfil" scope="session" value="coordenacao">
                                        <input class="btn btn-danger" type="button" value="Excluir" onClick="fExcluir(<bean:write name="lista" property="id"/>);">
                                    </logic:equal>
                                    <logic:equal name="tipoPerfil" scope="session" value="diretoria">
                                        <input class="btn btn-danger" type="button" value="Excluir" onClick="fExcluir(<bean:write name="lista" property="id"/>);">
                                    </logic:equal>
                                </td>
                                <td width="10%">&nbsp;</td>
                            </tr>
                        </logic:iterate>
                    </logic:present>
                </table>
            </div>
        </html:form>
        <br/><br/><br/><br/><br/>
    </body>
</html>
<script language="javascript">

    function fPesquisar() {
        var idSerieAno = document.RecuperacaoAnualForm.idSerieAno.value;

        if (idSerieAno === "") {
            alert("Deve ser informado a SÉRIE/ANO");
        } else {
            document.RecuperacaoAnualForm.action = "RecuperacaoAnual.do?action=pesquisarAlunosPorSerieRecuperacaoAnual";
            document.RecuperacaoAnualForm.target = "_self";
            document.RecuperacaoAnualForm.submit();
        }
    }

    function fIncluirNotaPage(idAluno, idDisciplina, mediaAnual, nomeDisciplina, nomeAluno) {
        document.RecuperacaoAnualForm.action = "RecuperacaoAnual.do?action=pageIncluirNota&idAluno=" + idAluno + "&idDisciplina=" + idDisciplina + "&mediaAnual=" + mediaAnual + "&nomeDisciplina=" + nomeDisciplina + "&nomeAluno=" + nomeAluno;
        document.RecuperacaoAnualForm.submit();
    }

    function fSalvarNota(idAluno, idDisciplina, mediaAnual) {
        document.RecuperacaoAnualForm.action = "RecuperacaoAnual.do?action=salvarNotaRecuperacao&idAluno=" + idAluno + "&idDisciplina=" + idDisciplina + "&mediaAnual=" + mediaAnual;
        document.RecuperacaoAnualForm.submit();
    }

    function fExcluir(id) {
        if (confirm("Deseja realmente excluir??")) {
            document.RecuperacaoAnualForm.action = "RecuperacaoAnual.do?action=excluirNotaRecuperacao&id=" + id;
            document.RecuperacaoAnualForm.submit();
        }
    }

</script>



