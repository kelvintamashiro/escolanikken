<%-- 
    Document   : documentos_aluno
    Created on : 20/10/2020, 23:42:23
    Author     : macuser
--%>

<%-- 
    Document   : rematricula
    Created on : 19/10/2020, 23:26:57
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
        <title>Escola Nikken - Rematricula</title>
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
    <body style="padding-bottom: 150px">
        <logic:present name="errors">
            <script>
                alert('<bean:write name="errors"/>');
            </script>
        </logic:present>
        <%--<html:form action="Rematricula" name="RematriculaForm" type="br.com.Form.RematriculaForm" scope="request">--%>
        <html:form action="Rematricula.do" method="post" enctype="multipart/form-data">
            <jsp:include page="topo.jsp"/>

            <table border="0" align="center" style="margin-top: 20px; background-color: #ADD8E6" width="100%">
                <tr>
                    <td width="10%" style="padding-left: 50px">
                        <a href="javascript:history.back()"><img src="imagens/bt_voltar_2.png" width="100px"/></a>
                    </td>
                    <td width="80%" align="center">
                        <h1>Rematricula de Aluno - Documentos Zairyu</h1>
                    </td>
                    <td width="10%">&nbsp;</td>
                </tr>
            </table>

            <bean:define id="AlunoForm" name="RematriculaForm" property="alunoForm"/>
            <html:hidden name="AlunoForm" property="idPF"/>
            <html:hidden name="RematriculaForm" property="idDocumento"/>
            <table width="100%" style="background-color: #F5F5F5; height: 100px">
                <tr>
                    <td align="center">
                        <input class="btn btn-info" type="button" value="1.Informa��es Aluno" onClick="fInformacaoAluno(<bean:write name="AlunoForm" property="idPF"/>);">
                        <input class="btn btn-info" type="button" value="2.Envio ZairyuCard" onClick="fEnvioDocZairyu(<bean:write name="AlunoForm" property="idPF"/>);" style="border-bottom: 3px solid black; color: white">
                        <input class="btn btn-info" type="button" value="3.Envio MyNumber" onClick="fEnvioDocMyNumber(<bean:write name="AlunoForm" property="idPF"/>);">
                        <input class="btn btn-info" type="button" value="4.Envio Passaporte" onClick="fEnvioDocPassaporte(<bean:write name="AlunoForm" property="idPF"/>);">
                        <input class="btn btn-info" type="button" value="5.Envio de Documentos Escolares" onClick="fEnvioDocumentosEscolares(<bean:write name="AlunoForm" property="idPF"/>);">
                    </td>
                </tr>
            </table>

            <div class="form-group">
                <table border="0" align="center" style="margin-top: 20px;" width="80%">
                    <tr>
                        <td align="center" style="color: red">
                            Nessa �rea envie em anexo os documentos solicitados
                        </td>
                    </tr>
                </table>
            </div>
            <div class="form-group">
                <table border="0" align="center" style="margin-top: 20px;" width="80%">
                    <tr>
                        <td>
                            <div class="col-lg-12">
                                <label for="usr">ID: <b><bean:write name="AlunoForm" property="idPF"/></b></label>
                            </div>
                        </td>
                        <td>
                            <div class="col-lg-12">
                                <label for="usr">Nome do Aluno: <b><bean:write name="AlunoForm" property="nome"/></b></label>

                            </div>
                        </td>
                        <td>
                            <div class="col-lg-12">
                                <label for="usr">N�mero ID do Aluno: <b><bean:write name="AlunoForm" property="numeroIDAluno"/></b></label>
                            </div>
                        </td>
                        <td width="25%">
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </div>

            <div class="form-group">
                <table border="0" align="center" width="80%" style="background-color: #FFFAF0;">
                    <tr>
                        <td colspan="3" align="center" style="padding: 30px">
                            <b>Envio dos Documentos: Zairyu Card</b>
                        </td>
                    </tr>
                    <tr>
                        <td width="33%">
                            <div class="col-lg-12">
                                <label for="usr">Zairyu Card Aluno</label>
                                <html:file name="RematriculaForm" property="zairyuCardAluno" styleId="zairyuCardAluno" styleClass="form-control"/>
                            </div>
                        </td>
                        <td width="33%">
                            <div class="col-lg-12">
                                <label for="usr">Zairyu Card Pai</label>
                                <html:file name="RematriculaForm" property="zairyuCardPai" styleClass="form-control"/>
                            </div>
                        </td>
                        <td width="33%">
                            <div class="col-lg-12">
                                <label for="usr">Zairyu Card M�e</label>
                                <html:file name="RematriculaForm" property="zairyuCardMae" styleClass="form-control"/>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td width="33%" align="center">
                            <div class="col-lg-12">
                                <logic:notEqual name="RematriculaForm" property="docZairyuCardAluno" value="">
                                    <a href="documentos_aluno/<bean:write name="RematriculaForm" property="docZairyuCardAluno"/>" target="_blank" class="btn btn-info">
                                        Visualizar
                                    </a>
                                    <a href="javascript:fExcluir(<bean:write name="RematriculaForm" property="idDocumento"/>, <bean:write name="AlunoForm" property="idPF"/>, 'docZairyuCardAluno')" class="btn btn-danger">
                                        Excluir
                                    </a>
                                </logic:notEqual>
                                <logic:equal name="RematriculaForm" property="docZairyuCardAluno" value="">
                                    <span style="color: red">Documento n�o enviado</span>
                                </logic:equal>
                            </div>
                        </td>
                        <td width="33%" align="center">
                            <div class="col-lg-12">
                                <logic:notEqual name="RematriculaForm" property="docZairyuCardPai" value="">
                                    <a href="documentos_aluno/<bean:write name="RematriculaForm" property="docZairyuCardPai"/>" target="_blank" class="btn btn-info">
                                        Visualizar
                                    </a>
                                    <a href="javascript:fExcluir(<bean:write name="RematriculaForm" property="idDocumento"/>, <bean:write name="AlunoForm" property="idPF"/>, 'docZairyuCardPai')" class="btn btn-danger">
                                        Excluir
                                    </a>
                                </logic:notEqual>
                                <logic:equal name="RematriculaForm" property="docZairyuCardPai" value="">
                                    <span style="color: red">Documento n�o enviado</span>
                                </logic:equal>
                            </div>
                        </td>
                        <td width="33%" align="center">
                            <div class="col-lg-12">
                                <logic:notEqual name="RematriculaForm" property="docZairyuCardMae" value="">
                                    <a href="documentos_aluno/<bean:write name="RematriculaForm" property="docZairyuCardMae"/>" target="_blank" class="btn btn-info">
                                        Visualizar
                                    </a>
                                    <a href="javascript:fExcluir(<bean:write name="RematriculaForm" property="idDocumento"/>, <bean:write name="AlunoForm" property="idPF"/>, 'docZairyuCardMae')" class="btn btn-danger">
                                        Excluir
                                    </a>
                                </logic:notEqual>
                                <logic:equal name="RematriculaForm" property="docZairyuCardMae" value="">
                                    <span style="color: red">Documento n�o enviado</span>
                                </logic:equal>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </div>

            <%--            <div class="form-group">
                            <table border="0" align="center" width="80%" style="background-color: #F0FFF0;">
                                <tr>
                                    <td colspan="3" align="center" style="padding: 30px">
                                        <b>Envio dos Documentos: My Number</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="33%">
                                        <div class="col-lg-12">
                                            <label for="usr">My Number Aluno</label>
                                            <html:file name="RematriculaForm" property="myNumberAluno" styleClass="form-control"/>
                                        </div>
                                    </td>
                                    <td width="33%">
                                        <div class="col-lg-12">
                                            <label for="usr">My Number Pai</label>
                                            <html:file name="RematriculaForm" property="myNumberPai" styleClass="form-control"/>
                                        </div>
                                    </td>
                                    <td width="33%">
                                        <div class="col-lg-12">
                                            <label for="usr">My Number M�e</label>
                                            <html:file name="RematriculaForm" property="myNumberMae" styleClass="form-control"/>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td width="33%" align="center">
                                        <div class="col-lg-12">
                                            <logic:notEqual name="RematriculaForm" property="docMyNumberAluno" value="">
                                                <a href="documentos_aluno/<bean:write name="RematriculaForm" property="docMyNumberAluno"/>" target="_blank" class="btn btn-info">
                                                    Visualizar
                                                </a>
                                                <a href="javascript:fExcluir(<bean:write name="RematriculaForm" property="idDocumento"/>, <bean:write name="AlunoForm" property="idPF"/>, 'docMyNumberAluno')" class="btn btn-danger">
                                                    Excluir
                                                </a>
                                            </logic:notEqual>
                                            <logic:equal name="RematriculaForm" property="docMyNumberAluno" value="">
                                                <span style="color: red">Documento n�o enviado</span>
                                            </logic:equal>
                                        </div>
                                    </td>
                                    <td width="33%" align="center">
                                        <div class="col-lg-12">
                                            <logic:notEqual name="RematriculaForm" property="docMyNumberPai" value="">
                                                <a href="documentos_aluno/<bean:write name="RematriculaForm" property="docMyNumberPai"/>" target="_blank" class="btn btn-info">
                                                    Visualizar
                                                </a>
                                                <a href="javascript:fExcluir(<bean:write name="RematriculaForm" property="idDocumento"/>, <bean:write name="AlunoForm" property="idPF"/>, 'docMyNumberPai')" class="btn btn-danger">
                                                    Excluir
                                                </a>
                                            </logic:notEqual>
                                            <logic:equal name="RematriculaForm" property="docMyNumberPai" value="">
                                                <span style="color: red">Documento n�o enviado</span>
                                            </logic:equal>
                                        </div>
                                    </td>
                                    <td width="33%" align="center">
                                        <div class="col-lg-12">
                                            <logic:notEqual name="RematriculaForm" property="docMyNumberMae" value="">
                                                <a href="documentos_aluno/<bean:write name="RematriculaForm" property="docMyNumberMae"/>" target="_blank" class="btn btn-info">
                                                    Visualizar
                                                </a>
                                                <a href="javascript:fExcluir(<bean:write name="RematriculaForm" property="idDocumento"/>, <bean:write name="AlunoForm" property="idPF"/>, 'docMyNumberMae')" class="btn btn-danger">
                                                    Excluir
                                                </a>
                                            </logic:notEqual>
                                            <logic:equal name="RematriculaForm" property="docMyNumberMae" value="">
                                                <span style="color: red">Documento n�o enviado</span>
                                            </logic:equal>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3">
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                        </div>

            <div class="form-group">
                <table border="0" align="center" width="80%" style="background-color: #FFF0F5;">
                    <tr>
                        <td colspan="3" align="center" style="padding: 30px">
                            <b>Envio dos Documentos: Passaporte</b>
                        </td>
                    </tr>
                    <tr>
                        <td width="33%">
                            <div class="col-lg-12">
                                <label for="usr">Passaporte Aluno</label>
                                <html:file name="RematriculaForm" property="passaporteAluno" styleClass="form-control"/>
                            </div>
                        </td>
                        <td width="33%">
                            <div class="col-lg-12">
                                <label for="usr">Passaporte Pai</label>
                                <html:file name="RematriculaForm" property="passaportePai" styleClass="form-control"/>
                            </div>
                        </td>
                        <td width="33%">
                            <div class="col-lg-12">
                                <label for="usr">Passaporte M�e</label>
                                <html:file name="RematriculaForm" property="passaporteMae" styleClass="form-control"/>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td width="33%" align="center">
                            <div class="col-lg-12">
                                <logic:notEqual name="RematriculaForm" property="docPassaporteAluno" value="">
                                    <a href="documentos_aluno/<bean:write name="RematriculaForm" property="docPassaporteAluno"/>" target="_blank" class="btn btn-info">
                                        Visualizar
                                    </a>
                                    <a href="javascript:fExcluir(<bean:write name="RematriculaForm" property="idDocumento"/>, <bean:write name="AlunoForm" property="idPF"/>, 'docPassaporteAluno')" class="btn btn-danger">
                                        Excluir
                                    </a>
                                </logic:notEqual>
                                <logic:equal name="RematriculaForm" property="docPassaporteAluno" value="">
                                    <span style="color: red">Documento n�o enviado</span>
                                </logic:equal>
                            </div>
                        </td>
                        <td width="33%" align="center">
                            <div class="col-lg-12">
                                <logic:notEqual name="RematriculaForm" property="docPassaportePai" value="">
                                    <a href="documentos_aluno/<bean:write name="RematriculaForm" property="docPassaportePai"/>" target="_blank" class="btn btn-info">
                                        Visualizar
                                    </a>
                                    <a href="javascript:fExcluir(<bean:write name="RematriculaForm" property="idDocumento"/>, <bean:write name="AlunoForm" property="idPF"/>, 'docPassaportePai')" class="btn btn-danger">
                                        Excluir
                                    </a>
                                </logic:notEqual>
                                <logic:equal name="RematriculaForm" property="docPassaportePai" value="">
                                    <span style="color: red">Documento n�o enviado</span>
                                </logic:equal>
                            </div>
                        </td>
                        <td width="33%" align="center">
                            <div class="col-lg-12">
                                <logic:notEqual name="RematriculaForm" property="docPassaporteMae" value="">
                                    <a href="documentos_aluno/<bean:write name="RematriculaForm" property="docPassaporteMae"/>" target="_blank" class="btn btn-info">
                                        Visualizar
                                    </a>
                                    <a href="javascript:fExcluir(<bean:write name="RematriculaForm" property="idDocumento"/>, <bean:write name="AlunoForm" property="idPF"/>, 'docPassaporteMae')" class="btn btn-danger">
                                        Excluir
                                    </a>
                                </logic:notEqual>
                                <logic:equal name="RematriculaForm" property="docPassaporteMae" value="">
                                    <span style="color: red">Documento n�o enviado</span>
                                </logic:equal>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </div>--%>

            <div align="center">
                <br/>
                <br/>
                <input class="btn btn-green" type="button" value="Enviar Documentos" onClick="fSalvar(<bean:write name="AlunoForm" property="idPF"/>);">
            </div>


        </html:form>
    </body>
