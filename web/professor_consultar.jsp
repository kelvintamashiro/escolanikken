<%-- 
    Document   : professor_consultar
    Created on : 05/03/2020, 23:25:44
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
        <html:form action="Professor" name="PessoaFisicaForm" type="br.com.Form.PessoaFisicaForm" scope="request">
            <jsp:include page="topo.jsp"/>

            <table border="0" align="center" style="margin-top: 20px; background-color: #C1FFC1" width="100%">
                <tr>
                    <td width="10%" style="padding-left: 50px">
                        <a href="tela_interativa.jsp"><img src="imagens/bt_voltar_2.png" width="100px"/></a>
                    </td>
                    <td width="80%" align="center">
                        <h1>Consulta de Professor</h1>
                    </td>
                    <td width="10%">&nbsp;</td>
                </tr>
            </table>
            <div class="form-group">
                <table border="0" align="center" style="margin-top: 20px;" width="80%">
                    <tr>
                        <td width="40%">
                            <div class="col-lg-12">
                                <label for="usr">Nome do Professor:</label>
                                <html:text styleClass="form-control" name="PessoaFisicaForm" property="nome" styleId="nome"/>
                            </div>
                        </td>
                        <td width="20%">
                            <div class="col-lg-12">
                                <label for="usr">Sexo:</label>
                                <html:select name="PessoaFisicaForm" property="sexo" styleId="sexo" styleClass="form-control">
                                    <html:option value="">Selecione</html:option>
                                    <html:option value="masculino">Masculino</html:option>
                                    <html:option value="feminino">Feminino</html:option>
                                </html:select>
                            </div>
                        </td>
                        <td width="10%">
                            <div class="col-lg-12">
                                <label for="usr">Status:</label>
                                <html:select name="PessoaFisicaForm" property="status" styleId="status" styleClass="form-control">
                                    <html:option value="1">Ativo</html:option>
                                    <html:option value="2">Inativo</html:option>
                                </html:select>    
                            </div>
                        </td>
                        <td width="10%">
                            <div class="col-lg-12">
                                <label for="usr">&nbsp;</label>
                                <input class="btn btn-green" type="button" value="Pesquisar" onClick="fPesquisar();">    
                            </div>
                        </td>
                    </tr>
                </table>
            </div>

            <logic:present name="listaProfessores" scope="request">
                <div class="form-group">
                    <table border="0" class="table" align="center" style="margin-top: 20px;" width="90%">
                        <tr>
                            <td><b>ID do Professor</b></td>
                            <td><b>Nome do Professor</b></td>
                            <td><b>Data de Nascimento</b></td>
                            <td><b>Sexo</b></td>
                            <td><b>Província/Cidade</b></td>
                            <td><b>E-mail</b></td>
                            <td><b>Status</b></td>
                            <td><b>&nbsp;</b></td>
                        </tr>
                        <logic:iterate name="listaProfessores" id="lista" scope="request">
                            <tr>
                                <td><bean:write name="lista" property="idPF"/></td>
                                <td><bean:write name="lista" property="nome"/></td>
                                <td><bean:write name="lista" property="dataNascimento"/></td>
                                <td><bean:write name="lista" property="sexo"/></td>
                                <td><bean:write name="lista" property="provincia"/> - <bean:write name="lista" property="cidade"/></td>
                                <td><bean:write name="lista" property="email"/></td>
                                <td>
                                    <bean:write name="lista" property="dsStatus"/>
                                </td>
                                <td>
                                    <input class="btn btn-grey" type="button" value="Editar" onClick="fAtualizar(<bean:write name="lista" property="idPF"/>);">    
                                </td>
                            </tr>
                        </logic:iterate>
                    </table>
                </div>
                <br/><br/><br/><br/>
            </logic:present>
            <logic:notPresent name="listaProfessores" scope="request">
                <br/><br/><br/><br/><br/><br/><br/>
            </logic:notPresent>


            <%--<jsp:include page="footer.jsp"/>--%>
        </html:form>
    </body>
</html>
<script language="javascript">

    function fPesquisar() {
        document.PessoaFisicaForm.action = "Professor.do?action=consultar";
        document.PessoaFisicaForm.submit();
    }
    function fAtualizar(idPF) {
        document.PessoaFisicaForm.action = "Professor.do?action=pageAtualizar&idPF=" + idPF;
        document.PessoaFisicaForm.submit();
    }
</script>




