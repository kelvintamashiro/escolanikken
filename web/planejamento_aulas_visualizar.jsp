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
        <%--<jsp:include page="topo.jsp"/>--%>
        <html:form action="PlanejamentoAulas" name="PlanejamentoAulasForm" type="br.com.Form.PlanejamentoAulasForm" scope="request">

            <table border="0" align="center" style="margin-top: 20px;" width="100%">
                <tr>
                    <td width="10%" style="padding-left: 50px">
                    </td>
                    <td width="80%" align="center">
                        <h1>Planejamento de Aula</h1>
                    </td>
                    <td width="10%">&nbsp;</td>
                </tr>
            </table>
            <div class="form-group">
                <html:hidden name="PlanejamentoAulasForm" property="idProfessor"/>
                <table border="0" class="table-condensed" align="center" style="margin-top: 20px;" width="60%">
                    <tr>
                        <td>
                            <label for="usr"><b>ID:</b></label>
                            <html:hidden name="PlanejamentoAulasForm" property="idPlanejamento"/>
                            <bean:write name="PlanejamentoAulasForm" property="idPlanejamento"/>
                        </td>
                        <td>
                            <label for="usr"><b>Série/Ano:</b></label>
                            <bean:write name="PlanejamentoAulasForm" property="dsSerieAno"/>
                        </td>
                        <td>
                            <label for="usr"><b>Bimestre:</b></label>
                            <bean:write name="PlanejamentoAulasForm" property="nrBimestre"/>º Bimestre
                        </td>
                        <td>
                            <label for="usr"><b>Disciplina</b></label>
                            <bean:write name="PlanejamentoAulasForm" property="nomeDisciplina"/>
                        </td>
                    </tr>
                </table>
                <table border="0" class="table-condensed" align="center" width="60%">
                    <tr>
                        <td>
                            <label for="usr"><b>Data:</b></label>
                            <bean:write name="PlanejamentoAulasForm" property="data"/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <label for="usr"><b>Conteúdo da Aula:</b></label>
                            <bean:write name="PlanejamentoAulasForm" property="conteudoAula"/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <label for="usr"><b>Metodologia:</b></label>
                            <bean:write name="PlanejamentoAulasForm" property="metodologia"/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <label for="usr"><b>Recursos:</b></label>
                            <bean:write name="PlanejamentoAulasForm" property="recurso"/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <label for="usr"><b>Tarefas:</b></label>
                            <bean:write name="PlanejamentoAulasForm" property="tarefa"/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <label for="usr"><b>Avaliação:</b></label>
                            <bean:write name="PlanejamentoAulasForm" property="avaliacao"/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <label for="usr"><b>Observação:</b></label>
                            <bean:write name="PlanejamentoAulasForm" property="observacao"/>
                        </td>
                    </tr>
                    <tr><td align="center" colspan="2">&nbsp;</td></tr>
                    <tr><td align="center" colspan="2">&nbsp;</td></tr>
                </table>
                <table width="10%" align="center">
                    <tr>
                        <td align="center">
                            <html:button property="btImprimir" styleClass="btn btn-green" onclick="javascript: style.display='none', window.print()">
                                Imprimir
                            </html:button>
                        </td>
                    </tr>
                </table>
            </div>
        </html:form>
    </body>

    <script language="javascript">
        function DoPrinting() {
            window.print();
        }
    </script>

</html>
