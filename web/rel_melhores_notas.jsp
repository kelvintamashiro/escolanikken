<%-- 
    Document   : rel_melhores_notas
    Created on : 28/07/2020, 09:41:07
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
        <title>Escola Nikken - Relatório de Melhores de Médias</title>
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
                    <h2>Relatório Melhores Médias - <bean:write name="RelatoriosForm" property="nrBimestre" scope="request"/>º Bimestre - <bean:write name="RelatoriosForm" property="ano" scope="request"/></h2>
                </td>
            </tr>
        </table>
        <table class="table" style="font-size: 10px" width="100%" border="0" id="exportable_table">
            <tr>
                <td colspan="4" style="background-color: #ffff99">
                    <b>2º ANO</b>
                </td>
            </tr>
            <logic:present name="listaMelhoresMedias2ano" scope="request">
                <tr>
                    <td width="30%"><b>Aluno</b></td>
                    <td width="10%"><b>Série/Ano</b></td>
                    <td width="10%"><b>Média</b></td>
                    <td width="50%"></td>
                </tr>
                <logic:iterate id="lista" name="listaMelhoresMedias2ano" scope="request">
                    <bean:define id="aluno" name="lista" property="alunoForm"/>
                    <bean:define id="notaBimestre" name="lista" property="notaBimestreForm"/>
                    <tr>
                        <td><bean:write name="aluno" property="nome"/></td>
                        <td><bean:write name="aluno" property="dsSerieAno"/></td>
                        <td><bean:write name="notaBimestre" property="mediaBimestre"/></td>
                        <td></td>
                    </tr>
                </logic:iterate>
            </logic:present>

            <tr>
                <td colspan="4" style="background-color: #ffff99">
                    <b>3º ANO</b>
                </td>
            </tr>
            <logic:present name="listaMelhoresMedias3ano" scope="request">
                <tr>
                    <td width="30%"><b>Aluno</b></td>
                    <td width="10%"><b>Série/Ano</b></td>
                    <td width="10%"><b>Média</b></td>
                    <td width="50%"></td>
                </tr>
                <logic:iterate id="lista" name="listaMelhoresMedias3ano" scope="request">
                    <bean:define id="aluno" name="lista" property="alunoForm"/>
                    <bean:define id="notaBimestre" name="lista" property="notaBimestreForm"/>
                    <tr>
                        <td><bean:write name="aluno" property="nome"/></td>
                        <td><bean:write name="aluno" property="dsSerieAno"/></td>
                        <td><bean:write name="notaBimestre" property="mediaBimestre"/></td>
                        <td></td>
                    </tr>
                </logic:iterate>
            </logic:present>
            <tr>
                <td colspan="4" style="background-color: #ffff99">
                    <b>4º ANO</b>
                </td>
            </tr>
            <logic:present name="listaMelhoresMedias4ano" scope="request">
                <tr>
                    <td width="30%"><b>Aluno</b></td>
                    <td width="10%"><b>Série/Ano</b></td>
                    <td width="10%"><b>Média</b></td>
                    <td width="50%"></td>
                </tr>
                <logic:iterate id="lista" name="listaMelhoresMedias4ano" scope="request">
                    <bean:define id="aluno" name="lista" property="alunoForm"/>
                    <bean:define id="notaBimestre" name="lista" property="notaBimestreForm"/>
                    <tr>
                        <td><bean:write name="aluno" property="nome"/></td>
                        <td><bean:write name="aluno" property="dsSerieAno"/></td>
                        <td><bean:write name="notaBimestre" property="mediaBimestre"/></td>
                        <td></td>
                    </tr>
                </logic:iterate>
            </logic:present>

            <tr>
                <td colspan="4" style="background-color: #ffff99">
                    <b>5º ANO</b>
                </td>
            </tr>
            <logic:present name="listaMelhoresMedias5ano" scope="request">
                <tr>
                    <td width="30%"><b>Aluno</b></td>
                    <td width="10%"><b>Série/Ano</b></td>
                    <td width="10%"><b>Média</b></td>
                    <td width="50%"></td>
                </tr>
                <logic:iterate id="lista" name="listaMelhoresMedias5ano" scope="request">
                    <bean:define id="aluno" name="lista" property="alunoForm"/>
                    <bean:define id="notaBimestre" name="lista" property="notaBimestreForm"/>
                    <tr>
                        <td><bean:write name="aluno" property="nome"/></td>
                        <td><bean:write name="aluno" property="dsSerieAno"/></td>
                        <td><bean:write name="notaBimestre" property="mediaBimestre"/></td>
                        <td></td>
                    </tr>
                </logic:iterate>
            </logic:present>

            <tr>
                <td colspan="4" style="background-color: #ffff99">
                    <b>6º ANO</b>
                </td>
            </tr>
            <logic:present name="listaMelhoresMedias6ano" scope="request">
                <tr>
                    <td width="30%"><b>Aluno</b></td>
                    <td width="10%"><b>Série/Ano</b></td>
                    <td width="10%"><b>Média</b></td>
                    <td width="50%"></td>
                </tr>
                <logic:iterate id="lista" name="listaMelhoresMedias6ano" scope="request">
                    <bean:define id="aluno" name="lista" property="alunoForm"/>
                    <bean:define id="notaBimestre" name="lista" property="notaBimestreForm"/>
                    <tr>
                        <td><bean:write name="aluno" property="nome"/></td>
                        <td><bean:write name="aluno" property="dsSerieAno"/></td>
                        <td><bean:write name="notaBimestre" property="mediaBimestre"/></td>
                        <td></td>
                    </tr>
                </logic:iterate>
            </logic:present>
            <tr>
                <td colspan="4" style="background-color: #ffff99">
                    <b>7º ANO</b>
                </td>
            </tr>
            <logic:present name="listaMelhoresMedias7ano" scope="request">
                <tr>
                    <td width="30%"><b>Aluno</b></td>
                    <td width="10%"><b>Série/Ano</b></td>
                    <td width="10%"><b>Média</b></td>
                    <td width="50%"></td>
                </tr>
                <logic:iterate id="lista" name="listaMelhoresMedias7ano" scope="request">
                    <bean:define id="aluno" name="lista" property="alunoForm"/>
                    <bean:define id="notaBimestre" name="lista" property="notaBimestreForm"/>
                    <tr>
                        <td><bean:write name="aluno" property="nome"/></td>
                        <td><bean:write name="aluno" property="dsSerieAno"/></td>
                        <td><bean:write name="notaBimestre" property="mediaBimestre"/></td>
                        <td></td>
                    </tr>
                </logic:iterate>
            </logic:present>
            <tr>
                <td colspan="4" style="background-color: #ffff99">
                    <b>8º ANO</b>
                </td>
            </tr>
            <logic:present name="listaMelhoresMedias8ano" scope="request">
                <tr>
                    <td width="30%"><b>Aluno</b></td>
                    <td width="10%"><b>Série/Ano</b></td>
                    <td width="10%"><b>Média</b></td>
                    <td width="50%"></td>
                </tr>
                <logic:iterate id="lista" name="listaMelhoresMedias8ano" scope="request">
                    <bean:define id="aluno" name="lista" property="alunoForm"/>
                    <bean:define id="notaBimestre" name="lista" property="notaBimestreForm"/>
                    <tr>
                        <td><bean:write name="aluno" property="nome"/></td>
                        <td><bean:write name="aluno" property="dsSerieAno"/></td>
                        <td><bean:write name="notaBimestre" property="mediaBimestre"/></td>
                        <td></td>
                    </tr>
                </logic:iterate>
            </logic:present>
            <tr>
                <td colspan="4" style="background-color: #ffff99">
                    <b>9º ANO</b>
                </td>
            </tr>
            <logic:present name="listaMelhoresMedias9ano" scope="request">
                <tr>
                    <td width="30%"><b>Aluno</b></td>
                    <td width="10%"><b>Série/Ano</b></td>
                    <td width="10%"><b>Média</b></td>
                    <td width="50%"></td>
                </tr>
                <logic:iterate id="lista" name="listaMelhoresMedias9ano" scope="request">
                    <bean:define id="aluno" name="lista" property="alunoForm"/>
                    <bean:define id="notaBimestre" name="lista" property="notaBimestreForm"/>
                    <tr>
                        <td><bean:write name="aluno" property="nome"/></td>
                        <td><bean:write name="aluno" property="dsSerieAno"/></td>
                        <td><bean:write name="notaBimestre" property="mediaBimestre"/></td>
                        <td></td>
                    </tr>
                </logic:iterate>
            </logic:present>
            <tr>
                <td colspan="4" style="background-color: #ffff99">
                    <b>1ª SÉRIE</b>
                </td>
            </tr>
            <logic:present name="listaMelhoresMedias1serie" scope="request">
                <tr>
                    <td width="30%"><b>Aluno</b></td>
                    <td width="10%"><b>Série/Ano</b></td>
                    <td width="10%"><b>Média</b></td>
                    <td width="50%"></td>
                </tr>
                <logic:iterate id="lista" name="listaMelhoresMedias1serie" scope="request">
                    <bean:define id="aluno" name="lista" property="alunoForm"/>
                    <bean:define id="notaBimestre" name="lista" property="notaBimestreForm"/>
                    <tr>
                        <td><bean:write name="aluno" property="nome"/></td>
                        <td><bean:write name="aluno" property="dsSerieAno"/></td>
                        <td><bean:write name="notaBimestre" property="mediaBimestre"/></td>
                        <td></td>
                    </tr>
                </logic:iterate>
            </logic:present>
            <tr>
                <td colspan="4" style="background-color: #ffff99">
                    <b>2ª SÉRIE</b>
                </td>
            </tr>
            <logic:present name="listaMelhoresMedias2serie" scope="request">
                <tr>
                    <td width="30%"><b>Aluno</b></td>
                    <td width="10%"><b>Série/Ano</b></td>
                    <td width="10%"><b>Média</b></td>
                    <td width="50%"></td>
                </tr>
                <logic:iterate id="lista" name="listaMelhoresMedias2serie" scope="request">
                    <bean:define id="aluno" name="lista" property="alunoForm"/>
                    <bean:define id="notaBimestre" name="lista" property="notaBimestreForm"/>
                    <tr>
                        <td><bean:write name="aluno" property="nome"/></td>
                        <td><bean:write name="aluno" property="dsSerieAno"/></td>
                        <td><bean:write name="notaBimestre" property="mediaBimestre"/></td>
                        <td></td>
                    </tr>
                </logic:iterate>
            </logic:present>
            <tr>
                <td colspan="4" style="background-color: #ffff99">
                    <b>3ª SÉRIE</b>
                </td>
            </tr>
            <logic:present name="listaMelhoresMedias3serie" scope="request">
                <tr>
                    <td width="30%"><b>Aluno</b></td>
                    <td width="10%"><b>Série/Ano</b></td>
                    <td width="10%"><b>Média</b></td>
                    <td width="50%"></td>
                </tr>
                <logic:iterate id="lista" name="listaMelhoresMedias3serie" scope="request">
                    <bean:define id="aluno" name="lista" property="alunoForm"/>
                    <bean:define id="notaBimestre" name="lista" property="notaBimestreForm"/>
                    <tr>
                        <td><bean:write name="aluno" property="nome"/></td>
                        <td><bean:write name="aluno" property="dsSerieAno"/></td>
                        <td><bean:write name="notaBimestre" property="mediaBimestre"/></td>
                        <td></td>
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
                        XLSX.writeFile(wb, fn || ('RelatorioMelhoresNotas.' + (type || 'xlsx')));
            }
        </script>

    </body>
</html>
<script language="JavaScript">
    function DoPrinting() {
        window.print();
    }

</script>






