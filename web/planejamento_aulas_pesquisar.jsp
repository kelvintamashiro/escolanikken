<%-- 
    Document   : planejamento_aulas_pesquisar
    Created on : 05/08/2020, 20:41:39
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
        <title>Escola Nikken - Painel</title>
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
        <jsp:include page="topo.jsp"/>
        <div class="container-fluid">
            <div class="row p-3" style="background-color: #F4F4F4" >
                <div class="col-12 col-sm-1" align="center">
                    <a href="planejamento_aulas_page_coordenacao.jsp"><img src="imagens/bt_voltar_2.png" width="100px"/></a>
                </div>
                <div class="col-sm-10" align="center">
                    <h2>Planejamento de Aulas Cadastradas</h2>
                </div>
                <div class="col-sm-1">&nbsp;</div>
            </div>
        </div>
        <html:form action="PlanejamentoAulas" name="PlanejamentoAulasForm" type="br.com.Form.PlanejamentoAulasForm" scope="request">
            <html:hidden name="PlanejamentoAulasForm" property="idProfessor"/>

            <div class="form-group">
                <table border="0" class="table-condensed" align="center" style="margin-top: 20px;font-size: 11px" width="80%">
                    <logic:present name="listaPlanoAulas" scope="request">
                        <tr>
                            <td><b>Data</b></td>
                            <td><b>Disciplina</b></td>
                            <td><b>Professor</b></td>
                            <td><b>Série/Ano</b></td>
                            <td><b>Bimestre</b></td>
                            <td align="center"><b>Plano de Aula Vistado Diretoria/Coordenação</b></td>
                            <td align="center"><b>Plano de Aula Confirmado</b></td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <logic:iterate id="lista" name="listaPlanoAulas" scope="request">
                            <% String strCor = "bgColor=#F4F4F4";%>
                            <logic:equal name="lista" property="confirmar" value="1">
                                <%strCor = "bgColor=#FFFFE0";%>
                            </logic:equal>
                            <logic:equal name="lista" property="confirmar" value="0">
                                <% strCor = "bgColor=#FFFFFF";%>
                            </logic:equal>

                            <tr <%=strCor%>>
                                <td>
                                    <bean:write name="lista" property="data"/>
                                </td>
                                <td><bean:write name="lista" property="nomeDisciplina"/></td>
                                <td><bean:write name="lista" property="nomeProfessor"/></td>
                                <td>
                                    <logic:equal name="lista" property="idSerieAno" value="11">Infantil I</logic:equal>
                                    <logic:equal name="lista" property="idSerieAno" value="12">Infantil II</logic:equal>
                                    <logic:equal name="lista" property="idSerieAno" value="13">Infantil III</logic:equal>
                                    <logic:equal name="lista" property="idSerieAno" value="1">1º ano</logic:equal>
                                    <logic:equal name="lista" property="idSerieAno" value="2">2º ano</logic:equal>
                                    <logic:equal name="lista" property="idSerieAno" value="3">3º ano</logic:equal>
                                    <logic:equal name="lista" property="idSerieAno" value="4">4º ano</logic:equal>
                                    <logic:equal name="lista" property="idSerieAno" value="5">5º ano</logic:equal>
                                    <logic:equal name="lista" property="idSerieAno" value="6">6º ano</logic:equal>
                                    <logic:equal name="lista" property="idSerieAno" value="7">7º ano</logic:equal>
                                    <logic:equal name="lista" property="idSerieAno" value="8">8º ano</logic:equal>
                                    <logic:equal name="lista" property="idSerieAno" value="9">9º ano</logic:equal>
                                    <logic:equal name="lista" property="idSerieAno" value="10">1ª série E.M.</logic:equal>
                                    <logic:equal name="lista" property="idSerieAno" value="20">2ª série E.M.</logic:equal>
                                    <logic:equal name="lista" property="idSerieAno" value="30">3ª série E.M.</logic:equal>
                                    </td>
                                    <td><bean:write name="lista" property="nrBimestre"/>º Bimestre</td>
                                <logic:equal name="lista" property="vistado" value="0">
                                    <td align="center">
                                        <img src="imagens/warning.png" width="30px" alt="Plano de aula Não Vistado" title="Plano de aula Não Vistado"/>
                                    </td>
                                </logic:equal>
                                <logic:equal name="lista" property="vistado" value="1">
                                    <td align="center">
                                        <img src="imagens/check.png" width="30px" alt="Plano de aula Vistado" title="Plano de aula Vistado"/>
                                    </td>
                                </logic:equal>
                                <logic:equal name="lista" property="confirmar" value="1">
                                    <td align="center">
                                        <img src="imagens/check.png" width="30px" alt="Plano de aula Não Vistado" title="Plano de aula Confirmado"/>
                                    </td>
                                    <td>
                                        <input class="btn btn-sm btn-dark" type="button" value="Visualizar" onClick="fVisualizar(<bean:write name="lista" property="idPlanejamento"/>);">
                                    </td>
                                    <td colspan="2">&nbsp;</td>
                                </logic:equal>
                                <logic:equal name="lista" property="confirmar" value="0">
                                    <td align="center">
                                        <img src="imagens/warning.png" width="30px" alt="Plano de aula Não Vistado" title="Plano de aula Não Confirmado"/>
                                    </td>
                                    <td>
                                        <input class="btn btn-sm btn-success" type="button" value="Editar" onClick="fEditar(<bean:write name="lista" property="idPlanejamento"/>);">
                                    </td>
                                    <td>
                                        <input class="btn btn-sm btn-danger" type="button" value="Excluir" onClick="fExcluir(<bean:write name="lista" property="idPlanejamento"/>);">
                                    </td>
                                </logic:equal>



                            </tr>
                        </logic:iterate>
                    </logic:present>

                </table>
            </div>
        </html:form>
    </body>


    <script language="javascript">
        function fEditar(idPlanejamento) {
            document.PlanejamentoAulasForm.action = "PlanejamentoAulas.do?action=editar&idPlanejamento=" + idPlanejamento + "&idPF=<bean:write name="PlanejamentoAulasForm" property="idProfessor"/>";
            document.PlanejamentoAulasForm.target = "_self";
            document.PlanejamentoAulasForm.submit();
        }

        function fVisualizar(idPlanejamento) {
            document.PlanejamentoAulasForm.action = "PlanejamentoAulas.do?action=visualizar&idPlanejamento=" + idPlanejamento + "&idPF=<bean:write name="PlanejamentoAulasForm" property="idProfessor"/>";
            document.PlanejamentoAulasForm.target = "_blank";
            document.PlanejamentoAulasForm.submit();
        }

        function fConfirmar(idPlanejamento) {
            if (confirm("Você Confirma esse Planejamento??")) {
                document.PlanejamentoAulasForm.action = "PlanejamentoAulas.do?action=confirmar&idPlanejamento=" + idPlanejamento + "&idPF=<bean:write name="PlanejamentoAulasForm" property="idProfessor"/>";
                document.PlanejamentoAulasForm.target = "_self";
                document.PlanejamentoAulasForm.submit();
            }
        }

        function fExcluir(idPlanejamento) {
            if (confirm("Deseja Realmente EXCLUIR??")) {
                document.PlanejamentoAulasForm.action = "PlanejamentoAulas.do?action=excluir&idPlanejamento=" + idPlanejamento + "&idPF=<bean:write name="PlanejamentoAulasForm" property="idProfessor"/>";
                document.PlanejamentoAulasForm.target = "_self";
                document.PlanejamentoAulasForm.submit();
            }
        }

    </script>

</html>
