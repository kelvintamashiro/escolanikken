<%-- 
    Document   : page_consulta_nota_aluno
    Created on : 19/06/2020, 23:46:53
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
                        <h1>Consulta de Notas</h1>
                    </div>
                    <div class="col-sm-1">&nbsp;</div>
                </div>
            </div>

            <div class="form-group">
                <table border="0" class="table-condensed" align="center" style="margin-top: 20px;" width="50%">
                    <logic:present name="listaAnos" scope="request">
                        <tr>
                            <td align="center">
                                <b>Ano Letivo</b>
                            </td>
                        </tr>
                        <logic:iterate name="listaAnos" scope="request" id="lista">
                            <tr>
                                <td align="center">
                                    <bean:write name="lista" property="dsSerieAno"/> - <bean:write name="lista" property="ano"/>
                                    <a href="javascript:fVisualizar(<bean:write name="lista" property="ano"/>, <bean:write name="lista" property="idSerieAno"/>, <bean:write name="NotaBimestreForm" property="idAluno"/>)" class="btn btn-sm btn-primary">Visualizar/Imprimir</a>
                                </td>
                            </tr>
                        </logic:iterate>
                    </logic:present>
                </table>
            </div>

            <%--<jsp:include page="footer.jsp"/>--%>
        </html:form>
    </body>
</html>
<script language="javascript">

    function fVisualizar(ano, idSerieAno, idAluno) {
        document.NotaBimestreForm.action = "NotaBimestre.do?action=visualizarNotaAluno&ano=" + ano + "&idAluno=" + idAluno + "&idSerieAno=" + idSerieAno;
        document.NotaBimestreForm.target = "_blank";
        document.NotaBimestreForm.submit();
    }

</script>




