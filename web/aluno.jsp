<%-- 
    Document   : aluno
    Created on : 26/02/2020, 21:12:54
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
                        <h1>Cadastro de Aluno</h1>
                    </td>
                    <td width="10%">&nbsp;</td>
                </tr>
            </table>
            <div class="form-group">
                <table border="0" align="center" style="margin-top: 20px;" width="80%">
                    <tr>
                        <td width="50%">
                            <div class="col-lg-12">
                                <label for="usr">Nome do Aluno:</label>
                                <html:text styleClass="form-control" name="AlunoForm" property="nome" styleId="nome"/>
                            </div>
                        </td>
                        <td width="25%">
                            <div class="col-lg-12">
                                <label for="usr">Sexo:</label>
                                <html:select name="AlunoForm" property="sexo" styleId="sexo" styleClass="form-control">
                                    <html:option value="">Selecione</html:option>
                                    <html:option value="masculino">Masculino</html:option>
                                    <html:option value="feminino">Feminino</html:option>
                                </html:select>
                            </div>
                        </td>
                        <td width="25%">
                            <div class="col-lg-12">
                                <label for="usr">Data de Nascimento:</label>
                                <html:text name="AlunoForm" property="dataNascimento" styleId="dataNascimento" styleClass="form-control" size="15" maxlength="10" onkeyup="formatarData(this);" onkeypress="return(validarConteudo(event, 'numero'))" onfocus="show('dataNascimento')" onblur="hide('dataNascimento')"/>
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
                                <html:text styleClass="form-control" name="AlunoForm" property="email" styleId="email"/>
                            </div>
                        </td>
                        <td width="25%">
                            <div class="col-lg-12">
                                <label for="usr">Número ID do Aluno:</label>
                                <html:text name="AlunoForm" property="numeroIDAluno" styleId="numeroIDAluno" styleClass="form-control"/>
                            </div>
                        </td>
                        <td width="25%">
                            <div class="col-lg-12">
                                <label for="usr">Telefone do aluno:</label>
                                <html:text name="AlunoForm" property="celularAluno" styleId="celularAluno" styleClass="form-control"/>
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
                                <html:text styleClass="form-control" name="AlunoForm" property="naturalidade" styleId="naturalidade"/>
                            </div>
                        </td>
                        <td width="25%">
                            <div class="col-lg-12">
                                <label for="usr">Nacionalidade:</label>
                                <html:text styleClass="form-control" name="AlunoForm" property="nacionalidade" styleId="nacionalidade"/>
                            </div>
                        </td>
                        <td width="25%">
                            <div class="col-lg-12">
                                <label for="usr">Autorização Uso de Imagem:</label>
                                <html:select name="AlunoForm" property="autorizacaoImagem" styleId="autorizacaoImagem" styleClass="form-control">
                                    <html:option value="">Selecione</html:option>
                                    <html:option value="S">SIM</html:option>
                                    <html:option value="N">NÃO</html:option>
                                </html:select>
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
                                <html:text styleClass="form-control" name="AlunoForm" property="dsEndereco" styleId="dsEndereco"/>
                            </div>
                        </td>
                        <td width="25%">
                            <div class="col-lg-12">
                                <label for="usr">Província:</label>
                                <html:select name="AlunoForm" property="provincia" styleId="provincia" styleClass="form-control">
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
                                <%--<html:text styleClass="form-control" name="AlunoForm" property="provincia" styleId="provincia"/>--%>
                            </div>
                        </td>
                        <td width="25%">
                            <div class="col-lg-12">
                                <label for="usr">Cidade:</label>
                                <html:text styleClass="form-control" name="AlunoForm" property="cidade" styleId="cidade"/>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>

            <div class="form-group">
                <table border="0" align="center" width="80%">
                    <tr style="background-color: #F4F4F4; color: #000080">
                        <td colspan="3">
                            <b>Dados dos Responsáveis</b>
                        </td>
                    </tr>
                    <tr>
                        <td width="50%">
                            <div class="col-lg-12">
                                <label for="usr">Nome da mãe(ou responsável):</label>
                                <html:text styleClass="form-control" name="AlunoForm" property="nomeMae" styleId="nomeMae"/>
                            </div>
                        </td>
                        <td width="30%">
                            <div class="col-lg-12">
                                <label for="usr">E-mail da mãe:</label>
                                <html:text styleClass="form-control" name="AlunoForm" property="emailMae" styleId="emailMae"/>
                            </div>
                        </td>
                        <td width="20%">
                            <div class="col-lg-12">
                                <label for="usr">Telefone da mãe:</label>
                                <html:text styleClass="form-control" name="AlunoForm" property="celularMae" styleId="celularMae"/>
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
                                <label for="usr">Nome do pai(ou responsável):</label>
                                <html:text styleClass="form-control" name="AlunoForm" property="nomePai" styleId="nomePai"/>
                            </div>
                        </td>
                        <td width="30%">
                            <div class="col-lg-12">
                                <label for="usr">E-mail do pai:</label>
                                <html:text styleClass="form-control" name="AlunoForm" property="emailPai" styleId="emailPai"/>
                            </div>
                        </td>
                        <td width="20%">
                            <div class="col-lg-12">
                                <label for="usr">Telefone do pai:</label>
                                <html:text styleClass="form-control" name="AlunoForm" property="celularPai" styleId="celularPai"/>
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
                                <html:text styleClass="form-control" name="AlunoForm" property="contatoEmergencia" styleId="contatoEmergencia"/>
                            </div>
                        </td>
                        <td width="50%">
                            <div class="col-lg-12">
                                <label for="usr">Telefone(s) para Emergência:</label>
                                <html:text styleClass="form-control" name="AlunoForm" property="telefoneContato" styleId="telefoneContato"/>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>

            <div class="form-group">
                <table border="0" align="center" width="80%">
                    <tr style="background-color: #F4F4F4; color: #000080">
                        <td colspan="3">
                            <b>Saúde</b>
                        </td>
                    </tr>
                    <tr>
                        <td width="50%">
                            <div class="col-lg-12">
                                <label for="usr">Restrição Alimentar:</label>
                                <html:text styleClass="form-control" name="AlunoForm" property="restricaoAlimentar" styleId="restricaoAlimentar"/>
                            </div>
                        </td>
                        <td width="50%">
                            <div class="col-lg-12">
                                <label for="usr">Observação:</label>
                                <html:text styleClass="form-control" name="AlunoForm" property="observacaoSaude" styleId="observacaoSaude"/>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>

            <div class="form-group">
                <table border="0" align="center" width="80%">
                    <tr style="background-color: #F4F4F4; color: #000080">
                        <td colspan="3">
                            <b>Alimentação/Transporte</b>
                        </td>
                    </tr>
                    <tr>
                        <td width="50%">
                            <div class="col-lg-12">
                                <label for="usr">Tipo de Alimentação:</label>
                                <html:select name="AlunoForm" property="tipoAlimentacao" styleId="tipoAlimentacao" styleClass="form-control">
                                    <html:option value="">Selecione</html:option>
                                    <html:option value="CANTINA">CANTINA</html:option>
                                    <html:option value="PROPRIA">PRÓPRIA</html:option>
                                </html:select>
                            </div>
                        </td>
                        <td width="50%">
                            <div class="col-lg-12">
                                <label for="usr">Transporte (Linha/Região):</label>
                                <html:select name="AlunoForm" property="linhaTransporte" styleId="linhaTransporte" styleClass="form-control">
                                    <html:option value="">Selecione</html:option>
                                    <html:option value="INABE">INABE</html:option>
                                    <html:option value="KASUMIGAURA">KASUMIGAURA</html:option>
                                    <html:option value="KAWAGOE">KAWAGOE</html:option>
                                    <html:option value="KUWANA">KUWANA</html:option>
                                    <html:option value="NAGOYA">NAGOYA</html:option>
                                    <html:option value="SASAGAWA">SASAGAWA</html:option>
                                    <html:option value="SUZUKA">SUZUKA</html:option>
                                    <html:option value="YATOMI">YATOMI</html:option>
                                    <html:option value="PROPRIO">PRÓPRIO</html:option>
                                    <html:option value="OUTRO">OUTRO</html:option>
                                </html:select>
                                <%--<html:text styleClass="form-control" name="AlunoForm" property="linhaTransporte" styleId="linhaTransporte"/>--%>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>

            <div class="form-group">
                <table border="0" align="center" width="80%">
                    <tr style="background-color: #F4F4F4; color: #000080">
                        <td colspan="3">
                            <b>Ensalamento</b>
                        </td>
                    </tr>
                    <tr>
                        <td width="50%">
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
                        <td width="50%">
                            <div class="col-lg-12">
                                <label for="usr">Data da Matrícula:</label>
                                <html:text name="AlunoForm" property="dataMatricula" styleId="dataMatricula" styleClass="form-control" size="15" maxlength="10" onkeyup="formatarData(this);" onkeypress="return(validarConteudo(event, 'numero'))" onfocus="show('dataMatricula')" onblur="hide('dataMatricula')"/>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="form-group">
                <table border="0" align="center" width="80%">
                    <tr style="background-color: #F4F4F4; color: #000080">
                        <td colspan="3">
                            <b>Outras Informações</b>
                        </td>
                    </tr>
                    <tr>
                        <td width="100%">
                            <div class="col-lg-12">
                                <label for="usr">Outras Observações:</label>
                                <html:text styleClass="form-control" name="AlunoForm" property="observacao" styleId="observacao"/>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>

            <div align="center">
                <br/>
                <br/>
                <!--<input class="btn btn-danger" type="reset" value="Resetar" onClick="fResetar();">-->
                <input class="btn btn-green" type="button" value="Cadastrar" onClick="fCadastrar();">
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
        var nome = document.AlunoForm.nome.value;
        var numeroIDAluno = document.AlunoForm.numeroIDAluno.value;
        var sexo = document.AlunoForm.sexo.value;
        var dataNascimento = document.AlunoForm.dataNascimento.value;
        var nomeMae = document.AlunoForm.nomeMae.value;
        var serieAno = document.AlunoForm.serieAno.value;
        var email = document.AlunoForm.email.value;
        var dataMatricula = document.AlunoForm.dataMatricula.value;

        if (nome.length < 2) {
            alert("Deve ser informado o nome do aluno corretamente!");
            document.getElementById('nome').focus();
        } else if (sexo == "") {
            alert("Deve ser informado o sexo corretamente!");
            document.getElementById('sexo').focus();
        } else if (dataNascimento.length < 2) {
            alert("Deve ser informado a data de nascimento corretamente!");
            document.getElementById('dataNascimento').focus();
        } else if (numeroIDAluno.length < 2) {
            alert("Deve ser informado o Número ID do Aluno corretamente!");
            document.getElementById('numeroIDAluno').focus();
        } else if (nomeMae.length < 2) {
            alert("Deve ser informado o nome da mãe corretamente!");
            document.getElementById('nomeMae').focus();
        } else if (serieAno === 0) {
            alert("Deve ser informado a Série/Ano corretamente!");
            document.getElementById('serieAno').focus();
        } else if (email.length < 2) {
            alert("Deve ser informado o E-mail de Acesso corretamente!");
            document.getElementById('email').focus();
        } else if (dataMatricula.length < 2) {
            alert("Deve ser informado a data de matricula corretamente!");
            document.getElementById('dataMatricula').focus();
        } else {
            document.AlunoForm.action = "Aluno.do?action=cadastrar";
            document.AlunoForm.submit();
        }
    }
</script>


