<%-- 
    Document   : recuperacao_anual_incluir_nota
    Created on : 10/dez/2020, 22:56:45
    Author     : macuser
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<!DOCTYPE html>
<html class="js-disabled">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Escola Nikken - Recuperação Anual</title>
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

    </head>
    <body>
        <logic:present name="errors">
            <script>
                alert('<bean:write name="errors"/>');
            </script>
        </logic:present>
        <html:form action="RecuperacaoAnual" name="RecuperacaoAnualForm" type="br.com.Form.RecuperacaoAnualForm" scope="request">
            <jsp:include page="topo.jsp"/>
            <div class="container-fluid">
                <div class="row p-3" style="background-color: #F4F4F4" >
                    <div class="col-12 col-sm-1" align="center">
                        <a href="RecuperacaoAnual.do"><img src="imagens/bt_voltar_2.png" width="100px"/></a>
                    </div>
                    <div class="col-sm-10" align="center">
                        <h1>Recuperação Anual</h1>
                    </div>
                    <div class="col-sm-1">&nbsp;</div>
                </div>
            </div>

            <div class="form-group">
                <table border="0" align="center" style="margin-top: 20px;" width="80%">
                    <tr>
                        <td width="30%">
                            <div class="col-lg-10">
                                <label for="usr">Disciplina:</label><br/>
                                <b>
                                    <html:hidden name="RecuperacaoAnualForm" property="nomeAluno"/>
                                    <bean:write name="RecuperacaoAnualForm" property="nomeAluno"/>
                                </b>
                            </div>
                        </td>
                        <td width="10%">
                            <div class="col-lg-12">
                                <label for="usr">Disciplina:</label><br/>
                                <b>
                                    <html:hidden name="RecuperacaoAnualForm" property="nomeDisciplina"/>
                                    <bean:write name="RecuperacaoAnualForm" property="nomeDisciplina"/>
                                </b>
                            </div>
                        </td>
                        <td width="25%">
                            <div class="col-lg-10">
                                <label for="usr">Série/Ano:</label>
                                <html:hidden name="RecuperacaoAnualForm" property="idSerieAno"/>
                                <html:select name="RecuperacaoAnualForm" property="idSerieAno" styleId="idSerieAno" styleClass="form-control form-control-sm" disabled="true">
                                    <html:option value="">Selecione Série/Ano</html:option>
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
                        <td width="25%">
                            <div class="col-lg-10">
                                <label for="usr">Ano letivo:</label>
                                <html:hidden name="RecuperacaoAnualForm" property="ano"/>
                                <html:select name="RecuperacaoAnualForm" property="ano" styleId="ano" styleClass="form-control form-control-sm" disabled="true">
                                    <html:option value="2023">2023</html:option>
                                    <html:option value="2022">2022</html:option>
                                    <html:option value="2021">2021</html:option>
                                    <html:option value="2020">2020</html:option>
                                </html:select>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
            <hr/>
            <logic:present name="listaTodasMedias" scope="session">
                <div class="form-group">
                    <table border="0" class="table-condensed" align="center" style="margin-top: 20px;" width="40%">
                        <logic:iterate name="listaTodasMedias" id="lista" scope="session">
                            <tr>
                                <td>
                                    <bean:write name="lista" property="nrBimestre"/>º Bimestre
                                </td>
                                <td>
                                    <b><bean:write name="lista" property="mediaBimestre"/></b>
                                </td>
                            </tr>
                        </logic:iterate>
                        <tr>
                            <td>
                                Média Anual (Soma das Médias Bimestrais / 4)
                            </td>
                            <td>
                                <b style="color: red"><bean:write name="RecuperacaoAnualForm" property="mediaAnual"/></b>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Nota Recuperação Anual
                            </td>
                            <td>
                                <input class="nota form-control form-control-sm" name="notaRecuperacao" id="notaRecuperacao" type="text" min="0" max="10" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" style="color: #000080; font-size: 12px">
                                *O cálculo para a nota final é: (Média Anual + Recuperação Anual) / 2
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <input class="btn btn-sm btn-success" type="button" value="Salvar" onClick="fSalvarNota(<bean:write name="RecuperacaoAnualForm" property="idAluno"/>, <bean:write name="RecuperacaoAnualForm" property="idDisciplina"/>, '<bean:write name="RecuperacaoAnualForm" property="mediaAnual"/>');">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">&nbsp;</td>
                        </tr>
                    </table>
                </div>
            </logic:present>
            <logic:equal name="mediaSalvo" value="true" scope="request">
                <hr/>
                <div class="form-group">
                    <table border="0" class="table-condensed" align="center" style="margin-top: 20px;" width="40%">
                        <tr>
                            <td align="center" style="font-size: 25px; background-color: wheat">
                                <b>RESULTADO FINAL</b>
                            </td>
                        </tr>  
                        <tr>
                            <td align="center" style="font-size: 20px">
                                Nota Recuperação Anual <br/>
                                <b><bean:write name="RecuperacaoAnualForm" property="notaRecuperacao"/></b>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" style="font-size: 20px">
                                Média Final <br/>
                                <logic:equal name="RecuperacaoAnualForm" property="passouDeAno" value="false">
                                    <b style="color: red"><bean:write name="RecuperacaoAnualForm" property="mediaFinal"/></b>    
                                </logic:equal>
                                <logic:equal name="RecuperacaoAnualForm" property="passouDeAno" value="true">
                                    <b style="color: blue"><bean:write name="RecuperacaoAnualForm" property="mediaFinal"/></b>
                                    <br/>
                                    <img src="imagens/check.png"/>
                                </logic:equal>
                            </td>
                        </tr>
                    </table>
                </div>
            </logic:equal>
            <script type="text/javascript">
                var notas = document.getElementsByClassName("nota");

                var onNotaInput = function (event) {
                    var regexp = new RegExp("[^0-9]", "g");
                    var value = event.target.value.replace(regexp, "");
                    value = parseInt(value) / 10;
                    if (value >= event.target.min && value <= event.target.max) {
                        event.target.dataset.value = value;
                    } else {
                        value = parseFloat(event.target.dataset.value);
                    }
                    if (isNaN(value)) {
                        value = 0;
                    }

                    event.target.value = value.toLocaleString(undefined, {minimumFractionDigits: 1});
                };

                [].forEach.call(notas, function (nota) {
                    nota.addEventListener("input", onNotaInput);
                });
            </script>



            <script type="text/javascript">
                var notas = document.getElementsByClassName("nota");

                var onNotaInput = function (event) {
                    var regexp = new RegExp("[^0-9]", "g");
                    var value = event.target.value.replace(regexp, "");
                    value = parseInt(value) / 10;
                    if (value >= event.target.min && value <= event.target.max) {
                        event.target.dataset.value = value;
                    } else {
                        value = parseFloat(event.target.dataset.value);
                    }
                    if (isNaN(value)) {
                        value = 0;
                    }

                    event.target.value = value.toLocaleString(undefined, {minimumFractionDigits: 1});
                };

                [].forEach.call(notas, function (nota) {
                    nota.addEventListener("input", onNotaInput);
                });
            </script>

        </html:form>
    </body>
</html>
<script language="javascript">
    function fSalvarNota(idAluno, idDisciplina, mediaAnual) {
        document.RecuperacaoAnualForm.action = "RecuperacaoAnual.do?action=salvarNotaRecuperacao&idAluno=" + idAluno + "&idDisciplina=" + idDisciplina + "&mediaAnual=" + mediaAnual;
        document.RecuperacaoAnualForm.submit();
    }

</script>




