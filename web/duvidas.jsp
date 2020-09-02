<%-- 
    Document   : duvidas
    Created on : 29/07/2020, 13:13:44
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
        <logic:present name="errors">
            <script>
                alert('<bean:write name="errors"/>');
            </script>
        </logic:present>
        <jsp:include page="topo.jsp"/>
        <html:form action="TirarDuvidas" name="TirarDuvidasForm" type="br.com.Form.TirarDuvidasForm" scope="request">

            <table border="0" align="center" style="margin-top: 20px; background-color: #C1FFC1" width="100%">
                <tr>
                    <td width="10%" style="padding-left: 50px">
                        <a href="tela_interativa.jsp"><img src="imagens/bt_voltar_2.png" width="100px"/></a>
                    </td>
                    <td width="80%" align="center">
                        <h1>Contato / Dúvidas</h1>
                    </td>
                    <td width="10%">&nbsp;</td>
                </tr>
            </table>
            <div class="form-group">
                <table border="0" class="table-condensed" align="center" style="margin-top: 20px;" width="60%">
                    <tr>
                        <td>
                            <label for="usr">Nome do Aluno:</label>
                            <bean:write name="TirarDuvidasForm" property="nomeAluno" scope="request"/>
                            <html:hidden name="TirarDuvidasForm" property="nomeAluno"/>
                        </td>
                        <td>
                            <label for="usr">E-mail do Aluno:</label>
                            <bean:write name="TirarDuvidasForm" property="emailAluno" scope="request"/>
                            <html:hidden name="TirarDuvidasForm" property="emailAluno"/>
                        </td>
                    </tr>
                    <td colspan="2">
                        <label for="usr">Disciplina/Assunto:</label>
                        <html:select name="TirarDuvidasForm" property="idDisciplina" styleId="idDisciplina" styleClass="form-control">
                            <html:option value="0">Selecione</html:option>
                            <html:option value="Direcao">DIREÇÃO</html:option>
                            <html:option value="Financeiro">FINANCEIRO</html:option>
                            <html:option value="Administrativo">ADMINISTRATIVO</html:option>
                            <html:option value="Outros">OUTROS</html:option>
                            <html:options collection="listaDisciplinas" property="nomeDisciplina" labelProperty="nomeDisciplina"></html:options>
                        </html:select>
                    </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <label for="usr">Descrição:</label>
                            <html:textarea name="TirarDuvidasForm" property="mensagem" styleId="mensagem" styleClass="form-control" rows="7"/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <input class="btn btn-green" type="button" value="Enviar" onClick="fEnviar();">
                        </td>
                    </tr>
                </table>
            </div>
        </html:form>
    </body>
</html>

<script language="javascript">
    function fEnviar() {
        var mensagem = document.TirarDuvidasForm.mensagem.value;
        var idDisciplina = document.TirarDuvidasForm.idDisciplina.value;
        if (idDisciplina === "0") {
            alert("Deve ser informado a disciplina/assunto!!");
            document.getElementById('idDisciplina').focus();
        } else if (mensagem.length < 2) {
            alert("Deve ser informado a mensagem!!");
            document.getElementById('mensagem').focus();
        } else {
            document.TirarDuvidasForm.action = "TirarDuvidas.do?action=enviar";
            document.TirarDuvidasForm.submit();
        }

    }
</script>
