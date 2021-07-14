<%-- 
    Document   : rel_sintetico_serie
    Created on : 15 de abr de 2021, 18:23:21
    Author     : macuser
--%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<!DOCTYPE html>
<html lang="pt-br" class="js-disabled">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Escola Nikken - Relatório</title>
        <link rel="shortcut icon" href="imagens/favico.png" />
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <script language="javascript1.2" src="js/mizanscene.js"></script>
        <script type="text/javascript" src="js/JQuery/js/jquery-1.3.2.js"></script>

        <link rel="stylesheet" media="all" type="text/css" href="assets/css/fix.css" />
        <link rel="stylesheet" media="all" type="text/css" href="assets/css/style_original.css" />
        <link rel="stylesheet" media="all" type="text/css" href="assets/css/mobile.css" />

        <!-- Link para exportar Excel-->
        <script type="text/javascript" src="https://unpkg.com/xlsx@0.15.1/dist/xlsx.full.min.js"></script>

        <style>
            body {
                margin:0;
                padding:0;
            }

        </style>
    </head>
    <body>
        <table border="0" align="center" style="background-color: #F4F4F4" width="100%">
            <tr><td>&nbsp;</td></tr>
            <tr>
                <td align="center">
                    <img src="imagens/logo.png" width="20%"/>
                </td>
            </tr>
            <tr>
                <td align="center">
                    <h2>Relatório Médias Mensal por Série/Ano</h2>
                </td>
            </tr>
        </table>
        <logic:present name="listaConsolidado" scope="request">
            <div style="overflow-x: auto">
                <table style="font-size: 10px" width="100%" border="1" id="exportable_table">
                    <tr>
                        <td width="25%" align="center" colspan="3"><b>ALUNOS</b></td>
                        <td align="center" colspan="80" ><b>DISCIPLINAS</b></td>
                    </tr>
                    <tr>
                        <td rowspan="2" align="center" valign="middle"><b>Qtd.</b></td>
                        <td rowspan="2" align="center" valign="middle"><b>Série/Ano</b></td>
                        <td rowspan="2"><b>Aluno</b></td>

                        <logic:iterate name="listaDisciplinas" id="listDisc" scope="request">
                            <td align="center" colspan="4">
                                <b><bean:write name="listDisc" property="nomeDisciplina"/></b>
                            </td>
                        </logic:iterate>
                    </tr>
                    <tr>
                        <logic:iterate name="listaDisciplinas" id="listDisc" scope="request">
                            <td align="center">1B</td>
                            <td align="center">2B</td>
                            <td align="center">3B</td>
                            <td align="center">4B</td>
                        </logic:iterate>
                    </tr>
                    <%int i = 1;%>
                    <logic:iterate name="listaConsolidado" id="lista" scope="request">
                        <bean:define id="aluno" name="lista" property="alunoForm"/>
                        <bean:define id="listaNotaN" name="lista" property="listaNotaBimestreForm"/>
                        <tr>
                            <td align="center" style="vertical-align: middle"><%=i++%></td>
                            <td align="center" style="vertical-align: middle"><bean:write name="aluno" property="dsSerieAno"/></td>
                            <td><bean:write name="aluno" property="nome"/></td>
                            <logic:iterate name="listaNotaN" id="listaN">
                                <td align="center" style="vertical-align: middle">
                                    <logic:lessThan name="listaN" property="media1Bimestre" value="0">
                                        -
                                    </logic:lessThan>
                                    <logic:greaterEqual name="listaN" property="media1Bimestre" value="0">
                                        <bean:write name="listaN" property="media1Bimestre"/>
                                    </logic:greaterEqual>
                                </td>
                                <td align="center" style="vertical-align: middle">
                                    <logic:lessThan name="listaN" property="media2Bimestre" value="0">
                                        -
                                    </logic:lessThan>
                                    <logic:greaterEqual name="listaN" property="media2Bimestre" value="0">
                                        <bean:write name="listaN" property="media2Bimestre"/>
                                    </logic:greaterEqual>
                                </td>
                                <td align="center" style="vertical-align: middle">
                                    <logic:lessThan name="listaN" property="media3Bimestre" value="0">
                                        -
                                    </logic:lessThan>
                                    <logic:greaterEqual name="listaN" property="media3Bimestre" value="0">
                                        <bean:write name="listaN" property="media3Bimestre"/>
                                    </logic:greaterEqual>
                                </td>
                                <td align="center" style="vertical-align: middle">
                                    <logic:lessThan name="listaN" property="media4Bimestre" value="0">
                                        -
                                    </logic:lessThan>
                                    <logic:greaterEqual name="listaN" property="media4Bimestre" value="0">
                                        <bean:write name="listaN" property="media4Bimestre"/>
                                    </logic:greaterEqual>
                                </td>
                            </logic:iterate>
                            <%--
                            <logic:iterate name="listaNotaN" id="listaNota" scope="request">
                                <td><bean:write name="listaNota" property="media1Bimestre"/></td>
                                <td><bean:write name="listaNota" property="media2Bimestre"/></td>
                                <td><bean:write name="listaNota" property="media3Bimestre"/></td>
                                <td><bean:write name="listaNota" property="media4Bimestre"/></td>
                            </logic:iterate>--%>

                        </tr>
                    </logic:iterate>
                </table>
            </div>
        </logic:present>
        <table width="100%" style="margin-top: 150px">
            <tr>
                <td align="center">
                    <html:button property="btImprimir" styleClass="btn btn-green" onclick="javascript: style.display='none', window.print()">Imprimir</html:button>
                    <button class="btn btn-info" onclick="ExportExcel('xlsx')">Exportar para Excel</button>
                </td>
            </tr>
        </table>

        <script type="text/javascript">
            function ExportExcel(type, fn, dl) {
                var elt = document.getElementById('exportable_table');
                var wb = XLSX.utils.table_to_book(elt, {sheet: "Sheet JS"});
                return dl ?
                        XLSX.write(wb, {bookType: type, bookSST: true, type: 'base64'}) :
                        XLSX.writeFile(wb, fn || ('RelatorioMedias.' + (type || 'xlsx')));
            }
        </script>
    </body>
</html>
<script language="JavaScript">
    function DoPrinting() {
        window.print();
    }

</script>




