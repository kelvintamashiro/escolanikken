<%-- 
    Document   : advertencia_pesquisar
    Created on : 5 de abr de 2021, 15:07:55
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
        <html:form action="Advertencia" name="AdvertenciaForm" type="br.com.Form.AdvertenciaForm" scope="request">

            <table border="0" align="center" style="margin-top: 20px; background-color: #ADD8E6" width="100%">
                <tr>
                    <td width="10%" style="padding-left: 50px">
                        <a href="tela_interativa.jsp"><img src="imagens/bt_voltar_2.png" width="100px"/></a>
                    </td>
                    <td width="80%" align="center">
                        <h2>Lista Advertência por Aluno</h2>
                    </td>
                    <td width="10%">&nbsp;</td>
                </tr>
            </table>

            <div class="form-group">
                <table border="0" align="center" style="margin-top: 20px;font-size: 11px" width="90%" class="table">
                    <tr style="background-color: #F4F4F4">
                        <td width="10%"><b>Data Advertência</b> </td>
                        <td width="15%"><b>Aluno</b> </td>
                        <td width="10%"><b>Série/Ano</b> </td>
                        <td width="5%"><b>Tipo</b> </td>
                        <td width="50%"><b>Advertência</b> </td>
                        <td width="5%">&nbsp;</td>
                        <td width="5%">&nbsp;</td>
                    </tr>
                    <logic:present name="listaAdvertencias" scope="request">
                        <logic:iterate name="listaAdvertencias" id="lista" scope="request">
                            <tr>
                                <td>
                                    <bean:write name="lista" property="dataAdvertencia"/>
                                </td>
                                <td>
                                    <bean:write name="lista" property="nomeAluno"/>
                                </td>
                                <td>
                                    <bean:write name="lista" property="dsSerieAno"/>
                                </td>
                                <td>
                                    <logic:equal name="lista" property="tipoAdvSusp" value="0">Advertência</logic:equal>
                                    <logic:equal name="lista" property="tipoAdvSusp" value="1">Suspensão</logic:equal>
                                </td>
                                <td>
                                    <bean:write name="lista" property="dsTipoAdvertencia"/>
                                </td>
                                <td>
                                    <input class="btn btn-green" type="button" value="Imprimir" onClick="fImprimir(<bean:write name="lista" property="idAdvertencia"/>)">
                                </td>
                                <td>
                                    <input class="btn btn-danger" type="button" value="Excluir" onClick="fExcluir(<bean:write name="lista" property="idAdvertencia"/>)">
                                </td>
                            </tr>
                        </logic:iterate>
                    </logic:present>

                </table>
            </div>

        </html:form>
    </body>
</html>
<script language="javascript">
    function fImprimir(idAdvertencia) {
        document.AdvertenciaForm.action = "Advertencia.do?action=imprimirAdvertencia&idAdvertencia=" + idAdvertencia;
        document.AdvertenciaForm.target = "_blank";
        document.AdvertenciaForm.submit();
    }


    function fExcluir(idAdvertencia) {
        if (confirm("Deseja Realmente Excluir?")) {
            document.AdvertenciaForm.action = "Advertencia.do?action=excluirAdvertencia&idAdvertencia=" + idAdvertencia;
            document.AdvertenciaForm.target = "_self";
            document.AdvertenciaForm.submit();
        }
    }
</script>


