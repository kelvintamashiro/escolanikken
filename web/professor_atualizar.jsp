<%-- 
    Document   : professor_atualizar
    Created on : 05/03/2020, 23:38:40
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
                        <h2>Atualização do Professor</h2>
                    </div>
                    <div class="col-sm-1">&nbsp;</div>
                </div>
            </div>

            <div class="form-group">
                <table border="0" align="center" style="margin-top: 20px;" width="80%">
                    <html:hidden name="PessoaFisicaForm" property="idPF"/>
                    <tr>
                        <td width="6%">
                            <div class="col-lg-12">
                                <label for="usr">ID: <b><bean:write name="PessoaFisicaForm" property="idPF"/></b></label>
                            </div>
                        </td>
                        <td width="22%">
                            <div class="col-lg-12">
                                <label for="usr">Data de Cadastro: <b><bean:write name="PessoaFisicaForm" property="dataCadastro"/></b></label>

                            </div>
                        </td>
                        <td width="25%">
                            <div class="col-lg-12">
                                <label for="usr">Status:</label>
                                <html:select name="PessoaFisicaForm" property="status" styleId="status" styleClass="form-control form-control-sm">
                                    <html:option value="1">Ativo</html:option>
                                    <html:option value="2">Inativo</html:option>
                                </html:select>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="form-group">
                <table border="0" align="center" style="margin-top: 20px;" width="80%">
                    <tr>
                        <td width="50%">
                            <div class="col-lg-12">
                                <label for="usr">Nome do Professor:</label>
                                <html:text styleClass="form-control form-control-sm" name="PessoaFisicaForm" property="nome" styleId="nome"/>
                            </div>
                        </td>
                        <td width="25%">
                            <div class="col-lg-12">
                                <label for="usr">Sexo:</label>
                                <html:select name="PessoaFisicaForm" property="sexo" styleId="sexo" styleClass="form-control form-control-sm">
                                    <html:option value="">Selecione</html:option>
                                    <html:option value="masculino">Masculino</html:option>
                                    <html:option value="feminino">Feminino</html:option>
                                </html:select>
                            </div>
                        </td>
                        <td width="25%">
                            <div class="col-lg-12">
                                <label for="usr">Data de Nascimento:</label>
                                <html:text name="PessoaFisicaForm" property="dataNascimento" styleId="dataNascimento" styleClass="form-control form-control-sm" size="15" maxlength="10" onkeyup="formatarData(this);" onkeypress="return(validarConteudo(event, 'numero'))" onfocus="show('dataNascimento')" onblur="hide('dataNascimento')"/>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="form-group">
                <table border="0" align="center" width="80%">
                    <tr>
                        <td width="50%">
                            <div class="col-lg-12">
                                <label for="usr">Naturalidade:</label>
                                <html:text styleClass="form-control form-control-sm" name="PessoaFisicaForm" property="naturalidade" styleId="naturalidade"/>
                            </div>
                        </td>
                        <td width="50%">
                            <div class="col-lg-12">
                                <label for="usr">Nacionalidade:</label>
                                <html:text styleClass="form-control form-control-sm" name="PessoaFisicaForm" property="nacionalidade" styleId="nacionalidade"/>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="form-group">
                <table border="0" align="center" width="80%">
                    <tr>
                        <td width="50%">
                            <div class="col-lg-12">
                                <label for="usr">Endereço:</label>
                                <html:text styleClass="form-control form-control-sm" name="PessoaFisicaForm" property="dsEndereco" styleId="dsEndereco"/>
                            </div>
                        </td>
                        <td width="25%">
                            <div class="col-lg-12">
                                <label for="usr">Província:</label>
                                <html:text styleClass="form-control form-control-sm" name="PessoaFisicaForm" property="provincia" styleId="provincia"/>
                            </div>
                        </td>
                        <td width="25%">
                            <div class="col-lg-12">
                                <label for="usr">Cidade:</label>
                                <html:text styleClass="form-control form-control-sm" name="PessoaFisicaForm" property="cidade" styleId="cidade"/>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="form-group">
                <table border="0" align="center" width="80%">
                    <tr>
                        <td width="50%">
                            <div class="col-lg-12">
                                <label for="usr">E-mail de Acesso ao sistema NIKKEN:</label>
                                <html:text styleClass="form-control form-control-sm" name="PessoaFisicaForm" property="email" styleId="email"/>
                            </div>
                        </td>
                        <td width="25%">
                            <div class="col-lg-12">
                                <label for="usr">Telefone de Contato:</label>
                                <html:text name="PessoaFisicaForm" property="telefoneProfessor" styleId="telefoneProfessor" styleClass="form-control form-control-sm"/>
                            </div>
                        </td>
                        <td width="25%">
                            <div class="col-lg-12">
                                <label for="usr">Tipo Perfil:</label>
                                <html:select name="PessoaFisicaForm" property="tipoPerfil" styleId="tipoPerfil" styleClass="form-control form-control-sm">
                                    <html:option value="professor">PROFESSOR</html:option>
                                    <html:option value="coordenacao">COORDENAÇÃO</html:option>
                                    <html:option value="diretoria">DIRETORIA</html:option>
                                </html:select>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>

            <div class="form-group">
                <table border="0" align="center" width="80%">
                    <tr style="background-color: #F4F4F4; color: #000080">
                        <td colspan="3">
                            <b>Emergência</b>
                        </td>
                    </tr>
                    <tr>
                        <td width="50%">
                            <div class="col-lg-12">
                                <label for="usr">Nome(s) para Emergência (ou responsável):</label>
                                <html:text styleClass="form-control form-control-sm" name="PessoaFisicaForm" property="contatoEmergencia" styleId="contatoEmergencia"/>
                            </div>
                        </td>
                        <td width="50%">
                            <div class="col-lg-12">
                                <label for="usr">Telefone(s) para Emergência:</label>
                                <html:text styleClass="form-control form-control-sm" name="PessoaFisicaForm" property="telefoneContato" styleId="telefoneContato"/>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>

            <div align="center">
                <br/>
                <br/>
                <input class="btn btn-sm btn-success" type="button" value="Atualizar" onClick="fAtualizar();">
            </div>

            <logic:equal name="atualizar" value="true">
                <br/>
                <div class="alert alert-info" id="myAlert" style="text-align: center">
                    <a href="#" class="close">&times;</a>
                    <b>Atualização Realizada com Sucesso!</b>
                </div>
            </logic:equal>
            <logic:equal name="atualizar" value="false">
                <br/>
                <div class="alert alert-danger alert-dismissible" id="myAlert" style="text-align: center">
                    <a href="#" class="close">&times;</a>
                    <b>Erro na Atualização. Favor verificar!</b>
                </div>
            </logic:equal>

            <%--<jsp:include page="footer.jsp"/>--%>
        </html:form>
    </body>
</html>
<script language="javascript">
    function fAtualizar() {
        var nome = document.PessoaFisicaForm.nome.value;
        var sexo = document.PessoaFisicaForm.sexo.value;
        var dataNascimento = document.PessoaFisicaForm.dataNascimento.value;
        var email = document.PessoaFisicaForm.email.value;
        if (nome.length < 2) {
            alert("Deve ser informado o nome do professor corretamente!");
            document.getElementById('nome').focus();
        } else if (sexo == "") {
            alert("Deve ser informado o sexo corretamente!");
            document.getElementById('sexo').focus();
        } else if (dataNascimento.length < 2) {
            alert("Deve ser informado a data de nascimento corretamente!");
            document.getElementById('dataNascimento').focus();
        } else if (email.length < 2) {
            alert("Deve ser informado o E-mail de Acesso corretamente!");
            document.getElementById('email').focus();
        } else {
            document.PessoaFisicaForm.action = "Professor.do?action=atualizar";
            document.PessoaFisicaForm.submit();
        }
    }
</script>


