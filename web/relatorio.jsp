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
        <jsp:include page="topo.jsp"/>
        <div class="container-fluid">
            <div class="row p-3" style="background-color: #F4F4F4" >
                <div class="col-12 col-sm-1" align="center">
                    <a href="tela_interativa.jsp"><img src="imagens/bt_voltar_2.png" width="100px"/></a>
                </div>
                <div class="col-sm-10" align="center">
                    <h1>Relat�rios</h1>
                </div>
                <div class="col-sm-1">&nbsp;</div>
            </div>
        </div>

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
                        <a href="Relatorios.do?action=relTelefonePais" target="_blank" class="btn btn-sm btn-success">Visualizar</a>
                    </td>
                </tr>
                <tr>
                    <td>
                        Relat�rio Lista de Anivers�rios
                    </td>
                    <td>
                        <a href="Relatorios.do?action=relListaAniversario" target="_blank" class="btn btn-sm btn-success">Visualizar</a>
                    </td>
                </tr>
                <tr>
                    <td>
                        Relat�rio Lista de Endere�os / Telefone / Linha Transporte
                    </td>
                    <td>
                        <a href="Relatorios.do?action=relListaEndereco" target="_blank" class="btn btn-sm btn-success">Visualizar</a>
                    </td>
                </tr>
                <tr>
                    <td>
                        Relat�rio Geral (Ativos, Inativos, Sexo, Turma)
                    </td>
                    <td>
                        <a href="Relatorios.do?action=relGeralAtivoInativoTurma" target="_blank" class="btn btn-sm btn-success">Visualizar</a>
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
                        <a href="Relatorios.do?action=pageRelNotasMensalPorBimestre" class="btn btn-sm btn-success">Visualizar</a>
                    </td>
                </tr>
                <tr>
                    <td>
                        Relat�rio Notas Bimestral (por bimestre)
                    </td>
                    <td>
                        <a href="Relatorios.do?action=pageRelNotasBimestralPorBimestre" class="btn btn-sm btn-success">Visualizar</a>
                    </td>
                </tr>
                <tr>
                    <td>
                        Relat�rio Notas Produ��o de Sala (por bimestre)
                    </td>
                    <td>
                        <a href="Relatorios.do?action=pageRelNotasProducaoPorBimestre" class="btn btn-sm btn-success">Visualizar</a>
                    </td>
                </tr>
                <tr>
                    <td>
                        Relat�rio de M�dia de Notas (por bimestre)
                    </td>
                    <td>
                        <a href="Relatorios.do?action=pageRelNotasMediaPorBimestre" class="btn btn-sm btn-success">Visualizar</a>
                    </td>
                </tr>
                <logic:equal name="tipoPerfil" scope="session" value="diretoria">
                    <tr>
                        <td>
                            Relat�rio de Lan�amentos de Notas (por data)
                        </td>
                        <td>
                            <a href="Relatorios.do?action=pageRelLancamentoNotas" class="btn btn-sm btn-success">Visualizar</a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Relat�rio das Melhores M�dias por Bimestre
                        </td>
                        <td>
                            <a href="Relatorios.do?action=pageRelMelhoresNotasPorBimestre" class="btn btn-sm btn-success">Visualizar</a>
                        </td>
                    </tr>
                </logic:equal>
                <tr>
                    <td>
                        Relat�rio de Notas Segmentada Por Aluno
                    </td>
                    <td>
                        <a href="Relatorios.do?action=pageNotasPorAluno" class="btn btn-sm btn-success">Visualizar</a>
                    </td>
                </tr>
                <tr>
                    <td>
                        Relat�rio de M�dias Bimestrais Por S�rie/Ano
                    </td>
                    <td>
                        <a href="Relatorios.do?action=pageRelSinteticoMediaPorSerie" class="btn btn-sm btn-success">Visualizar</a>
                    </td>
                </tr>
                <tr>
                    <td>
                        Relat�rio de Faltas Bimestrais Por S�rie/Ano
                    </td>
                    <td>
                        <a href="Relatorios.do?action=pageRelFaltasPorBimestre" class="btn btn-sm btn-success">Visualizar</a>
                    </td>
                </tr>
            </table>
        </div>





    </body>
</html>

