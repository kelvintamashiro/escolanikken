<%-- 
    Document   : rel_lista_aniversario
    Created on : 16/07/2020, 09:30:57
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
                    <h2>Lista de Aniversariantes</h2>
                </td>
            </tr>
        </table>
        <table class="table" style="font-size: 10px" width="50%" id="exportable_table">
            <tr>
                <td>&nbsp;</td>
                <td><b>Aluno</b></td>
                <td><b>Ensino</b></td>
                <td><b>S�rie/Ano</b></td>
                <td><b>Data de Nascimento</b></td>
            </tr>
            <logic:present name="listaAniversariantes" scope="request">
                <%int i = 1;%>
                <logic:iterate id="lista" name="listaAniversariantes" scope="request">
                    <bean:define id="disciplinaForm" name="lista" property="disciplinasForm"/>
                    <bean:define id="alunoForm" name="lista" property="alunoForm"/>
                    <tr>
                        <td align="center"><%=i++%></td>
                        <td><bean:write name="alunoForm" property="nome"/></td>
                        <td><bean:write name="disciplinaForm" property="categoriaEnsino"/></td>
                        <td><bean:write name="disciplinaForm" property="dsCategoriaEnsino"/></td>
                        <td><bean:write name="alunoForm" property="dataNascimento"/></td>
                    </tr>
                </logic:iterate>
            </logic:present>
            <!--            <tr>
                            <td colspan="9" align="center">
                                <input type="button" class="btn btn-green" value="Imprimir" onclick="javascript:DoPrinting()">
                            </td>
                        </tr>-->

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
                        XLSX.writeFile(wb, fn || ('ListaAniversario.' + (type || 'xlsx')));
            }
        </script>
    </body>
</html>
<script language="JavaScript">
    function DoPrinting() {
        window.print()
    }

</script>


