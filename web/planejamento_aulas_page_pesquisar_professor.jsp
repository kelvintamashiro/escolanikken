<%-- 
    Document   : planejamento_aulas_page_pesquisar_professor
    Created on : 09/09/2020, 22:23:08
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
                    <a href="tela_interativa.jsp"><img src="imagens/bt_voltar_2.png" width="100px"/></a>
                </div>
                <div class="col-sm-10" align="center">
                    <h2>Planejamento de Aulas Por Professor</h2>
                </div>
                <div class="col-sm-1">&nbsp;</div>
            </div>
        </div>
        <html:form action="PlanejamentoAulas" name="PlanejamentoAulasForm" type="br.com.Form.PlanejamentoAulasForm" scope="request">

            <div class="form-group">
                <table border="0" align="center" style="margin-top: 20px;" width="30%">
                    <tr>
                        <td>
                            <div class="col-lg-12">
                                <label for="usr">Professor:</label>
                                <logic:equal name="tipoPerfil" scope="session" value="diretoria">
                                    <html:select name="PlanejamentoAulasForm" property="idProfessor" styleId="idProfessor" styleClass="form-control form-control-sm">
                                        <html:option value="">Selecione</html:option>
                                        <html:options collection="listaProfessores" property="idPF" labelProperty="nome"></html:options>
                                    </html:select>    
                                </logic:equal>
                                <logic:equal name="tipoPerfil" scope="session" value="coordenacao">
                                    <html:select name="PlanejamentoAulasForm" property="idProfessor" styleId="idProfessor" styleClass="form-control form-control-sm">
                                        <html:option value="">Selecione</html:option>
                                        <html:options collection="listaProfessores" property="idPF" labelProperty="nome"></html:options>
                                    </html:select>    
                                </logic:equal>
                                <logic:equal name="tipoPerfil" scope="session" value="professor">
                                    <html:hidden name="PlanejamentoAulasForm" property="idProfessor"/>
                                    <html:select name="PlanejamentoAulasForm" property="idProfessor" styleId="idProfessor" styleClass="form-control form-control-sm" disabled="true">
                                        <html:options collection="listaProfessores" property="idPF" labelProperty="nome"></html:options>
                                    </html:select>
                                </logic:equal>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="col-lg-12">
                                <label for="usr">Série/Ano:</label>
                                <html:select name="PlanejamentoAulasForm" property="idSerieAno" styleId="idSerieAno" styleClass="form-control form-control-sm" onchange="fCarregarDisciplina()">
                                    <html:option value="0">Todos</html:option>
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
                        <td>
                            <div class="col-lg-12">
                                <label for="usr">Disciplina:</label>
                                <logic:present name="listaDisciplinaPorProfessor" scope="request">
                                    <html:select name="PlanejamentoAulasForm" property="idDisciplina" styleId="idDisciplina" styleClass="form-control form-control-sm">
                                        <html:option value="0">Selecione</html:option>
                                        <html:options collection="listaDisciplinaPorProfessor" property="idDisciplina" labelProperty="nomeDisciplina"></html:options>
                                    </html:select>
                                </logic:present>
                                <logic:notPresent name="listaDisciplinaPorProfessor" scope="request">
                                    <html:select name="PlanejamentoAulasForm" property="idDisciplina" styleId="idDisciplina" styleClass="form-control form-control-sm">
                                        <html:option value="0">Selecione a Série/Ano Corretamente</html:option>
                                    </html:select>
                                </logic:notPresent>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="col-lg-12">
                                <label for="usr">Bimestre:</label>
                                <html:select name="PlanejamentoAulasForm" property="nrBimestre" styleId="nrBimestre" styleClass="form-control form-control-sm">
                                    <html:option value="0">Todos</html:option>
                                    <html:option value="1">1º Bimestre</html:option>
                                    <html:option value="2">2º Bimestre</html:option>
                                    <html:option value="3">3º Bimestre</html:option>
                                    <html:option value="4">4º Bimestre</html:option>
                                </html:select>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="col-lg-12">
                                <label for="usr">Ano:</label>
                                <html:select name="PlanejamentoAulasForm" property="anoVigente" styleId="anoVigente" styleClass="form-control form-control-sm">
                                    <html:option value="2023">2023</html:option>
                                    <html:option value="2022">2022</html:option>
                                    <html:option value="2021">2021</html:option>
                                    <html:option value="2020">2020</html:option>
                                </html:select>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="col-lg-12">
                                <label for="usr">&nbsp;</label><br/>
                                <input class="btn btn-sm btn-success" type="button" value="Pesquisar" onClick="fPesquisar()">
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </html:form>
    </body>


    <script language="javascript">
        function fCarregarDisciplina() {
            var idSerieAno = document.PlanejamentoAulasForm.idSerieAno.value;
            document.PlanejamentoAulasForm.action = "PlanejamentoAulas.do?action=carregarDisciplinaPorProfessorSerie&idSerieAno=" + idSerieAno;
            document.PlanejamentoAulasForm.submit();
        }

        function fPesquisar() {
//            var idProfessor = document.PlanejamentoAulasForm.idProfessor.value;
            var idProfessor = document.getElementById("idProfessor").value;
            if (idProfessor === "") {
                alert("Deve ser informado o(a) Professor(a)!!");
                document.getElementById("idProfessor").focus();
            } else {
                document.PlanejamentoAulasForm.action = "PlanejamentoAulas.do?action=pesquisarProfessorBimestre";
                document.PlanejamentoAulasForm.submit();
            }
        }

    </script>

</html>
