<%-- 
    Document   : lista_presenca_page_imprimir
    Created on : 15/fev/2021, 20:10:25
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
        <title>Escola Nikken - Imprimir Di�rio</title>
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
                        <h1>Impress�o Di�rio de Classe</h1>
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
                                <label for="usr">S�rie/Ano:</label>
                                <html:select name="ListaPresencaForm" property="idSerieAno" styleId="idSerieAno" styleClass="form-control" onchange="fCarregarDisciplina()">
                                    <html:option value="0">Selecione</html:option>
                                    <html:option value="11">Infantil I</html:option>
                                    <html:option value="12">Infantil II</html:option>
                                    <html:option value="13">Infantil III</html:option>
                                    <html:option value="1">1� ano</html:option>
                                    <html:option value="2">2� ano</html:option>
                                    <html:option value="3">3� ano</html:option>
                                    <html:option value="4">4� ano</html:option>
                                    <html:option value="5">5� ano</html:option>
                                    <html:option value="6">6� ano</html:option>
                                    <html:option value="7">7� ano</html:option>
                                    <html:option value="8">8� ano</html:option>
                                    <html:option value="9">9� ano</html:option>
                                    <html:option value="10">1� s�rie E.M.</html:option>
                                    <html:option value="20">2� s�rie E.M.</html:option>
                                    <html:option value="30">3� s�rie E.M.</html:option>
                                </html:select>    
                            </div>
                        </td>
                        <logic:present name="listaDisciplinas" scope="session">
                            <td width="20%">
                                <div class="col-lg-12">
                                    <label for="usr">Bimestre:</label>
                                    <html:select name="ListaPresencaForm" property="nrBimestre" styleId="nrBimestre" styleClass="form-control">
                                        <html:option value="1">1� Bimestre</html:option>
                                        <html:option value="2">2� Bimestre</html:option>
                                        <html:option value="3">3� Bimestre</html:option>
                                        <html:option value="4">4� Bimestre</html:option>
                                    </html:select>
                                </div>
                            </td>
                            <td width="30%">
                                <div class="col-lg-12">
                                    <label for="usr">Disciplina:</label>
                                    <html:select name="ListaPresencaForm" property="idDisciplina" styleId="idDisciplina" styleClass="form-control">
                                        <html:option value="0">Selecione</html:option>
                                        <html:options collection="listaDisciplinas" property="idDisciplina" labelProperty="nomeDisciplina"></html:options>
                                    </html:select>
                                </div>
                            </td>
                            <td width="10%">
                                <div class="col-lg-12">
                                    <label for="usr">&nbsp;</label>
                                    <input class="btn btn-green" type="button" value="Consultar" onClick="fImprimir();">    
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

        </html:form>
    </body>
</html>
<script language="javascript">

    function fCarregarDisciplina() {
        document.ListaPresencaForm.action = "ListaPresenca.do?action=carregarDisciplinaImpDiario";
        document.ListaPresencaForm.target = "_self";
        document.ListaPresencaForm.submit();
    }

    function fImprimir() {
        document.ListaPresencaForm.action = "ListaPresenca.do?action=imprimirDiario";
        document.ListaPresencaForm.target = "_blank";
        document.ListaPresencaForm.submit();
    }

</script>




