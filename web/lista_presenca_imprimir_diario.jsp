<%-- 
    Document   : lista_presenca_imprimir_diario
    Created on : 15/fev/2021, 20:27:30
    Author     : macuser
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Escola Nikken - Imprimir Diário</title>
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
        
        <table width="90%" border="0" align="center" style="margin-top: 50px; border: 1px solid black; background-color: #FFFFF0">
            <tr>
                <td colspan="5">&nbsp;</td>
            </tr>
            <tr>
                <td width="20%" align="center">
                    <img src="imagens/logo.png" width="90%"/>
                </td>
                <td width="20%" align="center">
                    <b>Série/Ano</b> <br/>
                    <bean:write name="ListaPresencaForm" property="dsCategoriaEnsino"/> - <bean:write name="ListaPresencaForm" property="dsSerieAno"/>
                </td>
                <td width="20%" align="center">
                    <b>Bimestre</b> <br/>
                    <bean:write name="ListaPresencaForm" property="nrBimestre"/>º Bimestre
                </td>
                <td width="20%" align="center">
                    <b>Disciplina</b> <br/>
                    <bean:write name="ListaPresencaForm" property="dsDisciplina"/>
                </td>
                <td width="20%" align="center">
                    <b>Professor(a)</b> <br/>
                    <%--<bean:write name="ListaPresencaForm" property="nomeProfessor"/>--%>
                    <logic:present name="ListaPresencaForm" property="listaNomeProfessor">
                        <logic:iterate id="nomeProfessor" name="ListaPresencaForm" property="listaNomeProfessor">
                            <bean:write name="nomeProfessor"/> <br/>
                        </logic:iterate>
                    </logic:present>
                </td>
            </tr>
            <tr>
                <td colspan="5">&nbsp;</td>
            </tr>
        </table>

        <logic:present name="listaDiario" scope="request">
            <table width="90%" border="1" style="font-size: 10px; margin-top: 10px" align="center">
                <tr>
                    <td width="2%" align="center" style="font-size: 20px"><b>N.</b></td>
                    <td width="15%" style="font-size: 20px; padding-left: 10px"><b>NOME DO(A) ALUNO(A)</b></td>
                    <logic:present name="listaDatas" scope="request">
                        <logic:iterate name="listaDatas" id="data" scope="request">
                            <td width="2%" align="center" style="transform: rotate(-90deg); height: 80px">
                                <b><bean:write name="data"/></b>
                            </td>
                        </logic:iterate>
                    </logic:present>
                    <td width="2%">&nbsp;</td>
                    <td width="2%">&nbsp;</td>
                    <td width="2%">&nbsp;</td>
                    <td width="2%">&nbsp;</td>
                    <td width="4%" align="center" style="transform: rotate(-90deg)"><b>Faltas</b></td>
                    <td width="4%" align="center" style="transform: rotate(-90deg)"><b>Produção</b></td>
                    <td width="4%" align="center" style="transform: rotate(-90deg)"><b>Mensal</b></td>
                    <td width="4%" align="center" style="transform: rotate(-90deg)"><b>Bimestral</b></td>
                    <td width="4%" align="center" style="transform: rotate(-90deg)"><b>Média</b></td>
                    <td width="20%" align="center"><b>Observação</b></td>
                </tr>
                <%int i = 1;%>
                <logic:iterate name="listaDiario" id="listaAlunos" scope="request">
                    <tr>
                        <td align="center"><%=i++%></td>
                        <td style="padding-left: 10px">
                            <bean:write name="listaAlunos" property="nomeAluno"/>
                        </td>
                        <logic:iterate name="listaAlunos" id="listPresenca" property="listaPresenca">
                            <td style="font-size: 10px" align="center">
                                <logic:equal name="listPresenca" property="falta" value="N">
                                    P
                                </logic:equal>
                                <logic:equal name="listPresenca" property="falta" value="S">
                                    <span style="color: red">F</span>
                                </logic:equal>
                            </td>
                        </logic:iterate>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td align="center"><bean:write name="listaAlunos" property="falta"/></td>
                        <td align="center"><bean:write name="listaAlunos" property="notaProducaoSala"/></td>
                        <td align="center"><bean:write name="listaAlunos" property="notaMensal"/></td>
                        <td align="center"><bean:write name="listaAlunos" property="notaBimestral"/></td>
                        <td align="center"><bean:write name="listaAlunos" property="mediaBimestre"/></td>
                        <td>&nbsp;</td>
                    </tr>
                </logic:iterate>
            </table>

            <table width="90%" border="1" style="font-size: 10px; margin-top: 10px" align="center">
                <tr>
                    <td style="padding-left: 10px; font-size: 20px; height: 40px">
                        <b>Resumo Conteúdo - Planejamento de Aulas</b>
                    </td>
                </tr>
                <logic:present name="listaPlanejamento" scope="request">
                    <logic:iterate name="listaPlanejamento" id="planoAula" scope="request">
                        <tr>
                            <td style="padding-left: 10px">
                                <bean:write name="planoAula" property="data"/> - <b>Conteúdo:</b> <bean:write name="planoAula" property="conteudoAula"/> - <b>Obs:</b> <bean:write name="planoAula" property="observacao"/>
                            </td>
                        </tr>
                    </logic:iterate>
                </logic:present>
            </table>
        </logic:present>


    </body>
</html>
