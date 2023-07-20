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
        <html:form action="Disciplinas" name="DisciplinasForm" type="br.com.Form.DisciplinasForm" scope="request">
            <jsp:include page="topo.jsp"/>
            <div class="container-fluid">
                <div class="row p-3" style="background-color: #F4F4F4" >
                    <div class="col-12 col-sm-1" align="center">
                        <a href="Disciplinas.do"><img src="imagens/bt_voltar_2.png" width="100px"/></a>
                    </div>
                    <div class="col-sm-10" align="center">
                        <h2>Gerenciador de Disciplinas</h2>
                    </div>
                    <div class="col-sm-1">&nbsp;</div>
                </div>
            </div>
          
            <div class="form-group">
                <table border="0" align="center" style="margin-top: 20px;" width="80%">
                    <html:hidden name="DisciplinasForm" property="idDisciplina"/>
                    <tr>
                        <td width="25%">
                            <div class="col-lg-10">
                                <label for="usr">Nome da Disciplina:</label>
                                <html:text styleClass="form-control form-control-sm" name="DisciplinasForm" property="nomeDisciplina" styleId="nomeDisciplina"/>
                            </div>
                        </td>
                        <td width="20%">
                            <div class="col-lg-10">
                                <label for="usr">Categoria de Ensino:</label>
                                <html:select name="DisciplinasForm" property="categoriaEnsino" styleId="categoriaEnsino" styleClass="form-control form-control-sm">
                                    <html:option value="">Selecione</html:option>
                                    <html:option value="INF">Educação Infantil</html:option>
                                    <html:option value="EF1">Ensino Fundamental I</html:option>
                                    <html:option value="EF2">Ensino Fundamental II</html:option>
                                    <html:option value="EM">Ensino Médio</html:option>
                                </html:select>
                            </div>
                        </td>
                        <td width="15%">
                            <div class="col-lg-10">
                                <label for="usr">Peso Produção de Sala</label>
                                <html:select name="DisciplinasForm" property="pesoProducaoSala" styleId="pesoProducaoSala" styleClass="form-control form-control-sm">
                                    <html:option value="0">0</html:option>
                                    <html:option value="1">1</html:option>
                                    <html:option value="2">2</html:option>
                                    <html:option value="3">3</html:option>
                                </html:select>
                            </div>
                        </td>
                        <td width="15%">
                            <div class="col-lg-10">
                                <label for="usr">Peso Prova Mensal</label>
                                <html:select name="DisciplinasForm" property="pesoProvaMensal" styleId="pesoProvaMensal" styleClass="form-control form-control-sm">
                                    <html:option value="0">0</html:option>
                                    <html:option value="1">1</html:option>
                                    <html:option value="2">2</html:option>
                                    <html:option value="3">3</html:option>
                                </html:select>
                            </div>
                        </td>
                        <td width="15%">
                            <div class="col-lg-10">
                                <label for="usr">Peso Prova Bimestral</label>
                                <html:select name="DisciplinasForm" property="pesoProvaBimestral" styleId="pesoProvaBimestral" styleClass="form-control form-control-sm">
                                    <html:option value="0">0</html:option>
                                    <html:option value="1">1</html:option>
                                    <html:option value="2">2</html:option>
                                    <html:option value="3">3</html:option>
                                </html:select>
                            </div>
                        </td>
                        <td>
                            <div class="col-lg-12">
                                <label for="usr">&nbsp;</label><br/>
                                <input class="btn btn-sm btn-success" type="button" value="Atualizar" onClick="fAtualizar();">
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



