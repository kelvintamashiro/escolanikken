<%-- 
    Document   : planejamento_oficina
    Created on : 08/10/2020, 21:53:28
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
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <script language="javascript1.2" src="js/mizanscene.js"></script>
        <script type="text/javascript" src="js/JQuery/js/jquery-1.3.2.js"></script>

        <link rel="stylesheet" media="all" type="text/css" href="assets/css/fix.css" />
        <link rel="stylesheet" media="all" type="text/css" href="assets/css/style_original.css" />
        <link rel="stylesheet" media="all" type="text/css" href="assets/css/mobile.css" />

        <!--Ajax-->
        <script type="text/javascript" src="js/ajax.js"></script>

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
        <html:form action="PlanejamentoOficinas" name="PlanejamentoOficinasForm" type="br.com.Form.PlanejamentoOficinasForm" scope="request">

            <table border="0" align="center" style="margin-top: 20px; background-color: #F0FFFF" width="100%">
                <tr>
                    <td width="10%" style="padding-left: 50px">
                        <a href="tela_interativa.jsp"><img src="imagens/bt_voltar_2.png" width="100px"/></a>
                    </td>
                    <td width="80%" align="center">
                        <h1>Planejamento de Oficinas</h1>
                    </td>
                    <td width="10%">&nbsp;</td>
                </tr>
            </table>
            <div class="form-group">
                <html:hidden name="PlanejamentoOficinasForm" property="idProfessor"/>
                <table border="0" class="table-condensed" align="center" style="margin-top: 20px;" width="60%">
                    <tr>
                        <td valign="top" width="20%"> <!-- coluna 1 -->
                            <table width="100%" border="0">
                                <tr>
                                    <td>
                                        <label for="usr">Série/Ano:</label>
                                    </td>
                                </tr>
                                <logic:iterate name="listaSerieAno" id="lista" scope="session">
                                    <tr>
                                        <td width="90%" valign="top" colspan="2">
                                            <html:multibox name="PlanejamentoOficinasForm" property="selectedOptions"> 
                                                <bean:write name="lista" property="serieAno"/> 
                                            </html:multibox>
                                            <bean:write name="lista" property="dsSerieAno"/>
                                        </td>
                                    </tr>
                                </logic:iterate>
                                <tr>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="button" class="btn btn-info" name="Submit" value="+ / -" onClick="inverte()">
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td valign="top"> <!-- coluna 3 -->
                            <table width="100%" class="table-condensed" border="0">
                                <tr>
                                    <td width="50%">
                                        <label for="usr">Data:</label>
                                        <input type="date" class="form-control" name="data" id="data" maxlength="10" onkeypress="mascaraData(this)">
                                    </td>
                                    <td width="50%">
                                        <label for="usr">Bimestre:</label>
                                        <html:select name="PlanejamentoOficinasForm" property="nrBimestre" styleId="nrBimestre" styleClass="form-control">
                                            <html:option value="1">1º Bimestre</html:option>
                                            <html:option value="2">2º Bimestre</html:option>
                                            <html:option value="3">3º Bimestre</html:option>
                                            <html:option value="4">4º Bimestre</html:option>
                                        </html:select>
                                    </td>
                                </tr>

                                <tr>
                                    <td colspan="2">
                                        <label for="usr">Nome da Oficina:</label>
                                        <html:text name="PlanejamentoOficinasForm" property="nomeOficina" styleId="nomeOficina" styleClass="form-control"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <label for="usr">Conteúdo da Oficina:</label>
                                        <html:textarea name="PlanejamentoOficinasForm" property="conteudo" styleId="conteudo" styleClass="form-control" rows="8"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <label for="usr">Observação:</label>
                                        <html:textarea name="PlanejamentoOficinasForm" property="observacao" styleId="observacao" styleClass="form-control" rows="8"/>
                                    </td>
                                </tr>

                                <tr>
                                    <td align="center" colspan="2">
                                        <input class="btn btn-green" type="button" value="Salvar" onClick="fSalvar();">
                                    </td>
                                    <!--                                    <td align="center">
                                                                            <input class="btn btn-grey" type="button" value="Pesquisar" onClick="fPesquisar();">
                                                                        </td>-->
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>

            </div>
        </html:form>
    </body>


    <script language="javascript">
        function fCarregarSerie() {
            var categoriaEnsino = document.PlanejamentoOficinasForm.categoriaEnsino.value;
            document.PlanejamentoOficinasForm.action = "PlanejamentoOficinas.do?action=carregarSerie&categoriaEnsino=" + categoriaEnsino + "&idPF=<bean:write name="PlanejamentoOficinasForm" property="idProfessor"/>";
            document.PlanejamentoOficinasForm.submit();
        }

        function fPesquisar() {
            document.PlanejamentoOficinasForm.action = "PlanejamentoOficinas.do?action=pagePesquisarPorProfessor&idPF=<bean:write name="PlanejamentoOficinasForm" property="idProfessor"/>";
            document.PlanejamentoOficinasForm.submit();
        }

        function fSalvar() {
            var data = document.getElementById("data").value;
            var nomeOficina = document.PlanejamentoOficinasForm.nomeOficina.value;
            var conteudo = document.PlanejamentoOficinasForm.conteudo.value;
            if (data === "") {
                alert("Deve ser informado a Data");
                document.getElementById("data").focus();
            } else if (nomeOficina === "") {
                alert("Deve ser informado o Nome da Oficina");
                document.getElementById("nomeOficina").focus();
            } else if (conteudo === "") {
                alert("Deve ser informado o Conteudo da Oficina");
                document.getElementById("conteudo").focus();
            } else {
                document.PlanejamentoOficinasForm.action = "PlanejamentoOficinas.do?action=salvar&idPF=<bean:write name="PlanejamentoOficinasForm" property="idProfessor"/>";
                document.PlanejamentoOficinasForm.submit();
            }

        }
    </script>

</html>
