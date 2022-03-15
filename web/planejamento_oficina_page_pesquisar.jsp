<%-- 
    Document   : planejamento_oficina_page_pesquisar
    Created on : 13/10/2020, 21:57:24
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
        <html:form action="PlanejamentoOficinas" name="PlanejamentoOficinasForm" type="br.com.Form.PlanejamentoOficinasForm" scope="request">
            <table border="0" align="center" style="margin-top: 20px; background-color: #F0FFFF" width="100%">
                <tr>
                    <td width="10%" style="padding-left: 50px">
                        <a href="javascript:history.back()"><img src="imagens/bt_voltar_2.png" width="100px"/></a>
                    </td>
                    <td width="80%" align="center">
                        <h1>Planejamento de Oficinas Por Professor</h1>
                    </td>
                    <td width="10%">&nbsp;</td>
                </tr>
            </table>
            <div class="form-group">
                <table border="0" align="center" style="margin-top: 20px;" width="30%">
                    <tr>
                        <td>
                            <div class="col-lg-12">
                                <label for="usr">Professor:</label>
                                <logic:equal name="tipoPerfil" scope="session" value="diretoria">
                                    <html:select name="PlanejamentoOficinasForm" property="idProfessor" styleId="idProfessor" styleClass="form-control">
                                        <html:option value="">Selecione</html:option>
                                        <html:options collection="listaProfessores" property="idPF" labelProperty="nome"></html:options>
                                    </html:select>    
                                </logic:equal>
                                <logic:equal name="tipoPerfil" scope="session" value="coordenacao">
                                    <html:select name="PlanejamentoOficinasForm" property="idProfessor" styleId="idProfessor" styleClass="form-control">
                                        <html:option value="">Selecione</html:option>
                                        <html:options collection="listaProfessores" property="idPF" labelProperty="nome"></html:options>
                                    </html:select>    
                                </logic:equal>
                                <logic:equal name="tipoPerfil" scope="session" value="professor">
                                    <html:hidden name="PlanejamentoOficinasForm" property="idProfessor"/>
                                    <html:select name="PlanejamentoOficinasForm" property="idProfessor" styleId="idProfessor" styleClass="form-control" disabled="true">
                                        <html:options collection="listaProfessores" property="idPF" labelProperty="nome"></html:options>
                                    </html:select>
                                </logic:equal>
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <div class="col-lg-12">
                                <label for="usr">Bimestre:</label>
                                <html:select name="PlanejamentoOficinasForm" property="nrBimestre" styleId="nrBimestre" styleClass="form-control">
                                    <html:option value="0">Todos</html:option>
                                    <html:option value="1">1º Bimestre</html:option>
                                    <html:option value="2">2º Bimestre</html:option>
                                    <html:option value="3">3º Bimestre</html:option>
                                    <html:option value="4">4º Bimestre</html:option>
                                </html:select>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="col-lg-12">
                                <label for="usr">Ano:</label>
                                <html:select name="PlanejamentoOficinasForm" property="anoVigente" styleId="anoVigente" styleClass="form-control">
                                    <html:option value="2022">2022</html:option>
                                    <html:option value="2021">2021</html:option>
                                    <html:option value="2020">2020</html:option>
                                </html:select>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="col-lg-12">
                                <label for="usr">&nbsp;</label>
                                <input class="btn btn-green" type="button" value="Pesquisar" onClick="fPesquisar()">
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </html:form>
    </body>


    <script language="javascript">
        function fPesquisar() {
            var idProfessor = document.PlanejamentoOficinasForm.idProfessor.value;
            if (idProfessor === "") {
                alert("Deve ser informado o(a) Professor(a)!!");
                document.getElementById("idProfessor").focus();
            } else {
                document.PlanejamentoOficinasForm.action = "PlanejamentoOficinas.do?action=pesquisar";
                document.PlanejamentoOficinasForm.submit();
            }
        }

    </script>

</html>
