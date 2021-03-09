<%-- 
    Document   : page_visualizar_nota
    Created on : 11/06/2020, 20:44:11
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
                <table align="center" width="80%" border="0" style="font-size: 11px">

                    <tr>
                        <td>
                            <img src="imagens/logo.png" width="50%"/>
                        </td>
                        <td colspan="2" align="right">
                            <h2>BOLETIM ESCOLAR</h2>
                        </td>
                    </tr>

                    <bean:define id="aluno" name="NotaBimestreForm" property="alunoForm"/>
                    <bean:define id="serie" name="NotaBimestreForm" property="serieAnoForm"/>
                    <tr>
                        <td colspan="2">Nome do Aluno(a): <b><bean:write name="aluno" property="nome"/></b></td>
                        <td align="right">Ano Letivo: <b><bean:write name="NotaBimestreForm" property="ano"/></b></td>
                    </tr>
                    <tr>
                        <td width="50%">Série/Ano: <b><bean:write name="serie" property="dsSerieAno"/></b></td>
                        <td width="30%">Turno: <b>Integral</b></td>
                        <td width="20%" align="right">Emissão: <b><bean:write name="NotaBimestreForm" property="dataEmissao"/></b></td>
                    </tr>
                </table>
                <table border="1" align="center" width="80%" style="font-size: 10px">
                    <tr>
                        <td rowspan="2" align="center">
                            <b>Componentes Curriculares</b>
                        </td>
                        <td colspan="2" align="center">
                            <b>1º Bimestre</b>
                        </td>
                        <td colspan="2" align="center">
                            <b>2º Bimestre</b>
                        </td>
                        <td colspan="2" align="center">
                            <b>3º Bimestre</b>
                        </td>
                        <td colspan="2" align="center">
                            <b>4º Bimestre</b>
                        </td>
                        <td rowspan="2" align="center">
                            <b>Total de Faltas</b>
                        </td>
                        <td rowspan="2" align="center">
                            <b>Média Anual</b>
                        </td>
                        <td rowspan="2" align="center">
                            <b>Média Final</b>
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
                                    <logic:lessThan name="lista" property="media1Bimestre" value="0">
                                        -
                                    </logic:lessThan>
                                    <logic:greaterEqual name="lista" property="media1Bimestre" value="0">
                                        <logic:lessThan name="lista" property="media1Bimestre" value="6">
                                            <i>
                                                <b>
                                                    <bean:write name="lista" property="media1Bimestre"/>
                                                </b>
                                            </i>
                                        </logic:lessThan>
                                        <logic:greaterEqual name="lista" property="media1Bimestre" value="6">
                                            <bean:write name="lista" property="media1Bimestre"/>
                                        </logic:greaterEqual>
                                    </logic:greaterEqual>
                                </td> <!-- nota 1 bimestre -->
                                <td align="center"><bean:write name="lista" property="falta1Bimestre"/></td> <!-- falta 1 bimestre -->
                                <td align="center">
                                    <logic:lessThan name="lista" property="media2Bimestre" value="0">
                                        -
                                    </logic:lessThan>
                                    <logic:greaterEqual name="lista" property="media2Bimestre" value="0">
                                        <logic:lessThan name="lista" property="media2Bimestre" value="6">
                                            <i>
                                                <b>
                                                    <bean:write name="lista" property="media2Bimestre"/>
                                                </b>
                                            </i>
                                        </logic:lessThan>
                                        <logic:greaterEqual name="lista" property="media2Bimestre" value="6">
                                            <bean:write name="lista" property="media2Bimestre"/>
                                        </logic:greaterEqual>
                                    </logic:greaterEqual>
                                </td> <!-- nota 2 bimestre -->
                                <td align="center"><bean:write name="lista" property="falta2Bimestre"/></td> <!-- falta 2 bimestre -->
                                <td align="center">
                                    <logic:lessThan name="lista" property="media3Bimestre" value="0">
                                        -
                                    </logic:lessThan>
                                    <logic:greaterEqual name="lista" property="media3Bimestre" value="0">
                                        <logic:lessThan name="lista" property="media3Bimestre" value="6">
                                            <i>
                                                <b>
                                                    <bean:write name="lista" property="media3Bimestre"/>
                                                </b>
                                            </i>
                                        </logic:lessThan>
                                        <logic:greaterEqual name="lista" property="media3Bimestre" value="6">
                                            <bean:write name="lista" property="media3Bimestre"/>
                                        </logic:greaterEqual>
                                    </logic:greaterEqual>
                                </td> <!-- nota 3 bimestre -->
                                <td align="center"><bean:write name="lista" property="falta3Bimestre"/></td> <!-- falta 3 bimestre -->
                                <td align="center">
                                    <logic:lessThan name="lista" property="media4Bimestre" value="0">
                                        -
                                    </logic:lessThan>
                                    <logic:greaterEqual name="lista" property="media4Bimestre" value="0">
                                        <logic:lessThan name="lista" property="media4Bimestre" value="6">
                                            <i>
                                                <b>
                                                    <bean:write name="lista" property="media4Bimestre"/>
                                                </b>
                                            </i>
                                        </logic:lessThan>
                                        <logic:greaterEqual name="lista" property="media4Bimestre" value="6">
                                            <bean:write name="lista" property="media4Bimestre"/>
                                        </logic:greaterEqual>
                                    </logic:greaterEqual>
                                </td> <!-- nota 4 bimestre -->
                                <td align="center"><bean:write name="lista" property="falta4Bimestre"/></td> <!-- falta 4 bimestre -->
                                <td align="center"><bean:write name="lista" property="faltaTotal"/></td> <!-- total de faltas -->
                                <td align="center">
                                    <logic:equal name="lista" property="mediaFinal" value="0">
                                        &nbsp;
                                    </logic:equal>
                                    <logic:notEqual name="lista" property="mediaFinal" value="0">
                                        <logic:lessThan name="lista" property="mediaFinal" value="6">
                                            <i>
                                                <b>
                                                    <bean:write name="lista" property="mediaFinal"/>
                                                </b>
                                            </i>
                                        </logic:lessThan>
                                        <logic:greaterEqual name="lista" property="mediaFinal" value="6">
                                            <bean:write name="lista" property="mediaFinal"/>
                                        </logic:greaterEqual>
                                    </logic:notEqual>
                                </td> <!-- média anual -->
                                <td align="center">
                                    <logic:equal name="lista" property="mediaRecupFinal" value="0">
                                        &nbsp;
                                    </logic:equal>
                                    <logic:notEqual name="lista" property="mediaRecupFinal" value="0">
                                        <i>
                                            <b>
                                                <logic:equal name="lista" property="passouDisciplina" value="true">
                                                    *<bean:write name="lista" property="mediaRecupFinal"/>
                                                </logic:equal>
                                                <logic:equal name="lista" property="passouDisciplina" value="false">
                                                    *<bean:write name="lista" property="mediaFinal"/>
                                                </logic:equal>
                                            </b>
                                        </i>
                                        <logic:greaterEqual name="lista" property="mediaFinal" value="6">
                                            <bean:write name="lista" property="mediaFinal"/>
                                        </logic:greaterEqual>
                                    </logic:notEqual>
                                </td>
                                <td align="center"><!-- Resultado final -->
                                    <bean:write name="lista" property="resultadoFinal"/>
                                </td> 

                            </tr>
                        </logic:iterate>
                    </logic:present>
                </table>
                <logic:present name="listaObservacao" scope="request">
                    <table border="1" style="margin-top: 2px; font-size: 9px" width="80%" align="center">
                        <tr>
                            <td>Observação:</td>
                        </tr>
                        <logic:iterate name="listaObservacao" id="listaObs" scope="request">
                            <tr>
                                <td style="height: 2px">
                                    *<bean:write name="listaObs"/>
                                </td>
                            </tr>
                        </logic:iterate>
                    </table>
                </logic:present>
                <table border="0" align="center" style="margin-top: 80px">
                    <tr>
                        <td align="center" style="color: red">
                            Esse boletim tem caráter apenas de consulta. Para obter o documento válido, deve ser solicitado.
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




