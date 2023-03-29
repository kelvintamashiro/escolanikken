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
        <!--        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
                <script language="javascript1.2" src="js/mizanscene.js"></script>
                <script type="text/javascript" src="js/JQuery/js/jquery-1.3.2.js"></script>
        
                <link rel="stylesheet" media="all" type="text/css" href="assets/css/fix.css" />
                <link rel="stylesheet" media="all" type="text/css" href="assets/css/style.css" />-->

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
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
            <div class="container-fluid">
                <div class="row p-3" style="background-color: #F4F4F4" >
                    <div class="col-12 col-sm-1" align="center">
                        <a href="tela_interativa.jsp"><img src="imagens/bt_voltar_2.png" width="100px"/></a>
                    </div>
                    <div class="col-sm-10" align="center">
                        <h1>Consulta de Aluno</h1>
                    </div>
                    <div class="col-sm-1">&nbsp;</div>
                </div>
            </div>

            <div class="col-12">
                <table border="0" align="center" style="margin-top: 20px;" width="80%">
                    <tr>
                        <td width="40%">
                            <div class="col-lg-10">
                                <label for="usr">Nome do Aluno:</label>
                                <html:text styleClass="form-control form-control-sm" name="AlunoForm" property="nome" styleId="nome"/>
                            </div>
                        </td>
                        <td width="20%">
                            <div class="col-lg-10">
                                <label for="usr">Sexo:</label>
                                <html:select name="AlunoForm" property="sexo" styleId="sexo" styleClass="form-control form-control-sm">
                                    <html:option value="">Selecione</html:option>
                                    <html:option value="masculino">Masculino</html:option>
                                    <html:option value="feminino">Feminino</html:option>
                                </html:select>
                            </div>
                        </td>
                        <td width="20%">
                            <div class="col-lg-10">
                                <label for="usr">Série/Ano:</label>
                                <html:select name="AlunoForm" property="serieAno" styleId="serieAno" styleClass="form-control form-control-sm">
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
                            <div class="col-lg-10">
                                <label for="usr">Status:</label>
                                <html:select name="AlunoForm" property="status" styleId="status" styleClass="form-control form-control-sm">
                                    <html:option value="1">Ativo</html:option>
                                    <html:option value="2">Inativo</html:option>
                                </html:select>    
                            </div>
                        </td>
                        <td width="10%">
                            <div class="col-lg-12">
                                <label for="usr">&nbsp;</label> <br/>
                                <input class="btn btn-success" type="button" value="Pesquisar" onClick="fPesquisar();">    
                            </div>
                        </td>
                    </tr>
                </table>
            </div>

            <logic:present name="listaAlunos" scope="request">
                <div class="form-group">
                    <table border="0" class="table" align="center" style="margin-top: 20px;" width="90%">
                        <tr>
                            <th width="5%">&nbsp;</th>
                            <th><b>ID do Aluno</b></th>
                            <th><b>Nome do Aluno</th>
                            <th><b>Sexo</b></th>
                            <th><b>Província/Cidade</b></th>
                            <th><b>Série</b></th>
                            <th><b>E-mail</b></th>
                            <th><b>Status</b></th>
                            <th>&nbsp;</th>
                            <th width="5%">&nbsp;</th>
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
                                    <input class="btn btn-sm btn-dark" type="button" value="Visualizar/Editar" onClick="fAtualizar(<bean:write name="lista" property="idPF"/>);">    
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



