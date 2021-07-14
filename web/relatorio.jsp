<%-- 
    Document   : relatorio
    Created on : 13/07/2020, 23:45:51
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
        <jsp:include page="topo.jsp"/>

        <table border="0" align="center" style="margin-top: 20px; background-color: #C1FFC1" width="100%">
            <tr>
                <td width="10%" style="padding-left: 50px">
                    <a href="tela_interativa.jsp"><img src="imagens/bt_voltar_2.png" width="100px"/></a>
                </td>
                <td width="80%" align="center">
                    <h1>Relat�rios</h1>
                </td>
                <td width="10%">&nbsp;</td>
            </tr>
        </table>
        <div class="form-group">
            <table border="0" class="table-condensed" align="center" style="margin-top: 20px;" width="80%">
                <tr>
                    <td colspan="2" style="background-color: #FFFACD">
                        <b>RELAT�RIOS DE DADOS</b>
                    </td>
                </tr>
                <tr>
                    <td>
                        Relat�rio de Telefones dos Pais
                    </td>
                    <td>
                        <a href="Relatorios.do?action=relTelefonePais" target="_blank" class="btn btn-green">Visualizar</a>
                    </td>
                </tr>
                <tr>
                    <td>
                        Relat�rio Lista de Anivers�rios
                    </td>
                    <td>
                        <a href="Relatorios.do?action=relListaAniversario" target="_blank" class="btn btn-green">Visualizar</a>
                    </td>
                </tr>
                <tr>
                    <td>
                        Relat�rio Lista de Endere�os / Telefone / Linha Transporte
                    </td>
                    <td>
                        <a href="Relatorios.do?action=relListaEndereco" target="_blank" class="btn btn-green">Visualizar</a>
                    </td>
                </tr>
                <tr>
                    <td>
                        Relat�rio Geral (Ativos, Inativos, Sexo, Turma)
                    </td>
                    <td>
                        <a href="Relatorios.do?action=relGeralAtivoInativoTurma" target="_blank" class="btn btn-green">Visualizar</a>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="background-color: #FFFACD">
                        <b>RELAT�RIOS DE NOTAS</b>
                    </td>
                </tr>
                <tr>
                    <td>
                        Relat�rio Notas Mensal (por bimestre)
                    </td>
                    <td>
                        <a href="Relatorios.do?action=pageRelNotasMensalPorBimestre" class="btn btn-green">Visualizar</a>
                    </td>
                </tr>
                <tr>
                    <td>
                        Relat�rio Notas Bimestral (por bimestre)
                    </td>
                    <td>
                        <a href="Relatorios.do?action=pageRelNotasBimestralPorBimestre" class="btn btn-green">Visualizar</a>
                    </td>
                </tr>
                <tr>
                    <td>
                        Relat�rio Notas Produ��o de Sala (por bimestre)
                    </td>
                    <td>
                        <a href="Relatorios.do?action=pageRelNotasProducaoPorBimestre" class="btn btn-green">Visualizar</a>
                    </td>
                </tr>
                <tr>
                    <td>
                        Relat�rio de M�dia de Notas (por bimestre)
                    </td>
                    <td>
                        <a href="Relatorios.do?action=pageRelNotasMediaPorBimestre" class="btn btn-green">Visualizar</a>
                    </td>
                </tr>
                <logic:equal name="tipoPerfil" scope="session" value="diretoria">
                    <tr>
                        <td>
                            Relat�rio de Lan�amentos de Notas (por data)
                        </td>
                        <td>
                            <a href="Relatorios.do?action=pageRelLancamentoNotas" class="btn btn-green">Visualizar</a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Relat�rio das Melhores M�dias por Bimestre
                        </td>
                        <td>
                            <a href="Relatorios.do?action=pageRelMelhoresNotasPorBimestre" class="btn btn-green">Visualizar</a>
                        </td>
                    </tr>
                </logic:equal>
                <tr>
                    <td>
                        Relat�rio de Notas Segmentada Por Aluno
                    </td>
                    <td>
                        <a href="Relatorios.do?action=pageNotasPorAluno" class="btn btn-green">Visualizar</a>
                    </td>
                </tr>
                <tr>
                    <td>
                        Relat�rio de M�dias Bimestrais Por S�rie/Ano
                    </td>
                    <td>
                        <a href="Relatorios.do?action=pageRelSinteticoMediaPorSerie" class="btn btn-green">Visualizar</a>
                    </td>
                </tr>
                <tr>
                    <td>
                        Relat�rio de Faltas Bimestrais Por S�rie/Ano
                    </td>
                    <td>
                        <a href="Relatorios.do?action=pageRelFaltasPorBimestre" class="btn btn-green">Visualizar</a>
                    </td>
                </tr>
            </table>
        </div>





    </body>
</html>