</html>
<script language="javascript">
    function fSalvar(idPF) {
        var uploadAluno = document.RematriculaForm.zairyuCardAluno;
        var uploadPai = document.RematriculaForm.zairyuCardPai;
        var uploadMae = document.RematriculaForm.zairyuCardMae;

        var sizeAluno = 0;
        var sizePai = 0;
        var sizeMae = 0;
        if (document.RematriculaForm.zairyuCardAluno.value != "") {
            sizeAluno = uploadAluno.files[0].size;
        }
        if (document.RematriculaForm.zairyuCardPai.value != "") {
            sizePai = uploadPai.files[0].size;
        }
        if (document.RematriculaForm.zairyuCardMae.value != "") {
            sizeMae = uploadMae.files[0].size;
        }
        var sizeMb = 1048576;
        if (sizeAluno > sizeMb || sizePai > sizeMb || sizeMae > sizeMb) {
            alert("Favor informar o documento de at� 1 MB de tamanho.")
        } else {
            document.RematriculaForm.action = "Rematricula.do?action=salvarDocZairyu&idPF=" + idPF;
            document.RematriculaForm.submit();
        }
    }

    function fInformacaoAluno(idPF) {
        document.RematriculaForm.action = "Rematricula.do?idPF=" + idPF;
        document.RematriculaForm.submit();
    }

    function fEnvioDocZairyu(idPF) {
        document.RematriculaForm.action = "Rematricula.do?action=pageDocZairyu&idPF=" + idPF;
        document.RematriculaForm.submit();
    }
    function fEnvioDocMyNumber(idPF) {
        document.RematriculaForm.action = "Rematricula.do?action=pageDocMyNumber&idPF=" + idPF;
        document.RematriculaForm.submit();
    }
    function fEnvioDocPassaporte(idPF) {
        document.RematriculaForm.action = "Rematricula.do?action=pageDocPassaporte&idPF=" + idPF;
        document.RematriculaForm.submit();
    }
    function fEnvioDocumentosEscolares(idPF) {
        document.RematriculaForm.action = "Rematricula.do?action=pageDocumentosEscolares&idPF=" + idPF;
        document.RematriculaForm.submit();
    }
    function fExcluir(idDocumento, idPF, tipo) {
        if (confirm("Deseja realmente excluir?")) {
            document.RematriculaForm.action = "Rematricula.do?action=excluirDocZairyu&idDocumento=" + idDocumento + "&idPF=" + idPF + "&tipoDocumento=" + tipo;
            document.RematriculaForm.submit();
        }
    }

</script>


