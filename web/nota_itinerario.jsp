<%-- 
    Document   : nota_projeto
    Created on : 2 de fev de 2022, 23:00:22
    Author     : macuser
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<!DOCTYPE html>
<html class="js-disabled">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Escola Nikken - Lan�amento de Notas</title>
        <link rel="shortcut icon" href="imagens/favico.png" />
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <script language="javascript1.2" src="js/mizanscene.js"></script>
        <script type="text/javascript" src="js/JQuery/js/jquery-1.3.2.js"></script>

        <link rel="stylesheet" media="all" type="text/css" href="assets/css/fix.css" />
        <link rel="stylesheet" media="all" type="text/css" href="assets/css/style.css" />
        <style>
            body {
                margin:0;
                padding:0;
            }
        </style>
    </head>
    <body>
        <logic:present name="errors">
            <script>
                alert('<bean:write name="errors"/>');
            </script>
        </logic:present>
        <html:form action="NotaItinerario" name="NotaItinerarioForm" type="br.com.Form.NotaItinerarioForm" scope="request">
            <jsp:include page="topo.jsp"/>

            <table border="0" align="center" style="margin-top: 20px; background-color: #ADD8E6" width="100%">
                <tr>
                    <td width="10%" style="padding-left: 50px">
                        <a href="tela_interativa.jsp"><img src="imagens/bt_voltar_2.png" width="100px"/></a>
                    </td>
                    <td width="80%" align="center">
                        <h1>Lan�amento de Notas Itiner�rio</h1>
                    </td>
                    <td width="10%">&nbsp;</td>
                </tr>
            </table>
            <div class="form-group">
                <table border="0" align="center" style="margin-top: 20px;" width="80%" class="table">
                    <tr>
                        <td width="15%">&nbsp;</td>
                        <td width="10%">
                            <b>Categoria Ensino</b>
                        </td>
                        <td width="35%">
                            <b>Itiner�rio</b>
                        </td>
                        <td width="15%">
                            <b>S�rie/Ano</b>
                        </td>
                        <td width="20%" colspan="4">
                            &nbsp;
                        </td>
                        <td width="15%">&nbsp;</td>
                    </tr>
                    <logic:present name="listaItinerarioPorProfessor" scope="request">
                        <logic:iterate id="lista" name="listaItinerarioPorProfessor" scope="request">
                            <tr>
                                <td width="10%">&nbsp;</td>
                                <td>
                                    <logic:equal name="lista" property="categoriaEnsino" value="EF2">
                                        Fundamental II
                                    </logic:equal>
                                    <logic:equal name="lista" property="categoriaEnsino" value="EM">
                                        Ensino M�dio
                                    </logic:equal>
                                </td>
                                <td>
                                    <bean:write name="lista" property="nomeItinerario"/>
                                </td>
                                <td>
                                    <bean:write name="lista" property="dsSerieAno"/>
                                </td>
                                <td>
                                    <input class="btn btn-grey" type="button" value="Lan�ar Nota 1� Bim." onClick="fLancarNota(1,<bean:write name="lista" property="idItinerario"/>,<bean:write name="lista" property="idSerieAno"/>);">
                                </td>
                                <td>
                                    <input class="btn btn-green" type="button" value="Lan�ar Nota 2� Bim." onClick="fLancarNota(2,<bean:write name="lista" property="idItinerario"/>,<bean:write name="lista" property="idSerieAno"/>);">
                                </td>
                                <td>
                                    <input class="btn btn-grey" type="button" value="Lan�ar Nota 3� Bim." onClick="fLancarNota(3,<bean:write name="lista" property="idItinerario"/>,<bean:write name="lista" property="idSerieAno"/>);">
                                </td>
                                <td>
                                    <input class="btn btn-green" type="button" value="Lan�ar Nota 4� Bim." onClick="fLancarNota(4,<bean:write name="lista" property="idItinerario"/>,<bean:write name="lista" property="idSerieAno"/>);">
                                </td>
                                <td width="10%">&nbsp;</td>
                            </tr>
                        </logic:iterate>
                    </logic:present>
                </table>
            </div>

        </html:form>
    </body>
</html>
<script language="javascript">
    function fLancarNota(nrBimestre, idItinerario, serieAno) {
        document.NotaItinerarioForm.action = "NotaItinerario.do?action=pageLancarNota&idItinerario=" + idItinerario + "&idSerieAno=" + serieAno + "&nrBimestre=" + nrBimestre;
        document.NotaItinerarioForm.submit();
    }
</script>


