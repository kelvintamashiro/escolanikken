<%-- 
    Document   : lista_presenca
    Created on : 8/jan/2021, 21:57:13
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
        <title>Escola Nikken - Lista de Presença</title>
        <link rel="shortcut icon" href="imagens/favico.png" />
        <!--        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
                <script language="javascript1.2" src="js/mizanscene.js"></script>
                <script type="text/javascript" src="js/JQuery/js/jquery-1.3.2.js"></script>
                <link rel="stylesheet" media="all" type="text/css" href="assets/css/fix.css" />
                <link rel="stylesheet" media="all" type="text/css" href="assets/css/style.css" />-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
        <style>
            body {
                margin:0;
                padding:0;
            }
        </style>

        <script>
            function inverte() {
                var checks = document.getElementsByTagName("input");
                for (var i = 0; i < checks.length; i++) {
                    var check = checks[i];
                    if (check.type == "checkbox") {
                        check.checked = !check.checked;
                    }
                }
            }

            $(document).ready(function () {
                $(".close").click(function () {
                    $("#myAlert").alert("close");
                });
            });
        </script>
    </head>
    <body style="padding-bottom: 150px">
        <logic:present name="errors">
            <script>
                alert('<bean:write name="errors"/>');
            </script>
        </logic:present>
        <html:form action="ListaPresenca" name="ListaPresencaForm" type="br.com.Form.ListaPresencaForm" scope="request">
            <jsp:include page="topo.jsp"/>
            <div class="container-fluid">
                <div class="row p-3" style="background-color: #F4F4F4" >
                    <div class="col-12 col-sm-1" align="center">
                        <a href="gerenciador_presenca.jsp"><img src="imagens/bt_voltar_2.png" width="100px"/></a>
                    </div>
                    <div class="col-sm-10" align="center">
                        <h1>Diário de Classe Online</h1>
                    </div>
                    <div class="col-sm-1">&nbsp;</div>
                </div>
            </div>


            <div class="form-group">
                <table border="0" align="center" style="margin-top: 20px;" width="80%">
                    <tr>
                        <td width="10%">&nbsp;</td>
                        <td>
                            <div class="col-lg-12">
                                <label for="usr">Série/Ano:</label>
                                <html:select name="ListaPresencaForm" property="idSerieAno" styleId="idSerieAno" styleClass="form-control form-control-sm" onchange="fCarregarDisciplina()">
                                    <html:option value="0">Selecione</html:option>
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
                                    <html:option value="10">1ª série E.M.</html:option>
                                    <html:option value="20">2ª série E.M.</html:option>
                                    <html:option value="30">3ª série E.M.</html:option>
                                </html:select>    
                            </div>
                        </td>
                        <logic:present name="listaDisciplinas" scope="session">
                            <td width="20%">
                                <label for="usr">Data:</label>
                                <logic:present name="data" scope="request">
                                    <input type="date" class="form-control form-control-sm" name="data" id="data" value='<bean:write name="data" scope="request"/>'>
                                </logic:present>
                                <logic:notPresent name="data" scope="request">
                                    <input type="date" class="form-control form-control-sm" name="data" id="data">
                                </logic:notPresent>
                            </td>
                            <td width="30%">
                                <label for="usr">Disciplina:</label>
                                <html:select name="ListaPresencaForm" property="idDisciplina" styleId="idDisciplina" styleClass="form-control form-control-sm">
                                    <html:option value="0">Selecione</html:option>
                                    <html:options collection="listaDisciplinas" property="idDisciplina" labelProperty="nomeDisciplina"></html:options>
                                </html:select>
                            </td>
                            <td width="10%">
                                <div class="col-lg-12">
                                    <label for="usr">&nbsp;</label><br/>
                                    <input class="btn btn-sm btn-success" type="button" value="Consultar" onClick="fPesquisar();">    
                                </div>
                            </td>
                        </logic:present>
                        <logic:notPresent name="listaDisciplinas" scope="session">
                            <td width="20%">
                                &nbsp;
                            </td>
                            <td width="30%">
                                &nbsp;
                            </td>
                            <td width="10%">
                                &nbsp;
                            </td>
                        </logic:notPresent>
                        <td width="10%">&nbsp;</td>
                    </tr>
                </table>
            </div>

            <logic:present name="listaAlunos" scope="session">
                <div class="form-group" style="background-color: #FFFFFF">
                    <table border="0" class="table-condensed" align="center" style="margin-top: 20px;" width="100%">
                        <tr style="background-color: #F0FFF0">
                            <td colspan="3" align="center">
                                <b style="font-size: 20px; border-bottom: 1px solid black">Lista de Chamada</b>
                            </td>
                        </tr>
                        <tr><td colspan="3" align="center">&nbsp;</td></tr>
                        <tr>
                            <td width="10%">&nbsp;</td>
                            <td>
                                Legenda: <img src="imagens/legenda_check.png" width="2%"/> Presente
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <img src="imagens/legenda_uncheck.png" width="2%"/> Ausente
                            </td>
                            <td width="10%">&nbsp;</td>
                        </tr>
                    </table>
                    <table border="1" class="table-condensed" align="center"  width="80%">
                        <tr style="background-color: #FFFFE0">
                            <td width="5%" align="center"><b>Nº</b></td>
                            <td width="5%" align="center">
                                <input type="button" class="botao" name="Submit" value="+ / -" onClick="inverte()">
                            </td>
                            <!--<td><b>ID do Aluno</b></td>-->
                            <td><b>Nome do Aluno</b></td>
                            <td><b>Série</b></td>
                        </tr>
                        <%int i = 1;%>
                        <logic:iterate name="listaAlunos" id="lista" scope="session">
                            <tr>
                                <td width="5%" align="center"><%=i++%></td>
                                <td width="5%" align="center">
                                    <html:multibox name="ListaPresencaForm" property="selectedOptions"> 
                                        <bean:write name="lista" property="idAluno"/> 
                                    </html:multibox>
                                </td>
                                <!--<td><bean:write name="lista" property="idAluno"/></td>-->
                                <td><bean:write name="lista" property="nomeAluno"/></td>
                                <td><bean:write name="lista" property="dsSerieAno"/></td>

                            </tr>
                        </logic:iterate>
                    </table>
                </div>

                <div class="form-group">
                    <bean:define id="PlanejamentoAulasForm" name="ListaPresencaForm" property="planejamentoAulasForm"/>
                    <html:hidden name="PlanejamentoAulasForm" property="idPlanejamento"/>
                    <table border="0" class="table-condensed" align="center" style="margin-top: 20px;" width="100%">
                        <tr><td colspan="3" align="center">&nbsp;</td></tr>
                        <tr style="background-color: #F0FFF0">
                            <td colspan="3" align="center">
                                <b style="font-size: 20px; border-bottom: 1px solid black">Plano de Aula Programado</b>
                            </td>
                        </tr>
                        <tr><td colspan="3" align="center">&nbsp;</td></tr>
                        <tr>
                            <td width="10%">&nbsp;</td>
                            <td>
                                <label for="usr">Bimestre:</label>
                                <html:select name="PlanejamentoAulasForm" property="nrBimestre" styleId="nrBimestre" styleClass="form-control form-control-sm">
                                    <html:option value="1">1º Bimestre</html:option>
                                    <html:option value="2">2º Bimestre</html:option>
                                    <html:option value="3">3º Bimestre</html:option>
                                    <html:option value="4">4º Bimestre</html:option>
                                </html:select>
                            </td>
                            <td width="10%">&nbsp;</td>
                        </tr>
                        <tr>
                            <td width="10%">&nbsp;</td>
                            <td>
                                <label for="usr">Conteúdo da Aula:</label>
                                <html:textarea name="PlanejamentoAulasForm" property="conteudoAula" styleId="conteudoAula" styleClass="form-control form-control-sm" rows="5"/>
                            </td>
                            <td width="10%">&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>
                                <label for="usr">Tarefas:</label>
                                <html:text name="PlanejamentoAulasForm" property="tarefa" styleId="tarefa" styleClass="form-control form-control-sm"/>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>
                                <label for="usr">Observação:</label>
                                <html:textarea name="PlanejamentoAulasForm" property="observacao" styleId="observacao" styleClass="form-control form-control-sm" rows="5"/>
                            </td>
                            <td>&nbsp;</td>
                        </tr>

                        <tr>
                            <td>&nbsp;</td>
                            <td>
                                <label for="usr">Quantidade de Aulas:</label>
                                <input type="number" class="form-control form-control-sm" name="qtdAulas" id="qtdAulas"/>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>
                                <input class="btn btn-sm btn-primary" type="button" value="Salvar Diário Online" onClick="fSalvar();">    
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                </div>
                <br/><br/><br/><br/><br/><br/><br/>
            </logic:present>
            <logic:notPresent name="listaAlunos" scope="request">
                <br/><br/><br/><br/><br/><br/><br/>
            </logic:notPresent>


            <%--<jsp:include page="footer.jsp"/>--%>
        </html:form>
    </body>
