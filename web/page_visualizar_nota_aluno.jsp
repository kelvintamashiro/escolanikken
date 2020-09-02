<%-- 
    Document   : page_visualizar_nota_aluno
    Created on : 02/07/2020, 09:10:48
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
        <title>Escola Nikken - Consulta de Notas</title>
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
            <div class="form-group">
                <table align="center" width="80%" border="0">
                    <tr>
                        <td colspan="3">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <img src="imagens/logo.png" width="25%"/>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" colspan="3">
                            <h2>BOLETIM ESCOLAR - ONLINE</h2>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            &nbsp;
                        </td>
                    </tr>
                    <bean:define id="aluno" name="NotaBimestreForm" property="alunoForm"/>
                    <bean:define id="serie" name="NotaBimestreForm" property="serieAnoForm"/>
                    <tr>
                        <td colspan="2">Nome do Aluno(a): <b><bean:write name="aluno" property="nome"/></b></td>
                        <td>Ano Letivo: <b><bean:write name="NotaBimestreForm" property="ano"/></b></td>
                    </tr>
                    <tr>
                        <td width="50%">S�rie/Ano: <b><bean:write name="serie" property="dsSerieAno"/></b></td>
                        <td width="30%">Turno: <b>Integral</b></td>
                        <td width="20%">Emiss�o: <b><bean:write name="NotaBimestreForm" property="dataEmissao"/></b></td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            &nbsp;
                        </td>
                    </tr>
                </table>
                <table border="1" align="center" width="80%">
                    <tr>
                        <td rowspan="2" align="center">
                            <b>Componentes Curriculares</b>
                        </td>
                        <td colspan="2" align="center">
                            <b>1� Bimestre</b>
                        </td>
                        <td colspan="2" align="center">
                            <b>2� Bimestre</b>
                        </td>
                        <td colspan="2" align="center">
                            <b>3� Bimestre</b>
                        </td>
                        <td colspan="2" align="center">
                            <b>4� Bimestre</b>
                        </td>
                        <td rowspan="2" align="center">
                            <b>Total de Faltas</b>
                        </td>
                        <td rowspan="2" align="center">
                            <b>M�dia Final</b>
                        </td>
                        <td rowspan="2" align="center">
                            <b>Resultado Final</b>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">Nota</td>
                        <td align="center">Faltas</td>
                        <td align="center">Nota</td>
                        <td align="center">Faltas</td>
                        <td align="center">Nota</td>
                        <td align="center">Faltas</td>
                        <td align="center">Nota</td>
                        <td align="center">Faltas</td>
                    </tr>
                    <!-- linha de disciplinas -->
                    <logic:present name="listaNotasDisciplinas" scope="request">
                        <logic:iterate id="lista" name="listaNotasDisciplinas" scope="request">
                            <bean:define id="disciplina" name="lista" property="disciplinasForm"/>
                            <tr>
                                <td align="center"><bean:write name="disciplina" property="nomeDisciplina"/></td>
                                <td align="center">
                                    <logic:equal name="lista" property="media1Bimestre" value="0">
                                        &nbsp;
                                    </logic:equal>
                                    <logic:notEqual name="lista" property="media1Bimestre" value="0">
                                        <bean:write name="lista" property="media1Bimestre"/>
                                    </logic:notEqual>
                                </td> <!-- nota 1 bimestre -->
                                <td align="center"><bean:write name="lista" property="falta1Bimestre"/></td> <!-- falta 1 bimestre -->
                                <td align="center">
                                    <logic:equal name="lista" property="media2Bimestre" value="0">
                                        &nbsp;
                                    </logic:equal>
                                    <logic:notEqual name="lista" property="media2Bimestre" value="0">
                                        <bean:write name="lista" property="media2Bimestre"/>
                                    </logic:notEqual>
                                </td> <!-- nota 2 bimestre -->
                                <td align="center"><bean:write name="lista" property="falta2Bimestre"/></td> <!-- falta 2 bimestre -->
                                <td align="center">
                                    <logic:equal name="lista" property="media3Bimestre" value="0">
                                        &nbsp;
                                    </logic:equal>
                                    <logic:notEqual name="lista" property="media3Bimestre" value="0">
                                        <bean:write name="lista" property="media3Bimestre"/>
                                    </logic:notEqual>
                                </td> <!-- nota 3 bimestre -->
                                <td align="center"><bean:write name="lista" property="falta3Bimestre"/></td> <!-- falta 3 bimestre -->
                                <td align="center">
                                    <logic:equal name="lista" property="media4Bimestre" value="0">
                                        &nbsp;
                                    </logic:equal>
                                    <logic:notEqual name="lista" property="media4Bimestre" value="0">
                                        <bean:write name="lista" property="media4Bimestre"/>
                                    </logic:notEqual>
                                </td> <!-- nota 4 bimestre -->
                                <td align="center"><bean:write name="lista" property="falta4Bimestre"/></td> <!-- falta 4 bimestre -->
                                <td align="center"><bean:write name="lista" property="faltaTotal"/></td> <!-- total de faltas -->
                                <td align="center">
                                    <logic:equal name="lista" property="mediaFinal" value="0">
                                        &nbsp;
                                    </logic:equal>
                                    <logic:notEqual name="lista" property="mediaFinal" value="0">
                                        <bean:write name="lista" property="mediaFinal"/>
                                    </logic:notEqual>
                                </td> <!-- m�dia final -->
                                <td align="center"></td> <!-- Resultado final -->
                            </tr>
                        </logic:iterate>
                    </logic:present>
                </table>
                <table border="0" align="center" style="margin-top: 80px">
                    <tr>
                        <td align="center" style="color: red">
                            Esse boletim tem car�ter apenas de consulta. Para obter o documento v�lido, deve ser solicitado.
                        </td>
                    </tr>
                </table>

            </div>
        </html:form>
    </body>
</html>
<script language="javascript">


    function fVisualizar(idSerieAno, ano, idAluno) {
        document.NotaBimestreForm.action = "NotaBimestre.do?action=visualizarNota&idSerieAno=" + idSerieAno + "&ano=" + ano + "&idAluno=" + idAluno;
        document.NotaBimestreForm.submit();
    }

</script>




