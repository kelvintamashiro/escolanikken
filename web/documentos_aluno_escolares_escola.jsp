<%-- 
    Document   : documentos_aluno_escolares_escola
    Created on : 30/10/2020, 21:17:08
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
        <html:form action="Rematricula.do?action=salvarDocumentosAluno" method="post" enctype="multipart/form-data">
            <jsp:include page="topo.jsp"/>

            <table border="0" align="center" style="margin-top: 20px; background-color: #ADD8E6" width="100%">
                <tr>
                    <td width="10%" style="padding-left: 50px">
                        <a href="javascript:history.back()"><img src="imagens/bt_voltar_2.png" width="100px"/></a>
                    </td>
                    <td width="80%" align="center">
                        <h1>Informações Aluno - Documentos Escolares</h1>
                    </td>
                    <td width="10%">&nbsp;</td>
                </tr>
            </table>

            <bean:define id="AlunoForm" name="RematriculaForm" property="alunoForm"/>
            <html:hidden name="AlunoForm" property="idPF"/>
            <html:hidden name="RematriculaForm" property="idDocumento"/>
            <logic:notEqual name="tipoPerfil" scope="session" value="aluno">
                <logic:notEqual name="tipoPerfil" scope="session" value="professor">
                    <table width="100%" style="background-color: #F5F5F5; height: 100px">
                        <tr>
                            <td align="center">
                                <input class="btn btn-info" type="button" value="1.Informações Aluno" onClick="fInformacaoAluno(<bean:write name="AlunoForm" property="idPF"/>);">
                                <input class="btn btn-info" type="button" value="2.Doc ZairyuCard" onClick="fEnvioDocZairyu(<bean:write name="AlunoForm" property="idPF"/>);">
                                <input class="btn btn-info" type="button" value="3.Doc MyNumber" onClick="fEnvioDocMyNumber(<bean:write name="AlunoForm" property="idPF"/>);">
                                <input class="btn btn-info" type="button" value="4.Doc Passaporte" onClick="fEnvioDocPassaporte(<bean:write name="AlunoForm" property="idPF"/>);">
                                <input class="btn btn-info" type="button" value="5.Doc Escolares/Pessoais" onClick="fEnvioDocumentosEscolares(<bean:write name="AlunoForm" property="idPF"/>);" style="border-bottom: 3px solid black; color: white">
                            </td>
                        </tr>
                    </table>
                </logic:notEqual>
            </logic:notEqual>

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
                                <label for="usr">Número ID do Aluno: <b><bean:write name="AlunoForm" property="numeroIDAluno"/></b></label>
                            </div>
                        </td>
                        <td width="25%">
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </div>


            <div class="form-group">
                <table border="0" align="center" width="80%" style="background-color: #F5F5DC;">
                    <tr>
                        <td colspan="2" align="center" style="padding: 30px">
                            <b>Documentos: Dados Escolares</b>
                        </td>
                    </tr>
                    <tr>
                        <td width="50%">
                            <div class="col-lg-12">
                                <label for="usr">Histórico Escolar</label>
                                <html:file name="RematriculaForm" property="historicoEscolar" styleClass="form-control" disabled="true"/>
                            </div>
                        </td>
                        <td width="50%">
                            <div class="col-lg-12">
                                <label for="usr">Transferência Escolar</label>
                                <html:file name="RematriculaForm" property="transferenciaEscolar" styleClass="form-control" disabled="true"/>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td width="50%" align="center">
                            <div class="col-lg-12">
                                <logic:notEqual name="RematriculaForm" property="docHistoricoEscolar" value="">
                                    <a href="documentos_aluno/<bean:write name="RematriculaForm" property="docHistoricoEscolar"/>" target="_blank" class="btn btn-info">
                                        Visualizar
                                    </a>
<!--                                    <a href="javascript:fExcluir(<bean:write name="RematriculaForm" property="idDocumento"/>, <bean:write name="AlunoForm" property="idPF"/>, 'docHistoricoEscolar')" class="btn btn-danger">
                                        Excluir
                                    </a>-->
                                </logic:notEqual>
                                <logic:equal name="RematriculaForm" property="docHistoricoEscolar" value="">
                                    <span style="color: red">Documento não enviado</span>
                                </logic:equal>
                            </div>
                        </td>
                        <td width="50%" align="center">
                            <div class="col-lg-12">
                                <logic:notEqual name="RematriculaForm" property="docTransferenciaEscolar" value="">
                                    <a href="documentos_aluno/<bean:write name="RematriculaForm" property="docTransferenciaEscolar"/>" target="_blank" class="btn btn-info">
                                        Visualizar
                                    </a>