</html>
<script language="javascript">

    function fPesquisar() {
        var data = document.getElementById("data").value;
        var idDisciplina = document.getElementById("idDisciplina").value;
        if (data === "") {
            alert("Deve ser informado a Data corretamente");
            document.getElementById("data").focus();
        } else if (idDisciplina === "0") {
            alert("Deve ser informado a Disciplina corretamente");
            document.getElementById("idDisciplina").focus();
        } else {
            document.ListaPresencaForm.action = "ListaPresenca.do?action=pesquisar";
            document.ListaPresencaForm.submit();
        }
    }

    function fCarregarDisciplina() {
        document.ListaPresencaForm.action = "ListaPresenca.do?action=carregarDisciplinaCadastro";
        document.ListaPresencaForm.submit();
    }

    function fSalvar() {
        var data = document.getElementById("data").value;
        var idDisciplina = document.getElementById("idDisciplina").value;
        var qtdAulas = document.getElementById("qtdAulas").value;

        if (data === "") {
            alert("Deve ser informado a Data corretamente");
            document.getElementById("data").focus();
        } else if (idDisciplina === "0") {
            alert("Deve ser informado a Disciplina corretamente");
            document.getElementById("idDisciplina").focus();
        } else if (qtdAulas === "" || qtdAulas === 0) {
            alert("Deve ser informado a Quantidade de Aulas corretamente");
            document.getElementById("qtdAulas").focus();
        } else {
            document.ListaPresencaForm.action = "ListaPresenca.do?action=salvarPresenca";
            document.ListaPresencaForm.submit();
        }
    }
</script>




