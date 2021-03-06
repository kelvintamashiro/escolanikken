<%-- 
    Document   : comunicados_pesquisar
    Created on : 28/04/2020, 22:33:56
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
        <!--<link rel="stylesheet" media="all" type="text/css" href="assets/css/mobile.css" />-->

        <!--Ajax-->
        <script type="text/javascript" src="js/ajax.js"></script>
    </head>
    <body onLoad="mudatam()">
        <html:form action="Comunicados.do" name="ComunicadosForm" type="br.com.Form.ComunicadosForm" scope="request">
            <jsp:include page="topo.jsp"/>

            <table border="0" align="center" style="margin-top: 20px; background-color: #ADD8E6" width="100%">
                <tr>
                    <td width="10%" style="padding-left: 50px">
                        <a href="tela_interativa.jsp"><img src="imagens/bt_voltar_2.png" width="100px"/></a>
                    </td>
                    <td width="80%" align="center">
                        <logic:equal name="ComunicadosForm" property="tipoComunicado" value="PROFESSOR">
                            <h1>Comunicados Enviados - Atividades Realizadas</h1>
                        </logic:equal>
                        <logic:equal name="ComunicadosForm" property="tipoComunicado" value="DIRECAO">
                            <h1>Comunicados Enviados - Dire��o</h1>
                        </logic:equal>
                    </td>
                    <td width="10%">&nbsp;</td>
                </tr>
            </table>

            <div class="form-group" style="padding-top: 20px">

                <table width="100%" class="table" border="0" align="center" style="font-size: 11px">
                    <tr>
                        <td width="5%">&nbsp;</td>
                        <td width="5%"><b>ID</b></td>
                        <td><b>Data Envio</b></td>
                        <td><b>Professor</b></td>
                        <td><b>T�tulo</b></td>
                        <td><b>S�rie/Ano</b></td>
                        <td width="10%">&nbsp;</td>
                        <td width="10%">&nbsp;</td>
                        <td width="10%">&nbsp;</td>
                        <td width="5%">&nbsp;</td>
                    </tr>
                    <logic:present name="listaComunicados" scope="request">
                        <logic:iterate id="lista" name="listaComunicados" scope="request">
                            <tr>
                                <td width="5%">&nbsp;</td>
                                <td><bean:write name="lista" property="idComunicado"/></td>
                                <td><bean:write name="lista" property="data"/></td>
                                <td><bean:write name="lista" property="nomeProfessor"/></td>
                                <td><bean:write name="lista" property="assunto"/></td>
                                <td>
                                    <bean:write name="lista" property="listaSerieAno"/>
                                </td>
                                <td>
                                    <input class="btn btn-info" type="button" value="Visualizar" onClick="fVisualizar(<bean:write name="lista" property="idComunicado"/>);">   
                                </td>
                                <td>
                                    <input class="btn btn-green" type="button" value="Alunos Enviados" onClick="fVisualizarAlunos(<bean:write name="lista" property="idComunicado"/>);">   
                                </td>
                                <td>
                                    <input class="btn btn-danger" type="button" value="Excluir" onClick="fExcluir(<bean:write name="lista" property="idComunicado"/>, '<bean:write name="ComunicadosForm" property="tipoComunicado"/>');">   
                                </td>
                                <td width="5%">&nbsp;</td>
                            </tr>
                        </logic:iterate>
                    </logic:present>
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
            document.ComunicadosForm.action = "Comunicados.do?action=salvar";
            document.ComunicadosForm.submit();
        }
    }

    function fVisualizar(idComunicado) {
//        window.open("Comunicados.do?action=visualizar&idComunicado=" + idComunicado);
        window.open("Comunicados.do?action=visualizar&idComunicado=" + idComunicado, "", "width=800,height=600,left=" + (document.documentElement.clientWidth - 800) / 2 + ",top=" + (document.documentElement.clientHeight - 600) / 2);
    }
    function fVisualizarAlunos(idComunicado) {
        window.open("Comunicados.do?action=visualizarAlunos&idComunicado=" + idComunicado, "", "width=800,height=600,left=" + (document.documentElement.clientWidth - 800) / 2 + ",top=" + (document.documentElement.clientHeight - 600) / 2);
    }

    function fExcluir(idComunicado, tipoComunicado) {
        if (confirm("Deseja realmente excluir esse Aviso?")) {
            document.ComunicadosForm.action = "Comunicados.do?action=excluir&idComunicado=" + idComunicado + "&tipoComunicado=" + tipoComunicado;
            document.ComunicadosForm.submit();
        }
    }
</script>



