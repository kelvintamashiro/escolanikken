<%-- 
    Document   : planejamento_oficina_editar
    Created on : 14/10/2020, 19:53:52
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
        <div class="container-fluid">
            <div class="row p-3" style="background-color: #F4F4F4" >
                <div class="col-12 col-sm-1" align="center">
                    <a href="planejamento_oficina_page.jsp"><img src="imagens/bt_voltar_2.png" width="100px"/></a>
                </div>
                <div class="col-sm-10" align="center">
                    <h2>Planejamento de Oficinas - Editar</h2>
                </div>
                <div class="col-sm-1">&nbsp;</div>
            </div>
        </div>
        <html:form action="PlanejamentoOficinas" name="PlanejamentoOficinasForm" type="br.com.Form.PlanejamentoOficinasForm" scope="request">

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
                                        <input type="button" class="btn btn-sm btn-dark" name="Submit" value="+ / -" onClick="inverte()">
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td valign="top"> <!-- coluna 3 -->
                            <html:hidden name="PlanejamentoOficinasForm" property="idPlanejamento"/>
                            <table width="100%" class="table-condensed" border="0">
                                <tr>
                                    <td width="50%">
                                        <label for="usr">Data:</label>
                                        <html:text name="PlanejamentoOficinasForm" property="data" styleId="data" styleClass="form-control form-control-sm" size="15" maxlength="10" onkeyup="formatarData(this);" onkeypress="return(validarConteudo(event, 'numero'))" onfocus="show('data')" onblur="hide('data')"/>
                                        <!--<input type="text" class="form-control form-control-sm" name="data" id="data" maxlength="10" onkeypress="mascaraData(this)">-->
                                    </td>
                                    <td width="50%">
                                        <label for="usr">Bimestre:</label>
                                        <html:select name="PlanejamentoOficinasForm" property="nrBimestre" styleId="nrBimestre" styleClass="form-control form-control-sm">
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
                                        <html:text name="PlanejamentoOficinasForm" property="nomeOficina" styleId="nomeOficina" styleClass="form-control form-control-sm"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <label for="usr">Conteúdo da Oficina:</label>
                                        <html:textarea name="PlanejamentoOficinasForm" property="conteudo" styleId="conteudo" styleClass="form-control form-control-sm" rows="8"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <label for="usr">Observação:</label>
                                        <html:textarea name="PlanejamentoOficinasForm" property="observacao" styleId="observacao" styleClass="form-control form-control-sm" rows="8"/>
                                    </td>
                                </tr>

                                <tr>
                                    <td align="center" colspan="2">
                                        <input class="btn btn-sm btn-success" type="button" value="Atualizar" onClick="fAtualizar();">
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>

            </div>
        </html:form>
    </body>


    <script language="javascript">
        function fAtualizar() {
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
                document.PlanejamentoOficinasForm.action = "PlanejamentoOficinas.do?action=atualizar&idPF=<bean:write name="PlanejamentoOficinasForm" property="idProfessor"/>";
                document.PlanejamentoOficinasForm.submit();
            }
        }
    </script>

</html>
