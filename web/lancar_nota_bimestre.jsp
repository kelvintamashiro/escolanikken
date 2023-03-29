<%-- 
    Document   : lancar_nota_bimestre
    Created on : 06/04/2020, 11:13:02
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
    <body>
        <logic:present name="errors">
            <script>
                alert('<bean:write name="errors"/>');
            </script>
        </logic:present>
        <html:form action="NotaBimestre" name="NotaBimestreForm" type="br.com.Form.NotaBimestreForm" scope="request">
            <jsp:include page="topo.jsp"/>
            <div class="container-fluid">
                <div class="row p-3" style="background-color: #F4F4F4" >
                    <div class="col-12 col-sm-1" align="center">
                        <a href="tela_interativa.jsp"><img src="imagens/bt_voltar_2.png" width="100px"/></a>
                    </div>
                    <div class="col-sm-10" align="center">
                        <h1>Lançamento de Notas por Série/Ano</h1>
                    </div>
                    <div class="col-sm-1">&nbsp;</div>
                </div>
            </div>

            <bean:define id="disciplina" name="NotaBimestreForm" property="disciplinasForm"/>
            <bean:define id="serieAno" name="NotaBimestreForm" property="serieAnoForm"/>
            <div class="form-group">
                <table border="0" align="center" style="margin-top: 20px;" width="80%">
                    <tr>
                        <td width="20%">
                            <div class="col-lg-12">
                                <label for="usr">Bimestre:</label>
                                <b><bean:write name="bimestre" scope="request"/>º Bim.</b>
                            </div>
                        </td>
                        <td width="20%">
                            <div class="col-lg-12">
                                <label for="usr">Categoria de Ensino:</label>
                                <b><bean:write name="disciplina" property="dsCategoriaEnsino"/></b>
                            </div>
                        </td>
                        <td width="20%">
                            <div class="col-lg-12">
                                <label for="usr">Nome da Disciplina:</label>
                                <b><bean:write name="disciplina" property="nomeDisciplina"/></b>
                            </div>
                        </td>
                        <td width="50%">
                            <div class="col-lg-12">
                                <label for="usr">Série:</label>
                                <html:hidden name="serieAno" property="serieAno"/>
                                <b><bean:write name="serieAno" property="dsSerieAno"/></b>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
            <logic:present name="listaAlunosSemNota" scope="request">
                <div class="form-group">
                    <table border="0" class="table" align="center" style="margin-top: 20px;background-color: #C1FFC1" width="90%">
                        <tr>
                            <td width="5%">&nbsp;</td>
                            <td width="40%">
                                <b>Alunos</b>
                            </td>
                            <td width="10%">
                                <b>Produção de Sala</b>
                            </td>
                            <td width="10%">
                                <b>Prova Mensal</b>
                            </td>
                            <td width="10%">
                                <b>Prova Bimestral</b>
                            </td>
                            <td width="10%">&nbsp;<td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>
                                <html:select name="NotaBimestreForm" property="idAluno" styleClass="form-control form-control-sm">
                                    <html:option value="0">Selecione</html:option>
                                    <html:options collection="listaAlunosSemNota" property="idPF" labelProperty="nome"></html:options>
                                </html:select>
                            </td>
                            <td>
                                <input class="nota form-control form-control-sm" name="notaProducaoSala" id="notaProducaoSala" type="text" min="0" max="10" />
                            </td>
                            <td>
                                <input class="nota form-control form-control-sm" name="notaMensal" id="notaMensal" type="text" min="0" max="10" />
                            </td>
                            <td>
                                <input class="nota form-control form-control-sm" name="notaBimestral" id="notaBimestral" type="text" min="0" max="10" />
                            </td>
                            <td><input class="btn btn-sm btn-primary" type="button" value="Lançar" onClick="fLancarNota(<bean:write name="bimestre" scope="request"/>, <bean:write name="disciplina" property="idDisciplina"/>);"></td>
                            <td>&nbsp;</td>
                        </tr>
                        <script type="text/javascript">
                            var notas = document.getElementsByClassName("nota");

                            var onNotaInput = function (event) {
                                var regexp = new RegExp("[^0-9]", "g");
                                var value = event.target.value.replace(regexp, "");
                                value = parseInt(value) / 10;
                                if (value >= event.target.min && value <= event.target.max) {
                                    event.target.dataset.value = value;
                                } else {
                                    value = parseFloat(event.target.dataset.value);
                                }
                                if (isNaN(value)) {
                                    value = 0;
                                }

                                event.target.value = value.toLocaleString(undefined, {minimumFractionDigits: 1});
                            };

                            [].forEach.call(notas, function (nota) {
                                nota.addEventListener("input", onNotaInput);
                            });
                        </script>
                    </table>
                </div>
            </logic:present>

            <logic:present name="listaAlunosComNota" scope="request">
                <table border="0" class="table" align="center" style="margin-top: 20px;" width="90%">
                    <thead>
                        <tr>
                            <td width="5%">&nbsp;</td>
                            <td><b>Nome Aluno</b></td>
                            <td align="center"><b>Nota Produção de Sala</b></td>
                            <td align="center"><b>Nota Prova Mensal</b></td>
                            <td align="center"><b>Nota Prova Bimestral</b></td>
                            <td align="center"><b>Média Bimestral</b></td>
                            <td colspan="3">&nbsp;</td>
                        </tr>
                    </thead>
                    <tbody>
                        <logic:iterate name="listaAlunosComNota" id="lista" scope="request">
                            <bean:define name="lista" property="notaBimestre" id="notaBimestre"/>
                            <tr>
                                <td>&nbsp;</td>
                                <td><bean:write name="lista" property="nome"/></td>
                                <td align="center"><bean:write name="notaBimestre" property="notaProducaoSala"/></td>
                                <td align="center"><bean:write name="notaBimestre" property="notaMensal"/></td>
                                <td align="center"><bean:write name="notaBimestre" property="notaBimestral"/></td>
                                <logic:lessThan name="notaBimestre" property="mediaBimestre" value="6">
                                    <td align="center" style="color: red">
                                        <b><bean:write name="notaBimestre" property="mediaBimestre"/></b>
                                    </td>
                                    <td>
                                        <input class="btn btn-sm btn-success" type="button" value="Editar" onClick="fEditar(<bean:write name="bimestre" scope="request"/>, <bean:write name="notaBimestre" property="idNotaBimestre"/>, <bean:write name="disciplina" property="idDisciplina"/>);">
                                        <input class="btn btn-sm btn-danger" type="button" value="Excluir" onClick="fExcluir(<bean:write name="bimestre" scope="request"/>, <bean:write name="notaBimestre" property="idNotaBimestre"/>, <bean:write name="disciplina" property="idDisciplina"/>);">
                                        <input class="btn btn-sm btn-dark" type="button" value="Recuperou" onClick="fRecuperou(<bean:write name="bimestre" scope="request"/>, <bean:write name="notaBimestre" property="idNotaBimestre"/>, <bean:write name="disciplina" property="idDisciplina"/>);">
                                    </td>
                                </logic:lessThan>
                                <logic:greaterEqual name="notaBimestre" property="mediaBimestre" value="6">
                                    <logic:equal name="notaBimestre" property="recuperacao" value="1">
                                        <td align="center" style="background-color: #ffff99; color: blue">
                                            <b><bean:write name="notaBimestre" property="mediaBimestre"/></b>
                                        </td>
                                    </logic:equal>
                                    <logic:notEqual name="notaBimestre" property="recuperacao" value="1">
                                        <td align="center" style="color: blue">
                                            <b><bean:write name="notaBimestre" property="mediaBimestre"/></b>
                                        </td>
                                    </logic:notEqual>
                                    <td>
                                        <input class="btn btn-sm btn-success" type="button" value="Editar" onClick="fEditar(<bean:write name="bimestre" scope="request"/>, <bean:write name="notaBimestre" property="idNotaBimestre"/>, <bean:write name="disciplina" property="idDisciplina"/>);">
                                        <input class="btn btn-sm btn-danger" type="button" value="Excluir" onClick="fExcluir(<bean:write name="bimestre" scope="request"/>, <bean:write name="notaBimestre" property="idNotaBimestre"/>, <bean:write name="disciplina" property="idDisciplina"/>);">
                                    </td>
                                </logic:greaterEqual>
                                <td>&nbsp;</td>
                            </tr>
                        </logic:iterate>
                    </tbody>
                </table>
            </logic:present>

        </html:form>
    </body>
