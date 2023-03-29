<%-- 
    Document   : page_editar_nota_bimestre
    Created on : 4 de mar de 2021, 10:08:46
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

            <html:hidden name="NotaBimestreForm" property="idDisciplina"/>
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
            <div class="form-group">
                <table border="0" align="center" style="margin-top: 20px;" width="80%">
                    <tr>
                        <td width="20%">
                            <div class="col-lg-12">
                                <label for="usr">Bimestre:</label>
                                <b><bean:write name="NotaBimestreForm" property="nrBimestre"/>º Bim.</b>
                                <html:hidden name="NotaBimestreForm" property="nrBimestre"/>
                            </div>
                        </td>
                        <td width="20%">
                            <div class="col-lg-12">
                                <label for="usr">Categoria de Ensino:</label>
                                <b><bean:write name="NotaBimestreForm" property="categoriaEnsino"/></b>
                                <html:hidden name="NotaBimestreForm" property="categoriaEnsino"/>
                            </div>
                        </td>
                        <td width="20%">
                            <div class="col-lg-12">
                                <label for="usr">Nome da Disciplina:</label>
                                <b><bean:write name="NotaBimestreForm" property="nomeDisciplina"/></b>
                                <html:hidden name="NotaBimestreForm" property="nomeDisciplina"/>
                            </div>
                        </td>
                        <td width="50%">
                            <div class="col-lg-12">
                                <label for="usr">Série:</label>
                                <b><bean:write name="NotaBimestreForm" property="dsSerieAno"/></b>
                                <html:hidden name="NotaBimestreForm" property="dsSerieAno"/>
                                <html:hidden name="NotaBimestreForm" property="idSerieAno"/>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
            <html:hidden name="NotaBimestreForm" property="idNotaBimestre"/>
            <div class="form-group">
                <table border="0" class="table" align="center" style="margin-top: 20px;background-color: #C1FFC1" width="90%">
                    <tr>
                        <td width="5%">&nbsp;</td>
                        <td width="40%">
                            <b>Aluno</b>
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
                            <bean:write name="NotaBimestreForm" property="nomeAluno"/>
                            <html:hidden name="NotaBimestreForm" property="nomeAluno"/>
                        </td>
                        <td>
                            <input class="nota form-control form-control-sm" name="notaProducaoSala" id="notaProducaoSala" type="text" min="0" max="10" value="<bean:write name="NotaBimestreForm" property="notaProducaoSala"/>"/>
                        </td>
                        <td>
                            <input class="nota form-control form-control-sm" name="notaMensal" id="notaMensal" type="text" min="0" max="10" value="<bean:write name="NotaBimestreForm" property="notaMensal"/>" />
                        </td>
                        <td>
                            <input class="nota form-control form-control-sm" name="notaBimestral" id="notaBimestral" type="text" min="0" max="10" value="<bean:write name="NotaBimestreForm" property="notaBimestral"/>" />
                        </td>
                        <td><input class="btn btn-sm btn-success" type="button" value="Atualizar" onClick="fAtualizar()"></td>
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

        </html:form>
    </body>
</html>
<script language="javascript">
    function fAtualizar() {
        var notaProducaoSala = document.getElementById("notaProducaoSala").value;
        var notaMensal = document.getElementById("notaMensal").value;
        var notaBimestral = document.getElementById("notaBimestral").value;
        if (notaProducaoSala === "" && notaMensal === "" && notaBimestral === "") {
            alert("Deve ser INFORMADO uma das notas");
        } else {
            document.NotaBimestreForm.action = "NotaBimestre.do?action=editarNota";
            document.NotaBimestreForm.submit();
        }
    }

</script>



