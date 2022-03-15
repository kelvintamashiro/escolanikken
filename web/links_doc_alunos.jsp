<%-- 
    Document   : links_doc_alunos
    Created on : 18/jan/2021, 22:16:32
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

        <style>
            body {
                margin:0;
                padding:0;
            }

        </style>
    </head>
    <body>
        <jsp:include page="topo.jsp"/>

        <table border="0" align="center" style="margin-top: 20px; background-color: #C1FFC1" width="100%">
            <tr>
                <td width="10%" style="padding-left: 50px">
                    <a href="tela_interativa.jsp"><img src="imagens/bt_voltar_2.png" width="100px"/></a>
                </td>
                <td width="80%" align="center">
                    <h1>Links Importantes</h1>
                </td>
                <td width="10%">&nbsp;</td>
            </tr>
        </table>
        <div class="form-group">
            <table border="0" class="table-condensed" align="center" style="margin-top: 20px;" width="80%">
                <tr>
                    <td>
                        Calendário Escolar
                    </td>
                    <td>
                        <a href="pdf/CALENDARIO_NIKKEN.pdf" target="_blank" class="btn btn-green">Visualizar</a>
                    </td>
                </tr>
                <tr>
                    <td>
                        Guia do Aluno
                    </td>
                    <td>
                        <a href="pdf/GUIA_ALUNO_ESCOLANIKKEN.pdf" target="_blank" class="btn btn-green">Visualizar</a>
                    </td>
                </tr>
               
            </table>
        </div>





    </body>
</html>

