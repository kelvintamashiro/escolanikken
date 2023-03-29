<%-- 
    Document   : esqueceu_senha
    Created on : 13/07/2020, 22:22:21
    Author     : macuser
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Escola Nikken - Esqueceu senha</title>
        <link rel="shortcut icon" href="imagens/favico.png" />
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <script language="javascript1.2" src="js/mizanscene.js"></script>
        <script type="text/javascript" src="js/JQuery/js/jquery-1.3.2.js"></script>
        <style>
            body {
                margin:0;
                padding:0;
            }
        </style>
        <script language="javascript">
            $(function () {
                $("#login").attr("placeholder", "E-mail. Ex. email@email.com");
                $("#dtNascimento").attr("placeholder", "dd/mm/yyyy");
            });
            function fEnviar() {
                var login = document.getElementById('login').value.trim();
                var dtNascimento = document.getElementById('dtNascimento').value.trim();
                if (login.length < 2) {
                    alert("Deve ser informado o login corretamente!");
                    document.getElementById('login').focus();
                } else if (dtNascimento.length < 2) {
                    alert("Deve ser informado a Data de Nascimento corretamente!");
                    document.getElementById('dtNascimento').focus();
                } else {
                    document.LoginForm.action = "Login.do?action=resetarSenha";
                    document.LoginForm.submit();
                }
            }

            function fVoltar() {
                document.LoginForm.action = "index.jsp";
                document.LoginForm.submit();
            }

        </script>
    </head>
    <body>
        <logic:present name="errors">
            <script>
                alert('<bean:write name="errors"/>');
            </script>
        </logic:present>
        <html:form action="Login" name="LoginForm" type="br.com.Form.LoginForm" scope="request">

            <table width="50%" border="0" align="center" class="table-responsive">
                <tr><td style="padding-top: 20%;">&nbsp;</td></tr>
                <tr>
                    <td align="center">
                        <img src="imagens/logo.png" width="80%"/>
                    </td>
                </tr>
                <tr><td style="padding-top: 10px;">&nbsp;</td></tr>
                <tr>
                    <td>
                        <div class="form-group">
                            <label for="usr">E-mail:</label>
                            <html:text styleClass="form-control" name="LoginForm" property="login" styleId="login"/>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="form-group">
                            <label for="usr">Data de Nascimento:</label>
                            <html:text name="LoginForm" property="dtNascimento" styleId="dtNascimento" styleClass="form-control" size="15" maxlength="10" onkeyup="formatarData(this);" onkeypress="return(validarConteudo(event, 'numero'))" onfocus="show('dtNascimento')" onblur="hide('dtNascimento')"/>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input class="btn btn-primary" type="button" value="Solicitar Nova Senha" onClick="fEnviar();">
                        <input class="btn btn-success" type="button" value="Voltar Início" onClick="fVoltar();">
                    </td>
                </tr>
            </table>
            <logic:equal name="erroLogin" value="false">
                <br/>
                <div class="alert alert-success alert-dismissible" id="myAlert" style="text-align: center">
                    <a href="#" class="close">&times;</a>
                    <b>Foi enviado uma nova senha para o seu e-mail</b>
                </div>
            </logic:equal>                
            <logic:equal name="erroLogin" value="true">
                <br/>
                <div class="alert alert-danger alert-dismissible" id="myAlert" style="text-align: center">
                    <a href="#" class="close">&times;</a>
                    <b>Erro na solicitação, favor entrar em contato!</b>
                </div>
            </logic:equal>
        </html:form>
    </body>
</html>

