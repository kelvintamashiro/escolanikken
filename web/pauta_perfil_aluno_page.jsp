<%-- 
    Document   : pauta_perfil_aluno_page
    Created on : 14 de jul de 2021, 20:51:22
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
                        <a href="gerenciador_pauta.jsp"><img src="imagens/bt_voltar_2.png" width="100px"/></a>
                    </td>
                    <td width="80%" align="center">
                        <h2>Perfil do Aluno para Pauta de Reunião</h2>
                    </td>
                    <td width="10%">&nbsp;</td>
                </tr>
            </table>

            <div class="form-group">
                <table border="0" align="center" style="margin-top: 20px;" width="90%">
                    <tr>
                        <!--1 coluna-->
                        <td width="45%">
                            <table width="100%">
                                <tr>
                                    <td colspan="2">
                                        <div class="col-lg-12">
                                            <label for="usr">Série/Ano:</label>
                                            <html:select name="PautaForm" property="idSerieAno" styleId="idSerieAno" styleClass="form-control">
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
                                            <html:select name="PautaForm" property="nrBimestre" styleId="nrBimestre" styleClass="form-control" onchange="fCarregarAlunos()">
                                                <html:option value="0">Selecione</html:option>
                                                <html:option value="1">1º Bimestre</html:option>
                                                <html:option value="2">2º Bimestre</html:option>
                                                <html:option value="3">3º Bimestre</html:option>
                                                <html:option value="4">4º Bimestre</html:option>
                                            </html:select>
                                        </div>
                                    </td>
                                </tr>
                                <logic:present name="listaAlunos" scope="session">
                                    <tr>
                                        <td colspan="2">
                                            <div class="col-lg-12">
                                                <label for="usr">Aluno:</label>

                                                <html:select name="PautaForm" property="idAluno" styleId="idAluno" styleClass="form-control">
                                                    <html:option value="0">Selecione</html:option>
                                                    <html:options collection="listaAlunos" property="idAluno" labelProperty="nome"></html:options>
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


                                </logic:present>
                                <tr>
                                    <td>
                                        <div class="col-lg-12">
                                            <label for="usr">&nbsp;</label>
                                            <input class="btn btn-green" type="button" value="Salvar" onClick="fSalvar()">
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </td>

                        <!--2 coluna-->
                        <td valign="top" style="background-color: #FFFFE0" width="55%">
                            <table width="95%" border="0" style="font-size: 10px" align="center">
                                <tr>
                                    <td align="center" style="color: #4169E1; padding-top: 20px; font-size: 14px" colspan="6">
                                        <strong>Alunos já Cadastrados</strong>
                                        <hr/>
                                    </td>
                                </tr>
                                <logic:present name="listaAlunosJaCadastrado" scope="session">
                                    <tr>
                                        <td><strong>Aluno</strong></td>
                                        <td><strong>Professor</strong></td>
                                        <td><strong>Bimestre</strong></td>
                                        <td><strong>Ano</strong></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <logic:iterate name="listaAlunosJaCadastrado" id="listaCadastrado" scope="session">
                                        <tr>
                                            <td><bean:write name="listaCadastrado" property="nomeAluno"/></td>
                                            <td><bean:write name="listaCadastrado" property="nomeProfessor"/></td>
                                            <td><bean:write name="listaCadastrado" property="nrBimestre"/>º Bimestre</td>
                                            <td><bean:write name="listaCadastrado" property="ano"/></td>
                                            <td style="padding: 2px"><input style="font-size: 10px" class="btn btn-info" type="button" value="Editar" onClick="fVisualizar(<bean:write name="listaCadastrado" property="idPautaObsAluno"/>)"></td>
                                            <td style="padding: 2px"><input style="font-size: 10px; color: white" class="btn btn-danger" type="button" value="Excluir" onClick="fExcluir(<bean:write name="listaCadastrado" property="idPautaObsAluno"/>)"></td>
                                        </tr>
                                    </logic:iterate>
                                </logic:present>
                            </table>
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
    function fCarregarAlunos() {
        document.PautaForm.action = "Pauta.do?action=carregarAlunosPorSerie";
        document.PautaForm.target = "_self";
        document.PautaForm.submit();
    }

    function fSalvar() {
        var idAluno = document.PautaForm.idAluno.value;
        if (idAluno === "0") {
            alert("Deve ser informado o Aluno(a) corretamente!!");
        } else {
            document.PautaForm.action = "Pauta.do?action=salvarPerfilAluno";
            document.PautaForm.target = "_self";
            document.PautaForm.submit();
        }
    }

    function fVisualizar(idPautaObsAluno) {
        document.PautaForm.action = "Pauta.do?action=visualizarPerfilAluno&idPautaObsAluno=" + idPautaObsAluno;
        document.PautaForm.target = "_blank";
        document.PautaForm.submit();
    }

    function fExcluir(idPautaObsAluno) {
        if (confirm("Deseja realmente excluir??")) {
            document.PautaForm.action = "Pauta.do?action=excluirPerfilAluno&idPautaObsAluno=" + idPautaObsAluno;
            document.PautaForm.target = "_self";
            document.PautaForm.submit();
        }
    }

</script>


