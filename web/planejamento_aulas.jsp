<%-- 
    Document   : planejamento_aulas
    Created on : 05/08/2020, 15:28:52
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
        <title>Escola Nikken - Painel</title>
        <link rel="shortcut icon" href="imagens/favico.png" />
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <script language="javascript1.2" src="js/mizanscene.js"></script>
        <script type="text/javascript" src="js/JQuery/js/jquery-1.3.2.js"></script>

        <!--<link rel="stylesheet" media="all" type="text/css" href="assets/css/reset.css" />-->
        <link rel="stylesheet" media="all" type="text/css" href="assets/css/fix.css" />
        <link rel="stylesheet" media="all" type="text/css" href="assets/css/style_original.css" />
        <link rel="stylesheet" media="all" type="text/css" href="assets/css/mobile.css" />

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
        <html:form action="PlanejamentoAulas" name="PlanejamentoAulasForm" type="br.com.Form.PlanejamentoAulasForm" scope="request">

            <table border="0" align="center" style="margin-top: 20px; background-color: #FFC0CB" width="100%">
                <tr>
                    <td width="10%" style="padding-left: 50px">
                        <a href="tela_interativa.jsp"><img src="imagens/bt_voltar_2.png" width="100px"/></a>
                    </td>
                    <td width="80%" align="center">
                        <h1>Planejamento de Aulas</h1>
                    </td>
                    <td width="10%">&nbsp;</td>
                </tr>
            </table>
            <div class="form-group">
                <html:hidden name="PlanejamentoAulasForm" property="idProfessor"/>
                <table border="0" class="table-condensed" align="center" style="margin-top: 20px;" width="60%">
                    <tr>
                        <td width="50%">
                            <label for="usr">Categoria Ensino:</label>
                            <html:select name="PlanejamentoAulasForm" property="categoriaEnsino" styleId="categoriaEnsino" styleClass="form-control" onchange="fCarregarSerie()">
                                <html:option value="">Selecione</html:option>
                                <html:option value="INF">Educação Infantil</html:option>
                                <html:option value="EF1">Ensino Fundamental I</html:option>
                                <html:option value="EF2">Ensino Fundamental II</html:option>
                                <html:option value="EM">Ensino Médio</html:option>
                            </html:select>
                        </td>
                        <td width="50%">
                            <label for="usr">Série/Ano:</label>
                            <logic:present name="listaSerie" scope="request">
                                <html:select name="PlanejamentoAulasForm" property="idSerieAno" styleId="idSerieAno" styleClass="form-control">
                                    <html:option value="">Selecione</html:option>
                                    <html:options collection="listaSerie" property="serieAno" labelProperty="dsSerieAno"></html:options>
                                </html:select>
                            </logic:present>
                            <logic:notPresent name="listaSerie" scope="request">
                                <html:select name="PlanejamentoAulasForm" property="idSerieAno" styleId="idSerieAno" styleClass="form-control">
                                    <html:option value="">Selecione a Categoria de Ensino</html:option>
                                </html:select>
                            </logic:notPresent>

                        </td>
                    </tr>

                    <tr>
                        <td>
                            <label for="usr">Data:</label>
                            <input type="date" class="form-control" name="data" id="data" maxlength="10" onkeypress="mascaraData(this)">
                        </td>
                        <td>
                            <label for="usr">Bimestre:</label>
                            <html:select name="PlanejamentoAulasForm" property="nrBimestre" styleId="nrBimestre" styleClass="form-control">
                                <html:option value="1">1º Bimestre</html:option>
                                <html:option value="2">2º Bimestre</html:option>
                                <html:option value="3">3º Bimestre</html:option>
                                <html:option value="4">4º Bimestre</html:option>
                            </html:select>
                        </td>
                    </tr>

                    <tr>
                        <td colspan="2">
                            <label for="usr">Disciplina</label>
                            <logic:present name="listaDisciplinaPorProfessor" scope="request">
                                <html:select name="PlanejamentoAulasForm" property="idDisciplina" styleId="idDisciplina" styleClass="form-control">
                                    <html:option value="0">Selecione</html:option>
                                    <html:options collection="listaDisciplinaPorProfessor" property="idDisciplina" labelProperty="nomeDisciplina"></html:options>
                                </html:select>
                            </logic:present>
                            <logic:notPresent name="listaDisciplinaPorProfessor" scope="request">
                                <html:select name="PlanejamentoAulasForm" property="idDisciplina" styleId="idDisciplina" styleClass="form-control">
                                    <html:option value="">Selecione a Categoria de Ensino</html:option>
                                </html:select>
                            </logic:notPresent>
                        </td>
                    </tr>

                    <tr>
                        <td colspan="2">
                            <label for="usr">Conteúdo da Aula:</label>
                            <html:textarea name="PlanejamentoAulasForm" property="conteudoAula" styleId="conteudoAula" styleClass="form-control" rows="5"/>
                        </td>
                    </tr>
