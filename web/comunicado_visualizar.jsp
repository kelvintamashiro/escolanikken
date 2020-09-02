<%-- 
    Document   : comunicado_visualizar
    Created on : 22/06/2020, 23:38:03
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
        <title>Escola Nikken - Comunicado</title>
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
        <html:form action="Comunicados.do" name="ComunicadosForm" type="br.com.Form.ComunicadosForm" scope="request" styleClass="form-horizontal">
            <table width="90%" align="center">
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <b><bean:write name="ComunicadosForm" property="assunto" scope="request"/></b>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <bean:write name="ComunicadosForm" property="descricao" filter="false" scope="request"/>
                    </td>
                </tr>
            </table>
            <div style="text-align: center">
                <input type="button" name="Button"  class="btn btn-danger" value="Fechar" onClick="window.close();">
            </div>
        </html:form>

    </body>
</html>