</html>
<script language="javascript">

    function fPesquisar() {
        document.AlunoForm.action = "Aluno.do?action=consultar";
        document.AlunoForm.submit();
    }
    function fLancarNota(nrBimestre, idDisciplina) {
        var idAluno = document.NotaBimestreForm.idAluno.value;
        var notaProducaoSala = document.getElementById("notaProducaoSala").value;
        var notaMensal = document.getElementById("notaMensal").value;
        var notaBimestral = document.getElementById("notaBimestral").value;
        if (idAluno === 0) {
            alert("Deve ser SELECIONADO o(a) estudante");
        } else if (notaProducaoSala === "" && notaMensal === "" && notaBimestral === "") {
            alert("Deve ser INFORMADO uma das notas");
        } else {
            document.NotaBimestreForm.action = "NotaBimestre.do?action=salvarNota&nrBimestre=" + nrBimestre + "&idDisciplina=" + idDisciplina;
            document.NotaBimestreForm.submit();
        }
    }

    function fEditar(nrBimestre, idNotaBimestre, idDisciplina) {
        document.NotaBimestreForm.action = "NotaBimestre.do?action=pageEditarNota&nrBimestre=" + nrBimestre + "&idNotaBimestre=" + idNotaBimestre + "&idDisciplina=" + idDisciplina;
        document.NotaBimestreForm.submit();
    }

    function fExcluir(nrBimestre, idNotaBimestre, idDisciplina) {
        if (confirm("Deseja Excluir mesmo??")) {
            document.NotaBimestreForm.action = "NotaBimestre.do?action=excluirNota&nrBimestre=" + nrBimestre + "&idNotaBimestre=" + idNotaBimestre + "&idDisciplina=" + idDisciplina;
            document.NotaBimestreForm.submit();
        }
    }

    function fRecuperou(nrBimestre, idNotaBimestre, idDisciplina) {
        if (confirm("O aluno realmente recuperou a nota desse Bimestre??")) {
            document.NotaBimestreForm.action = "NotaBimestre.do?action=recuperouNota&nrBimestre=" + nrBimestre + "&idNotaBimestre=" + idNotaBimestre + "&idDisciplina=" + idDisciplina;
            document.NotaBimestreForm.submit();
        }
    }
</script>



