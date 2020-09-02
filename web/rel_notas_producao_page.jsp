<%-- 
    Document   : rel_notas_producao_page
    Created on : 17/07/2020, 13:02:45
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

        <!--<link rel="stylesheet" media="all" type="text/css" href="assets/css/reset.css" />-->
        <link rel="stylesheet" media="all" type="text/css" href="assets/css/fix.css" />
        <link rel="stylesheet" media="all" type="text/css" href="assets/css/style_original.css" />
        <link rel="stylesheet" media="all" type="text/css" href="assets/css/mobile.css" />

        <style>
            body {
                margin:0;
                padding:0;
            }

        </style>
    </head>
    <body>
        <jsp:include page="topo.jsp"/>
        <html:form action="Relatorios" name="RelatoriosForm" type="br.com.Form.RelatoriosForm" scope="request">

            <table border="0" align="center" style="margin-top: 20px; background-color: #ADD8E6" width="100%">
                <tr>
                    <td width="10%" style="padding-left: 50px">
                        <a href="Relatorios.do"><img src="imagens/bt_voltar_2.png" width="100px"/></a>
                    </td>
                    <td width="80%" align="center">
                        <h2>Relat�rio Notas Produ��o de Sala (por bimestre)</h2>
                    </td>
                    <td width="10%">&nbsp;</td>
                </tr>
            </table>

            <div class="form-group">
                <table border="0" align="center" style="margin-top: 20px;" width="50%">
                    <tr>
                        <td>
                            <div class="col-lg-12">
                                <label for="usr">S�rie/Ano:</label>
                                <bean:define id="notaBimestreForm" name="RelatoriosForm" property="notaBimestreForm"/>
                                <html:select name="notaBimestreForm" property="idSerieAno" styleId="idSerieAno" styleClass="form-control">
                                    <html:option value="">Selecione S�rie/Ano</html:option>
                                    <html:option value="2">2� ano</html:option>
                                    <html:option value="3">3� ano</html:option>
                                    <html:option value="4">4� ano</html:option>
                                    <html:option value="5">5� ano</html:option>
                                    <html:option value="6">6� ano</html:option>
                                    <html:option value="7">7� ano</html:option>
                                    <html:option value="8">8� ano</html:option>
                                    <html:option value="9">9� ano</html:option>
                                    <html:option value="10">1� s�rie</html:option>
                                    <html:option value="20">2� s�rie</html:option>
                                    <html:option value="30">3� s�rie</html:option>
                                </html:select>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="col-lg-12">
                                <label for="usr">Bimestre:</label>
                                <bean:define id="notaBimestreForm" name="RelatoriosForm" property="notaBimestreForm"/>
                                <html:select name="notaBimestreForm" property="nrBimestre" styleId="nrBimestre" styleClass="form-control">
                                    <html:option value="1">1� Bimestre</html:option>
                                    <html:option value="2">2� Bimestre</html:option>
                                    <html:option value="3">3� Bimestre</html:option>
                                    <html:option value="4">4� Bimestre</html:option>
                                </html:select>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="col-lg-12">
                                <label for="usr">Ano letivo:</label>
                                <html:select name="notaBimestreForm" property="ano" styleId="ano" styleClass="form-control">
                                    <html:option value="2020">2020</html:option>
                                </html:select>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="col-lg-12">
                                <label for="usr">&nbsp;</label>
                                <input class="btn btn-green" type="button" value="Pesquisar" onClick="fPesquisar()">
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
        var idSerieAno = document.RelatoriosForm.idSerieAno.value;
        if (idSerieAno.length < 1) {
            alert("Deve ser informado a S�rie/Ano correto!!")
        } else {
            document.RelatoriosForm.action = "Relatorios.do?action=relNotasProducaoPorBimestre";
            document.RelatoriosForm.target = "_blank";
            document.RelatoriosForm.submit();
        }
    }
</script>