<!--                                    <a href="javascript:fExcluir(<bean:write name="RematriculaForm" property="idDocumento"/>, <bean:write name="AlunoForm" property="idPF"/>, 'docTransferenciaEscolar')" class="btn btn-danger">
                                        Excluir
                                    </a>-->
                                </logic:notEqual>
                                <logic:equal name="RematriculaForm" property="docTransferenciaEscolar" value="">
                                    <span style="color: red">Documento não enviado</span>
                                </logic:equal>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </div>

            <div class="form-group">
                <table border="0" align="center" width="80%" style="background-color: #F0FFFF;">
                    <tr>
                        <td colspan="2" align="center" style="padding: 30px">
                            <b>Documentos: Dados Pessoais</b>
                        </td>
                    </tr>
                    <tr>
                        <td width="50%">
                            <div class="col-lg-12">
                                <label for="usr">Foto 3x4</label>
                                <html:file name="RematriculaForm" property="foto3x4" styleClass="form-control" disabled="true"/>
                            </div>
                        </td>
                        <td width="50%">
                            <div class="col-lg-12">
                                <label for="usr">Caderneta Bancária</label>
                                <html:file name="RematriculaForm" property="cadernetaBancaria" styleClass="form-control" disabled="true"/>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td width="50%" align="center">
                            <div class="col-lg-12">
                                <logic:notEqual name="RematriculaForm" property="docFoto3x4" value="">
                                    <a href="documentos_aluno/<bean:write name="RematriculaForm" property="docFoto3x4"/>" target="_blank" class="btn btn-info">
                                        Visualizar
                                    </a>
<!--                                    <a href="javascript:fExcluir(<bean:write name="RematriculaForm" property="idDocumento"/>, <bean:write name="AlunoForm" property="idPF"/>, 'docFoto3x4')" class="btn btn-danger">
                                        Excluir
                                    </a>-->
                                </logic:notEqual>
                                <logic:equal name="RematriculaForm" property="docFoto3x4" value="">
                                    <span style="color: red">Documento não enviado</span>
                                </logic:equal>
                            </div>
                        </td>
                        <td width="50%" align="center">
                            <div class="col-lg-12">
                                <logic:notEqual name="RematriculaForm" property="docCadernetaBancaria" value="">
                                    <a href="documentos_aluno/<bean:write name="RematriculaForm" property="docCadernetaBancaria"/>" target="_blank" class="btn btn-info">
                                        Visualizar
                                    </a>
<!--                                    <a href="javascript:fExcluir(<bean:write name="RematriculaForm" property="idDocumento"/>, <bean:write name="AlunoForm" property="idPF"/>, 'docCadernetaBancaria')" class="btn btn-danger">
                                        Excluir
                                    </a>-->
                                </logic:notEqual>
                                <logic:equal name="RematriculaForm" property="docCadernetaBancaria" value="">
                                    <span style="color: red">Documento não enviado</span>
                                </logic:equal>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </div>

            <!--            <div align="center">
                            <br/>
                            <br/>
                            <input class="btn btn-green" type="button" value="Enviar Documentos" onClick="fSalvar(<bean:write name="AlunoForm" property="idPF"/>);">
                        </div>-->


        </html:form>
    </body>
</html>
<script language="javascript">
    function fSalvar(idPF) {
        var uploadHist = document.RematriculaForm.historicoEscolar;
        var uploadTransf = document.RematriculaForm.transferenciaEscolar;
        var uploadFoto = document.RematriculaForm.foto3x4;
        var uploadCaderneta = document.RematriculaForm.cadernetaBancaria;

        var sizeHist = 0;
        var sizeTransf = 0;
        var sizeFoto = 0;
        var sizeCaderneta = 0;
        if (document.RematriculaForm.historicoEscolar.value != "") {
            sizeHist = uploadHist.files[0].size;
        }
        if (document.RematriculaForm.transferenciaEscolar.value != "") {
            sizeTransf = uploadTransf.files[0].size;
        }
        if (document.RematriculaForm.foto3x4.value != "") {
            sizeFoto = uploadFoto.files[0].size;
        }
        if (document.RematriculaForm.cadernetaBancaria.value != "") {
            sizeFoto = uploadCaderneta.files[0].size;
        }
        var sizeMb = 1048576;
        if (sizeHist > sizeMb || sizeTransf > sizeMb || sizeFoto > sizeMb || sizeCaderneta > sizeMb) {
            alert("Favor informar o documento de até 1 MB de tamanho.")
        } else {
            document.RematriculaForm.action = "Rematricula.do?action=salvarDocumentosEscolares&idPF=" + idPF;
            document.RematriculaForm.submit();
        }
    }

    function fInformacaoAluno(idPF) {
        document.RematriculaForm.action = "Aluno.do?action=pageAtualizar&idPF=" + idPF;
        document.RematriculaForm.submit();
    }

    function fEnvioDocZairyu(idPF) {
        document.RematriculaForm.action = "Aluno.do?action=pageDocZairyu&idPF=" + idPF;
        document.RematriculaForm.submit();
    }
    function fEnvioDocMyNumber(idPF) {
        document.RematriculaForm.action = "Aluno.do?action=pageDocMyNumber&idPF=" + idPF;
        document.RematriculaForm.submit();
    }
    function fEnvioDocPassaporte(idPF) {
        document.RematriculaForm.action = "Aluno.do?action=pageDocPassaporte&idPF=" + idPF;
        document.RematriculaForm.submit();
    }
    function fEnvioDocumentosEscolares(idPF) {
        document.RematriculaForm.action = "Aluno.do?action=pageDocumentosEscolares&idPF=" + idPF;
        document.RematriculaForm.submit();
    }

//    function fExcluir(idDocumento, idPF, tipo) {
//        if (confirm("Deseja realmente excluir?")) {
//            document.RematriculaForm.action = "Rematricula.do?action=excluirDocumentosEscolares&idDocumento=" + idDocumento + "&idPF=" + idPF + "&tipoDocumento=" + tipo;
//            document.RematriculaForm.submit();
//        }
//    }

</script>



