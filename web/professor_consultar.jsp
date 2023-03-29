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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
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
            <div class="container-fluid">
                <div class="row p-3" style="background-color: #F4F4F4" >
                    <div class="col-12 col-sm-1" align="center">
                        <a href="tela_interativa.jsp"><img src="imagens/bt_voltar_2.png" width="100px"/></a>
                    </div>
                    <div class="col-sm-10" align="center">
                        <h2>Consulta de Professor</h2>
                    </div>
                    <div class="col-sm-1">&nbsp;</div>
                </div>
            </div>

            <div class="form-group">
                <table border="0" align="center" style="margin-top: 20px;" width="80%">
                    <tr>
                        <td width="40%">
                            <div class="col-lg-12">
                                <label for="usr">Nome do Professor:</label>
                                <html:text styleClass="form-control form-control-sm" name="PessoaFisicaForm" property="nome" styleId="nome"/>
                            </div>
                        </td>
                        <td width="20%">
                            <div class="col-lg-12">
                                <label for="usr">Sexo:</label>
                                <html:select name="PessoaFisicaForm" property="sexo" styleId="sexo" styleClass="form-control form-control-sm">
                                    <html:option value="">Selecione</html:option>
                                    <html:option value="masculino">Masculino</html:option>
                                    <html:option value="feminino">Feminino</html:option>
                                </html:select>
                            </div>
                        </td>
                        <td width="10%">
                            <div class="col-lg-12">
                                <label for="usr">Status:</label>
                                <html:select name="PessoaFisicaForm" property="status" styleId="status" styleClass="form-control form-control-sm">
                                    <html:option value="1">Ativo</html:option>
                                    <html:option value="2">Inativo</html:option>
                                </html:select>    
                            </div>
                        </td>
                        <td width="10%">
                            <div class="col-lg-12">
                                <label for="usr">&nbsp;</label><br/>
                                <input class="btn btn-sm btn-success" type="button" value="Pesquisar" onClick="fPesquisar();">    
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
                                    <input class="btn btn-sm btn-dark" type="button" value="Editar" onClick="fAtualizar(<bean:write name="lista" property="idPF"/>);">    
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




