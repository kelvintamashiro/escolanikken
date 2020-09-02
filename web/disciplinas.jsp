<%-- 
    Document   : disciplinas
    Created on : 27/03/2020, 08:57:37
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
                        <a href="tela_interativa.jsp"><img src="imagens/bt_voltar_2.png" width="100px"/></a>
                    </td>
                    <td width="80%" align="center">
                        <h1>Gerenciador de Disciplinas</h1>
                    </td>
                    <td width="10%">&nbsp;</td>
                </tr>
            </table>
            <div class="form-group">
                <table border="0" align="center" style="margin-top: 20px;" width="90%">
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
                                <input class="btn btn-green" type="button" value="Cadastrar" onClick="fCadastrar();">
                            </div>

                        </td>
                    </tr>
                </table>
            </div>

            <hr/>
            <table border="0" align="center" width="100%" style="background-color: #F4F4F4">
                <tr>
                    <td align="center">
                        <h3>Lista de Disciplinas Cadastradas</h3>
                    </td>
                </tr>
            </table>

            <div class="form-group">
                <table border="0" class="table-condensed" align="center" style="margin-top: 20px;" width="80%">
                    <tr>
                        <td><b>Categoria</b></td>
                        <td><b>Disciplina</b></td>
                        <td align="center"><b>Peso Produção de Sala</b></td>
                        <td align="center"><b>Peso Prova Mensal</b></td>
                        <td align="center"><b>Peso Prova Bimestral</b></td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <logic:iterate name="listaDisciplinas" id="lista" scope="request">
                        <logic:equal name="lista" property="categoriaEnsino" value="INF">
                            <tr style="background-color: #F5DEB3">
                            </logic:equal>
                            <logic:equal name="lista" property="categoriaEnsino" value="EF1">
                            <tr style="background-color: #E0FFFF">
                            </logic:equal>
                            <logic:equal name="lista" property="categoriaEnsino" value="EF2">
                            <tr style="background-color: #EEE8AA">
                            </logic:equal>
                            <logic:equal name="lista" property="categoriaEnsino" value="EM">
                            <tr style="background-color: #FFC0CB">
                            </logic:equal>
                            <td>
                                <logic:equal name="lista" property="categoriaEnsino" value="INF">Educação Infantil</logic:equal>
                                <logic:equal name="lista" property="categoriaEnsino" value="EF1">Fundamental I</logic:equal>
                                <logic:equal name="lista" property="categoriaEnsino" value="EF2">Fundamental II</logic:equal>
                                <logic:equal name="lista" property="categoriaEnsino" value="EM">Ensino Médio</logic:equal>
                                </td>
                                <td><bean:write name="lista" property="nomeDisciplina"/></td>
                            <td align="center"><bean:write name="lista" property="pesoProducaoSala"/></td>
                            <td align="center"><bean:write name="lista" property="pesoProvaMensal"/></td>
                            <td align="center"><bean:write name="lista" property="pesoProvaBimestral"/></td>
                            <td align="center">
                                <input class="btn btn-grey" type="button" value="Editar" onClick="fEditar(<bean:write name="lista" property="idDisciplina"/>);">
                            </td>
                            <td align="center">
                                <input class="btn btn-grey" type="button" value="Vincular Professor" onClick="fVincularProfessor(<bean:write name="lista" property="idDisciplina"/>, '<bean:write name="lista" property="categoriaEnsino"/>');">
                            </td>
                            <td align="center">
                                <input class="btn btn-grey" type="button" value="Excluir" onClick="fExcluir(<bean:write name="lista" property="idDisciplina"/>);">
                            </td>
                        </tr>
                    </logic:iterate>
                </table>
            </div>



            <%--<jsp:include page="footer.jsp"/>--%>
        </html:form>
    </body>
</html>
<script language="javascript">
    function fCadastrar() {
        var nomeDisciplina = document.DisciplinasForm.nomeDisciplina.value;
        if (nomeDisciplina.length < 2) {
            alert("Deve ser informado o nome da disciplina corretamente!");
            document.getElementById('nomeDisciplina').focus();
        } else {
            document.DisciplinasForm.action = "Disciplinas.do?action=cadastrar";
            document.DisciplinasForm.submit();
        }
    }

    function fEditar(idDisciplina) {
        document.DisciplinasForm.action = "Disciplinas.do?action=editar&idDisciplina=" + idDisciplina;
        document.DisciplinasForm.submit();
    }

    function fExcluir(idDisciplina) {
        if (confirm("Deseja realmente excluir essa disciplina??")) {
            document.DisciplinasForm.action = "Disciplinas.do?action=excluir&idDisciplina=" + idDisciplina;
            document.DisciplinasForm.submit();
        }
    }

    function fVincularProfessor(idDisciplina, categoriaEnsino) {
        document.DisciplinasForm.action = "DisciplinaProfessor.do?idDisciplina=" + idDisciplina + "&categoriaEnsino=" + categoriaEnsino;
        document.DisciplinasForm.submit();
    }
</script>



