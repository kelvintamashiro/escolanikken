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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

        <!--Ajax-->
        <script type="text/javascript" src="js/ajax.js"></script>
    </head>
    <body onLoad="mudatam()">
        <html:form action="Comunicados.do" name="ComunicadosForm" type="br.com.Form.ComunicadosForm" scope="request">
            <jsp:include page="topo.jsp"/>
            <div class="container-fluid">
                <div class="row p-3" style="background-color: #F4F4F4" >
                    <div class="col-12 col-sm-1" align="center">
                        <a href="tela_interativa.jsp"><img src="imagens/bt_voltar_2.png" width="100px"/></a>
                    </div>
                    <div class="col-sm-10" align="center">
                        <logic:equal name="ComunicadosForm" property="tipoComunicado" value="PROFESSOR">
                            <h2>Comunicados Enviados - Atividades Realizadas</h2>
                        </logic:equal>
                        <logic:equal name="ComunicadosForm" property="tipoComunicado" value="DIRECAO">
                            <h2>Comunicados Enviados - Direção</h2>
                        </logic:equal>
                    </div>
                    <div class="col-sm-1">&nbsp;</div>
                </div>
            </div>

            <div class="form-group" style="padding-top: 20px">

                <table width="100%" class="table" border="0" align="center" style="font-size: 11px">
                    <tr>
                        <td width="5%">&nbsp;</td>
                        <td width="5%"><b>ID</b></td>
                        <td><b>Data Envio</b></td>
                        <td><b>Professor</b></td>
                        <td><b>Título</b></td>
                        <td><b>Série/Ano</b></td>
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
                                    <input class="btn btn-sm btn-dark" type="button" value="Visualizar" onClick="fVisualizar(<bean:write name="lista" property="idComunicado"/>);">   
                                </td>
                                <td>
                                    <input class="btn btn-sm btn-success" type="button" value="Alunos Enviados" onClick="fVisualizarAlunos(<bean:write name="lista" property="idComunicado"/>);">   
                                </td>
                                <td>
                                    <input class="btn btn-sm btn-danger" type="button" value="Excluir" onClick="fExcluir(<bean:write name="lista" property="idComunicado"/>, '<bean:write name="ComunicadosForm" property="tipoComunicado"/>');">   
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



