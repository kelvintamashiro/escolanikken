<%-- 
    Document   : itinerario
    Created on : 9 de fev de 2022, 21:52:42
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
                        <h2>Gerenciador de Itinerários Formativos</h2>
                    </div>
                    <div class="col-sm-1">&nbsp;</div>
                </div>
            </div>

            <div class="form-group">
                <table border="0" align="center" style="margin-top: 20px;" width="80%">
                    <tr>
                        <td width="25%">
                            <div class="col-lg-12">
                                <label for="usr">Nome do Itinerário Formativo:</label>
                                <html:text styleClass="form-control form-control-sm" name="ItinerarioForm" property="nomeItinerario" styleId="nomeItinerario"/>
                            </div>
                        </td>
                        <td width="20%">
                            <div class="col-lg-12">
                                <label for="usr">Categoria de Ensino:</label>
                                <html:select name="ItinerarioForm" property="categoriaEnsino" styleId="categoriaEnsino" styleClass="form-control form-control-sm">
                                    <html:option value="EM">Ensino Médio</html:option>
                                </html:select>
                            </div>
                        </td>
                        <td width="15%">
                            <div class="col-lg-12">
                                <label for="usr">Série</label>
                                <html:select name="ItinerarioForm" property="idSerieAno" styleId="idSerieAno" styleClass="form-control form-control-sm">
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
                                <html:select name="ItinerarioForm" property="idProfessor" styleClass="form-control form-control-sm">
                                    <html:option value="0">Selecione</html:option>
                                    <html:options collection="listaProfessor" property="idPF" labelProperty="nome"></html:options>
                                </html:select>
                            </div>
                        </td>
                        <td>
                            <div class="col-lg-12">
                                <label for="usr">&nbsp;</label><br/>
                                <input class="btn btn-sm btn-success" type="button" value="Cadastrar" onClick="fCadastrar();">
                            </div>

                        </td>
                    </tr>
                </table>
            </div>

            <hr/>
            <table border="0" align="center" width="100%" style="background-color: #F4F4F4">
                <tr>
                    <td align="center">
                        <h3>Lista de Itinerários Formativos Cadastradas</h3>
                    </td>
                </tr>
            </table>

            <div class="form-group">
                <table border="0" class="table-condensed" align="center" style="margin-top: 20px;" width="80%">
                    <tr>
                        <td><b>Categoria</b></td>
                        <td><b>Série</b></td>
                        <td><b>Nome Itinerário Formativo</b></td>
                        <td><b>Professor</b></td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <logic:iterate name="listaItinerarios" id="lista" scope="request">
                        <tr>
                            <td>Ensino Médio</td>
                            <td>
                                <logic:equal name="lista" property="idSerieAno" value="10">1ª série</logic:equal>
                                <logic:equal name="lista" property="idSerieAno" value="20">2ª série</logic:equal>
                                <logic:equal name="lista" property="idSerieAno" value="30">3ª série</logic:equal>
                                </td>
                                <td><bean:write name="lista" property="nomeItinerario"/></td>
                            <td><bean:write name="lista" property="nomeProfessor"/></td>
                            <td align="center">
                                <input class="btn btn-sm btn-dark" type="button" value="Editar" onClick="fEditar(<bean:write name="lista" property="idItinerario"/>, '<bean:write name="lista" property="categoriaEnsino"/>');">
                            </td>
                            <td align="center">
                                <input class="btn btn-sm btn-success" type="button" value="Vincular Alunos" onClick="fVincularAlunos(<bean:write name="lista" property="idItinerario"/>, '<bean:write name="lista" property="idSerieAno"/>');">
                            </td>
                            <td align="center">
                                <input class="btn btn-sm btn-danger" type="button" value="Excluir" onClick="fExcluir(<bean:write name="lista" property="idItinerario"/>);">
                            </td>
                        </tr>
                    </logic:iterate>
                </table>
            </div>

        </html:form>
    </body>
</html>
<script language="javascript">
    function fCadastrar() {
        var nomeItinerario = document.ItinerarioForm.nomeItinerario.value;
        var idProfessor = document.ItinerarioForm.idProfessor.value;
        if (nomeItinerario.length < 2) {
            alert("Deve ser informado o nome da disciplina corretamente!");
            document.getElementById('nomeItinerario').focus();
        } else if (idProfessor === 0) {
            alert("Deve ser informado o Professor corretamente!");
        } else {
            document.ItinerarioForm.action = "Itinerario.do?action=cadastrar";
            document.ItinerarioForm.submit();
        }
    }

    function fExcluir(idItinerario) {
        if (confirm("Deseja realmente excluir essa disciplina??")) {
            document.ItinerarioForm.action = "Itinerario.do?action=excluir&idItinerario=" + idItinerario;
            document.ItinerarioForm.submit();
        }
    }

    function fEditar(idItinerario) {
        document.ItinerarioForm.action = "Itinerario.do?action=pageEditarItinerario&idItinerario=" + idItinerario;
        document.ItinerarioForm.submit();
    }

    function fVincularAlunos(idItinerario, idSerieAno) {
        document.ItinerarioForm.action = "Itinerario.do?action=pageVincularAlunos&idItinerario=" + idItinerario + "&idSerieAno=" + idSerieAno;
        document.ItinerarioForm.submit();
    }

</script>



