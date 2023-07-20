<%-- 
    Document   : disciplinas_vincular_professor
    Created on : 27/03/2020, 16:18:48
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
        <html:form action="DisciplinaProfessor" name="DisciplinaProfessorForm" type="br.com.Form.DisciplinaProfessorForm" scope="request">
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
                    <bean:define id="disciplinaForm" name="DisciplinaProfessorForm" property="disciplinasForm"/>
                    <tr>
                        <td width="20%">
                            <div class="col-lg-12">
                                <label for="usr">Categoria de Ensino:</label>
                                <html:hidden name="disciplinaForm" property="categoriaEnsino"/>
                                <b><bean:write name="disciplinaForm" property="dsCategoriaEnsino"/></b>
                            </div>
                        </td>
                        <td width="10%">
                            <div class="col-lg-12">
                                <label for="usr">ID Disciplina:</label>
                                <html:hidden name="disciplinaForm" property="idDisciplina"/>
                                <b><bean:write name="disciplinaForm" property="idDisciplina"/></b>
                            </div>
                        </td>
                        <td width="50%">
                            <div class="col-lg-12">
                                <label for="usr">Nome da Disciplina:</label>
                                <html:hidden name="disciplinaForm" property="nomeDisciplina"/>
                                <b><bean:write name="disciplinaForm" property="nomeDisciplina"/></b>
                            </div>
                        </td>
                    </tr>
                </table>
                <table border="0" align="center" style="margin-top: 20px;" width="80%" class="table">
                    <logic:equal name="disciplinaForm" property="categoriaEnsino" value="INF">
                        <tr>
                            <td width="10%">&nbsp;</td>
                            <td width="15%" align="center"><b>Infantil I</b></td>
                            <td>
                                <html:select name="DisciplinaProfessorForm" property="idProfInfantilI" styleClass="form-control form-control-sm">
                                    <html:option value="0">Selecione</html:option>
                                    <html:options collection="listaProfessor" property="idPF" labelProperty="nome"></html:options>
                                </html:select>
                            </td>
                            <td width="10%">&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td align="center"><b>Infantil II</b></td>
                            <td>
                                <html:select name="DisciplinaProfessorForm" property="idProfInfantilII" styleClass="form-control form-control-sm">
                                    <html:option value="0">Selecione</html:option>
                                    <html:options collection="listaProfessor" property="idPF" labelProperty="nome"></html:options>
                                </html:select>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td align="center"><b>Infantil III</b></td>
                            <td>
                                <html:select name="DisciplinaProfessorForm" property="idProfInfantilIII" styleClass="form-control form-control-sm">
                                    <html:option value="0">Selecione</html:option>
                                    <html:options collection="listaProfessor" property="idPF" labelProperty="nome"></html:options>
                                </html:select>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                    </logic:equal>
                    <logic:equal name="disciplinaForm" property="categoriaEnsino" value="EF1">
                        <tr>
                            <td width="10%">&nbsp;</td>
                            <td width="15%" align="center"><b>1º ano</b></td>
                            <td>
                                <html:select name="DisciplinaProfessorForm" property="idProf1ano" styleClass="form-control form-control-sm">
                                    <html:option value="0">Selecione</html:option>
                                    <html:options collection="listaProfessor" property="idPF" labelProperty="nome"></html:options>
                                </html:select>
                            </td>
                            <td width="10%">&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td align="center"><b>2º ano</b></td>
                            <td>
                                <html:select name="DisciplinaProfessorForm" property="idProf2ano" styleClass="form-control form-control-sm">
                                    <html:option value="0">Selecione</html:option>
                                    <html:options collection="listaProfessor" property="idPF" labelProperty="nome"></html:options>
                                </html:select>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td align="center"><b>3º ano</b></td>
                            <td>
                                <html:select name="DisciplinaProfessorForm" property="idProf3ano" styleClass="form-control form-control-sm">
                                    <html:option value="0">Selecione</html:option>
                                    <html:options collection="listaProfessor" property="idPF" labelProperty="nome"></html:options>
                                </html:select>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td align="center"><b>4º ano</b></td>
                            <td>
                                <html:select name="DisciplinaProfessorForm" property="idProf4ano" styleClass="form-control form-control-sm">
                                    <html:option value="0">Selecione</html:option>
                                    <html:options collection="listaProfessor" property="idPF" labelProperty="nome"></html:options>
                                </html:select>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td align="center"><b>5º ano</b></td>
                            <td>
                                <html:select name="DisciplinaProfessorForm" property="idProf5ano" styleClass="form-control form-control-sm">
                                    <html:option value="0">Selecione</html:option>
                                    <html:options collection="listaProfessor" property="idPF" labelProperty="nome"></html:options>
                                </html:select>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                    </logic:equal>
                    <logic:equal name="disciplinaForm" property="categoriaEnsino" value="EF2">
                        <tr>
                            <td width="10%">&nbsp;</td>
                            <td width="15%" align="center"><b>6º ano</b></td>
                            <td>
                                <html:select name="DisciplinaProfessorForm" property="idProf6ano" styleClass="form-control form-control-sm">
                                    <html:option value="0">Selecione</html:option>
                                    <html:options collection="listaProfessor" property="idPF" labelProperty="nome"></html:options>
                                </html:select>
                            </td>
                            <td width="10%">&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td align="center"><b>7º ano</b></td>
                            <td>
                                <html:select name="DisciplinaProfessorForm" property="idProf7ano" styleClass="form-control form-control-sm">
                                    <html:option value="0">Selecione</html:option>
                                    <html:options collection="listaProfessor" property="idPF" labelProperty="nome"></html:options>
                                </html:select>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td align="center"><b>8º ano</b></td>
                            <td>
                                <html:select name="DisciplinaProfessorForm" property="idProf8ano" styleClass="form-control form-control-sm">
                                    <html:option value="0">Selecione</html:option>
                                    <html:options collection="listaProfessor" property="idPF" labelProperty="nome"></html:options>
                                </html:select>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td align="center"><b>9º ano</b></td>
                            <td>
                                <html:select name="DisciplinaProfessorForm" property="idProf9ano" styleClass="form-control form-control-sm">
                                    <html:option value="0">Selecione</html:option>
                                    <html:options collection="listaProfessor" property="idPF" labelProperty="nome"></html:options>
                                </html:select>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                    </logic:equal>
                    <logic:equal name="disciplinaForm" property="categoriaEnsino" value="EM">
                        <tr>
                            <td width="10%">&nbsp;</td>
                            <td width="15%" align="center"><b>1ª série</b></td>
                            <td>
                                <html:select name="DisciplinaProfessorForm" property="idProf1serie" styleClass="form-control form-control-sm">
                                    <html:option value="0">Selecione</html:option>
                                    <html:options collection="listaProfessor" property="idPF" labelProperty="nome"></html:options>
                                </html:select>
                            </td>
                            <td width="10%">&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td align="center"><b>2ª série</b></td>
                            <td>
                                <html:select name="DisciplinaProfessorForm" property="idProf2serie" styleClass="form-control form-control-sm">
                                    <html:option value="0">Selecione</html:option>
                                    <html:options collection="listaProfessor" property="idPF" labelProperty="nome"></html:options>
                                </html:select>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td align="center"><b>3ª série</b></td>
                            <td>
                                <html:select name="DisciplinaProfessorForm" property="idProf3serie" styleClass="form-control form-control-sm">
                                    <html:option value="0">Selecione</html:option>
                                    <html:options collection="listaProfessor" property="idPF" labelProperty="nome"></html:options>
                                </html:select>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                    </logic:equal>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td align="center">
                            <input class="btn btn-sm btn-success" type="button" value="Salvar" onClick="fSalvar();">
                        </td>
                        <td>&nbsp;</td>
                    </tr>

                </table>
            </div>

            <%--<jsp:include page="footer.jsp"/>--%>
        </html:form>
    </body>
</html>
<script language="javascript">
    function fSalvar() {
        document.DisciplinaProfessorForm.action = "DisciplinaProfessor.do?action=salvarProfessorDisciplina";
        document.DisciplinaProfessorForm.submit();

    }

    function fVoltar() {
        document.DisciplinaProfessorForm.action = "Disciplinas.do";
        document.DisciplinaProfessorForm.submit();
    }
</script>




