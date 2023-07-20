<%-- 
    Document   : planejamento_oficina_visualizar
    Created on : 14/10/2020, 21:45:42
    Author     : macuser
--%>

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
        <%--<jsp:include page="topo.jsp"/>--%>
        <html:form action="PlanejamentoOficinas" name="PlanejamentoOficinasForm" type="br.com.Form.PlanejamentoOficinasForm" scope="request">
            <div class="container-fluid">
                <div class="row p-3" style="background-color: #F4F4F4" >
                    <div class="col-12 col-sm-1" align="center">&nbsp;</div>
                    <div class="col-sm-10" align="center">
                        <h2>Planejamento de Oficinas</h2>
                    </div>
                    <div class="col-sm-1">&nbsp;</div>
                </div>
            </div>
            <div class="form-group">
                <html:hidden name="PlanejamentoOficinasForm" property="idProfessor"/>
                <table border="0" class="table-condensed" align="center" style="margin-top: 20px;" width="60%">
                    <tr>
                        <td valign="top" width="20%"> <!-- coluna 1 -->
                            <table width="100%" border="0">
                                <tr>
                                    <td>
                                        <label for="usr"><b>Série/Ano:</b></label>
                                    </td>
                                </tr>
                                <logic:iterate name="listaSerieAno" id="lista" scope="session">
                                    <tr>
                                        <td width="90%" valign="top" colspan="2">
                                            <html:multibox name="PlanejamentoOficinasForm" property="selectedOptions" disabled="true"> 
                                                <bean:write name="lista" property="serieAno"/> 
                                            </html:multibox>
                                            <bean:write name="lista" property="dsSerieAno"/>
                                        </td>
                                    </tr>
                                </logic:iterate>
                                <tr>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>
                        </td>
                        <td valign="top"> <!-- coluna 3 -->
                            <html:hidden name="PlanejamentoOficinasForm" property="idPlanejamento"/>
                            <table width="100%" class="table-condensed" border="0">
                                <tr>
                                    <td width="50%">
                                        <label for="usr"><b>Data:</b></label>
                                        <bean:write name="PlanejamentoOficinasForm" property="data"/>
                                        <%--<html:text name="PlanejamentoOficinasForm" property="data" styleId="data" styleClass="form-control form-control-sm" size="15" maxlength="10" onkeyup="formatarData(this);" onkeypress="return(validarConteudo(event, 'numero'))" onfocus="show('data')" onblur="hide('data')"/>--%>
                                    </td>
                                    <td width="50%">
                                        <label for="usr"><b>Bimestre:</b></label>
                                        <bean:write name="PlanejamentoOficinasForm" property="nrBimestre"/>º Bimestre
                                    </td>
                                </tr>

                                <tr>
                                    <td colspan="2">
                                        <label for="usr"><b>Nome da Oficina:</b></label>
                                        <bean:write name="PlanejamentoOficinasForm" property="nomeOficina"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <label for="usr"><b>Conteúdo da Oficina:</b></label>
                                        <bean:write name="PlanejamentoOficinasForm" property="conteudo"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <label for="usr"><b>Objetivo:</b></label>
                                        <bean:write name="PlanejamentoOficinasForm" property="objetivo"/>
                                    </td>
                                </tr>                                
                                <tr>
                                    <td colspan="2">
                                        <label for="usr"><b>Observação:</b></label>
                                        <bean:write name="PlanejamentoOficinasForm" property="observacao"/>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                <table width="10%" align="center">
                    <tr>
                        <td align="center">
                            <html:button property="btImprimir" styleClass="btn btn-sm btn-success" onclick="javascript: style.display='none', window.print()">
                                Imprimir
                            </html:button>
                        </td>
                    </tr>
                </table>

            </div>
        </html:form>
    </body>


    <script language="javascript">
        function DoPrinting() {
            window.print();
        }
    </script>

</html>
