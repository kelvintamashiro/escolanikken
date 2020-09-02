<%-- 
    Document   : nota_bimestre
    Created on : 03/04/2020, 22:21:32
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
        <title>Escola Nikken - Lançamento de Notas</title>
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
        <html:form action="NotaBimestre" name="NotaBimestreForm" type="br.com.Form.NotaBimestreForm" scope="request">
            <jsp:include page="topo.jsp"/>

            <table border="0" align="center" style="margin-top: 20px; background-color: #ADD8E6" width="100%">
                <tr>
                    <td width="10%" style="padding-left: 50px">
                        <a href="tela_interativa.jsp"><img src="imagens/bt_voltar_2.png" width="100px"/></a>
                    </td>
                    <td width="80%" align="center">
                        <h1>Lançamento de Notas</h1>
                    </td>
                    <td width="10%">&nbsp;</td>
                </tr>
            </table>
            <div class="form-group">
                <table border="0" align="center" style="margin-top: 20px;" width="80%" class="table">
                    <tr>
                        <td width="15%">&nbsp;</td>
                        <td width="20%">
                            <b>Categoria Ensino</b>
                        </td>
                        <td width="20%">
                            <b>Disciplina</b>
                        </td>
                        <td width="10%">
                            <b>Série/Ano</b>
                        </td>
                        <td width="20%" colspan="4">
                            &nbsp;
                            <!--<b>Professor</b>-->
                        </td>
                        <td width="15%">&nbsp;</td>
                    </tr>
                    <logic:present name="listaDisciplinaPorProfessor" scope="request">
                        <logic:iterate id="lista" name="listaDisciplinaPorProfessor" scope="request">
                            <bean:define id="disciplina" name="lista" property="disciplinasForm"/>
                            <bean:define id="serieAno" name="lista" property="serieAnoForm"/>
                            <%--<bean:define id="professor" name="lista" property="professorForm"/>--%>
                            <tr>
                                <td width="10%">&nbsp;</td>
                                <td>
                                    <logic:equal name="disciplina" property="categoriaEnsino" value="INF">
                                        Educação Infantil
                                    </logic:equal>
                                    <logic:equal name="disciplina" property="categoriaEnsino" value="EF1">
                                        Fundamental I
                                    </logic:equal>
                                    <logic:equal name="disciplina" property="categoriaEnsino" value="EF2">
                                        Fundamental II
                                    </logic:equal>
                                    <logic:equal name="disciplina" property="categoriaEnsino" value="EM">
                                        Ensino Médio
                                    </logic:equal>
                                </td>
                                <td>
                                    <bean:write name="disciplina" property="nomeDisciplina"/>
                                </td>
                                <td>
                                    <bean:write name="serieAno" property="dsSerieAno"/>
                                </td>
                                <td>
                                    <input class="btn btn-grey" type="button" value="Lançar Nota 1º Bim." onClick="fLancarNota(1,<bean:write name="lista" property="idDisciplina"/>,<bean:write name="serieAno" property="serieAno"/>);">
                                </td>
                                <td>
                                    <input class="btn btn-green" type="button" value="Lançar Nota 2º Bim." onClick="fLancarNota(2,<bean:write name="lista" property="idDisciplina"/>,<bean:write name="serieAno" property="serieAno"/>);">
                                </td>
                                <td>
                                    <input class="btn btn-grey" type="button" value="Lançar Nota 3º Bim." onClick="fLancarNota(3,<bean:write name="lista" property="idDisciplina"/>,<bean:write name="serieAno" property="serieAno"/>);">
                                </td>
                                <td>
                                    <input class="btn btn-green" type="button" value="Lançar Nota 4º Bim." onClick="fLancarNota(4,<bean:write name="lista" property="idDisciplina"/>,<bean:write name="serieAno" property="serieAno"/>);">
                                </td>
                                <td width="10%">&nbsp;</td>
                            </tr>
                        </logic:iterate>
                    </logic:present>
                </table>
            </div>

            <!--<br/><br/><br/><br/><br/><br/>-->
            <%--<jsp:include page="footer.jsp"/>--%>
        </html:form>
    </body>
</html>
<script language="javascript">
    function fLancarNota(nrBimestre, idDisciplina, serieAno) {
        document.NotaBimestreForm.action = "NotaBimestre.do?action=pageLancarNota&idDisciplina=" + idDisciplina + "&serieAno=" + serieAno + "&nrBimestre=" + nrBimestre;
        document.NotaBimestreForm.submit();
    }
</script>


