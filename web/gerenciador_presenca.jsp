<%-- 
    Document   : gerenciador_presenca
    Created on : 8/jan/2021, 23:53:32
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
        <title>Escola Nikken - Lista de Presença</title>
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

        <div class="row" align="center">
            <div class="col-12 col-s-12 mt100px">
                <button class="btn-nikken2" onclick="window.location.href = 'ListaPresenca.do'">
                    Lançar Lista <br/>de Presença/ <br/>Plano de Aula
                </button>
                <button class="btn-nikken2" onclick="window.location.href = 'ListaPresenca.do?action=pageConsultar'">
                    Consultar Lista <br/>de Presença/ <br/>Plano de Aula
                </button>
                <button class="btn-nikken2" onclick="window.location.href = 'ListaPresenca.do?action=pageImprimirDiario'">
                    Imprimir <br/>Diário de Classe
                </button>
            </div>
        
            <div class="col-12 col-s-12">
                <button class="btn-nikken2" onclick="window.location.href = 'ListaPresencaItinerario.do'">
                    Lançar Lista <br/>de Presença <br/>Itinerário
                </button>
                <button class="btn-nikken2" onclick="window.location.href = 'ListaPresencaItinerario.do?action=pageConsultar'">
                    Consultar Lista <br/>de Presença <br/>Itinerário
                </button>
            </div>
        </div>
        <div>
            <jsp:include page="footer.jsp"/>
        </div>
    </body>
</html>
