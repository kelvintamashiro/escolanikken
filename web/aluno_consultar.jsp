<%-- 
    Document   : aluno_consultar
    Created on : 28/02/2020, 22:14:52
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
    <body style="padding-bottom: 150px">
        <logic:present name="errors">
            <script>
                alert('<bean:write name="errors"/>');
            </script>
        </logic:present>
        <html:form action="Aluno" name="AlunoForm" type="br.com.Form.AlunoForm" scope="request">
            <jsp:include page="topo.jsp"/>

            <table border="0" align="center" style="margin-top: 20px; background-color: #ADD8E6" width="100%">
                <tr>
                    <td width="10%" style="padding-left: 50px">
                        <a href="tela_interativa.jsp"><img src="imagens/bt_voltar_2.png" width="100px"/></a>
                    </td>
                    <td width="80%" align="center">
                        <h1>Consulta de Aluno</h1>
                    </td>
                    <td width="10%">&nbsp;</td>
                </tr>
            </table>
            <div class="form-group">
                <table border="0" align="center" style="margin-top: 20px;" width="80%">
                    <tr>
                        <td width="40%">
                            <div class="col-lg-12">
                                <label for="usr">Nome do Aluno:</label>
                                <html:text styleClass="form-control" name="AlunoForm" property="nome" styleId="nome"/>
                            </div>
                        </td>
                        <td width="20%">
                            <div class="col-lg-12">
                                <label for="usr">Sexo:</label>
                                <html:select name="AlunoForm" property="sexo" styleId="sexo" styleClass="form-control">
                                    <html:option value="">Selecione</html:option>
                                    <html:option value="masculino">Masculino</html:option>
                                    <html:option value="feminino">Feminino</html:option>
                                </html:select>
                            </div>
                        </td>
                        <td width="20%">
                            <div class="col-lg-12">
                                <label for="usr">Série/Ano:</label>
                                <html:select name="AlunoForm" property="serieAno" styleId="serieAno" styleClass="form-control">
                                    <html:option value="0">Selecione</html:option>
                                    <html:option value="11">Infantil I</html:option>
                                    <html:option value="12">Infantil II</html:option>
                                    <html:option value="13">Infantil III</html:option>
                                    <html:option value="1">1º ano</html:option>
                                    <html:option value="2">2º ano</html:option>
                                    <html:option value="3">3º ano</html:option>
                                    <html:option value="4">4º ano</html:option>
                                    <html:option value="5">5º ano</html:option>
                                    <html:option value="6">6º ano</html:option>
                                    <html:option value="7">7º ano</html:option>
                                    <html:option value="8">8º ano</html:option>
                                    <html:option value="9">9º ano</html:option>
                                    <html:option value="10">1ª série E.M.</html:option>
                                    <html:option value="20">2ª série E.M.</html:option>
                                    <html:option value="30">3ª série E.M.</html:option>
                                </html:select>    
                            </div>
                        </td>
                        <td width="10%">
                            <div class="col-lg-12">
                                <label for="usr">Status:</label>
                                <html:select name="AlunoForm" property="status" styleId="status" styleClass="form-control">
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

            <logic:present name="listaAlunos" scope="request">
                <div class="form-group">
                    <table border="0" class="table" align="center" style="margin-top: 20px;" width="90%">
                        <tr>
                            <td width="5%">&nbsp;</td>
                            <td><b>ID do Aluno</b></td>
                            <td><b>Nome do Aluno</b></td>
                            <!--<td><b>Data de Nascimento</b></td>-->
                            <td><b>Sexo</b></td>
                            <td><b>Província/Cidade</b></td>
                            <td><b>Série</b></td>
                            <td><b>E-mail</b></td>
                            <td><b>Status</b></td>
                            <td>&nbsp;</td>
                            <td width="5%">&nbsp;</td>
                        </tr>
                        <%int i = 1;%>
                        <logic:iterate name="listaAlunos" id="lista" scope="request">
                            <tr>
                                <td width="5%" align="center"><%=i++%></td>
                                <td><bean:write name="lista" property="numeroIDAluno"/></td>
                                <td><bean:write name="lista" property="nome"/></td>
                                <!--<td><bean:write name="lista" property="dataNascimento"/></td>-->
                                <td><bean:write name="lista" property="sexo"/></td>
                                <td><bean:write name="lista" property="provincia"/> - <bean:write name="lista" property="cidade"/></td>
                                <td><bean:write name="lista" property="dsSerieAno"/></td>
                                <td><bean:write name="lista" property="email"/></td>
                                <td>
                                    <bean:write name="lista" property="dsStatus"/>
                                </td>
                                <td>
                                    <input class="btn btn-info" type="button" value="Visualizar/Editar" onClick="fAtualizar(<bean:write name="lista" property="idPF"/>);">    
                                </td>
                                <td width="5%">&nbsp;</td>
                            </tr>
                        </logic:iterate>
                    </table>
                </div>
                <br/><br/><br/><br/>
            </logic:present>
            <logic:notPresent name="listaAlunos" scope="request">
                <br/><br/><br/><br/><br/><br/><br/>
            </logic:notPresent>


            <%--<jsp:include page="footer.jsp"/>--%>
        </html:form>
    </body>
</html>
<script language="javascript">

    function fPesquisar() {
        document.AlunoForm.action = "Aluno.do?action=consultar";
        document.AlunoForm.submit();
    }
    function fAtualizar(idPF) {
        document.AlunoForm.action = "Aluno.do?action=pageAtualizar&idPF=" + idPF;
        document.AlunoForm.submit();
    }
</script>



