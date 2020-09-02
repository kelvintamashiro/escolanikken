<%-- 
    Document   : rel_notas_producao
    Created on : 17/07/2020, 13:28:15
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
                    <h2>Relatório Notas Produção de Sala - <bean:write name="nrBimestre" scope="request"/>º Bimestre</h2>
                </td>
            </tr>
        </table>
        <table class="table" style="font-size: 10px" width="100%" border="0" id="exportable_table">
            <logic:present name="listaNotasAlunos" scope="request">
                <logic:iterate id="lista" name="listaNotasAlunos" scope="request">
                    <tr>
                        <td style="font-size: 11px" valign="middle">
                            &nbsp; <br/>
                            <bean:write name="lista" property="dsSerieAno"/>
                        </td>
                        <td style="font-size: 11px" valign="middle">
                            &nbsp; <br/>
                            <bean:write name="lista" property="nome"/>
                        </td>
                        <logic:iterate id="notas" name="lista" property="listaNotas">
                            <bean:define id="disciplina" name="notas" property="disciplinasForm"/>
                            <bean:define id="notaBimestre" name="notas" property="notaBimestreForm"/>
                            <td align="center">
                                <bean:write name="disciplina" property="nomeDisciplina"/> <br/>
                                <logic:equal name="notaBimestre" property="notaProducaoSala" value="">
                                    -
                                </logic:equal>
                                <logic:notEqual name="notaBimestre" property="notaProducaoSala" value="">
                                    <b><bean:write name="notaBimestre" property="notaProducaoSala"/></b>
                                </logic:notEqual>
                            </td>
                        </logic:iterate>
                    </tr>
                </logic:iterate>
            </logic:present>
        </table>
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
                        XLSX.writeFile(wb, fn || ('RelatorioNotasProducaoSala.' + (type || 'xlsx')));
            }
        </script>
    </body>
</html>
<script language="JavaScript">
    function DoPrinting() {
        window.print()
    }

</script>



