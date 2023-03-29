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
                    <a href="planejamento_aulas_page_coordenacao.jsp"><img src="imagens/bt_voltar_2.png" width="100px"/></a>
                </div>
                <div class="col-sm-10" align="center">
                    <h2>Planejamento de Aulas</h2>
                </div>
                <div class="col-sm-1">&nbsp;</div>
            </div>
        </div>
        <html:form action="PlanejamentoAulas" name="PlanejamentoAulasForm" type="br.com.Form.PlanejamentoAulasForm" scope="request">

            <div class="form-group">
                <html:hidden name="PlanejamentoAulasForm" property="idProfessor"/>
                <table border="0" class="table-condensed" align="center" style="margin-top: 20px;" width="60%">
                    <tr>
                        <td width="50%">
                            <label for="usr">Categoria Ensino:</label>
                            <html:select name="PlanejamentoAulasForm" property="categoriaEnsino" styleId="categoriaEnsino" styleClass="form-control form-control-sm" onchange="fCarregarSerie()">
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
                                <html:select name="PlanejamentoAulasForm" property="idSerieAno" styleId="idSerieAno" styleClass="form-control form-control-sm">
                                    <html:option value="">Selecione</html:option>
                                    <html:options collection="listaSerie" property="serieAno" labelProperty="dsSerieAno"></html:options>
                                </html:select>
                            </logic:present>
                            <logic:notPresent name="listaSerie" scope="request">
                                <html:select name="PlanejamentoAulasForm" property="idSerieAno" styleId="idSerieAno" styleClass="form-control form-control-sm">
                                    <html:option value="">Selecione a Categoria de Ensino</html:option>
                                </html:select>
                            </logic:notPresent>

                        </td>
                    </tr>

                    <tr>
                        <td>
                            <label for="usr">Data:</label>
                            <input type="date" class="form-control form-control-sm" name="data" id="data" maxlength="10" onkeypress="mascaraData(this)">
                        </td>
                        <td>
                            <label for="usr">Bimestre:</label>
                            <html:select name="PlanejamentoAulasForm" property="nrBimestre" styleId="nrBimestre" styleClass="form-control form-control-sm">
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
                                <html:select name="PlanejamentoAulasForm" property="idDisciplina" styleId="idDisciplina" styleClass="form-control form-control-sm">
                                    <html:option value="0">Selecione</html:option>
                                    <html:options collection="listaDisciplinaPorProfessor" property="idDisciplina" labelProperty="nomeDisciplina"></html:options>
                                </html:select>
                            </logic:present>
                            <logic:notPresent name="listaDisciplinaPorProfessor" scope="request">
                                <html:select name="PlanejamentoAulasForm" property="idDisciplina" styleId="idDisciplina" styleClass="form-control form-control-sm">
                                    <html:option value="">Selecione a Categoria de Ensino</html:option>
                                </html:select>
                            </logic:notPresent>
                        </td>
                    </tr>

                    <tr>
                        <td colspan="2">
                            <label for="usr">Conteúdo da Aula:</label>
                            <html:textarea name="PlanejamentoAulasForm" property="conteudoAula" styleId="conteudoAula" styleClass="form-control form-control-sm" rows="5"/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <label for="usr">Tarefas:</label>
                            <html:text name="PlanejamentoAulasForm" property="tarefa" styleId="tarefa" styleClass="form-control form-control-sm"/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <label for="usr">Observação:</label>
                            <html:textarea name="PlanejamentoAulasForm" property="observacao" styleId="observacao" styleClass="form-control form-control-sm" rows="5"/>
                        </td>
                    </tr>

                    <tr>
                        <td align="center" colspan="2">
                            <input class="btn btn-sm btn-success" type="button" value="Salvar" onClick="fSalvar();">
                        </td>
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