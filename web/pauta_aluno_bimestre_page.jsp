<%-- 
    Document   : pauta_aluno_bimestre_page
    Created on : 16 de jul de 2021, 21:44:43
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
        <title>Escola Nikken</title>
        <link rel="shortcut icon" href="imagens/favico.png" />
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <script language="javascript1.2" src="js/mizanscene.js"></script>
        <script type="text/javascript" src="js/JQuery/js/jquery-1.3.2.js"></script>

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
        <html:form action="Pauta" name="PautaForm" type="br.com.Form.PautaForm" scope="request">

            <table border="0" align="center" style="margin-top: 20px; background-color: #ADD8E6" width="100%">
                <tr>
                    <td width="10%" style="padding-left: 50px">
                        <a href="gerenciador_pauta.jsp"><img src="imagens/bt_voltar_2.png" width="100px"/></a>
                    </td>
                    <td width="80%" align="center">
                        <h2>Pauta de Reuni�o por Aluno</h2>
                    </td>
                    <td width="10%">&nbsp;</td>
                </tr>
            </table>

            <div class="form-group">
                <table border="0" align="center" style="margin-top: 20px;" width="80%">
                    <tr>
                        <!--1 coluna-->
                        <td width="50%">
                            <table width="100%">
                                <tr>
                                    <td colspan="2">
                                        <div class="col-lg-12">
                                            <label for="usr">S�rie/Ano:</label>
                                            <html:select name="PautaForm" property="idSerieAno" styleId="idSerieAno" styleClass="form-control">
                                                <html:option value="">Selecione S�rie/Ano</html:option>
                                                <html:option value="11">Infantil I</html:option>
                                                <html:option value="12">Infantil II</html:option>
                                                <html:option value="13">Infantil III</html:option>
                                                <html:option value="1">1� ano</html:option>
                                                <html:option value="2">2� ano</html:option>
                                                <html:option value="3">3� ano</html:option>
                                                <html:option value="4">4� ano</html:option>
                                                <html:option value="5">5� ano</html:option>
                                                <html:option value="6">6� ano</html:option>
                                                <html:option value="7">7� ano</html:option>
                                                <html:option value="8">8� ano</html:option>
                                                <html:option value="9">9� ano</html:option>
                                                <html:option value="10">1� s�rie</html:option>
                                                <html:option value="20">2� s�rie</html:option>
                                                <html:option value="30">3� s�rie</html:option>
                                            </html:select>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <div class="col-lg-12">
                                            <label for="usr">Bimestre:</label>
                                            <html:select name="PautaForm" property="nrBimestre" styleId="nrBimestre" styleClass="form-control" onchange="fCarregarAlunos()">
                                                <html:option value="0">Selecione</html:option>
                                                <html:option value="1">1� Bimestre</html:option>
                                                <html:option value="2">2� Bimestre</html:option>
                                                <html:option value="3">3� Bimestre</html:option>
                                                <html:option value="4">4� Bimestre</html:option>
                                            </html:select>
                                        </div>
                                    </td>
                                </tr>
                                <logic:present name="listaAlunos" scope="session">
                                    <tr>
                                        <td colspan="2">
                                            <div class="col-lg-12">
                                                <label for="usr">Aluno:</label>

                                                <html:select name="PautaForm" property="idAluno" styleId="idAluno" styleClass="form-control">
                                                    <html:option value="0">Selecione</html:option>
                                                    <html:options collection="listaAlunos" property="idAluno" labelProperty="nome"></html:options>
                                                </html:select>
                                            </div>
                                        </td>
                                    </tr>
                                </logic:present>
                                <tr>
                                    <td>
                                        <div class="col-lg-12">
                                            <label for="usr">&nbsp;</label>
                                            <input class="btn btn-green" type="button" value="Montar Pauta do Aluno" onClick="fMontarPauta()">
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </td>

                        <!--2 coluna-->
                        <td valign="top" style="background-color: #FFFFE0" width="50%">
                            <table width="90%" border="0" style="font-size: 10px" align="center">
                                <tr>
                                    <td align="center" style="color: #4169E1; padding-top: 20px; font-size: 14px" colspan="6">
                                        <strong>Pauta de Reuni�o Cadastrada por S�rie</strong>
                                        <hr/>
                                    </td>
                                </tr>
                                <logic:present name="listaPautasCadastradas" scope="request">
                                    <tr>
                                        <td><strong>Nome</strong></td>
                                        <td><strong>Bimestre</strong></td>
                                        <td><strong>Ano</strong></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <logic:iterate name="listaPautasCadastradas" id="listaCadastrado" scope="request">
                                        <tr>
                                            <td><bean:write name="listaCadastrado" property="nomeAluno"/></td>
                                            <td><bean:write name="listaCadastrado" property="nrBimestre"/>� Bimestre</td>
                                            <td><bean:write name="listaCadastrado" property="ano"/></td>
                                            <td style="padding: 2px"><input style="font-size: 10px" class="btn btn-info" type="button" value="Visualizar" onClick="fVisualizar(<bean:write name="listaCadastrado" property="idPauta"/>)"></td>
                                            <td style="padding: 2px"><input style="font-size: 10px; color: white" class="btn btn-danger" type="button" value="Excluir" onClick="fExcluir(<bean:write name="listaCadastrado" property="idPauta"/>)"></td>
                                        </tr>
                                    </logic:iterate>
                                </logic:present>
                            </table>
                        </td>
                    </tr>


                </table>
            </div>
            <logic:equal name="salvo" value="true">
                <div class="alert alert-info" id="myAlert" style="text-align: center">
                    <b><bean:write name="errors"/></b>
                </div>
            </logic:equal>
            <logic:equal name="salvo" value="false">
                <div class="alert alert-danger alert-dismissible" id="myAlert" style="text-align: center">
                    <b><bean:write name="errors"/></b>
                </div>
            </logic:equal>
        </html:form>
    </body>
</html>
<script language="javascript">
    function fCarregarAlunos() {
        document.PautaForm.action = "Pauta.do?action=carregarAlunosPorSeriePauta";
        document.PautaForm.target = "_self";
        document.PautaForm.submit();
    }

    function fMontarPauta() {
        var idAluno = document.PautaForm.idAluno.value;
        if (idAluno === "0") {
            alert("Deve ser informado o Aluno(a) corretamente!!");
        } else {
            document.PautaForm.action = "Pauta.do?action=montarPautaAluno";
            document.PautaForm.target = "_self";
            document.PautaForm.submit();
        }
    }

    function fVisualizar(idPauta) {
        document.PautaForm.action = "Pauta.do?action=visualizarPautaCadastrada&idPauta=" + idPauta;
        document.PautaForm.target = "_blank";
        document.PautaForm.submit();
    }

    function fExcluir(idPauta) {
        if (confirm("Deseja realmente excluir??")) {
            document.PautaForm.action = "Pauta.do?action=excluirPautaCadastrada&idPauta=" + idPauta;
            document.PautaForm.target = "_self";
            document.PautaForm.submit();
        }
    }

</script>


