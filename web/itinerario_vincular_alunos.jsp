<%-- 
    Document   : itinerario_vincular_alunos
    Created on : 28 de fev de 2022, 20:31:36
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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
        <style>
            body {
                margin:0;
                padding:0;
            }
        </style>
        <script>
            function inverte() {
                var checks = document.getElementsByTagName("input");
                for (var i = 0; i < checks.length; i++) {
                    var check = checks[i];
                    if (check.type == "checkbox") {
                        check.checked = !check.checked;
                    }
                }
            }

            $(document).ready(function () {
                $(".close").click(function () {
                    $("#myAlert").alert("close");
                });
            });
        </script>
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
                        <h2>Vincular Alunos Itinerários Formativos</h2>
                    </div>
                    <div class="col-sm-1">&nbsp;</div>
                </div>
            </div>

            <div class="form-group">
                <table border="0" align="center" style="margin-top: 20px;" width="80%">
                    <html:hidden name="ItinerarioForm" property="idItinerario"/> 
                    <tr>
                        <td>
                            <div class="col-lg-12">
                                <label for="usr">Nome do Itinerário Formativo:</label>
                                <html:text styleClass="form-control form-control-sm" name="ItinerarioForm" property="nomeItinerario" styleId="nomeItinerario" readonly="true"/>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="col-lg-12">
                                <label for="usr">Categoria de Ensino:</label>
                                <html:select name="ItinerarioForm" property="categoriaEnsino" styleId="categoriaEnsino" styleClass="form-control form-control-sm" disabled="true">
                                    <html:option value="EM">Ensino Médio</html:option>
                                </html:select>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="col-lg-12">
                                <label for="usr">Série</label>
                                <html:hidden name="ItinerarioForm" property="idSerieAno"/> 
                                <html:select name="ItinerarioForm" property="idSerieAno" styleId="idSerieAno" styleClass="form-control form-control-sm" disabled="true">
                                    <html:option value="">Selecione Série</html:option>
                                    <html:option value="10">1ª série</html:option>
                                    <html:option value="20">2ª série</html:option>
                                    <html:option value="30">3ª série</html:option>
                                </html:select>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                </table>
                <table border="1" class="table-condensed" align="center"  width="80%">
                    <tr style="background-color: #FFFFE0">
                        <td width="5%" align="center"><b>Nº</b></td>
                        <td width="5%" align="center">
                            <input type="button" class="botao" name="Submit" value="+ / -" onClick="inverte()">
                        </td>
                        <td><b>Nome do Aluno</b></td>
                    </tr>
                    <%int i = 1;%>
                    <logic:iterate name="listaAlunosSemVinculo" id="lista" scope="session">
                        <tr>
                            <td width="5%" align="center"><%=i++%></td>
                            <td width="5%" align="right">
                                <html:multibox name="ItinerarioForm" property="selectedOptions"> 
                                    <bean:write name="lista" property="idAluno"/> 
                                </html:multibox>
                            </td>
                            <td><bean:write name="lista" property="nome"/></td>

                        </tr>
                    </logic:iterate>
                </table>
                <table border="0" align="center" style="margin-top: 20px;" width="80%">
                    <tr>
                        <td>
                            <div class="col-lg-12">
                                <label for="usr">&nbsp;</label>
                                <input class="btn btn-sm btn-success" type="button" value="Vincular" onClick="fVincular();">
                            </div>

                        </td>
                    </tr>
                </table>
            </div>
            <hr/>
            <div class="form-group" style="background-color: #F0FFF0">
                <table class="table-condensed" border="0" align="center" style="margin-top: 20px;" width="80%">
                    <h3 align="center"><b>Alunos Vinculados</b></h3>
                    <logic:iterate name="listaAlunosComVinculo" id="listaVinculo" scope="session">
                        <tr>
                            <td>
                                <bean:write name="listaVinculo" property="nome"/>
                            </td>
                            <td>
                                <input class="btn btn-sm btn-danger" type="button" value="Excluir" onClick="fDesvincular(<bean:write name="listaVinculo" property="idItinerarioAluno"/>);">
                            </td>
                        </tr>

                    </logic:iterate>
                </table>
            </div>

        </html:form>
    </body>
</html>
<script language="javascript">
    function fVincular() {
        document.ItinerarioForm.action = "Itinerario.do?action=vincularAlunos";
        document.ItinerarioForm.submit();
    }

    function fDesvincular(idItinerarioAluno) {
        if (confirm("Deseja realmente desvincular esse aluno desse Itinerário??")) {
            document.ItinerarioForm.action = "Itinerario.do?action=desvincularAluno&idItinerarioAluno=" + idItinerarioAluno;
            document.ItinerarioForm.submit();
        }
    }

</script>




