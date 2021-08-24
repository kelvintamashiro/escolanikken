<%-- 
    Document   : pauta_aluno_bimestre
    Created on : 19 de jul de 2021, 23:04:30
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
                        <h2>Pauta de Reuni�o por Aluno e Bimestre</h2>
                    </td>
                    <td width="10%">&nbsp;</td>
                </tr>
            </table>

            <div class="form-group">
                <table border="0" align="center" style="margin-top: 20px;" width="60%">
                    <tr>
                        <td width="50%">
                            ALUNO: <strong><bean:write name="PautaForm" property="nomeAluno"/></strong>
                            <html:hidden name="PautaForm" property="idAluno"/>
                            <html:hidden name="PautaForm" property="idProfessor"/>
                        </td>
                        <td>
                            S�RIE: <strong><bean:write name="PautaForm" property="dsSerieAno"/></strong>
                            <html:hidden name="PautaForm" property="idSerieAno"/>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            M�E: <strong><bean:write name="PautaForm" property="nomeMaeAluno"/></strong>
                        </td>
                        <td>
                            BIMESTRE: <strong><bean:write name="PautaForm" property="nrBimestre"/>� Bimestre</strong>
                            <html:hidden name="PautaForm" property="nrBimestre"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            PAI: <strong><bean:write name="PautaForm" property="nomePaiAluno"/></strong>
                        </td>
                        <td>
                            ANO: <strong><bean:write name="PautaForm" property="ano"/></strong>
                            <html:hidden name="PautaForm" property="ano"/>
                        </td>
                    </tr>

                    <tr><td colspan="2"><hr/></td></tr>
                </table>
                <table border="0" align="center" style="margin-top: 10px;" width="60%">
                    <tr>
                        <td align="center">
                            <b>PAUTA</b>
                        </td>
                    </tr>
                    <tr><td><hr/></td></tr>
                    <tr>
                        <td style="border-bottom: 1px solid black">
                            1. APRESENTA��O
                        </td>
                    </tr>
                    <tr>
                        <td style="font-size: 11px">
                            <bean:write name="PautaForm" property="pautaApresentacao" filter="false"/>
                        </td>
                    </tr>
                    <tr><td>&nbsp;</td></tr>
                    <tr>
                        <td style="border-bottom: 1px solid black">
                            2. PERFIL DO ALUNO
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-left: 20px">
                            <strong>I. Qualidade:</strong>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-left: 20px; font-size: 11px">
                            <logic:present name="listaObsPerfil" scope="request">
                                <logic:iterate id="listaObsPerfil" name="listaObsPerfil" scope="request">
                                    <logic:notEqual name="listaObsPerfil" property="obsQualidade" value="">
                                        <bean:write name="listaObsPerfil" property="obsQualidade"/> - 
                                        (<bean:write name="listaObsPerfil" property="nomeProfessor"/>)
                                        <br/>
                                    </logic:notEqual>
                                </logic:iterate>
                            </logic:present>
                        </td>
                    </tr>
                    <tr><td>&nbsp;</td></tr>
                    <tr>
                        <td style="padding-left: 20px">
                            <strong>II. Participa��o na aula:</strong>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-left: 20px; font-size: 11px">
                            <logic:present name="listaObsPerfil" scope="request">
                                <logic:iterate id="listaObsPerfil" name="listaObsPerfil" scope="request">
                                    <logic:notEqual name="listaObsPerfil" property="obsParticipacaoAula" value="">
                                        <bean:write name="listaObsPerfil" property="obsParticipacaoAula"/> - 
                                        (<bean:write name="listaObsPerfil" property="nomeProfessor"/>)
                                        <br/>
                                    </logic:notEqual>
                                </logic:iterate>
                            </logic:present>
                        </td>
                    </tr>
                    <tr><td>&nbsp;</td></tr>
                    <tr>
                        <td style="padding-left: 20px">
                            <strong>III. Realiza��o das tarefas:</strong>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-left: 20px; font-size: 11px">
                            <logic:present name="listaObsPerfil" scope="request">
                                <logic:iterate id="listaObsPerfil" name="listaObsPerfil" scope="request">
                                    <logic:notEqual name="listaObsPerfil" property="obsRealizacaoTarefa" value="">
                                        <bean:write name="listaObsPerfil" property="obsRealizacaoTarefa"/> - 
                                        (<bean:write name="listaObsPerfil" property="nomeProfessor"/>)
                                        <br/>
                                    </logic:notEqual>
                                </logic:iterate>
                            </logic:present>
                        </td>
                    </tr>
                    <tr><td>&nbsp;</td></tr>
                    <tr>
                        <td style="padding-left: 20px">
                            <strong>IV. Comportamento em sala:</strong>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-left: 20px; font-size: 11px">
                            <logic:present name="listaObsPerfil" scope="request">
                                <logic:iterate id="listaObsPerfil" name="listaObsPerfil" scope="request">
                                    <logic:notEqual name="listaObsPerfil" property="obsComportamento" value="">
                                        <bean:write name="listaObsPerfil" property="obsComportamento"/> - 
                                        (<bean:write name="listaObsPerfil" property="nomeProfessor"/>)
                                        <br/>
                                    </logic:notEqual>
                                </logic:iterate>
                            </logic:present>
                        </td>
                    </tr>
                    <tr><td>&nbsp;</td></tr>
                    <tr>
                        <td style="padding-left: 20px">
                            <strong>V. Relacionamento com seus colegas/professores:</strong>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-left: 20px; font-size: 11px">
                            <logic:present name="listaObsPerfil" scope="request">
                                <logic:iterate id="listaObsPerfil" name="listaObsPerfil" scope="request">
                                    <logic:notEqual name="listaObsPerfil" property="obsRelacionamento" value="">
                                        <bean:write name="listaObsPerfil" property="obsRelacionamento"/> - 
                                        (<bean:write name="listaObsPerfil" property="nomeProfessor"/>)
                                        <br/>
                                    </logic:notEqual>
                                </logic:iterate>
                            </logic:present>
                        </td>
                    </tr>
                    <tr><td>&nbsp;</td></tr>
                    <tr>
                        <td style="padding-left: 20px">
                            <strong>VI. Dificuldades espec�ficas do aluno:</strong>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-left: 20px; font-size: 11px">
                            <logic:present name="listaObsPerfil" scope="request">
                                <logic:iterate id="listaObsPerfil" name="listaObsPerfil" scope="request">
                                    <logic:notEqual name="listaObsPerfil" property="obsDificuldade" value="">
                                        <bean:write name="listaObsPerfil" property="obsDificuldade"/> - 
                                        (<bean:write name="listaObsPerfil" property="nomeProfessor"/>)
                                        <br/>
                                    </logic:notEqual>
                                </logic:iterate>
                            </logic:present>
                        </td>
                    </tr>
                    <tr><td>&nbsp;</td></tr>
                    <tr>
                        <td style="padding-left: 20px">
                            <strong>VII. Precisa de refor�o?</strong>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-left: 20px; font-size: 11px">
                            <logic:present name="listaObsPerfil" scope="request">
                                <logic:iterate id="listaObsPerfil" name="listaObsPerfil" scope="request">
                                    <logic:notEqual name="listaObsPerfil" property="obsPrecisaReforco" value="">
                                        <bean:write name="listaObsPerfil" property="obsPrecisaReforco"/> - 
                                        (<bean:write name="listaObsPerfil" property="nomeProfessor"/>)
                                        <br/>
                                    </logic:notEqual>
                                </logic:iterate>
                            </logic:present>
                        </td>
                    </tr>
                    <tr><td>&nbsp;</td></tr>
                    <tr>
                        <td style="padding-left: 20px">
                            <strong>VIII. Como o aluno est�(estava) se comportando nos hor�rios de refor�o?</strong>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-left: 20px; font-size: 11px">
                            <logic:present name="listaObsPerfil" scope="request">
                                <logic:iterate id="listaObsPerfil" name="listaObsPerfil" scope="request">
                                    <logic:notEqual name="listaObsPerfil" property="obsComportamentoReforco" value="">
                                        <bean:write name="listaObsPerfil" property="obsComportamentoReforco"/> - 
                                        (<bean:write name="listaObsPerfil" property="nomeProfessor"/>)
                                        <br/>
                                    </logic:notEqual>
                                </logic:iterate>
                            </logic:present>
                        </td>
                    </tr>
                    <tr><td>&nbsp;</td></tr>
                    <tr>
                        <td style="padding-left: 20px">
                            <strong>IX. Dicas do professor para o aluno melhorar:</strong>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-left: 20px; font-size: 11px">
                            <logic:present name="listaObsPerfil" scope="request">
                                <logic:iterate id="listaObsPerfil" name="listaObsPerfil" scope="request">
                                    <logic:notEqual name="listaObsPerfil" property="obsDicaProfessor" value="">
                                        <bean:write name="listaObsPerfil" property="obsDicaProfessor"/> - 
                                        (<bean:write name="listaObsPerfil" property="nomeProfessor"/>)
                                        <br/>
                                    </logic:notEqual>
                                </logic:iterate>
                            </logic:present>
                        </td>
                    </tr>
                    <tr><td>&nbsp;</td></tr>
                    <tr>
                        <td style="padding-left: 20px">
                            <strong>X. Outros assuntos (sobre a aula de aula ou desempenho do aluno):</strong>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-left: 20px; font-size: 11px">
                            <logic:present name="listaObsPerfil" scope="request">
                                <logic:iterate id="listaObsPerfil" name="listaObsPerfil" scope="request">
                                    <logic:notEqual name="listaObsPerfil" property="obsOutroAssunto" value="">
                                        <bean:write name="listaObsPerfil" property="obsOutroAssunto"/> - 
                                        (<bean:write name="listaObsPerfil" property="nomeProfessor"/>)
                                        <br/>
                                    </logic:notEqual>
                                </logic:iterate>
                            </logic:present>
                        </td>
                    </tr>
                    <tr><td>&nbsp;</td></tr>
                    <tr>
                        <td style="border-bottom: 1px solid black">
                            3. BOLETIM DO ALUNO
                        </td>
                    </tr>
                    <tr>
                        <td style="font-size: 11px">
                            <bean:write name="PautaForm" property="pautaApresentacao" filter="false"/>
                        </td>
                    </tr>
                    <tr><td>&nbsp;</td></tr>
                    <tr>
                        <td style="border-bottom: 1px solid black">
                            4. PE�A AOS PAIS PARA
                        </td>
                    </tr>
                    <tr>
                        <td style="font-size: 11px">
                            <bean:write name="PautaForm" property="pautaRecadoPais" filter="false"/>
                        </td>
                    </tr>
                    <tr><td>&nbsp;</td></tr>
                    <tr>
                        <td style="border-bottom: 1px solid black">
                            5. RECADOS GERAIS
                        </td>
                    </tr>
                    <tr>
                        <td style="font-size: 11px">
                            <bean:write name="PautaForm" property="pautaRecadoGeral" filter="false"/>
                        </td>
                    </tr>
                    <tr><td>&nbsp;</td></tr>
                    <tr>
                        <td style="border-bottom: 1px solid black">
                            6. ESPA�O PARA SUGEST�ES
                        </td>
                    </tr>
                    <tr>
                        <td style="font-size: 11px">
                            <bean:write name="PautaForm" property="pautaSugestao" filter="false"/>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-left: 20px; font-size: 11px">
                            <html:textarea name="PautaForm" property="espacoSugestao" styleClass="form-control" rows="8"/>
                        </td>
                    </tr>
                    <tr><td>&nbsp;</td></tr>
                    <tr>
                        <td style="border-bottom: 1px solid black">
                            7. FINALIZA��O
                        </td>
                    </tr>
                    <tr>
                        <td style="font-size: 11px">
                            <bean:write name="PautaForm" property="pautaFinalizacao" filter="false"/>
                        </td>
                    </tr>
                    <tr><td>&nbsp;</td></tr>
                    <tr><td>&nbsp;</td></tr>
                    <tr>
                        <td>
                            <input class="btn btn-green" type="button" value="Salvar" onClick="fSalvar(<bean:write name="PautaForm" property="idSerieAno"/>)">
                        </td>
                    </tr>
                    <tr><td>&nbsp;</td></tr>
                    <tr><td>&nbsp;</td></tr>
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
    function fSalvar(idSerieAno) {
        document.PautaForm.action = "Pauta.do?action=salvarPautaAluno&idSerieAno="+idSerieAno;
        document.PautaForm.target = "_self";
        document.PautaForm.submit();
    }
</script>



