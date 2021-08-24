<%-- 
    Document   : pauta_perfil_aluno_visualizar
    Created on : 15 de jul de 2021, 21:47:20
    Author     : macuser
--%>


<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<!DOCTYPE html>
<html lang="pt-br" class="js-disabled">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Escola Nikken</title>
        <link rel="shortcut icon" href="imagens/favico.png" />
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <script language="javascript1.2" src="js/mizanscene.js"></script>
        <script type="text/javascript" src="js/JQuery/js/jquery-1.3.2.js"></script>

        <link rel="stylesheet" media="all" type="text/css" href="assets/css/fix.css" />
        <link rel="stylesheet" media="all" type="text/css" href="assets/css/style_original.css" />
        <link rel="stylesheet" media="all" type="text/css" href="assets/css/mobile.css" />

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
        <jsp:include page="topo.jsp"/>
        <html:form action="Pauta" name="PautaForm" type="br.com.Form.PautaForm" scope="request">

            <table border="0" align="center" style="margin-top: 20px; background-color: #ADD8E6" width="100%">
                <tr>
                    <td width="10%" style="padding-left: 50px">
                        <a href="javascript:window.close()"><img src="imagens/bt_voltar_2.png" width="100px"/></a>
                    </td>
                    <td width="80%" align="center">
                        <h2>Perfil do Aluno para Pauta de Reunião</h2>
                    </td>
                    <td width="10%">&nbsp;</td>
                </tr>
            </table>

            <div class="form-group">
                <table border="0" align="center" style="margin-top: 20px;" width="80%">
                    <html:hidden name="PautaForm" property="idPautaObsAluno"/>
                    <tr>
                        <td colspan="2">
                            <div class="col-lg-12">
                                <label for="usr">Aluno:</label>
                                <bean:write name="PautaForm" property="nomeAluno"/>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <div class="col-lg-12">
                                <label for="usr">Professor:</label>
                                <bean:write name="PautaForm" property="nomeProfessor"/>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <div class="col-lg-12">
                                <label for="usr">Série/Ano:</label>
                                <html:select name="PautaForm" property="idSerieAno" styleId="idSerieAno" styleClass="form-control" disabled="true">
                                    <html:option value="">Selecione Série/Ano</html:option>
                                    <html:option value="11">Infantil I</html:option>
                                    <html:option value="12">Infantil II</html:option>
                                    <html:option value="13">Infantil III</html:option>
                                    <html:option value="1">1º ano</html:option>
                                    <html:option value="2">2º ano</html:option>
                                    <html:option value="3">3º ano</html:option>
                                    <html:option value="4">4º ano</html:option>
                                    <html:option value="5">5º ano</html:option>
                                    <html:option value="6">6º ano</html:option>
                                    <html:option value="7">7º ano</html:option>
                                    <html:option value="8">8º ano</html:option>
                                    <html:option value="9">9º ano</html:option>
                                    <html:option value="10">1ª série</html:option>
                                    <html:option value="20">2ª série</html:option>
                                    <html:option value="30">3ª série</html:option>
                                </html:select>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <div class="col-lg-12">
                                <label for="usr">Bimestre:</label>
                                <html:select name="PautaForm" property="nrBimestre" styleId="nrBimestre" styleClass="form-control">
                                    <html:option value="1">1º Bimestre</html:option>
                                    <html:option value="2">2º Bimestre</html:option>
                                    <html:option value="3">3º Bimestre</html:option>
                                    <html:option value="4">4º Bimestre</html:option>
                                </html:select>
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td colspan="2">
                            <div class="col-lg-12">
                                <label for="usr">Qualidades:</label>
                                <html:text name="PautaForm" property="obsQualidade" styleId="obsQualidade" styleClass="form-control" maxlength="250"/>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <div class="col-lg-12">
                                <label for="usr">Participação na aula:</label>
                                <html:text name="PautaForm" property="obsParticipacaoAula" styleId="obsParticipacaoAula" styleClass="form-control" maxlength="250"/>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <div class="col-lg-12">
                                <label for="usr">Realização das tarefas:</label>
                                <html:text name="PautaForm" property="obsRealizacaoTarefa" styleId="obsRealizacaoTarefa" styleClass="form-control" maxlength="250"/>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <div class="col-lg-12">
                                <label for="usr">Comportamento em sala:</label>
                                <html:text name="PautaForm" property="obsComportamento" styleId="obsComportamento" styleClass="form-control" maxlength="250"/>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <div class="col-lg-12">
                                <label for="usr">Relacionamento com seus colegas/professores/namoros:</label>
                                <html:text name="PautaForm" property="obsRelacionamento" styleId="obsRelacionamento" styleClass="form-control" maxlength="250"/>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <div class="col-lg-12">
                                <label for="usr">Dificuldades específicas do aluno:</label>
                                <html:text name="PautaForm" property="obsDificuldade" styleId="obsDificuldade" styleClass="form-control" maxlength="250"/>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <div class="col-lg-12">
                                <label for="usr">Precisa de reforço? (se precisar, informe a disciplina)</label>
                                <html:text name="PautaForm" property="obsPrecisaReforco" styleId="obsPrecisaReforco" styleClass="form-control" maxlength="250"/>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <div class="col-lg-12">
                                <label for="usr">Como o aluno está(estava) se comportando nos horários de Reforço:</label>
                                <html:text name="PautaForm" property="obsComportamentoReforco" styleId="obsComportamentoReforco" styleClass="form-control" maxlength="250"/>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <div class="col-lg-12">
                                <label for="usr">Dicas dos professores para o aluno melhorar:</label>
                                <html:text name="PautaForm" property="obsDicaProfessor" styleId="obsDicaProfessor" styleClass="form-control" maxlength="250"/>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <div class="col-lg-12">
                                <label for="usr">Outros assuntos (sobre a sala de aula ou desempenho do aluno): </label>
                                <html:text name="PautaForm" property="obsOutroAssunto" styleId="obsOutroAssunto" styleClass="form-control" maxlength="250"/>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="col-lg-12">
                                <label for="usr">&nbsp;</label>
                                <input class="btn btn-green" type="button" value="Atualizar" onClick="fAtualizar()">
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
            <logic:equal name="salvo" value="true">
                <div class="alert alert-info" id="myAlert" style="text-align: center">
                    <b><bean:write name="errors"/></b>
                </div>
            </logic:equal>
            <logic:equal name="salvo" value="false">
                <div class="alert alert-danger alert-dismissible" id="myAlert" style="text-align: center">
                    <b><bean:write name="errors"/></b>
                </div>
            </logic:equal>
        </html:form>
    </body>
</html>
<script language="javascript">
    function fAtualizar() {
        document.PautaForm.action = "Pauta.do?action=atualizarPerfilAluno";
        document.PautaForm.target = "_self";
        document.PautaForm.submit();
    }

</script>


