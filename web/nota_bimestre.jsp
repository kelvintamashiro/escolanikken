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
        <html:form action="NotaBimestre" name="NotaBimestreForm" type="br.com.Form.NotaBimestreForm" scope="request">
            <jsp:include page="topo.jsp"/>
            <div class="container-fluid">
                <div class="row p-3" style="background-color: #F4F4F4" >
                    <div class="col-12 col-sm-1" align="center">
                        <a href="gerenciador_notas.jsp"><img src="imagens/bt_voltar_2.png" width="100px"/></a>
                    </div>
                    <div class="col-sm-10" align="center">
                        <h1>Lançamento de Notas</h1>
                    </div>
                    <div class="col-sm-1">&nbsp;</div>
                </div>
            </div>


            <div class="form-group">
                <table border="0" align="center" style="margin-top: 20px;" width="80%" class="table">
                    <tr>
                        <th width="15%">&nbsp;</th>
                        <th width="20%">
                            <b>Categoria Ensino</b>
                        </th>
                        <th width="20%">
                            <b>Disciplina</b>
                        </th>
                        <th width="10%">
                            <b>Série/Ano</b>
                        </th>
                        <th width="20%" colspan="4">
                            &nbsp;
                            <!--<b>Professor</b>-->
                        </th>
                        <th width="15%">&nbsp;</th>
                    </tr>
                    <logic:present name="listaDisciplinaPorProfessor" scope="request">
                        <logic:iterate id="lista" name="listaDisciplinaPorProfessor" scope="request">
                            <bean:define id="disciplina" name="lista" property="disciplinasForm"/>
                            <bean:define id="serieAno" name="lista" property="serieAnoForm"/>
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
                                    <input class="btn btn-sm btn-primary" type="button" value="Lançar Nota 1º Bim." onClick="fLancarNota(1,<bean:write name="lista" property="idDisciplina"/>,<bean:write name="serieAno" property="serieAno"/>);">
                                </td>
                                <td>
                                    <input class="btn btn-sm btn-danger" type="button" value="Lançar Nota 2º Bim." onClick="fLancarNota(2,<bean:write name="lista" property="idDisciplina"/>,<bean:write name="serieAno" property="serieAno"/>);">
                                </td>
                                <td>
                                    <input class="btn btn-sm btn-success" type="button" value="Lançar Nota 3º Bim." onClick="fLancarNota(3,<bean:write name="lista" property="idDisciplina"/>,<bean:write name="serieAno" property="serieAno"/>);">
                                </td>
                                <td>
                                    <input class="btn btn-sm btn-warning" type="button" value="Lançar Nota 4º Bim." onClick="fLancarNota(4,<bean:write name="lista" property="idDisciplina"/>,<bean:write name="serieAno" property="serieAno"/>);">
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


