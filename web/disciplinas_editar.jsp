<%-- 
    Document   : disciplinas_editar
    Created on : 27/03/2020, 11:57:29
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
        <title>Escola Nikken - Disciplinas</title>
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
        <html:form action="Disciplinas" name="DisciplinasForm" type="br.com.Form.DisciplinasForm" scope="request">
            <jsp:include page="topo.jsp"/>

            <table border="0" align="center" style="margin-top: 20px; background-color: #FFDAB9" width="100%">
                <tr>
                    <td width="10%" style="padding-left: 50px">
                        <a href="javascript:fVoltar()"><img src="imagens/bt_voltar_2.png" width="100px"/></a>
                    </td>
                    <td width="80%" align="center">
                        <h1>Gerenciador de Disciplinas</h1>
                    </td>
                    <td width="10%">&nbsp;</td>
                </tr>
            </table>
            <div class="form-group">
                <table border="0" align="center" style="margin-top: 20px;" width="80%">
                    <html:hidden name="DisciplinasForm" property="idDisciplina"/>
                    <tr>
                        <td width="25%">
                            <div class="col-lg-12">
                                <label for="usr">Nome da Disciplina:</label>
                                <html:text styleClass="form-control" name="DisciplinasForm" property="nomeDisciplina" styleId="nomeDisciplina"/>
                            </div>
                        </td>
                        <td width="20%">
                            <div class="col-lg-12">
                                <label for="usr">Categoria de Ensino:</label>
                                <html:select name="DisciplinasForm" property="categoriaEnsino" styleId="categoriaEnsino" styleClass="form-control">
                                    <html:option value="">Selecione</html:option>
                                    <html:option value="INF">Educação Infantil</html:option>
                                    <html:option value="EF1">Ensino Fundamental I</html:option>
                                    <html:option value="EF2">Ensino Fundamental II</html:option>
                                    <html:option value="EM">Ensino Médio</html:option>
                                </html:select>
                            </div>
                        </td>
                        <td width="15%">
                            <div class="col-lg-12">
                                <label for="usr">Peso Produção de Sala</label>
                                <html:select name="DisciplinasForm" property="pesoProducaoSala" styleId="pesoProducaoSala" styleClass="form-control">
                                    <html:option value="0">0</html:option>
                                    <html:option value="1">1</html:option>
                                    <html:option value="2">2</html:option>
                                    <html:option value="3">3</html:option>
                                </html:select>
                            </div>
                        </td>
                        <td width="15%">
                            <div class="col-lg-12">
                                <label for="usr">Peso Prova Mensal</label>
                                <html:select name="DisciplinasForm" property="pesoProvaMensal" styleId="pesoProvaMensal" styleClass="form-control">
                                    <html:option value="0">0</html:option>
                                    <html:option value="1">1</html:option>
                                    <html:option value="2">2</html:option>
                                    <html:option value="3">3</html:option>
                                </html:select>
                            </div>
                        </td>
                        <td width="15%">
                            <div class="col-lg-12">
                                <label for="usr">Peso Prova Bimestral</label>
                                <html:select name="DisciplinasForm" property="pesoProvaBimestral" styleId="pesoProvaBimestral" styleClass="form-control">
                                    <html:option value="0">0</html:option>
                                    <html:option value="1">1</html:option>
                                    <html:option value="2">2</html:option>
                                    <html:option value="3">3</html:option>
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

            <%--<jsp:include page="footer.jsp"/>--%>
        </html:form>
    </body>
</html>
<script language="javascript">
    function fAtualizar() {
        var nomeDisciplina = document.DisciplinasForm.nomeDisciplina.value;
        if (nomeDisciplina.length < 2) {
            alert("Deve ser informado o nome da disciplina corretamente!");
            document.getElementById('nomeDisciplina').focus();
        } else {
            document.DisciplinasForm.action = "Disciplinas.do?action=atualizar";
            document.DisciplinasForm.submit();
        }
    }

    function fVoltar() {
        document.DisciplinasForm.action = "Disciplinas.do";
        document.DisciplinasForm.submit();
    }
</script>



