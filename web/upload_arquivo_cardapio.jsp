<%-- 
    Document   : upload_arquivo_cardapio
    Created on : 02/09/2020, 22:00:37
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
        <html:form action="UploadArquivo.do?action=enviarCardapio" method="post" enctype="multipart/form-data">

            <table border="0" align="center" style="margin-top: 20px; background-color: #EEDD82" width="100%">
                <tr>
                    <td width="10%" style="padding-left: 50px">
                        <a href="tela_interativa.jsp"><img src="imagens/bt_voltar_2.png" width="100px"/></a>
                    </td>
                    <td width="80%" align="center" colspan="2">
                        <h1>Upload de Imagem Cardápio</h1>
                    </td>
                    <td width="10%">&nbsp;</td>
                </tr>
            </table>
            <div class="form-group">
                <table width="80%" border="0" class="table-condensed" align="center">
                    <tr><td colspan="4">&nbsp;</td></tr>
                    <tr><td colspan="4">&nbsp;</td></tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td colspan="2">
                            Essa funcionalidade, irá enviar imagem do tipo JPG, PNG ao servidor
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td colspan="2">
                            Selecione o arquivo (JPG, PNG):
                            <html:file property="myFile" styleClass="form-control"/>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td colspan="2">
                            Mês do Cardápio:
                            <html:select name="UploadArquivoForm" property="nomeImagem" styleClass="form-control">
                                <html:option value="Janeiro">Janeiro</html:option>
                                <html:option value="Fevereiro">Fevereiro</html:option>
                                <html:option value="Marco">Março</html:option>
                                <html:option value="Abril">Abril</html:option>
                                <html:option value="Maio">Maio</html:option>
                                <html:option value="Junho">Junho</html:option>
                                <html:option value="Julho">Julho</html:option>
                                <html:option value="Agosto">Agosto</html:option>
                                <html:option value="Setembro">Setembro</html:option>
                                <html:option value="Outubro">Outubro</html:option>
                                <html:option value="Novembro">Novembro</html:option>
                                <html:option value="Dezembro">Dezembro</html:option>
                            </html:select>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td width="20%">&nbsp;</td>
                        <td width="30%">
                            <%--<html:submit value="Enviar" styleClass="btn btn-primary"/>--%>
                            <input type="submit" class="btn btn-success" value="Enviar"/>
                        </td>
                        <td width="30%">
                            <input class="btn btn-info" type="button" value="Listar Imagens" onClick="fListarImagem();">
                        </td>
                        <td width="20%">&nbsp;</td>
                    </tr>
                </table>
                <logic:present name="uploadDone" scope="request">
                    <div class="alert alert-success alert-dismissible" id="myAlert" style="text-align: center">
                        <a href="#" class="close">&times;</a>
                        <b>OK! Imagem inserida com sucesso!!</b>
                    </div>
                </logic:present>
            </div>
        </html:form>
    </body>
</html>

<script language="javascript">
    function fListarImagem() {
        document.UploadArquivoForm.action = "UploadArquivo.do?action=listarImagens";
        document.UploadArquivoForm.submit();
    }
</script>

