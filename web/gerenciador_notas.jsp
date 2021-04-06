<%-- 
    Document   : gerenciador_notas
    Created on : 5 de abr de 2021, 10:53:19
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
        <title>Escola Nikken - Painel</title>
        <link rel="shortcut icon" href="imagens/favico.png" />
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <script language="javascript1.2" src="js/mizanscene.js"></script>
        <script type="text/javascript" src="js/JQuery/js/jquery-1.3.2.js"></script>

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
                <button class="btn-nikken2" onclick="window.location.href = 'NotaBimestre.do?idPF=<%=session.getAttribute("idPF").toString()%>'">
                    Lançamento <br/>de Notas
                </button>
                <button class="btn-nikken2" onclick="window.location.href = 'NotaBimestre.do?action=pageConsulta&idPF=<%=session.getAttribute("idPF").toString()%>&tipoPerfil=professor'">
                    Consulta <br/>de Notas
                </button>
            </div>
        </div>
        <div>
            <jsp:include page="footer.jsp"/>
        </div>
    </body>
</html>

