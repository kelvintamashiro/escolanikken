<%-- 
    Document   : page_notas_bimestrais_aluno
    Created on : 4 de mar de 2021, 16:08:50
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
        <title>Escola Nikken - Notas Bimestrais</title>
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
        <html:form action="NotaBimestre" name="NotaBimestreForm" type="br.com.Form.NotaBimestreForm" scope="request">
            <jsp:include page="topo.jsp"/>
            <div class="container-fluid">
                <div class="row p-3" style="background-color: #F4F4F4" >
                    <div class="col-12 col-sm-1" align="center">
                        <a href="tela_interativa.jsp"><img src="imagens/bt_voltar_2.png" width="100px"/></a>
                    </div>
                    <div class="col-sm-10" align="center">
                        <h1>Visualizar Notas Bimestrais Segmentada</h1>
                    </div>
                    <div class="col-sm-1">&nbsp;</div>
                </div>
            </div>

            <div class="form-group">
                <table border="0" align="center" style="margin-top: 20px;" width="80%" class="table">
                    <logic:present name="listaNotas" scope="request">
                        <tr>
                            <td><b>Ano</b></td>
                            <td><b>Bimestre</b></td>
                            <td><b>Categoria Ensino</b></td>
                            <td><b>Série/Ano</b></td>
                            <td><b>Disciplina</b></td>
                            <td align="center"><b>Qtd. Faltas</b></td>
                            <td align="center"><b>Nota Mensal</b></td>
                            <td align="center"><b>Nota Bimestral</b></td>
                            <td align="center"><b>Nota Produção de Sala</b></td>
                            <td align="center"><b>Média</b></td>
                        </tr>
                        <logic:iterate id="lista" name="listaNotas" scope="request">
                            <tr>
                                <td><bean:write name="lista" property="ano"/></td>
                                <td><bean:write name="lista" property="nrBimestre"/>º Bimestre</td>
                                <td>
                                    <logic:equal name="lista" property="categoriaEnsino" value="INF">Educação Infantil</logic:equal>
                                    <logic:equal name="lista" property="categoriaEnsino" value="EF1">Fundamental I</logic:equal>
                                    <logic:equal name="lista" property="categoriaEnsino" value="EF2">Fundamental II</logic:equal>
                                    <logic:equal name="lista" property="categoriaEnsino" value="EM">Ensino Médio</logic:equal>
                                    </td>
                                    <td><bean:write name="lista" property="dsSerieAno"/></td>
                                <td><bean:write name="lista" property="nomeDisciplina"/></td>
                                <td align="center"><bean:write name="lista" property="falta"/></td>
                                <td align="center"><bean:write name="lista" property="notaMensal"/></td>
                                <td align="center"><bean:write name="lista" property="notaBimestral"/></td>
                                <td align="center"><bean:write name="lista" property="notaProducaoSala"/></td>
                                <td align="center"><bean:write name="lista" property="mediaBimestre"/></td>
                            </tr>
                        </logic:iterate>
                    </logic:present>
                </table>
            </div>

        </html:form>
    </body>
</html>




