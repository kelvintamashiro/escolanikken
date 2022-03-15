<%-- 
    Document   : itinerario_editar
    Created on : 16 de fev de 2022, 15:00:31
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
        <title>Escola Nikken - Itinerários</title>
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
        <html:form action="Itinerario" name="ItinerarioForm" type="br.com.Form.ItinerarioForm" scope="request">
            <jsp:include page="topo.jsp"/>

            <table border="0" align="center" style="margin-top: 20px; background-color: #FFDAB9" width="100%">
                <tr>
                    <td width="10%">&nbsp;</td>
                    <td width="80%" align="center">
                        <h1>Editar Itinerários Formativos</h1>
                    </td>
                    <td width="10%">&nbsp;</td>
                </tr>
            </table>
            <div class="form-group">
                <table border="0" align="center" style="margin-top: 20px;" width="80%">
                    <html:hidden name="ItinerarioForm" property="idItinerario"/> 
                    <tr>
                        <td width="25%">
                            <div class="col-lg-12">
                                <label for="usr">Nome do Itinerário Formativo:</label>
                                <html:text styleClass="form-control" name="ItinerarioForm" property="nomeItinerario" styleId="nomeItinerario"/>
                            </div>
                        </td>
                        <td width="20%">
                            <div class="col-lg-12">
                                <label for="usr">Categoria de Ensino:</label>
                                <html:select name="ItinerarioForm" property="categoriaEnsino" styleId="categoriaEnsino" styleClass="form-control">
                                    <html:option value="EM">Ensino Médio</html:option>
                                </html:select>
                            </div>
                        </td>
                        <td width="15%">
                            <div class="col-lg-12">
                                <label for="usr">Série</label>
                                <html:select name="ItinerarioForm" property="idSerieAno" styleId="idSerieAno" styleClass="form-control">
                                    <html:option value="">Selecione Série</html:option>
                                    <html:option value="10">1ª série</html:option>
                                    <html:option value="20">2ª série</html:option>
                                    <html:option value="30">3ª série</html:option>
                                </html:select>
                            </div>
                        </td>
                        <td>
                            <div class="col-lg-12">
                                <label>Professor</label>
                                <html:select name="ItinerarioForm" property="idProfessor" styleClass="form-control">
                                    <html:option value="0">Selecione</html:option>
                                    <html:options collection="listaProfessor" property="idPF" labelProperty="nome"></html:options>
                                </html:select>
                            </div>
                        </td>
                        <td>
                            <div class="col-lg-12">
                                <label for="usr">&nbsp;</label>
                                <input class="btn btn-green" type="button" value="Atualizar" onClick="fAtualizar();">
                            </div>

                        </td>
                    </tr>
                </table>
            </div>

        </html:form>
    </body>
</html>
<script language="javascript">
    function fAtualizar() {
        var nomeItinerario = document.ItinerarioForm.nomeItinerario.value;
        var idProfessor = document.ItinerarioForm.idProfessor.value;
        if (nomeItinerario.length < 2) {
            alert("Deve ser informado o nome do Itinerário corretamente!");
            document.getElementById('nomeItinerario').focus();
        } else if (idProfessor === 0) {
            alert("Deve ser informado o Professor corretamente!");
        } else {
            document.ItinerarioForm.action = "Itinerario.do?action=atualizar";
            document.ItinerarioForm.submit();
        }
    }


</script>



