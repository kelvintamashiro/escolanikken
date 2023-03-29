<%-- 
    Document   : rel_lancamento_notas_page
    Created on : 21/07/2020, 23:18:04
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
        <title>Escola Nikken - Relatório de Lançamento de Notas</title>
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
        <jsp:include page="topo.jsp"/>
        <div class="container-fluid">
            <div class="row p-3" style="background-color: #F4F4F4" >
                <div class="col-12 col-sm-1" align="center">
                    <a href="relatorio.jsp"><img src="imagens/bt_voltar_2.png" width="100px"/></a>
                </div>
                <div class="col-sm-10" align="center">
                    <h2>Relatório de Lançamento de Notas (por data)</h2>
                </div>
                <div class="col-sm-1">&nbsp;</div>
            </div>
        </div>
        <html:form action="Relatorios" name="RelatoriosForm" type="br.com.Form.RelatoriosForm" scope="request">

            <div class="form-group">
                <table border="0" align="center" style="margin-top: 20px;" width="50%">
                    <tr>
                        <td>
                            <div class="col-lg-5">
                                <label for="usr">Data de Início:</label>
                                <html:text name="RelatoriosForm" property="dataInicio" styleId="dataInicio" styleClass="form-control form-control-sm" size="15" maxlength="10" onkeyup="formatarData(this);" onkeypress="return(validarConteudo(event, 'numero'))" onfocus="show('dataInicio')" onblur="hide('dataInicio')"/>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="col-lg-5">
                                <label for="usr">Data Final:</label>
                                <html:text name="RelatoriosForm" property="dataFim" styleId="dataFim" styleClass="form-control form-control-sm" size="15" maxlength="10" onkeyup="formatarData(this);" onkeypress="return(validarConteudo(event, 'numero'))" onfocus="show('dataFim')" onblur="hide('dataFim')"/>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="col-lg-5">
                                <label for="usr">&nbsp;</label>
                                <input class="btn btn-sm btn-success" type="button" value="Pesquisar" onClick="fPesquisar()">
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </html:form>
    </body>
</html>
<script language="javascript">
    function fPesquisar() {
        var dataInicio = document.RelatoriosForm.dataInicio.value;
        var dataFim = document.RelatoriosForm.dataFim.value;
        if (dataInicio.length < 5) {
            alert("Deve ser informado a Data de Início corretamente!!")
            document.getElementById('dataInicio').focus();
        } else if (dataFim.length < 5) {
            alert("Deve ser informado a Data Final corretamente!!")
            document.getElementById('dataFim').focus();
        } else {
            document.RelatoriosForm.action = "Relatorios.do?action=relLancamentoNotas";
            document.RelatoriosForm.target = "_blank";
            document.RelatoriosForm.submit();
        }
    }
</script>

