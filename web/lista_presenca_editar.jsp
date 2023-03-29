<%-- 
    Document   : lista_presenca_editar
    Created on : 13/jan/2021, 22:09:51
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
        <title>Escola Nikken - Lista de Presença</title>
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
    <body style="padding-bottom: 150px">
        <logic:present name="errors">
            <script>
                alert('<bean:write name="errors"/>');
            </script>
        </logic:present>
        <html:form action="ListaPresenca" name="ListaPresencaForm" type="br.com.Form.ListaPresencaForm" scope="request">
            <jsp:include page="topo.jsp"/>
            <div class="container-fluid">
                <div class="row p-3" style="background-color: #F4F4F4" >
                    <div class="col-12 col-sm-1" align="center">
                        <a href="gerenciador_presenca.jsp"><img src="imagens/bt_voltar_2.png" width="100px"/></a>
                    </div>
                    <div class="col-sm-10" align="center">
                        <h1>Lista de Presença</h1>
                    </div>
                    <div class="col-sm-1">&nbsp;</div>
                </div>
            </div>
            <div class="form-group">
                <table border="0" class="table-condensed" align="center" width="60%">
                    <html:hidden name="ListaPresencaForm" property="idPresenca"/>
                    <html:hidden name="ListaPresencaForm" property="data"/>
                    <html:hidden name="ListaPresencaForm" property="idDisciplina"/>
                    <html:hidden name="ListaPresencaForm" property="idSerieAno"/>
                    <tr><td colspan="2">&nbsp;</td></tr>
                    <tr>
                        <td align="right" width="40%"><b>Nome:</b></td>
                        <td><bean:write name="ListaPresencaForm" property="nomeAluno"/></td>
                    </tr>
                    <tr>
                        <td align="right"><b>Data:</b></td>
                        <td><bean:write name="ListaPresencaForm" property="data"/></td>
                    </tr>
                    <tr>
                        <td align="right"><b>Disciplina:</b></td>
                        <td><bean:write name="ListaPresencaForm" property="dsDisciplina"/></td>
                    </tr>
                    <tr>
                        <td align="right"><b>Série/Ano:</b></td>
                        <td><bean:write name="ListaPresencaForm" property="dsSerieAno"/></td>
                    </tr>
                    <tr>
                        <td align="right"><b>Qtd. Aula(s):</b></td>
                        <td>
                            <input type="number" class="form-control form-control-sm" name="qtdAulas" id="qtdAulas" value='<bean:write name="ListaPresencaForm" property="qtdAulas"/>'/>
                        </td>
                    </tr>
                    <tr>
                        <td align="right"><b>Presença:</b></td>
                        <td>
                            <html:select name="ListaPresencaForm" property="falta" styleClass="form-control form-control-sm">
                                <html:option value="N">Presente</html:option>
                                <html:option value="S">Ausente</html:option>
                            </html:select>
                        </td>
                    </tr>
                    <tr><td colspan="2">&nbsp;</td></tr>
                    <tr>
                        <td></td>
                        <td>
                            <input class="btn btn-sm btn-success" type="button" value="Atualizar" onClick="fAtualizar();">    
                        </td>
                    </tr>
                </table>

            </div>
        </html:form>
    </body>
</html>
<script language="javascript">

    function fAtualizar() {
        document.ListaPresencaForm.action = "ListaPresenca.do?action=atualizarPresenca";
        document.ListaPresencaForm.submit();
    }

    function fVoltar() {
        document.ListaPresencaForm.action = "ListaPresenca.do?action=consultar";
        document.ListaPresencaForm.submit();
    }

</script>





