<%-- 
    Document   : lancar_nota_projeto
    Created on : 2 de fev de 2022, 23:15:02
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
    <body>
        <logic:present name="errors">
            <script>
                alert('<bean:write name="errors"/>');
            </script>
        </logic:present>
        <html:form action="NotaItinerario" name="NotaItinerarioForm" type="br.com.Form.NotaItinerarioForm" scope="request">
            <jsp:include page="topo.jsp"/>

            <table border="0" align="center" style="margin-top: 20px; background-color: #ADD8E6" width="100%">
                <tr>
                    <td width="10%" style="padding-left: 50px">
                        <a href="NotaItinerario.do?idPF=<%=session.getAttribute("idPF").toString()%>"><img src="imagens/bt_voltar_2.png" width="100px"/></a>
                    </td>
                    <td width="80%" align="center">
                        <h1>Lançamento de Notas por Série/Ano</h1>
                    </td>
                    <td width="10%">&nbsp;</td>
                </tr>
            </table>

            <div class="form-group">
                <table border="0" align="center" style="margin-top: 20px;" width="80%">
                    <tr>
                        <td width="20%">
                            <div class="col-lg-12">
                                <label for="usr">Bimestre:</label>
                                <html:hidden name="NotaItinerarioForm" property="nrBimestre"/>
                                <b><bean:write name="NotaItinerarioForm" property="nrBimestre" scope="request"/>º Bim.</b>
                            </div>
                        </td>
                        <td width="20%">
                            <div class="col-lg-12">
                                <label for="usr">Categoria de Ensino:</label>
                                <html:hidden name="NotaItinerarioForm" property="categoriaEnsino"/>
                                <b><bean:write name="NotaItinerarioForm" property="categoriaEnsino"/></b>
                            </div>
                        </td>
                        <td width="20%">
                            <div class="col-lg-12">
                                <label for="usr">Série:</label>
                                <html:hidden name="NotaItinerarioForm" property="idSerieAno"/>
                                <logic:equal name="NotaItinerarioForm" property="idSerieAno" value="10"><b>1ª série E.M.</b></logic:equal>
                                <logic:equal name="NotaItinerarioForm" property="idSerieAno" value="20"><b>2ª série E.M.</b></logic:equal>
                                <logic:equal name="NotaItinerarioForm" property="idSerieAno" value="30"><b>3ª série E.M.</b></logic:equal>
                                </div>
                            </td>
                            <td width="50%">
                                <div class="col-lg-12">
                                    <label for="usr">Nome Itinerário:</label>
                                <html:hidden name="NotaItinerarioForm" property="idItinerario"/>
                                <html:hidden name="NotaItinerarioForm" property="nomeItinerario"/>
                                <b><bean:write name="NotaItinerarioForm" property="nomeItinerario"/></b>
                            </div>
                        </td>

                    </tr>
                </table>
            </div>
            <logic:present name="listaAlunosSemNota" scope="request">
                <div class="form-group">
                    <table border="0" class="table" align="center" style="margin-top: 20px;background-color: #C1FFC1" width="100%">
                        <tr>
                            <td width="25%">&nbsp;</td>
                            <td width="30%">
                                <b>Alunos</b>
                            </td>
                            <td width="10%">
                                <b>Nota</b>
                            </td>
                            <td width="10%">&nbsp;<td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>
                                <html:select name="NotaItinerarioForm" property="idAluno" styleClass="form-control">
                                    <html:option value="0">Selecione</html:option>
                                    <html:options collection="listaAlunosSemNota" property="idPF" labelProperty="nome"></html:options>
                                </html:select>
                            </td>
                            <td>
                                <input class="nota form-control" name="notaBimestral" id="notaBimestral" type="text" min="0" max="10" />
                            </td>
                            <td><input class="btn btn-grey" type="button" value="Lançar" onClick="fLancarNota(<bean:write name="bimestre" scope="request"/>, <bean:write name="NotaItinerarioForm" property="idItinerario"/>)"/></td>
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
                <div class="form-group">
                    <table border="0" class="table" align="center" style="margin-top: 20px;" width="90%">
                        <tr>
                            <td width="10%">&nbsp;</td>
                            <td><b>Nome Aluno</b></td>
                            <td align="center"><b>Nota</b></td>
                            <td width="10%">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td width="10%">&nbsp;</td>
                        </tr>
                        <logic:iterate name="listaAlunosComNota" id="lista" scope="request">
                            <tr>
                                <td>&nbsp;</td>
                                <td><bean:write name="lista" property="nomeAluno"/></td>
                                <td align="center"><bean:write name="lista" property="notaBimestral"/></td>
                                <td>
                                    <input class="btn btn-danger" type="button" value="Excluir" onClick="fExcluir(<bean:write name="lista" property="idNotaItinerario" />);">
                                </td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                        </logic:iterate>
                    </table>
                </div>
            </logic:present>

            <!--<br/><br/><br/><br/><br/><br/>-->
            <%--<jsp:include page="footer.jsp"/>--%>
        </html:form>
    </body>
</html>
<script language="javascript">

    function fPesquisar() {
        document.AlunoForm.action = "Aluno.do?action=consultar";
        document.AlunoForm.submit();
    }
    function fLancarNota(nrBimestre, idItinerario) {
        var idAluno = document.NotaItinerarioForm.idAluno.value;
        var notaBimestral = document.getElementById("notaBimestral").value;
        if (idAluno === "0") {
            alert("Deve ser SELECIONADO o(a) estudante");
        } else if (notaBimestral === "") {
            alert("Deve ser INFORMADO uma das notas");
        } else {
            document.NotaItinerarioForm.action = "NotaItinerario.do?action=salvarNota&nrBimestre=" + nrBimestre + "&idItinerario=" + idItinerario;
            document.NotaItinerarioForm.submit();
        }
    }

    function fExcluir(idNotaItinerario) {
        if (confirm("Deseja Excluir mesmo??")) {
            document.NotaItinerarioForm.action = "NotaItinerario.do?action=excluirNota&idNotaItinerario=" + idNotaItinerario;
            document.NotaItinerarioForm.submit();
        }
    }

</script>



