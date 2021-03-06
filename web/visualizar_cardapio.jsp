<%-- 
    Document   : visualizar_cardapio
    Created on : 09/09/2020, 20:52:38
    Author     : macuser
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<!DOCTYPE html>
<html:html>
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
    <body onLoad="mudatam()">
        <logic:present name="errors">
            <script>
                alert('<bean:write name="errors"/>');
            </script>
        </logic:present>
        <jsp:include page="topo.jsp"/>
        <html:form action="UploadArquivo" name="UploadArquivoForm" type="br.com.Form.UploadArquivoForm" scope="request">
            <table border="0" align="center" style="margin-top: 20px; background-color: #EEDD82" width="100%">
                <tr>
                    <td width="10%" style="padding-left: 50px">
                        <a href="UploadArquivo.do?action=pageCardapio"><img src="imagens/bt_voltar_2.png" width="100px"/></a>
                    </td>
                    <td width="80%" align="center" colspan="2">
                        <h1>Lista de Imagens Card�pio</h1>
                    </td>
                    <td width="10%">&nbsp;</td>
                </tr>
            </table>
            <div class="form-group" style="padding-top: 50px">
                <table width="50%" class="table-condensed" border="0" align="center">
                    <logic:present name="listaImagens" scope="request">
                        <logic:iterate id="lista" name="listaImagens" scope="request">
                            <tr>
                                <td>&nbsp;</td>
                                <!--<td><bean:write name="lista" property="idImagem"/></td>-->
                                <td>
                                    <img src="img_cardapio/<bean:write name='lista' property='nomeImagem'/>" width="70px"/>
                                </td>
                                <td><bean:write name="lista" property="data"/></td>
                                <td>
                                    <!--<a href="http://localhost:8084/nikken/img_cardapio/<bean:write name='lista' property='nomeImagem'/>" target="_blank">-->
                                    <a href="http://162.214.120.203:10000/img_cardapio/<bean:write name='lista' property='nomeImagem'/>" target="_blank">
                                        <bean:write name='lista' property='nomeImagem'/>
                                    </a>
                                </td>
                                <td align="center">
                                    <a href="http://162.214.120.203:10000/img_cardapio/<bean:write name='lista' property='nomeImagem'/>" target="_blank" class="btn btn-success" style="color: white">
                                        Visualizar
                                    </a>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                        </logic:iterate>
                    </logic:present>
                </table>
            </div>
        </html:form>
    </body>
</html:html>



