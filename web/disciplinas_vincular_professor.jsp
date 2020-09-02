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
        <html:form action="DisciplinaProfessor" name="DisciplinaProfessorForm" type="br.com.Form.DisciplinaProfessorForm" scope="request">
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
                    <bean:define id="disciplinaForm" name="DisciplinaProfessorForm" property="disciplinasForm"/>
                    <tr>
                        <td width="20%">
                            <div class="col-lg-12">
                                <label for="usr">Categoria de Ensino:</label>
                                <html:hidden name="disciplinaForm" property="categoriaEnsino"/>
                                <b><bean:write name="disciplinaForm" property="dsCategoriaEnsino"/></b>
                               <%-- <logic:equal name="disciplinaForm" property="categoriaEnsino" value="INF">
                                    <b>Educação Infantil</b>
                                </logic:equal>
                                <logic:equal name="disciplinaForm" property="categoriaEnsino" value="EF1">
                                    <b>Fundamental I</b>
                                </logic:equal>
                                <logic:equal name="disciplinaForm" property="categoriaEnsino" value="EF2">
                                    <b>Fundamental II</b>
                                </logic:equal>
                                <logic:equal name="disciplinaForm" property="categoriaEnsino" value="EM">
                                    <b>Ensino Médio</b>
                                </logic:equal> --%>
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
                                <html:select name="DisciplinaProfessorForm" property="idProfInfantilI" styleClass="form-control">
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
                                <html:select name="DisciplinaProfessorForm" property="idProfInfantilII" styleClass="form-control">
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
                                <html:select name="DisciplinaProfessorForm" property="idProfInfantilIII" styleClass="form-control">
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
                                <html:select name="DisciplinaProfessorForm" property="idProf1ano" styleClass="form-control">
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
                                <html:select name="DisciplinaProfessorForm" property="idProf2ano" styleClass="form-control">
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
                                <html:select name="DisciplinaProfessorForm" property="idProf3ano" styleClass="form-control">
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
                                <html:select name="DisciplinaProfessorForm" property="idProf4ano" styleClass="form-control">
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
                                <html:select name="DisciplinaProfessorForm" property="idProf5ano" styleClass="form-control">
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
                                <html:select name="DisciplinaProfessorForm" property="idProf6ano" styleClass="form-control">
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
                                <html:select name="DisciplinaProfessorForm" property="idProf7ano" styleClass="form-control">
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
                                <html:select name="DisciplinaProfessorForm" property="idProf8ano" styleClass="form-control">
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
                                <html:select name="DisciplinaProfessorForm" property="idProf9ano" styleClass="form-control">
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
                                <html:select name="DisciplinaProfessorForm" property="idProf1serie" styleClass="form-control">
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
                                <html:select name="DisciplinaProfessorForm" property="idProf2serie" styleClass="form-control">
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
                                <html:select name="DisciplinaProfessorForm" property="idProf3serie" styleClass="form-control">
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
                            <input class="btn btn-green" type="button" value="Salvar" onClick="fSalvar();">
                        </td>
                        <td>&nbsp;</td>
                    </tr>

                    <%--<logic:present name="listaSerieAno" scope="session">
                        <logic:iterate name="listaSerieAno" id="listaSerie" scope="session">
                            <tr>
                                <td width="15%" align="center">
                                    <html:hidden name="listaSerie" property="serieAno"/>
                                    <html:hidden name="listaSerie" property="dsSerieAno"/>
                                    <b><bean:write name="listaSerie" property="dsSerieAno"/></b>
                                </td>
                                <td>
                                    <html:select name="DisciplinaProfessorForm" property="idProfessor" styleId="idProfessor" styleClass="form-control">
                                        <html:option value="">Selecione</html:option>
                                        <html:options collection="listaProfessor" property="idPF" labelProperty="nome"></html:options>
                                    </html:select>
                                </td>
                                <td>
                                    <input class="btn btn-green" type="button" value="Salvar" onClick="fSalvar(<bean:write name="listaSerie" property="serieAno"/>);">
                                </td>
                            </tr>
                        </logic:iterate>
                    </logic:present>--%>

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




