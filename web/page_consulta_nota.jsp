<%-- 
    Document   : page_consulta_nota
    Created on : 29/04/2020, 22:33:55
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
        <title>Escola Nikken - Consulta de Notas</title>
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
    <body>
        <logic:present name="errors">
            <script>
                alert('<bean:write name="errors"/>');
            </script>
        </logic:present>
        <html:form action="NotaBimestre" name="NotaBimestreForm" type="br.com.Form.NotaBimestreForm" scope="request">
            <jsp:include page="topo.jsp"/>

            <table border="0" align="center" style="margin-top: 20px; background-color: #ADD8E6" width="100%">
                <tr>
                    <td width="10%" style="padding-left: 50px">
                        <a href="tela_interativa.jsp"><img src="imagens/bt_voltar_2.png" width="100px"/></a>
                    </td>
                    <td width="80%" align="center">
                        <h1>Consulta de Notas</h1>
                    </td>
                    <td width="10%">&nbsp;</td>
                </tr>
            </table>

            <bean:define id="disciplina" name="NotaBimestreForm" property="disciplinasForm"/>
            <%--<bean:define id="serieAno" name="NotaBimestreForm" property="serieAnoForm"/>--%>
            <div class="form-group">
                <table border="0" align="center" style="margin-top: 20px;" width="80%">
                    <tr>
                        <td width="25%">
                            <div class="col-lg-12">
                                <label for="usr">Série/Ano:</label>
                                <%--<html:hidden name="serieAno" property="serieAno"/>--%>
                                <html:select name="NotaBimestreForm" property="idSerieAno" styleId="idSerieAno" styleClass="form-control">
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
                            <div class="col-lg-12">
                                <label for="usr">Ano letivo:</label>
                                <html:select name="NotaBimestreForm" property="ano" styleId="ano" styleClass="form-control">
                                    <html:option value="2021">2021</html:option>
                                    <html:option value="2020">2020</html:option>
                                </html:select>
                            </div>
                        </td>
                        <td width="25%">
                            <div class="col-lg-12">
                                <label for="usr">&nbsp;</label>
                                <input class="btn btn-green" type="button" value="Pesquisar" onClick="fPesquisar()">
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
            <logic:present name="listaAlunosSerieAnoComNota" scope="request">
                <div class="form-group">
                    <table border="0" class="table" align="center" style="margin-top: 20px;" width="90%">
                        <tr>
                            <td width="10%">&nbsp;</td>
                            <td width="10%" align="center"><b>Ano</b></td>
                            <td width="10%" align="center"><b>Série</b></td>
                            <!--<td width="10%" align="center"><b>Bimestre</b></td>-->
                            <td width="50%"><b>Aluno</b></td>
                            <td>&nbsp;</td>
                            <td width="10%">&nbsp;</td>
                        </tr>
                        <logic:iterate name="listaAlunosSerieAnoComNota" id="lista" scope="request">
                            <bean:define name="lista" property="alunoForm" id="alunoForm"/>
                            <bean:define name="lista" property="serieAnoForm" id="serieAnoForm"/>
                            <tr>
                                <td>&nbsp;</td>
                                <td align="center"><bean:write name="lista" property="ano"/></td>
                                <td align="center">
                                    <%--<bean:write name="lista" property="idSerieAno"/>--%>
                                    <bean:write name="serieAnoForm" property="dsSerieAno"/>
                                </td>
                                <!--<td align="center"><bean:write name="lista" property="nrBimestre"/></td>-->
                                <td><bean:write name="alunoForm" property="nome"/></td>
                                <td>
                                    <!--<input class="btn btn-big btn-grey" type="button" value="Salvar" onClick="fSalvar();">-->
                                    <a href="javascript:fVisualizar(<bean:write name="lista" property="idSerieAno"/>,<bean:write name="lista" property="ano"/>,<bean:write name="lista" property="idAluno"/>)" class="btn btn-big btn-grey">Visualizar/Imprimir</a>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                        </logic:iterate>
                    </table>
                </div>
            </logic:present>

            <!--<br/><br/><br/><br/><br/><br/>-->
            <%--<jsp:include page="footer.jsp"/>--%>
        </html:form>
    </body>
</html>
<script language="javascript">

    function fPesquisar() {
        var idSerieAno = document.NotaBimestreForm.idSerieAno.value;

        if (idSerieAno === "") {
            alert("Deve ser informado a SÉRIE/ANO");
        } else {
            document.NotaBimestreForm.action = "NotaBimestre.do?action=consultarAlunosSerie";
            document.NotaBimestreForm.target = "_self";
            document.NotaBimestreForm.submit();
        }
    }

    function fVisualizar(idSerieAno, ano, idAluno) {
        document.NotaBimestreForm.action = "NotaBimestre.do?action=visualizarNota&idSerieAno=" + idSerieAno + "&ano=" + ano + "&idAluno=" + idAluno;
        document.NotaBimestreForm.target = "_blank";
        document.NotaBimestreForm.submit();
    }

</script>



