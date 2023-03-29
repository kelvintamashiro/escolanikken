<%-- 
    Document   : advertencia_pesquisar_aluno
    Created on : 5 de abr de 2021, 20:33:08
    Author     : macuser
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<!DOCTYPE html>
<html lang="pt-br" class="js-disabled">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Escola Nikken</title>
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
        <logic:present name="errors">
            <script>
                alert('<bean:write name="errors"/>');
            </script>
        </logic:present>
        <jsp:include page="topo.jsp"/>
        <div class="container-fluid">
            <div class="row p-3" style="background-color: #F4F4F4" >
                <div class="col-12 col-sm-1" align="center">
                    <a href="tela_interativa.jsp"><img src="imagens/bt_voltar_2.png" width="100px"/></a>
                </div>
                <div class="col-sm-10" align="center">
                    <h2>Lista Advertência</h2>
                </div>
                <div class="col-sm-1">&nbsp;</div>
            </div>
        </div>
        <html:form action="Advertencia" name="AdvertenciaForm" type="br.com.Form.AdvertenciaForm" scope="request">

            <div class="form-group">
                <table border="0" align="center" style="margin-top: 20px;font-size: 11px" width="90%">
                    <tr style="background-color: #F4F4F4">
                        <td width="10%"><b>Data Advertência</b> </td>
                        <td width="15%"><b>Aluno</b> </td>
                        <td width="10%"><b>Série/Ano</b> </td>
                        <td width="55%"><b>Advertência</b> </td>
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
                                    <bean:write name="lista" property="dsTipoAdvertencia"/>
                                </td>
                                <td>
                                    <input class="btn btn-sm btn-success" type="button" value="Imprimir" onClick="fImprimir('<bean:write name="lista" property="idAdvertenciaCripto"/>')">
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
        document.AdvertenciaForm.action = "Advertencia.do?action=imprimirAdvertenciaAluno&idAdvertenciaCripto=" + idAdvertencia;
        document.AdvertenciaForm.target = "_blank";
        document.AdvertenciaForm.submit();
    }

</script>



