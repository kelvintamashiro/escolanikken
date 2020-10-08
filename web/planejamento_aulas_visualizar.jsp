<%-- 
    Document   : planejamento_aulas_visualizar
    Created on : 15/09/2020, 23:01:03
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
                        <a href="javascript:history.back()"><img src="imagens/bt_voltar_2.png" width="100px"/></a>
                    </td>
                    <td width="80%" align="center">
                        <h1>Planejamento de Aulas - Visualizar</h1>
                    </td>
                    <td width="10%">&nbsp;</td>
                </tr>
            </table>
            <div class="form-group">
                <html:hidden name="PlanejamentoAulasForm" property="idProfessor"/>
                <table border="0" class="table-condensed" align="center" style="margin-top: 20px;" width="60%">
                    <tr>
                        <td width="33%">
                            <label for="usr">ID:</label>
                            <html:hidden name="PlanejamentoAulasForm" property="idPlanejamento"/>
                            <b><bean:write name="PlanejamentoAulasForm" property="idPlanejamento"/></b>
                        </td>
                        <td width="33%">
                            <label for="usr">Série/Ano:</label>
                            <b><bean:write name="PlanejamentoAulasForm" property="dsSerieAno"/></b>
                        </td>
                        <td width="33%">
                            <label for="usr">Disciplina</label>
                            <b><bean:write name="PlanejamentoAulasForm" property="nomeDisciplina"/></b>
                        </td>
                    </tr>
                </table>
                <table border="0" class="table-condensed" align="center" style="margin-top: 20px;" width="60%">
                    <tr>
                        <td width="50%">
                            <label for="usr">Data:</label>
                            <html:text name="PlanejamentoAulasForm" property="data" styleId="data" styleClass="form-control" readonly="true"/>
                        </td>
                        <td width="50%">
                            <label for="usr">Bimestre:</label>
                            <html:select name="PlanejamentoAulasForm" property="nrBimestre" styleId="nrBimestre" styleClass="form-control" disabled="true">
                                <html:option value="1">1º Bimestre</html:option>
                                <html:option value="2">2º Bimestre</html:option>
                                <html:option value="3">3º Bimestre</html:option>
                                <html:option value="4">4º Bimestre</html:option>
                            </html:select>
                        </td>
                    </tr>

                    <tr>

                    </tr>

                    <tr>
                        <td colspan="2">
                            <label for="usr">Conteúdo da Aula:</label>
                            <html:textarea name="PlanejamentoAulasForm" property="conteudoAula" styleId="conteudoAula" styleClass="form-control" rows="5" readonly="true"/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <label for="usr">Metodologia:</label>
                            <html:text name="PlanejamentoAulasForm" property="metodologia" styleId="metodologia" styleClass="form-control" readonly="true"/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <label for="usr">Recursos:</label>
                            <html:text name="PlanejamentoAulasForm" property="recurso" styleId="recurso" styleClass="form-control" readonly="true"/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <label for="usr">Tarefas:</label>
                            <html:text name="PlanejamentoAulasForm" property="tarefa" styleId="tarefa" styleClass="form-control" readonly="true"/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <label for="usr">Avaliação:</label>
                            <html:text name="PlanejamentoAulasForm" property="avaliacao" styleId="avaliacao" styleClass="form-control" readonly="true"/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <label for="usr">Observação:</label>
                            <html:textarea name="PlanejamentoAulasForm" property="observacao" styleId="observacao" styleClass="form-control" rows="5" readonly="true"/>
                        </td>
                    </tr>

                    <tr><td align="center" colspan="2">&nbsp;</td></tr>
                    <tr><td align="center" colspan="2">&nbsp;</td></tr>
                </table>
            </div>
        </html:form>
    </body>


    <script language="javascript">
        function fAtualizar() {
            var data = document.getElementById("data").value;
            if (data === "") {
                alert("Deve ser informado a Data");
                document.getElementById("data").focus();
            } else {
                document.PlanejamentoAulasForm.action = "PlanejamentoAulas.do?action=atualizar";
                document.PlanejamentoAulasForm.submit();
            }

        }
    </script>

</html>
