<%-- 
    Document   : comunicados_por_alunos
    Created on : 06/08/2020, 12:21:50
    Author     : macuser
--%>

<%-- 
    Document   : comunicados
    Created on : 10/04/2020, 08:56:38
    Author     : macuser
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<html:html>
    <head>
        <title>Escola Nikken - Comunicados</title>
        <link rel="shortcut icon" href="imagens/favico.png" />
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <script language="javascript1.2" src="js/mizanscene.js"></script>
        <script type="text/javascript" src="js/JQuery/js/jquery-1.3.2.js"></script>

        <!--<link rel="stylesheet" media="all" type="text/css" href="assets/css/reset.css" />-->
        <link rel="stylesheet" media="all" type="text/css" href="assets/css/fix.css" />
        <link rel="stylesheet" media="all" type="text/css" href="assets/css/style_original.css" />
        <link rel="stylesheet" media="all" type="text/css" href="assets/css/mobile.css" />

        <!--Ajax-->
        <script type="text/javascript" src="js/ajax.js"></script>

        <script>
            function inverte() {
                var checks = document.getElementsByTagName("input");
                for (var i = 0; i < checks.length; i++) {
                    var check = checks[i];
                    if (check.type == "checkbox") {
                        check.checked = !check.checked;
                    }
                }
            }

            $(document).ready(function () {
                $(".close").click(function () {
                    $("#myAlert").alert("close");
                });
            });
        </script>

        <script type="text/javascript" src="js/tinymce/js/tinymce/tinymce.min.js"></script>
        <script>
            tinymce.init({
                selector: 'textarea',
                height: 500,
                plugins: [
                    "advlist autolink lists link image charmap print preview anchor",
                    "searchreplace visualblocks code fullscreen",
                    "insertdatetime media table contextmenu paste imagetools"
                ],
                toolbar: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image",
                // imagetools_cors_hosts: ['www.tinymce.com', 'codepen.io'],
                content_css: [
                    '//fonts.googleapis.com/css?family=Lato:300,300i,400,400i',
                    '//www.tinymce.com/css/codepen.min.css'
                ]
            });
        </script>
    </head>
    <body onLoad="mudatam()">
        <logic:present name="errors">
            <script>
                alert('<bean:write name="errors"/>');
            </script>
        </logic:present>
        <html:form action="Comunicados.do" name="ComunicadosForm" type="br.com.Form.ComunicadosForm" scope="request">
            <jsp:include page="topo.jsp"/>

            <table border="0" align="center" style="margin-top: 20px; background-color: #ADD8E6" width="100%">
                <tr>
                    <td width="10%" style="padding-left: 50px">
                        <a href="tela_interativa.jsp"><img src="imagens/bt_voltar_2.png" width="100px"/></a>
                    </td>
                    <td width="80%" align="center">
                        <h1>Comunicados - Direção</h1>
                    </td>
                    <td width="10%">&nbsp;</td>
                </tr>
            </table>

            <div class="form-group">
                <table border="0" align="center" style="margin-top: 20px;" width="80%">
                    <tr>
                        <td width="40%">

                        </td>
                    </tr>
                </table>
            </div>


            <div class="form-group">
                <table width="100%" class="table" border="0">
                    <tr>
                        <td colspan="3" align="center">
                            <b>Escolha para quem deseja enviar o comunicado</b>
                        </td>
                    </tr>
                </table>
                <table width="80%" class="table-condensed" border="0" align="center">
                    <tr>
                        <td valign="top">
                            <table width="100%" style="font-size: 11px" border="0">
                                <tr>
                                    <td width="10%">&nbsp;</td>
                                    <td colspan="2">
                                        <b>Nome - Séries/Ano</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3">&nbsp;</td>
                                </tr>
                                <logic:iterate name="listaAlunos" id="lista" scope="session">
                                    <tr style="border-bottom: 1px solid black">
                                        <td width="10%">&nbsp;</td>
                                        <td width="90%" colspan="2">
                                            <html:multibox name="ComunicadosForm" property="selectedOptions"> 
                                                <bean:write name="lista" property="idPF"/>-<bean:write name="lista" property="serieAno"/>
                                            </html:multibox>
                                            <bean:write name="lista" property="nome"/> - <bean:write name="lista" property="dsSerieAno"/>
                                        </td>
                                    </tr>
                                </logic:iterate>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>
                                        <input type="button" class="botao" name="Submit" value="+ / -" onClick="inverte()">
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>
                        </td>
                        <td valign="top">
                            <table width="100%" class="table-condensed" border="0">
                                <tr>
                                    <td width="20%" align="right"><b>Título:</b></td>
                                    <td colspan="2"><html:text name="ComunicadosForm" property="assunto" styleClass="form-control"/></td>
                                </tr>
                                <tr>
                                    <td width="20%" align="right" valign="top"><b>Descrição:</b></td>
                                    <td colspan="2"><html:textarea name="ComunicadosForm" property="descricao" rows="20" cols="70" styleClass="form-control"/></td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td width="40%">
                                        <input type="button" name="Button"  class="btn btn-green" value="Salvar" onClick="fSalvar();">
                                    </td>
                                    <td width="40%">
                                        <input type="button" name="Button"  class="btn btn-grey" value="Pesquisar" onClick="fPesquisar();">
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </div>

            <br/>
            <br/>
            <logic:present name="salvo" scope="request">
                <div class="alert alert-success alert-dismissible" id="myAlert" style="text-align: center">
                    <a href="#" class="close">&times;</a>
                    <b>OK! Comunicado salvo com sucesso!!</b>
                </div>
            </logic:present>
        </html:form>
    </body>
</html:html>

<script language="JavaScript">
    function fSalvar() {
        if (document.ComunicadosForm.assunto.value === "") {
            alert("Favor informar o ASSUNTO do comunicado!");
            document.ComunicadosForm.assunto.focus();
        } else {
            document.ComunicadosForm.action = "Comunicados.do?action=salvarPorAluno&tipoComunicado=DIRECAO";
            document.ComunicadosForm.submit();
        }
    }

    function fPesquisar() {
        document.ComunicadosForm.action = "Comunicados.do?action=pesquisar&tipoComunicado=DIRECAO";
        document.ComunicadosForm.submit();
    }

</script>



