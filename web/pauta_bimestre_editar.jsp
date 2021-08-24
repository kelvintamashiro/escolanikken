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
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <script language="javascript1.2" src="js/mizanscene.js"></script>
        <script type="text/javascript" src="js/JQuery/js/jquery-1.3.2.js"></script>

        <link rel="stylesheet" media="all" type="text/css" href="assets/css/fix.css" />
        <link rel="stylesheet" media="all" type="text/css" href="assets/css/style_original.css" />
        <link rel="stylesheet" media="all" type="text/css" href="assets/css/mobile.css" />

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
        <html:form action="Pauta" name="PautaForm" type="br.com.Form.PautaForm" scope="request">

            <table border="0" align="center" style="margin-top: 20px; background-color: #ADD8E6" width="100%">
                <tr>
                    <td width="10%" style="padding-left: 50px">
                        <a href="gerenciador_pauta.jsp"><img src="imagens/bt_voltar_2.png" width="100px"/></a>
                    </td>
                    <td width="80%" align="center">
                        <h2>Editar Pauta por Bimestre/Ano</h2>
                    </td>
                    <td width="10%">&nbsp;</td>
                </tr>
            </table>

            <div class="form-group">
                <table border="0" align="center" style="margin-top: 20px;" width="80%">
                    <tr>
                        <td colspan="2">
                            <div class="col-lg-12">
                                <html:hidden name="PautaForm" property="idPauta"/>
                                <label for="usr">Bimestre:</label>
                                <html:select name="PautaForm" property="nrBimestre" styleId="nrBimestre" styleClass="form-control">
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
                                <html:textarea name="PautaForm" property="pautaApresentacao" styleClass="form-control"/>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <div class="col-lg-12">
                                <label for="usr">Item 3 - Boletim</label>
                                <html:textarea name="PautaForm" property="pautaBoletim" styleClass="form-control"/>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <div class="col-lg-12">
                                <label for="usr">Item 4 - Recados aos Pais</label>
                                <html:textarea name="PautaForm" property="pautaRecadoPais" styleClass="form-control"/>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <div class="col-lg-12">
                                <label for="usr">Item 5 - Recados Gerais</label>
                                <html:textarea name="PautaForm" property="pautaRecadoGeral" styleClass="form-control"/>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <div class="col-lg-12">
                                <label for="usr">Item 6 - Sugestões</label>
                                <html:textarea name="PautaForm" property="pautaSugestao" styleClass="form-control"/>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <div class="col-lg-12">
                                <label for="usr">Item 7 - Finalização</label>
                                <html:textarea name="PautaForm" property="pautaFinalizacao" styleClass="form-control"/>
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <div class="col-lg-12">
                                <label for="usr">&nbsp;</label>
                                <input class="btn btn-green" type="button" value="Atualizar" onClick="fAtualizar()">
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



