<%-- 
    Document   : planejamento_oficina_pesquisar
    Created on : 13/10/2020, 22:22:27
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
        <logic:present name="errors">
            <script>
                alert('<bean:write name="errors"/>');
            </script>
        </logic:present>
        <jsp:include page="topo.jsp"/>
        <html:form action="PlanejamentoOficinas" name="PlanejamentoOficinasForm" type="br.com.Form.PlanejamentoOficinasForm" scope="request">
            <html:hidden name="PlanejamentoOficinasForm" property="idProfessor"/>
            <table border="0" align="center" style="margin-top: 20px; background-color: #F0FFFF" width="100%">
                <tr>
                    <td width="10%" style="padding-left: 50px">
                        <a href="javascript:history.back()"><img src="imagens/bt_voltar_2.png" width="100px"/></a>
                    </td>
                    <td width="80%" align="center">
                        <h1>Planejamento de Oficinas Por Professor</h1>
                    </td>
                    <td width="10%">&nbsp;</td>
                </tr>
            </table>
            <html:hidden name="PlanejamentoOficinasForm" property="idProfessor"/>
            <div class="form-group">
                <logic:present name="listaPlanoOficinas" scope="request">
                    <table border="0" class="table-condensed" align="center" style="margin-top: 20px;font-size: 11px" width="80%">
                        <tr>
                            <td><b>Data</b></td>
                            <td><b>Professor</b></td>
                            <td><b>Nome Oficina</b></td>
                            <td><b>Bimestre</b></td>
                            <td><b>Série/Ano</b></td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <logic:iterate id="lista" name="listaPlanoOficinas" scope="request">
                            <tr>
                                <td><bean:write name="lista" property="data"/></td>
                                <td><bean:write name="lista" property="nomeProfessor"/></td>
                                <td><bean:write name="lista" property="nomeOficina"/></td>
                                <td><bean:write name="lista" property="nrBimestre"/>º Bimestre</td>
                                <td><bean:write name="lista" property="dsSerieAno"/></td>
                                <td>
                                    <input class="btn btn-green" type="button" value="Editar" onClick="fEditar(<bean:write name="lista" property="idPlanejamento"/>);">
                                </td>
                                <td>
<!--                                    <a href="PlanejamentoOficinas.do?action=visualizar&idPlanejamento=<bean:write name="lista" property="idPlanejamento"/>" target="_blank" class="btn btn-info">
                                        Visualizar
                                    </a>-->
                                    <input class="btn btn-info" type="button" value="Visualizar" onClick="fVisualizar(<bean:write name="lista" property="idPlanejamento"/>);">
                                </td>
                                <td>
                                    <input class="btn btn-danger" type="button" value="Excluir" onClick="fExcluir(<bean:write name="lista" property="idPlanejamento"/>);">
                                </td>
                            </tr>
                        </logic:iterate>
                    </table>
                </logic:present>
            </div>
        </html:form>
    </body>


    <script language="javascript">
        function fEditar(idPlanejamento) {
            document.PlanejamentoOficinasForm.action = "PlanejamentoOficinas.do?action=editar&idPlanejamento=" + idPlanejamento + "&idPF=<bean:write name="PlanejamentoOficinasForm" property="idProfessor"/>";
            document.PlanejamentoOficinasForm.target = "_self";
            document.PlanejamentoOficinasForm.submit();
        }

        function fVisualizar(idPlanejamento) {
            document.PlanejamentoOficinasForm.action = "PlanejamentoOficinas.do?action=visualizar&idPlanejamento=" + idPlanejamento + "&idPF=<bean:write name="PlanejamentoOficinasForm" property="idProfessor"/>";
            document.PlanejamentoOficinasForm.target = "_blank";
            document.PlanejamentoOficinasForm.submit();
        }

        function fExcluir(idPlanejamento) {
            if (confirm("Deseja Realmente EXCLUIR??")) {
                document.PlanejamentoOficinasForm.action = "PlanejamentoOficinas.do?action=excluir&idPlanejamento=" + idPlanejamento + "&idPF=<bean:write name="PlanejamentoOficinasForm" property="idProfessor"/>";
                document.PlanejamentoOficinasForm.target = "_self";
                document.PlanejamentoOficinasForm.submit();
            }
        }
    </script>

</html>

