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
        <title>Escola Nikken - Itiner�rios</title>
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
        <html:form action="Itinerario" name="ItinerarioForm" type="br.com.Form.ItinerarioForm" scope="request">
            <jsp:include page="topo.jsp"/>
            <div class="container-fluid">
                <div class="row p-3" style="background-color: #F4F4F4" >
                    <div class="col-12 col-sm-1" align="center">
                        <a href="tela_interativa.jsp"><img src="imagens/bt_voltar_2.png" width="100px"/></a>
                    </div>
                    <div class="col-sm-10" align="center">
                        <h2>Editar Itiner�rios Formativos</h2>
                    </div>
                    <div class="col-sm-1">&nbsp;</div>
                </div>
            </div>

            <div class="form-group">
                <table border="0" align="center" style="margin-top: 20px;" width="80%">
                    <html:hidden name="ItinerarioForm" property="idItinerario"/> 
                    <tr>
                        <td width="25%">
                            <div class="col-lg-10">
                                <label for="usr">Nome do Itiner�rio Formativo:</label>
                                <html:text styleClass="form-control form-control-sm" name="ItinerarioForm" property="nomeItinerario" styleId="nomeItinerario"/>
                            </div>
                        </td>
                        <td width="20%">
                            <div class="col-lg-10">
                                <label for="usr">Categoria de Ensino:</label>
                                <html:select name="ItinerarioForm" property="categoriaEnsino" styleId="categoriaEnsino" styleClass="form-control form-control-sm">
                                    <html:option value="EM">Ensino M�dio</html:option>
                                </html:select>
                            </div>
                        </td>
                        <td width="15%">
                            <div class="col-lg-10">
                                <label for="usr">S�rie</label>
                                <html:select name="ItinerarioForm" property="idSerieAno" styleId="idSerieAno" styleClass="form-control form-control-sm">
                                    <html:option value="">Selecione S�rie</html:option>
                                    <html:option value="10">1� s�rie</html:option>
                                    <html:option value="20">2� s�rie</html:option>
                                    <html:option value="30">3� s�rie</html:option>
                                </html:select>
                            </div>
                        </td>
                        <td>
                            <div class="col-lg-10">
                                <label>Professor</label>
                                <html:select name="ItinerarioForm" property="idProfessor" styleClass="form-control form-control-sm">
                                    <html:option value="0">Selecione</html:option>
                                    <html:options collection="listaProfessor" property="idPF" labelProperty="nome"></html:options>
                                </html:select>
                            </div>
                        </td>
                        <td>
                            <div class="col-lg-12">
                                <label for="usr">&nbsp;</label> <br/>
                                <input class="btn btn-sm btn-success" type="button" value="Atualizar" onClick="fAtualizar();">
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
            alert("Deve ser informado o nome do Itiner�rio corretamente!");
            document.getElementById('nomeItinerario').focus();
        } else if (idProfessor === 0) {
            alert("Deve ser informado o Professor corretamente!");
        } else {
            document.ItinerarioForm.action = "Itinerario.do?action=atualizar";
            document.ItinerarioForm.submit();
        }
    }


</script>



