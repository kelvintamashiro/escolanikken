<%-- 
    Document   : pauta_bimestre_editar
    Created on : 16 de jul de 2021, 21:09:06
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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

        <!--Ajax-->
        <script type="text/javascript" src="js/ajax.js"></script>
        <script type="text/javascript" src="js/tinymce/js/tinymce/tinymce.min.js"></script>
        <script>
            tinymce.init({
                selector: 'textarea',
                height: 200,
                plugins: [
                    "advlist autolink lists link image charmap print preview anchor",
                    "searchreplace visualblocks code fullscreen",
                    "insertdatetime media table contextmenu paste imagetools"
                ],
                toolbar: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image",
                // imagetools_cors_hosts: ['www.tinymce.com', 'codepen.io'],
                content_css: [
                    '//fonts.googleapis.com/css?family=Lato:300,300i,400,400i'
                ]
            });
        </script>

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
        <div class="container-fluid">
            <div class="row p-3" style="background-color: #F4F4F4" >
                <div class="col-12 col-sm-1" align="center">
                    <a href="gerenciador_pauta.jsp"><img src="imagens/bt_voltar_2.png" width="100px"/></a>
                </div>
                <div class="col-sm-10" align="center">
                    <h2>Editar Pauta por Bimestre/Ano</h2>
                </div>
                <div class="col-sm-1">&nbsp;</div>
            </div>
        </div>
        <html:form action="Pauta" name="PautaForm" type="br.com.Form.PautaForm" scope="request">

            <div class="form-group">
                <table border="0" align="center" style="margin-top: 20px;" width="80%">
                    <tr>
                        <td colspan="2">
                            <div class="col-lg-12">
                                <html:hidden name="PautaForm" property="idPauta"/>
                                <label for="usr">Bimestre:</label>
                                <html:select name="PautaForm" property="nrBimestre" styleId="nrBimestre" styleClass="form-control form-control-sm">
                                    <html:option value="1">1º Bimestre</html:option>
                                    <html:option value="2">2º Bimestre</html:option>
                                    <html:option value="3">3º Bimestre</html:option>
                                    <html:option value="4">4º Bimestre</html:option>
                                </html:select>
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td colspan="2">
                            <div class="col-lg-12">
                                <label for="usr">Item 1 - Apresentação</label>
                                <html:textarea name="PautaForm" property="pautaApresentacao" styleClass="form-control form-control-sm"/>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <div class="col-lg-12">
                                <label for="usr">Item 3 - Boletim</label>
                                <html:textarea name="PautaForm" property="pautaBoletim" styleClass="form-control form-control-sm"/>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <div class="col-lg-12">
                                <label for="usr">Item 4 - Recados aos Pais</label>
                                <html:textarea name="PautaForm" property="pautaRecadoPais" styleClass="form-control form-control-sm"/>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <div class="col-lg-12">
                                <label for="usr">Item 5 - Recados Gerais</label>
                                <html:textarea name="PautaForm" property="pautaRecadoGeral" styleClass="form-control form-control-sm"/>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <div class="col-lg-12">
                                <label for="usr">Item 6 - Sugestões</label>
                                <html:textarea name="PautaForm" property="pautaSugestao" styleClass="form-control form-control-sm"/>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <div class="col-lg-12">
                                <label for="usr">Item 7 - Finalização</label>
                                <html:textarea name="PautaForm" property="pautaFinalizacao" styleClass="form-control form-control-sm"/>
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <div class="col-lg-12">
                                <label for="usr">&nbsp;</label>
                                <input class="btn btn-sm btn-success" type="button" value="Atualizar" onClick="fAtualizar()">
                            </div>
                        </td>
                    </tr>
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
    function fAtualizar() {
        document.PautaForm.action = "Pauta.do?action=atualizarPautaBimestre";
        document.PautaForm.target = "_self";
        document.PautaForm.submit();
    }



</script>



