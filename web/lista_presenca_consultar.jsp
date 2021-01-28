<%-- 
    Document   : lista_presenca_page_consultar
    Created on : 12/jan/2021, 22:24:08
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

            <table border="0" align="center" style="margin-top: 20px; background-color: #ADD8E6" width="100%">
                <tr>
                    <td width="10%" style="padding-left: 50px">
                        <a href="gerenciador_presenca.jsp"><img src="imagens/bt_voltar_2.png" width="100px"/></a>
                    </td>
                    <td width="80%" align="center">
                        <h1>Lista de Presença</h1>
                    </td>
                    <td width="10%">&nbsp;</td>
                </tr>
            </table>
            <div class="form-group">
                <table border="0" align="center" style="margin-top: 20px;" width="80%">
                    <tr>
                        <td width="10%">&nbsp;</td>
                        <td>
                            <div class="col-lg-12">
                                <label for="usr">Série/Ano:</label>
                                <html:select name="ListaPresencaForm" property="idSerieAno" styleId="idSerieAno" styleClass="form-control" onchange="fCarregarDisciplina()">
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
                                    <input type="date" class="form-control" name="data" id="data" value='<bean:write name="data" scope="request"/>'>
                                </logic:present>
                                <logic:notPresent name="data" scope="request">
                                    <input type="date" class="form-control" name="data" id="data">
                                </logic:notPresent>
                            </td>
                            <td width="30%">
                                <label for="usr">Disciplina:</label>
                                <html:select name="ListaPresencaForm" property="idDisciplina" styleId="idDisciplina" styleClass="form-control">
                                    <html:option value="0">Selecione</html:option>
                                    <html:options collection="listaDisciplinas" property="idDisciplina" labelProperty="nomeDisciplina"></html:options>
                                </html:select>
                            </td>
                            <td width="10%">
                                <div class="col-lg-12">
                                    <label for="usr">&nbsp;</label>
                                    <input class="btn btn-green" type="button" value="Consultar" onClick="fConsultar();">    
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

            <logic:present name="listaAlunosPresenca" scope="request">
                <div class="form-group">
                    <table border="1" class="table-condensed" align="center"  width="80%">
                        <tr style="background-color: #FFFFE0">
                            <td width="5%" align="center"><b><input type="button" class="botao" name="Submit" value="+ / -" onClick="inverte()"></b></td>
                            <td width="5%" align="center"><b>Nº</b></td>
                            <td width="5%" align="center"><b>Data</b></td>
                            <td align="center"><b>Presença</b></td>
                            <td align="center"><b>Qtd. Aula(s)</b></td>
                            <td align="center"><b>Qtd. Falta(s)</b></td>
                            <td><b>Nome do Aluno</b></td>
                            <td><b>Disciplina</b></td>
                            <td><b>Série</b></td>
                            <td>&nbsp;</td>
                        </tr>
                        <%int i = 1;%>
                        <logic:iterate name="listaAlunosPresenca" id="lista" scope="request">
                            <% String strCor = "";%>
                            <logic:equal name="lista" property="falta" value="S">
                                <%strCor = "bgColor=#FFE4E1";%>
                            </logic:equal>
                            <tr <%=strCor%>>
                                <td width="5%" align="center">
                                    <html:multibox name="ListaPresencaForm" property="selectedOptions"> 
                                        <bean:write name="lista" property="idPresenca"/> 
                                    </html:multibox>
                                </td>
                                <td width="5%" align="center"><%=i++%></td>
                                                                <!--<td><bean:write name="lista" property="idPresenca"/></td>-->
                                <td><bean:write name="lista" property="data"/></td>
                                <td align="center">
                                    <logic:equal name="lista" property="falta" value="N">Presente</logic:equal>
                                    <logic:equal name="lista" property="falta" value="S">Ausente</logic:equal>
                                    </td>
                                    <td align="center"><bean:write name="lista" property="qtdAulas"/></td>
                                <td align="center">
                                    <bean:write name="lista" property="qtdFalta"/>
                                </td>
                                <td><bean:write name="lista" property="nomeAluno"/></td>
                                <td><bean:write name="lista" property="dsDisciplina"/></td>
                                <td><bean:write name="lista" property="dsSerieAno"/></td>
                                <td>
                                    <input class="btn btn-green" type="button" value="Editar" onClick="fEditar(<bean:write name="lista" property="idPresenca"/>);">    
                                </td>
                            </tr>
                        </logic:iterate>
                        <tr>
                            <td colspan="2">
                                <input class="btn btn-danger" style="color: white" type="button" value="Excluir" onClick="fExcluir();">
                            </td>
                            <td colspan="8">
                                &nbsp;
                            </td>
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

    function fCarregarDisciplina() {
        document.ListaPresencaForm.action = "ListaPresenca.do?action=carregarDisciplina";
        document.ListaPresencaForm.submit();
    }

    function fConsultar() {
        document.ListaPresencaForm.action = "ListaPresenca.do?action=consultar";
        document.ListaPresencaForm.submit();
    }
    function fEditar(idPresenca) {
        document.ListaPresencaForm.action = "ListaPresenca.do?action=editarPresenca&idPresenca=" + idPresenca;
        document.ListaPresencaForm.submit();
    }
    function fExcluir() {
        if (confirm("Deseja Realmente Excluir essa Lista de Presença?")) {
            document.ListaPresencaForm.action = "ListaPresenca.do?action=excluirPresenca";
            document.ListaPresencaForm.submit();
        }
    }
//    function fExcluir(idPresenca) {
//        if (confirm("Deseja Realmente Excluir essa Presença Lançada?")) {
//            document.ListaPresencaForm.action = "ListaPresenca.do?action=excluirPresenca&idPresenca=" + idPresenca;
//            document.ListaPresencaForm.submit();
//        }
//    }
</script>




