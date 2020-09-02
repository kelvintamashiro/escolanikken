<%-- 
    Document   : comunicado_visualizar_alunos
    Created on : 06/08/2020, 13:37:27
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
    <body onLoad="mudatam()" style="padding: 50px">
        <html:form action="Comunicados.do" name="ComunicadosForm" type="br.com.Form.ComunicadosForm" scope="request" styleClass="form-horizontal">

            <table width="70%" class="table-condensed" border="0" style="font-size: 11px" align="center">
                <tr>
                    <td colspan="2" align="center" style="background-color: #FEFA43">
                        <h3>Lista de Alunos Enviados</h3>
                    </td>
                </tr>
                <logic:present name="listaAlunosAvisos" scope="request">
                    <tr>
                        <td><b>Nome Aluno</b></td>
                        <td><b>Série/Ano</b></td>
                    </tr>
                    <logic:iterate id="lista" name="listaAlunosAvisos" scope="request">
                        <tr>
                            <td>
                                <bean:write name="lista" property="nome"/>
                            </td>
                            <td>
                                <bean:write name="lista" property="dsSerieAno"/>
                            </td>
                        </tr>
                    </logic:iterate>
                </logic:present>
            </table>
            <div style="text-align: center">
                <input type="button" name="Button"  class="btn btn-danger" value="Fechar" onClick="window.close();">
            </div>
        </html:form>

    </body>
</html>


