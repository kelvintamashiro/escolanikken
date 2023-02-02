<%-- 
    Document   : index
    Created on : 18/02/2020, 21:54:10
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
        <title>Escola Nikken - Painel</title>
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
                $("#password").attr("placeholder", "Password");
            });
            function fEntrar() {
                var login = document.getElementById('login').value.trim();
                var password = document.getElementById('password').value.trim();
                var tipoPerfil = document.getElementById('tipoPerfil').value.trim();
                if (login.length < 2) {
                    alert("Deve ser informado o login corretamente!");
                    document.getElementById('login').focus();
                } else if (password.length < 2) {
                    alert("Deve ser informado a Senha corretamente!");
                    document.getElementById('password').focus();
                } else if (tipoPerfil === "") {
                    alert("Deve ser informado o Tipo de Perfil!!");
                } else {
                    document.LoginForm.action = "Login.do";
                    document.LoginForm.submit();
                }
            }

            function fEsqueceuSenha() {
                document.LoginForm.action = "Login.do?action=pageEsqueceuSenha";
                document.LoginForm.submit();
            }
        </script>
    </head>
    <body>
        <!--<form class="cd-form" action="Login.do?action=page" method="post" name="frmlogin">-->
        <html:form action="Login" name="LoginForm" type="br.com.Form.LoginForm" scope="request">

            <table width="50%" border="0" align="center" class="table-responsive">
                <tr><td style="padding-top: 10%;">&nbsp;</td></tr>
                <tr>
                    <td align="center">
                        <img src="imagens/logo-nikken.png" width="80%"/>
                    </td>
                </tr>
                <tr><td style="padding-top: 10px;">&nbsp;</td></tr>
                <tr>
                    <td>
                        <div class="form-group">
                            <label for="usr">Login:</label>
                            <html:text styleClass="form-control" name="LoginForm" property="login" styleId="login"/>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="form-group">
                            <label for="usr">Senha:</label>
                            <html:password styleClass="form-control" name="LoginForm" property="password" styleId="password"/>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="form-group">
                            <label for="usr">Tipo de Acesso:</label>
                            <html:select name="LoginForm" property="tipoPerfil" styleId="tipoPerfil" styleClass="form-control">
                                <html:option value="">Selecione</html:option>
                                <html:option value="aluno">Aluno / Pais</html:option>
                                <html:option value="coordenacao">Coordenação</html:option>
                                <html:option value="diretoria">Diretoria</html:option>
                                <html:option value="professor">Professor</html:option>
                            </html:select>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input class="btn btn-primary" type="button" value="Entrar" onClick="fEntrar();">
                        <input class="btn btn-warning" type="button" value="Esqueceu Senha?" onClick="fEsqueceuSenha();">
                        <!--<button type="submit" class="btn btn-primary">Entrar</button>-->
                    </td>
                </tr>
            </table>
            <logic:equal name="erroLogin" value="true">
                <br/>
                <div class="alert alert-danger alert-dismissible" id="myAlert" style="text-align: center">
                    <a href="#" class="close">&times;</a>
                    <b>Erro de Login e/ou Senha!</b>
                </div>
            </logic:equal>
        </html:form>
    </body>
</html>
