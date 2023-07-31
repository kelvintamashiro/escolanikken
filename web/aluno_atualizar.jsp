<%-- 
    Document   : aluno_atualizar
    Created on : 02/03/2020, 20:29:42
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
        <script language="javascript1.2" src="js/mizanscene.js"></script>
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
                        <a href="Aluno.do?action=pageConsultar"><img src="imagens/bt_voltar_2.png" width="100px"/></a>
                    </div>
                    <div class="col-sm-10" align="center">
                        <h1>Informações Aluno</h1>
                    </div>
                    <div class="col-sm-1">&nbsp;</div>
                </div>
            </div>

            <logic:notEqual name="tipoPerfil" scope="session" value="aluno">
                <logic:notEqual name="tipoPerfil" scope="session" value="professor">
                    <table width="100%" style="background-color: #F5F5F5; height: 100px">
                        <tr>
                            <td align="center">
                                <input class="btn btn-info" type="button" value="1.Informações Aluno" onClick="fInformacaoAluno(<bean:write name="AlunoForm" property="idPF"/>);" style="border-bottom: 3px solid black; color: white">
<!--                                <input class="btn btn-info" type="button" value="2.Doc ZairyuCard" onClick="fEnvioDocZairyu(<bean:write name="AlunoForm" property="idPF"/>);">
                                <input class="btn btn-info" type="button" value="3.Doc MyNumber" onClick="fEnvioDocMyNumber(<bean:write name="AlunoForm" property="idPF"/>);">
                                <input class="btn btn-info" type="button" value="4.Doc Passaporte" onClick="fEnvioDocPassaporte(<bean:write name="AlunoForm" property="idPF"/>);">
                                <input class="btn btn-info" type="button" value="5.Doc Escolares/Pessoais" onClick="fEnvioDocumentosEscolares(<bean:write name="AlunoForm" property="idPF"/>);">-->
                            </td>
                        </tr>
                    </table>
                </logic:notEqual>
            </logic:notEqual>
            <div class="form-group">
                <table border="0" align="center" style="margin-top: 20px;" width="80%">
                    <html:hidden name="AlunoForm" property="idPF"/>
                    <tr>
                        <td width="6%">
                            <div class="col-lg-10">
                                <label for="usr">ID: <b><bean:write name="AlunoForm" property="idPF"/></b></label>
                            </div>
                        </td>
                        <td width="22%">
                            <div class="col-lg-10">
                                <label for="usr">Data de Cadastro: <b><bean:write name="AlunoForm" property="dataCadastro"/></b></label>

                            </div>
                        </td>
                        <td width="22%">
                            <div class="col-lg-10">
                                <label for="usr">Data de Matrícula: <b><bean:write name="AlunoForm" property="dataMatricula"/></b></label>

                            </div>
                        </td>
                        <td width="25%">
                            <div class="col-lg-10">
                                <label for="usr">Status:</label>
                                <html:select name="AlunoForm" property="status" styleId="status" styleClass="form-control form-control-sm">
                                    <html:option value="1">Ativo</html:option>
                                    <html:option value="2">Inativo</html:option>
                                </html:select>
                            </div>
                        </td>
                        <td width="25%">
                            <div class="col-lg-10">
                                <label for="usr">Data de Saída (quando o aluno sair):</label>
                                <html:text name="AlunoForm" property="dataSaida" styleId="dataSaida" styleClass="form-control form-control-sm" size="15" maxlength="10" onkeyup="formatarData(this);" onkeypress="return(validarConteudo(event, 'numero'))" onfocus="show('dataSaida')" onblur="hide('dataSaida')"/>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="form-group p-2">
                <table border="0" align="center" width="80%">
                    <tr>
                        <td width="50%">
                            <div class="col-lg-10">
                                <label for="usr">Nome do Aluno:</label>
                                <html:text styleClass="form-control form-control-sm" name="AlunoForm" property="nome" styleId="nome"/>
                            </div>
                        </td>
                        <td width="25%">
                            <div class="col-lg-10">
                                <label for="usr">Sexo:</label>
                                <html:select name="AlunoForm" property="sexo" styleId="sexo" styleClass="form-control form-control-sm">
                                    <html:option value="">Selecione</html:option>
                                    <html:option value="masculino">Masculino</html:option>
                                    <html:option value="feminino">Feminino</html:option>
                                </html:select>
                            </div>
                        </td>
                        <td width="25%">
                            <div class="col-lg-10">
                                <label for="usr">Data de Nascimento:</label>
                                <html:text name="AlunoForm" property="dataNascimento" styleId="dataNascimento" styleClass="form-control form-control-sm" size="15" maxlength="10" onkeyup="formatarData(this);" onkeypress="return(validarConteudo(event, 'numero'))" onfocus="show('dataNascimento')" onblur="hide('dataNascimento')"/>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="form-group p-2">
                <table border="0" align="center" width="80%">
                    <tr>
                        <td width="50%">
                            <div class="col-lg-10">
                                <label for="usr">E-mail de Acesso ao sistema NIKKEN:</label>
                                <html:text styleClass="form-control form-control-sm" name="AlunoForm" property="email" styleId="email" readonly="true"/>
                            </div>
                        </td>
                        <td width="25%">
                            <div class="col-lg-10">
                                <label for="usr">Número ID do Aluno:</label>
                                <html:text name="AlunoForm" property="numeroIDAluno" styleId="numeroIDAluno" styleClass="form-control form-control-sm"/>
                            </div>
                        </td>
                        <td width="25%">
                            <div class="col-lg-10">
                                <label for="usr">Telefone do aluno:</label>
                                <html:text name="AlunoForm" property="celularAluno" styleId="celularAluno" styleClass="form-control form-control-sm"/>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="form-group p-2">
                <table border="0" align="center" width="80%">
                    <tr>
                        <td width="50%">
                            <div class="col-lg-10">
                                <label for="usr">Naturalidade:</label>
                                <html:text styleClass="form-control form-control-sm" name="AlunoForm" property="naturalidade" styleId="naturalidade"/>
                            </div>
                        </td>
                        <td width="25%">
                            <div class="col-lg-10">
                                <label for="usr">Nacionalidade:</label>
                                <html:text styleClass="form-control form-control-sm" name="AlunoForm" property="nacionalidade" styleId="nacionalidade"/>
                            </div>
                        </td>
                        <td width="25%">
                            <div class="col-lg-10">
                                <label for="usr">Autorização Uso de Imagem:</label>
                                <html:select name="AlunoForm" property="autorizacaoImagem" styleId="autorizacaoImagem" styleClass="form-control form-control-sm">
                                    <html:option value="">Selecione</html:option>
                                    <html:option value="S">SIM</html:option>
                                    <html:option value="N">NÃO</html:option>
                                </html:select>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="form-group p-2">
                <table border="0" align="center" width="80%">
                    <tr>
                        <td width="50%">
                            <div class="col-lg-10">
                                <label for="usr">Endereço:</label>
                                <html:text styleClass="form-control form-control-sm" name="AlunoForm" property="dsEndereco" styleId="dsEndereco"/>
                            </div>
                        </td>
                        <td width="25%">
                            <div class="col-lg-10">
                                <label for="usr">Província:</label>
                                <html:select name="AlunoForm" property="provincia" styleId="provincia" styleClass="form-control form-control-sm">
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
                            </div>
                        </td>
                        <td width="25%">
                            <div class="col-lg-10">
                                <label for="usr">Cidade:</label>
                                <html:text styleClass="form-control form-control-sm" name="AlunoForm" property="cidade" styleId="cidade"/>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>

            <div class="form-group p-2">
                <table border="0" align="center" width="80%">
                    <tr style="background-color: #F4F4F4; color: #000080">
                        <td colspan="3">
                            <b>Dados dos Responsáveis</b>
                        </td>
                    </tr>
                    <tr><td colspan="3">&nbsp;</td></tr>
                    <tr>
                        <td width="50%">
                            <div class="col-lg-10">
                                <label for="usr">Nome da mãe(ou responsável):</label>
                                <html:text styleClass="form-control form-control-sm" name="AlunoForm" property="nomeMae" styleId="nomeMae"/>
                            </div>
                        </td>
                        <td width="30%">
                            <div class="col-lg-10">
                                <label for="usr">E-mail da mãe:</label>
                                <html:text styleClass="form-control form-control-sm" name="AlunoForm" property="emailMae" styleId="emailMae"/>
                            </div>
                        </td>
                        <td width="20%">
                            <div class="col-lg-10">
                                <label for="usr">Telefone da mãe:</label>
                                <html:text styleClass="form-control form-control-sm" name="AlunoForm" property="celularMae" styleId="celularMae"/>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="form-group p-2">
                <table border="0" align="center" width="80%">
                    <tr>
                        <td width="50%">
                            <div class="col-lg-10">
                                <label for="usr">Nome do pai(ou responsável):</label>
                                <html:text styleClass="form-control form-control-sm" name="AlunoForm" property="nomePai" styleId="nomePai"/>
                            </div>
                        </td>
                        <td width="30%">
                            <div class="col-lg-10">
                                <label for="usr">E-mail do pai:</label>
                                <html:text styleClass="form-control form-control-sm" name="AlunoForm" property="emailPai" styleId="emailPai"/>
                            </div>
                        </td>
                        <td width="20%">
                            <div class="col-lg-10">
                                <label for="usr">Telefone do pai:</label>
                                <html:text styleClass="form-control form-control-sm" name="AlunoForm" property="celularPai" styleId="celularPai"/>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>

            <div class="form-group p-2">
                <table border="0" align="center" width="80%">
                    <tr style="background-color: #F4F4F4; color: #000080">
                        <td colspan="3">
                            <b>Emergência</b>
                        </td>
                    </tr>
                    <tr><td colspan="3">&nbsp;</td></tr>
                    <tr>
                        <td width="50%">
                            <div class="col-lg-10">
                                <label for="usr">Nome(s) para Emergência (ou responsável):</label>
                                <html:text styleClass="form-control form-control-sm" name="AlunoForm" property="contatoEmergencia" styleId="contatoEmergencia"/>
                            </div>
                        </td>
                        <td width="50%">
                            <div class="col-lg-10">
                                <label for="usr">Telefone(s) para Emergência:</label>
                                <html:text styleClass="form-control form-control-sm" name="AlunoForm" property="telefoneContato" styleId="telefoneContato"/>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>

            <div class="form-group p-2">
                <table border="0" align="center" width="80%">
                    <tr style="background-color: #F4F4F4; color: #000080">
                        <td colspan="3">
                            <b>Saúde</b>
                        </td>
                    </tr>
                    <tr><td colspan="3">&nbsp;</td></tr>
                    <tr>
                        <td width="50%">
                            <div class="col-lg-10">
                                <label for="usr">Restrição Alimentar:</label>
                                <html:text styleClass="form-control form-control-sm" name="AlunoForm" property="restricaoAlimentar" styleId="restricaoAlimentar"/>
                            </div>
                        </td>
                        <td width="50%">
                            <div class="col-lg-10">
                                <label for="usr">Observação:</label>
                                <html:text styleClass="form-control form-control-sm" name="AlunoForm" property="observacaoSaude" styleId="observacaoSaude"/>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>

            <div class="form-group p-2">
                <table border="0" align="center" width="80%">
                    <tr style="background-color: #F4F4F4; color: #000080">
                        <td colspan="3">
                            <b>Alimentação/Transporte</b>
                        </td>
                    </tr>
                    <tr><td colspan="3">&nbsp;</td></tr>
                    <tr>
                        <td width="50%">
                            <div class="col-lg-10">
                                <label for="usr">Tipo de Alimentação:</label>
                                <html:select name="AlunoForm" property="tipoAlimentacao" styleId="tipoAlimentacao" styleClass="form-control form-control-sm">
                                    <html:option value="">Selecione</html:option>
                                    <html:option value="CANTINA">CANTINA</html:option>
                                    <html:option value="PROPRIA">PRÓPRIA</html:option>
                                </html:select>
                            </div>
                        </td>
                        <td width="25%">
                            <div class="col-lg-10">
                                <label for="usr">Transporte (Linha/Região):</label>
                                <html:select name="AlunoForm" property="linhaTransporte" styleId="linhaTransporte" styleClass="form-control form-control-sm">
                                    <html:option value="">Selecione</html:option>
                                    <html:option value="KUWANA">KUWANA</html:option>
                                    <html:option value="NAGOYA">NAGOYA</html:option>
                                    <html:option value="SASAGAWA">SASAGAWA</html:option>
                                    <html:option value="SUZUKA">SUZUKA</html:option>
                                    <html:option value="YATOMI">YATOMI</html:option>
                                    <html:option value="PROPRIO">PRÓPRIO</html:option>
                                    <html:option value="OUTRO">OUTRO</html:option>
                                </html:select>
                                <%--<html:text styleClass="form-control form-control-sm" name="AlunoForm" property="linhaTransporte" styleId="linhaTransporte"/>--%>
                            </div>
                        </td>
                        <td width="25%">
                            <div class="col-lg-10">
                                <label for="usr">Horário do Ônibus:</label>
                                <html:text styleClass="form-control form-control-sm" name="AlunoForm" property="horarioTransporte" styleId="horarioTransporte"/>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>

            <div class="form-group p-2">
                <table border="0" align="center" width="80%">
                    <tr style="background-color: #F4F4F4; color: #000080">
                        <td colspan="4">
                            <b>Ensalamento</b>
                        </td>
                    </tr>
                    <tr><td colspan="3">&nbsp;</td></tr>
                    <tr>
                        <td width="25%">
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
                        <td width="25%">
                            <div class="col-lg-10">
                                <label for="usr">Posição na chamada:</label>
                                <html:select name="AlunoForm" property="posicaoChamada" styleId="posicaoChamada" styleClass="form-control form-control-sm">
                                    <html:option value="">Selecione</html:option>
                                    <html:option value="1">1</html:option>
                                    <html:option value="2">2</html:option>
                                    <html:option value="3">3</html:option>
                                    <html:option value="4">4</html:option>
                                    <html:option value="5">5</html:option>
                                    <html:option value="6">6</html:option>
                                    <html:option value="7">7</html:option>
                                    <html:option value="8">8</html:option>
                                    <html:option value="9">9</html:option>
                                    <html:option value="10">10</html:option>
                                    <html:option value="11">11</html:option>
                                    <html:option value="12">12</html:option>
                                    <html:option value="13">13</html:option>
                                    <html:option value="14">14</html:option>
                                    <html:option value="15">15</html:option>
                                    <html:option value="16">16</html:option>
                                    <html:option value="17">17</html:option>
                                    <html:option value="18">18</html:option>
                                    <html:option value="19">19</html:option>
                                    <html:option value="20">20</html:option>
                                </html:select>
                            </div>
                        </td>
                        <td width="25%">
                            <div class="col-lg-10">
                                <label for="usr">Período:</label>
                                <html:select name="AlunoForm" property="periodo" styleId="periodo" styleClass="form-control form-control-sm">
                                    <html:option value="">Selecione</html:option>
                                    <html:option value="integral">Integral</html:option>
                                    <html:option value="meio_periodo">Meio Período</html:option>
                                </html:select>
                            </div>
                        </td>
                        <td width="25%">
                            <div class="col-lg-10">
                                <label for="usr">Data da Matrícula:</label>
                                <html:text name="AlunoForm" property="dataMatricula" styleClass="form-control form-control-sm" size="15" maxlength="10" onkeyup="formatarData(this);" onkeypress="return(validarConteudo(event, 'numero'))" onfocus="show('dataMatricula')" onblur="hide('dataMatricula')"/>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="form-group p-2">
                <table border="0" align="center" width="80%">
                    <tr style="background-color: #F4F4F4; color: #000080">
                        <td colspan="3">
                            <b>Outras Informações</b>
                        </td>
                    </tr>
                    <tr><td colspan="3">&nbsp;</td></tr>
                    <tr>
                        <td width="100%">
                            <div class="col-lg-10">
                                <label for="usr">Outras Observações:</label>
                                <html:text styleClass="form-control form-control-sm" name="AlunoForm" property="observacao" styleId="observacao"/>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>

            <div align="center">
                <br/>
                <br/>
                <input class="btn btn-sm btn-success" type="button" value="Atualizar Cadastro" onClick="fAtualizar();">
                <input class="btn btn-sm btn-dark" type="button" value="Histórico Aluno" onClick="fHistoricoAluno();">
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
        var nome = document.AlunoForm.nome.value;
        var numeroIDAluno = document.AlunoForm.numeroIDAluno.value;
        var sexo = document.AlunoForm.sexo.value;
        var dataNascimento = document.AlunoForm.dataNascimento.value;
        var nomeMae = document.AlunoForm.nomeMae.value;
        var serieAno = document.AlunoForm.serieAno.value;
        var email = document.AlunoForm.email.value;
        var posicaoChamada = document.AlunoForm.posicaoChamada.value;
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
        } else if (posicaoChamada == "") {
            alert("Deve ser informado a Posição na chamada corretamente!");
            document.getElementById('posicaoChamada').focus();
        } else {
            document.AlunoForm.action = "Aluno.do?action=atualizar";
            document.AlunoForm.submit();
        }
    }

    function fHistoricoAluno() {
        document.AlunoForm.action = "Aluno.do?action=pageHistoricoAluno";
        document.AlunoForm.submit();
    }

    function fInformacaoAluno(idPF) {
        document.AlunoForm.action = "Aluno.do?action=pageAtualizar&idPF=" + idPF;
        document.AlunoForm.submit();
    }

    function fEnvioDocZairyu(idPF) {
        document.AlunoForm.action = "Aluno.do?action=pageDocZairyu&idPF=" + idPF;
        document.AlunoForm.submit();
    }
    function fEnvioDocMyNumber(idPF) {
        document.AlunoForm.action = "Aluno.do?action=pageDocMyNumber&idPF=" + idPF;
        document.AlunoForm.submit();
    }
    function fEnvioDocPassaporte(idPF) {
        document.AlunoForm.action = "Aluno.do?action=pageDocPassaporte&idPF=" + idPF;
        document.AlunoForm.submit();
    }
    function fEnvioDocumentosEscolares(idPF) {
        document.AlunoForm.action = "Aluno.do?action=pageDocumentosEscolares&idPF=" + idPF;
        document.AlunoForm.submit();
    }
</script>


