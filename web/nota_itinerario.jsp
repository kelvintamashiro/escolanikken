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
        <title>Escola Nikken - Lançamento de Notas</title>
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
        <html:form action="NotaItinerario" name="NotaItinerarioForm" type="br.com.Form.NotaItinerarioForm" scope="request">
            <jsp:include page="topo.jsp"/>
            <div class="container-fluid">
                <div class="row p-3" style="background-color: #F4F4F4" >
                    <div class="col-12 col-sm-1" align="center">
                        <a href="gerenciador_notas.jsp"><img src="imagens/bt_voltar_2.png" width="100px"/></a>
                    </div>
                    <div class="col-sm-10" align="center">
                        <h1>Lançamento de Notas Itinerário</h1>
                    </div>
                    <div class="col-sm-1">&nbsp;</div>
                </div>
            </div>
            <div class="form-group">
                <table border="0" align="center" style="margin-top: 20px;" width="80%" class="table">
                    <tr>
                        <td width="15%">&nbsp;</td>
                        <td width="10%">
                            <b>Categoria Ensino</b>
                        </td>
                        <td width="35%">
                            <b>Itinerário</b>
                        </td>
                        <td width="15%">
                            <b>Série/Ano</b>
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
                                        Ensino Médio
                                    </logic:equal>
                                </td>
                                <td>
                                    <bean:write name="lista" property="nomeItinerario"/>
                                </td>
                                <td>
                                    <bean:write name="lista" property="dsSerieAno"/>
                                </td>
                                <td>
                                    <input class="btn btn-sm btn-primary" type="button" value="Lançar Nota 1º Bim." onClick="fLancarNota(1,<bean:write name="lista" property="idItinerario"/>,<bean:write name="lista" property="idSerieAno"/>);">
                                </td>
                                <td>
                                    <input class="btn btn-sm btn-danger" type="button" value="Lançar Nota 2º Bim." onClick="fLancarNota(2,<bean:write name="lista" property="idItinerario"/>,<bean:write name="lista" property="idSerieAno"/>);">
                                </td>
                                <td>
                                    <input class="btn btn-sm btn-success" type="button" value="Lançar Nota 3º Bim." onClick="fLancarNota(3,<bean:write name="lista" property="idItinerario"/>,<bean:write name="lista" property="idSerieAno"/>);">
                                </td>
                                <td>
                                    <input class="btn btn-sm btn-warning" type="button" value="Lançar Nota 4º Bim." onClick="fLancarNota(4,<bean:write name="lista" property="idItinerario"/>,<bean:write name="lista" property="idSerieAno"/>);">
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


