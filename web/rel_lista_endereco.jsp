<%-- 
    Document   : rel_lista_endereco
    Created on : 21/08/2020, 23:09:00
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
                    <h2>Lista de Endereços / Telefones / Linha de Transporte</h2>
                </td>
            </tr>
        </table>
        <table class="table" style="font-size: 10px" width="50%" id="exportable_table">
            <tr>
                <td><b>Ensino</b></td>
                <td><b>Série/Ano</b></td>
                <td><b>Aluno</b></td>
                <!--<td><b>Sexo</b></td>-->
                <td><b>Província</b></td>
                <td><b>Cidade</b></td>
                <td><b>Endereço</b></td>
                <td><b>Nome da Mãe</b></td>
                <td><b>Contato da Mãe</b></td>
                <td><b>Nome do Pai</b></td>
                <td><b>Contato do Pai</b></td>
                <td><b>Nome Emergência</b></td>
                <td><b>Contato Emergência</b></td>
                <td><b>Linha Transporte</b></td>
            </tr>
            <logic:present name="listaEnderecoTelefone" scope="request">
                <%int i = 1;%>
                <logic:iterate id="lista" name="listaEnderecoTelefone" scope="request">
                    <bean:define id="disciplinaForm" name="lista" property="disciplinasForm"/>
                    <bean:define id="alunoForm" name="lista" property="alunoForm"/>
                    <tr>
                        <td><bean:write name="disciplinaForm" property="categoriaEnsino"/></td>
                        <td><bean:write name="disciplinaForm" property="dsCategoriaEnsino"/></td>
                        <td><bean:write name="alunoForm" property="nome"/></td>
                        <!--<td><bean:write name="alunoForm" property="sexo"/></td>-->
                        <td><bean:write name="alunoForm" property="provincia"/></td>
                        <td><bean:write name="alunoForm" property="cidade"/></td>
                        <td><bean:write name="alunoForm" property="dsEndereco"/></td>
                        <td><bean:write name="alunoForm" property="nomeMae"/></td>
                        <td><bean:write name="alunoForm" property="celularMae"/></td>
                        <td><bean:write name="alunoForm" property="nomePai"/></td>
                        <td><bean:write name="alunoForm" property="celularPai"/></td>
                        <td><bean:write name="alunoForm" property="contatoEmergencia"/></td>
                        <td><bean:write name="alunoForm" property="telefoneContato"/></td>
                        <td><bean:write name="alunoForm" property="linhaTransporte"/></td>
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
                        XLSX.writeFile(wb, fn || ('ListaEnderecoTelefoneTransporte.' + (type || 'xlsx')));
            }
        </script>
    </body>
</html>
<script language="JavaScript">
    function DoPrinting() {
        window.print()
    }

</script>


