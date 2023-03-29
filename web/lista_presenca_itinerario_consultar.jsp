<%-- 
    Document   : lista_presenca_itinerario_consultar
    Created on : 11 de mar de 2022, 17:00:52
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
        <title>Escola Nikken - Lista de Presença Itinerário</title>
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
        <html:form action="ListaPresencaItinerario" name="ListaPresencaItinerarioForm" type="br.com.Form.ListaPresencaItinerarioForm" scope="request">
            <jsp:include page="topo.jsp"/>
            <div class="container-fluid">
                <div class="row p-3" style="background-color: #F4F4F4" >
                    <div class="col-12 col-sm-1" align="center">
                        <a href="gerenciador_presenca.jsp"><img src="imagens/bt_voltar_2.png" width="100px"/></a>
                    </div>
                    <div class="col-sm-10" align="center">
                        <h1>Lista de Presença Itinerário</h1>
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
                                <html:select name="ListaPresencaItinerarioForm" property="idSerieAno" styleId="idSerieAno" styleClass="form-control form-control-sm" onchange="fCarregarItinerarios()">
                                    <html:option value="0">Selecione</html:option>
                                    <html:option value="10">1ª série E.M.</html:option>
                                    <html:option value="20">2ª série E.M.</html:option>
                                    <html:option value="30">3ª série E.M.</html:option>
                                </html:select>    
                            </div>
                        </td>
                        <logic:present name="listaItinerarios" scope="session">
                            <td width="10%">
                                <div class="col-lg-12">
                                    <label for="usr">Bimestre:</label>
                                    <html:select name="ListaPresencaItinerarioForm" property="nrBimestre" styleId="nrBimestre" styleClass="form-control form-control-sm">
                                        <html:option value="0">Selecione</html:option>
                                        <html:option value="1">1º Bimestre</html:option>
                                        <html:option value="2">2º Bimestre</html:option>
                                        <html:option value="3">3º Bimestre</html:option>
                                        <html:option value="4">4º Bimestre</html:option>
                                    </html:select>
                                </div>
                            </td>
                            <td width="20%">
                                <div class="col-lg-12">
                                    <label for="usr">Data:</label>
                                    <logic:present name="data" scope="request">
                                        <input type="date" class="form-control form-control-sm" name="data" id="data" value='<bean:write name="data" scope="request"/>'>
                                    </logic:present>
                                    <logic:notPresent name="data" scope="request">
                                        <input type="date" class="form-control form-control-sm" name="data" id="data">
                                    </logic:notPresent>
                                </div>
                            </td>
                            <td width="30%">
                                <div class="col-lg-12">
                                    <label for="usr">Itinerário:</label>
                                    <html:select name="ListaPresencaItinerarioForm" property="idItinerario" styleId="idItinerario" styleClass="form-control form-control-sm">
                                        <html:option value="0">Selecione</html:option>
                                        <html:options collection="listaItinerarios" property="idItinerario" labelProperty="nomeItinerario"></html:options>
                                    </html:select>
                                </div>
                            </td>
                            <td width="10%">
                                <div class="col-lg-12">
                                    <label for="usr">&nbsp;</label><br/>
                                    <input class="btn btn-sm btn-success" type="button" value="Consultar" onClick="fPesquisar();">    
                                </div>
                            </td>
                        </logic:present>
                        <logic:notPresent name="listaItinerarios" scope="session">
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
            <br/>
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
                            <td><b>Itinerário</b></td>
                            <td><b>Série</b></td>
                        </tr>
                        <%int i = 1;%>
                        <logic:iterate name="listaAlunosPresenca" id="lista" scope="request">
                            <% String strCor = "";%>
                            <logic:equal name="lista" property="falta" value="S">
                                <%strCor = "bgColor=#FFE4E1";%>
                            </logic:equal>
                            <tr <%=strCor%>>
                                <td width="5%" align="center">
                                    <html:multibox name="ListaPresencaItinerarioForm" property="selectedOptions"> 
                                        <bean:write name="lista" property="idPresencaItinerario"/> 
                                    </html:multibox>
                                </td>
                                <td width="5%" align="center"><%=i++%></td>
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
                                <td><bean:write name="lista" property="dsItinerario"/></td>
                                <td><bean:write name="lista" property="dsSerieAno"/></td>
                            </tr>
                        </logic:iterate>
                        <tr>
                            <td colspan="2">
                                <input class="btn btn-sm btn-danger" style="color: white" type="button" value="Excluir" onClick="fExcluir();">
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

    function fPesquisar() {
        var data = document.getElementById("data").value;
        var nrBimestre = document.getElementById("nrBimestre").value;
        var idItinerario = document.getElementById("idItinerario").value;
        if (data === "") {
            alert("Deve ser informado a Data corretamente");
            document.getElementById("data").focus();
        } else if (nrBimestre === "0") {
            alert("Deve ser informado o Bimestre corretamente");
            document.getElementById("nrBimestre").focus();
        } else if (idItinerario === "0") {
            alert("Deve ser informado o Itinerário corretamente");
            document.getElementById("idItinerario").focus();
        } else {
            document.ListaPresencaItinerarioForm.action = "ListaPresencaItinerario.do?action=consultar";
            document.ListaPresencaItinerarioForm.submit();
        }
    }

    function fCarregarItinerarios() {
        document.ListaPresencaItinerarioForm.action = "ListaPresencaItinerario.do?action=carregarItinerarioConsulta";
        document.ListaPresencaItinerarioForm.submit();
    }

    function fExcluir() {
        if (confirm("Deseja Realmente Excluir essa Lista de Presença?")) {
            document.ListaPresencaItinerarioForm.action = "ListaPresencaItinerario.do?action=excluirPresenca";
            document.ListaPresencaItinerarioForm.submit();
        }
    }

    function fSalvar() {
        var data = document.getElementById("data").value;
        var idItinerario = document.getElementById("idItinerario").value;
        var qtdAulas = document.getElementById("qtdAulas").value;

        if (data === "") {
            alert("Deve ser informado a Data corretamente");
            document.getElementById("data").focus();
        } else if (idItinerario === "0") {
            alert("Deve ser informado o Itinerario corretamente");
            document.getElementById("idItinerario").focus();
        } else if (qtdAulas === "" || qtdAulas === 0) {
            alert("Deve ser informado a Quantidade de Aulas corretamente");
            document.getElementById("qtdAulas").focus();
        } else {
            document.ListaPresencaItinerarioForm.action = "ListaPresencaItinerario.do?action=salvarPresenca";
            document.ListaPresencaItinerarioForm.submit();
        }
    }
</script>





