<%-- 
    Document   : alterar_senha
    Created on : 06/03/2020, 20:19:02
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
        <title>Escola Nikken - Painel</title>
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
        <html:form action="AlterarSenha" name="AlterarSenhaForm" type="br.com.Form.AlterarSenhaForm" scope="request">
            <jsp:include page="topo.jsp"/>

            <table border="0" align="center" style="margin-top: 20px; background-color: #FFFF00" width="100%">
                <tr>
                    <td width="10%" style="padding-left: 50px">
                        <a href="tela_interativa.jsp"><img src="imagens/bt_voltar_2.png" width="100px"/></a>
                    </td>
                    <td width="80%" align="center">
                        <h1>Alteração de Senha</h1>
                    </td>
                    <td width="10%">&nbsp;</td>
                </tr>
            </table>
            <div class="form-group">
                <table border="0" align="center" style="margin-top: 20px;" width="50%">
                    <tr>
                        <td>
                            <div class="col-lg-12">
                                <html:hidden name="AlterarSenhaForm" property="idPF"/>
                                <label for="usr">ID: <b><bean:write name="AlterarSenhaForm" property="idPF"/></b></label>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="col-lg-12">
                                <label for="usr">Nome Usuário: <b><bean:write name="AlterarSenhaForm" property="nome"/></b></label>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="col-lg-12">
                                <label for="usr">Login: <b><bean:write name="AlterarSenhaForm" property="login"/></b></label>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="col-lg-12">
                                <label for="usr">Senha Antiga:</label>
                                <html:password styleClass="form-control" name="AlterarSenhaForm" property="senhaAntiga" styleId="senhaAntiga"/>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="col-lg-12">
                                <label for="usr">Senha Nova:</label>
                                <html:password styleClass="form-control" name="AlterarSenhaForm" property="senhaNova" styleId="senhaNova"/>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>

            <div align="center">
                <br/>
                <br/>
                <input class="btn btn-green" type="button" value="Atualizar" onClick="fAtualizar();">
            </div>

            <logic:equal name="atualizar" value="true">
                <br/>
                <div class="alert alert-info" id="myAlert" style="text-align: center">
                    <a href="#" class="close">&times;</a>
                    <b>Alteração de SENHA Realizada com Sucesso!</b>
                </div>
            </logic:equal>
            <logic:equal name="atualizar" value="false">
                <br/>
                <div class="alert alert-danger alert-dismissible" id="myAlert" style="text-align: center">
                    <a href="#" class="close">&times;</a>
                    <b>Erro na Alteração. Favor verificar!</b>
                </div>
            </logic:equal>

            <%--<jsp:include page="footer.jsp"/>--%>
        </html:form>
    </body>
</html>
<script language="javascript">
    function fAtualizar() {
        var senhaAntiga = document.AlterarSenhaForm.senhaAntiga.value;
        var senhaNova = document.AlterarSenhaForm.senhaNova.value;
        if (senhaAntiga.length < 1) {
            alert("Deve ser informado sua SENHA ANTIGA!!");
            document.getElementById('senhaAntiga').focus();
        } else if (senhaNova.length < 1) {
            alert("Deve ser informado sua NOVA SENHA!!");
            document.getElementById('senhaNova').focus();
        } else if (senhaAntiga === senhaNova) {
            alert("A nova senha deve ser diferente da senha antiga!");
        } else {
            document.AlterarSenhaForm.action = "AlterarSenha.do?action=alterar";
            document.AlterarSenhaForm.submit();
        }
    }
</script>