<!--                    <tr>
                        <td colspan="2">
                            <label for="usr">Metodologia:</label>
                            <html:text name="PlanejamentoAulasForm" property="metodologia" styleId="metodologia" styleClass="form-control"/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <label for="usr">Recursos:</label>
                            <html:text name="PlanejamentoAulasForm" property="recurso" styleId="recurso" styleClass="form-control"/>
                        </td>
                    </tr>-->
                    <tr>
                        <td colspan="2">
                            <label for="usr">Tarefas:</label>
                            <html:text name="PlanejamentoAulasForm" property="tarefa" styleId="tarefa" styleClass="form-control"/>
                        </td>
                    </tr>
<!--                    <tr>
                        <td colspan="2">
                            <label for="usr">Avaliação:</label>
                            <html:text name="PlanejamentoAulasForm" property="avaliacao" styleId="avaliacao" styleClass="form-control"/>
                        </td>
                    </tr>-->
                    <tr>
                        <td colspan="2">
                            <label for="usr">Observação:</label>
                            <html:textarea name="PlanejamentoAulasForm" property="observacao" styleId="observacao" styleClass="form-control" rows="5"/>
                        </td>
                    </tr>

                    <tr>
                        <td align="center" colspan="2">
                            <input class="btn btn-green" type="button" value="Salvar" onClick="fSalvar();">
                        </td>
<!--                        <td align="center">
                            <input class="btn btn-grey" type="button" value="Pesquisar" onClick="fPesquisar();">
                        </td>-->
                    </tr>
                </table>
            </div>
        </html:form>
    </body>


    <script language="javascript">
        function fCarregarSerie() {
            var categoriaEnsino = document.PlanejamentoAulasForm.categoriaEnsino.value;
            document.PlanejamentoAulasForm.action = "PlanejamentoAulas.do?action=carregarSerie&categoriaEnsino=" + categoriaEnsino + "&idPF=<bean:write name="PlanejamentoAulasForm" property="idProfessor"/>";
            document.PlanejamentoAulasForm.submit();
        }

        function fPesquisar() {
//            document.PlanejamentoAulasForm.action = "PlanejamentoAulas.do?action=pesquisar&idPF=<bean:write name="PlanejamentoAulasForm" property="idProfessor"/>";
            document.PlanejamentoAulasForm.action = "PlanejamentoAulas.do?action=pagePesquisarPorProfessor&idPF=<bean:write name="PlanejamentoAulasForm" property="idProfessor"/>";
            document.PlanejamentoAulasForm.submit();
        }

        function fSalvar() {
            var categoriaEnsino = document.PlanejamentoAulasForm.categoriaEnsino.value;
            var idSerieAno = document.PlanejamentoAulasForm.idSerieAno.value;
            var idDisciplina = document.PlanejamentoAulasForm.idDisciplina.value;
            var data = document.getElementById("data").value;
            if (categoriaEnsino === "") {
                alert("Deve ser informado a Categoria de Ensino");
                document.getElementById("categoriaEnsino").focus();
            } else if (idSerieAno === "") {
                alert("Deve ser informado a Série/Ano");
                document.getElementById("idSerieAno").focus();
            } else if (data === "") {
                alert("Deve ser informado a Data");
                document.getElementById("data").focus();
            } else if (idDisciplina === "0") {
                alert("Deve ser informado a Disciplina");
                document.getElementById("idDisciplina").focus();
            } else {
                document.PlanejamentoAulasForm.action = "PlanejamentoAulas.do?action=salvar&idPF=<bean:write name="PlanejamentoAulasForm" property="idProfessor"/>";
                document.PlanejamentoAulasForm.submit();
            }

        }
    </script>

</html>