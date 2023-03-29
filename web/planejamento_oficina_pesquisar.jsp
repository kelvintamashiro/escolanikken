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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

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
        <div class="container-fluid">
            <div class="row p-3" style="background-color: #F4F4F4" >
                <div class="col-12 col-sm-1" align="center">
                    <a href="planejamento_oficina_page.jsp"><img src="imagens/bt_voltar_2.png" width="100px"/></a>
                </div>
                <div class="col-sm-10" align="center">
                    <h2>Planejamento de Oficinas Por Professor</h2>
                </div>
                <div class="col-sm-1">&nbsp;</div>
            </div>
        </div>
        <html:form action="PlanejamentoOficinas" name="PlanejamentoOficinasForm" type="br.com.Form.PlanejamentoOficinasForm" scope="request">
            <html:hidden name="PlanejamentoOficinasForm" property="idProfessor"/>

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
                                    <input class="btn btn-sm btn-success" type="button" value="Editar" onClick="fEditar(<bean:write name="lista" property="idPlanejamento"/>);">
                                </td>
                                <td>
                                    <input class="btn btn-sm btn-dark" type="button" value="Visualizar" onClick="fVisualizar(<bean:write name="lista" property="idPlanejamento"/>);">
                                </td>
                                <td>
                                    <input class="btn btn-sm btn-danger" type="button" value="Excluir" onClick="fExcluir(<bean:write name="lista" property="idPlanejamento"/>);">
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

