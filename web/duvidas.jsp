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
        <jsp:include page="topo.jsp"/>
        <div class="container-fluid">
            <div class="row p-3" style="background-color: #F4F4F4" >
                <div class="col-12 col-sm-1" align="center">
                    <a href="tela_interativa.jsp"><img src="imagens/bt_voltar_2.png" width="100px"/></a>
                </div>
                <div class="col-sm-10" align="center">
                    <h2>Contato / Dúvidas</h2>
                </div>
                <div class="col-sm-1">&nbsp;</div>
            </div>
        </div>
        <html:form action="TirarDuvidas" name="TirarDuvidasForm" type="br.com.Form.TirarDuvidasForm" scope="request">

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
                        <html:select name="TirarDuvidasForm" property="idDisciplina" styleId="idDisciplina" styleClass="form-control form-control-sm">
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
                            <html:textarea name="TirarDuvidasForm" property="mensagem" styleId="mensagem" styleClass="form-control form-control-sm" rows="7"/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <input class="btn btn-sm btn-success" type="button" value="Enviar" onClick="fEnviar();">
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
