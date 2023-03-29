<%-- 
    Document   : professor_cadastrar
    Created on : 04/03/2020, 08:49:29
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
                        <h2>Cadastro de Professor</h2>
                    </div>
                    <div class="col-sm-1">&nbsp;</div>
                </div>
            </div>

            <div class="form-group">
                <table border="0" align="center" style="margin-top: 20px;" width="80%">
                    <tr>
                        <td width="50%">
                            <div class="col-lg-10">
                                <label for="usr">Nome do Professor:</label>
                                <html:text styleClass="form-control form-control-sm" name="PessoaFisicaForm" property="nome" styleId="nome"/>
                            </div>
                        </td>
                        <td width="25%">
                            <div class="col-lg-10">
                                <label for="usr">Sexo:</label>
                                <html:select name="PessoaFisicaForm" property="sexo" styleId="sexo" styleClass="form-control form-control-sm">
                                    <html:option value="">Selecione</html:option>
                                    <html:option value="masculino">Masculino</html:option>
                                    <html:option value="feminino">Feminino</html:option>
                                </html:select>
                            </div>
                        </td>
                        <td width="25%">
                            <div class="col-lg-10">
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
                            <div class="col-lg-10">
                                <label for="usr">Naturalidade:</label>
                                <html:text styleClass="form-control form-control-sm" name="PessoaFisicaForm" property="naturalidade" styleId="naturalidade"/>
                            </div>
                        </td>
                        <td width="50%">
                            <div class="col-lg-10">
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
                            <div class="col-lg-10">
                                <label for="usr">Endereço:</label>
                                <html:text styleClass="form-control form-control-sm" name="PessoaFisicaForm" property="dsEndereco" styleId="dsEndereco"/>
                            </div>
                        </td>
                        <td width="25%">
                            <div class="col-lg-10">
                                <label for="usr">Província:</label>
                                <html:select name="PessoaFisicaForm" property="provincia" styleId="provincia" styleClass="form-control form-control-sm">
                                    <html:option value="">Selecione</html:option>
                                    <html:option value="AICHI">AICHI</html:option>
                                    <html:option value="AKITA">AKITA</html:option>
                                    <html:option value="AOMORI">AOMORI</html:option>
                                    <html:option value="CHIBA">CHIBA</html:option>
                                    <html:option value="EHIME">EHIME</html:option>
                                    <html:option value="FUKUI">FUKUI</html:option>
                                    <html:option value="FUKUOKA">FUKUOKA</html:option>
                                    <html:option value="FUKUSHIMA">FUKUSHIMA</html:option>
                                    <html:option value="GIFU">GIFU</html:option>
                                    <html:option value="GUNMA">GUNMA</html:option>
                                    <html:option value="HIROSHIMA">HIROSHIMA</html:option>
                                    <html:option value="HOKKAIDO">HOKKAIDO</html:option>
                                    <html:option value="HYOGO">HYOGO</html:option>
                                    <html:option value="IBARAKI">IBARAKI</html:option>
                                    <html:option value="ISHIKAWA">ISHIKAWA</html:option>
                                    <html:option value="IWATE">IWATE</html:option>
                                    <html:option value="KAGAWA">KAGAWA</html:option>
                                    <html:option value="KAGOSHIMA">KAGOSHIMA</html:option>
                                    <html:option value="KANAGAWA">KANAGAWA</html:option>
                                    <html:option value="KOCHI">KOCHI</html:option>
                                    <html:option value="KUMAMOTO">KUMAMOTO</html:option>
                                    <html:option value="KYOTO">KYOTO</html:option>
                                    <html:option value="MIE">MIE</html:option>
                                    <html:option value="MIYAGI">MIYAGI</html:option>
                                    <html:option value="MIYAZAKI">MIYAZAKI</html:option>
                                    <html:option value="NAGANO">NAGANO</html:option>
                                    <html:option value="NAGASAKI">NAGASAKI</html:option>
                                    <html:option value="NARA">NARA</html:option>
                                    <html:option value="NIIGATA">NIIGATA</html:option>
                                    <html:option value="OITA">OITA</html:option>
                                    <html:option value="OKAYAMA">OKAYAMA</html:option>
                                    <html:option value="OKINAWA">OKINAWA</html:option>
                                    <html:option value="OSAKA">OSAKA</html:option>
                                    <html:option value="SAGA">SAGA</html:option>
                                    <html:option value="SAITAMA">SAITAMA</html:option>
                                    <html:option value="SHIGA">SHIGA</html:option>
                                    <html:option value="SHIMANE">SHIMANE</html:option>
                                    <html:option value="SHIZUOKA">SHIZUOKA</html:option>
                                    <html:option value="TOCHIGI">TOCHIGI</html:option>
                                    <html:option value="TOKUSHIMA">TOKUSHIMA</html:option>
                                    <html:option value="TÓQUIO">TÓQUIO</html:option>
                                    <html:option value="TOTTORI">TOTTORI</html:option>
                                    <html:option value="TOYAMA">TOYAMA</html:option>
                                    <html:option value="WAKAYAMA">WAKAYAMA</html:option>
                                    <html:option value="YAMAGATA">YAMAGATA</html:option>
                                    <html:option value="YAMAGUCHI">YAMAGUCHI</html:option>
                                    <html:option value="YAMANASHI">YAMANASHI</html:option>
                                </html:select>
                                <%--<html:text styleClass="form-control form-control-sm" name="PessoaFisicaForm" property="provincia" styleId="provincia"/>--%>
                            </div>
                        </td>
                        <td width="25%">
                            <div class="col-lg-10">
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
                            <div class="col-lg-10">
                                <label for="usr">E-mail de Acesso ao sistema NIKKEN:</label>
                                <html:text styleClass="form-control form-control-sm" name="PessoaFisicaForm" property="email" styleId="email"/>
                            </div>
                        </td>
                        <td width="25%">
                            <div class="col-lg-10">
                                <label for="usr">Telefone de Contato:</label>
                                <html:text name="PessoaFisicaForm" property="telefoneProfessor" styleId="telefoneProfessor" styleClass="form-control form-control-sm"/>
                            </div>
                        </td>
                        <td width="25%">
                            <div class="col-lg-10">
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
                            <div class="col-lg-10">
                                <label for="usr">Nome(s) para Emergência (ou responsável):</label>
                                <html:text styleClass="form-control form-control-sm" name="PessoaFisicaForm" property="contatoEmergencia" styleId="contatoEmergencia"/>
                            </div>
                        </td>
                        <td width="50%">
                            <div class="col-lg-10">
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
                <input class="btn btn-sm btn-danger" type="reset" value="Resetar" onClick="fResetar();">
                <input class="btn btn-sm btn-success" type="button" value="Cadastrar" onClick="fCadastrar();">
            </div>

            <logic:equal name="cadastro" value="true">
                <br/>
                <div class="alert alert-info" id="myAlert" style="text-align: center">
                    <a href="#" class="close">&times;</a>
                    <b>Cadastro Realizado com Sucesso!</b>
                </div>
            </logic:equal>
            <logic:equal name="cadastro" value="false">
                <br/>
                <div class="alert alert-danger alert-dismissible" id="myAlert" style="text-align: center">
                    <a href="#" class="close">&times;</a>
                    <b>Erro no Cadastro. Favor verificar!</b>
                </div>
            </logic:equal>

            <%--<jsp:include page="footer.jsp"/>--%>
        </html:form>
    </body>
</html>
<script language="javascript">
    function fCadastrar() {
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
            document.PessoaFisicaForm.action = "Professor.do?action=cadastrar";
            document.PessoaFisicaForm.submit();
        }
    }
</script>


