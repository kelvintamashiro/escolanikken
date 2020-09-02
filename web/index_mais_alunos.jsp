<%-- 
    Document   : index_mais_alunos
    Created on : 09/04/2020, 23:24:47
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

        <logic:present name="listaEmailsLogin" scope="request">
            <div class="row" align="center">
                <div class="col-12 col-s-12">
                    <logic:iterate name="listaEmailsLogin" id="lista" scope="request">
                        <html:hidden name="lista" property="login"/>
                        <html:hidden name="lista" property="tipoPerfil"/>
                        <button class="btn-nikken" onclick="window.location.href = 'Index.do?action=redirecionarAcesso&login=<bean:write name="lista" property="login"/>&tipoPerfil=<bean:write name="lista" property="tipoPerfil"/>'">
                            Acessar como <br/><bean:write name="lista" property="nomeAluno"/>
                        </button>
                    </logic:iterate>
                </div>
            </div>
        </logic:present>


        <jsp:include page="footer.jsp"/>
    </body>
</html>


