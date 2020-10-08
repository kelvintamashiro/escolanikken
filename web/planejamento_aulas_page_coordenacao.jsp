<%-- 
    Document   : planejamento_aulas_page_coordenacao
    Created on : 08/10/2020, 21:01:06
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
            <table border="0" align="center" style="margin-top: 20px; background-color: #FFC0CB" width="100%">
                <tr>
                    <td width="10%" style="padding-left: 50px">
                        <a href="javascript:history.back()"><img src="imagens/bt_voltar_2.png" width="100px"/></a>
                    </td>
                    <td width="80%" align="center">
                        <h1>Planejamento de Aulas</h1>
                    </td>
                    <td width="10%">&nbsp;</td>
                </tr>
            </table>
        <div class="row" align="center" style="padding-top: 200px">

            <div class="col-12 col-s-12">
                <button class="btn-nikken" style="color: #4682B4; border: 1px solid #4682B4" onclick="window.location.href = 'PlanejamentoAulas.do?idPF=<%=session.getAttribute("idPF").toString()%>'">
                    Cadastro 
                </button>
                <button class="btn-nikken" style="color: #4682B4; border: 1px solid #4682B4" onclick="window.location.href = 'PlanejamentoAulas.do?action=pagePesquisarPorProfessor'">
                    Pesquisa 
                </button>
            </div>
        </div>


    </body>
</html>
