<%-- 
    Document   : planejamento_aulas_editar
    Created on : 05/08/2020, 21:35:29
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
                    <a href="javascript:history.back()"><img src="imagens/bt_voltar_2.png" width="100px"/></a>
                </div>
                <div class="col-sm-10" align="center">
                    <h2>Planejamento de Aulas - Editar / Visualizar</h2>
                </div>
                <div class="col-sm-1">&nbsp;</div>
            </div>
        </div>
        <html:form action="PlanejamentoAulas" name="PlanejamentoAulasForm" type="br.com.Form.PlanejamentoAulasForm" scope="request">

            <div class="form-group">
                <html:hidden name="PlanejamentoAulasForm" property="idProfessor"/>
                <html:hidden name="PlanejamentoAulasForm" property="anoVigente"/>
                <table border="0" class="table-condensed" align="center" style="margin-top: 20px;" width="60%">
                    <tr>
                        <td width="33%">
                            <label for="usr">ID:</label>
                            <html:hidden name="PlanejamentoAulasForm" property="idPlanejamento"/>
                            <b><bean:write name="PlanejamentoAulasForm" property="idPlanejamento"/></b>
                        </td>
                        <td width="33%">
                            <label for="usr">Série/Ano:</label>
                            <b><bean:write name="PlanejamentoAulasForm" property="dsSerieAno"/></b>
                        </td>
                        <td width="33%">
                            <label for="usr">Disciplina</label>
                            <b><bean:write name="PlanejamentoAulasForm" property="nomeDisciplina"/></b>
                        </td>
                    </tr>
                </table>
                <table border="0" class="table-condensed" align="center" style="margin-top: 20px;" width="60%">
                    <tr>
                        <td width="50%">
                            <label for="usr">Data:</label>
                            <html:text name="PlanejamentoAulasForm" property="data" styleId="data" styleClass="form-control form-control-sm"/>
                        </td>
                        <td width="50%">
                            <label for="usr">Bimestre:</label>
                            <html:select name="PlanejamentoAulasForm" property="nrBimestre" styleId="nrBimestre" styleClass="form-control form-control-sm">
                                <html:option value="1">1º Bimestre</html:option>
                                <html:option value="2">2º Bimestre</html:option>
                                <html:option value="3">3º Bimestre</html:option>
                                <html:option value="4">4º Bimestre</html:option>
                            </html:select>
                        </td>
                    </tr>

                    <tr>

                    </tr>

                    <tr>
                        <td colspan="2">
                            <label for="usr">Conteúdo da Aula:</label>
                            <html:textarea name="PlanejamentoAulasForm" property="conteudoAula" styleId="conteudoAula" styleClass="form-control form-control-sm" rows="5"/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <label for="usr">Objetivo:</label>
                            <html:text name="PlanejamentoAulasForm" property="objetivo" styleId="objetivo" styleClass="form-control form-control-sm"/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <label for="usr">Tarefas:</label>
                            <html:text name="PlanejamentoAulasForm" property="tarefa" styleId="tarefa" styleClass="form-control form-control-sm"/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <label for="usr">Observação:</label>
                            <html:textarea name="PlanejamentoAulasForm" property="observacao" styleId="observacao" styleClass="form-control form-control-sm" rows="5"/>
                        </td>
                    </tr>

                    <tr>
                        <logic:equal name="tipoPerfil" scope="session" value="professor">
                            <td align="center" colspan="2">
                                <input class="btn btn-sm btn-success" type="button" value="Atualizar Planejamento" onClick="fAtualizar();">
                            </td>
                        </logic:equal>
                        <logic:equal name="tipoPerfil" scope="session" value="coordenacao">
                            <td align="center">
                                <input class="btn btn-sm btn-success" type="button" value="Atualizar Planejamento" onClick="fAtualizar();">
                            </td>
                            <td align="center">
                                <input class="btn btn-sm btn-primary" type="button" value="Vistado Coordenação/Diretoria" style="color: white" onClick="fVistado();">
                            </td>
                        </logic:equal>
                        <logic:equal name="tipoPerfil" scope="session" value="diretoria">
                            <td align="center">
                                <input class="btn btn-sm btn-success" type="button" value="Atualizar Planejamento" onClick="fAtualizar();">
                            </td>
                            <td align="center">
                                <input class="btn btn-sm btn-primary" type="button" value="Vistado Coordenação/Diretoria" style="color: white" onClick="fVistado();">
                            </td>
                        </logic:equal>
                    </tr>
                </table>
            </div>
        </html:form>
    </body>


    <script language="javascript">
        function fAtualizar() {
            var data = document.getElementById("data").value;
            if (data === "") {
                alert("Deve ser informado a Data");
                document.getElementById("data").focus();
            } else {
                document.PlanejamentoAulasForm.action = "PlanejamentoAulas.do?action=atualizar";
                document.PlanejamentoAulasForm.submit();
            }
        }

        function fVistado() {
            var data = document.getElementById("data").value;
            if (data === "") {
                alert("Deve ser informado a Data");
                document.getElementById("data").focus();
            } else {
                document.PlanejamentoAulasForm.action = "PlanejamentoAulas.do?action=vistadoDiretoria";
                document.PlanejamentoAulasForm.submit();
            }
        }
    </script>

</html>
