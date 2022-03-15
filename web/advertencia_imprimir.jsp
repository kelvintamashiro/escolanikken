<%-- 
    Document   : advertencia_imprimir
    Created on : 5 de abr de 2021, 16:59:57
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
    <!--<body onload="fImprimir()">-->
    <body>
        <html:form action="Advertencia" name="AdvertenciaForm" type="br.com.Form.AdvertenciaForm" scope="request">

            <table border="0" align="center" style="margin-top: 20px;" width="70%">
                <tr>
                    <td align="center">
                        <img src="imagens/logo.png" width="30%"/>
                    </td>
                </tr>
                <tr>
                    <td align="center" style="padding-top: 50px; padding-bottom: 50px">
                        <logic:equal name="AdvertenciaForm" property="tipoAdvSusp" value="0"><b><u>CARTA DE ADVERTÊNCIA</u></b></logic:equal>
                        <logic:equal name="AdvertenciaForm" property="tipoAdvSusp" value="1"><b><u>CARTA DE SUSPENSÃO</u></b></logic:equal>
                    </td>
                </tr>
                <tr>
                    <td>
                        Informativo de Ocorrência(s)
                    </td>
                </tr>
                <tr><td>&nbsp;</td></tr>
                <tr>
                    <td align="justify">
                        <b><u><bean:write name="AdvertenciaForm" property="nomeAluno"/></u></b>, aluno(a) deste estabelecimento de ensino, 
                        matriculado no(a) <u><bean:write name="AdvertenciaForm" property="dsSerieAno"/> do(a) <bean:write name="AdvertenciaForm" property="dsCategoriaSerie"/></u>, 
                        foi ADVERTIDO(A), pelo(s) motivo(s) discriminado(s) abaixo:
                    </td>
                </tr>
                <tr><td>&nbsp;</td></tr>
                <tr>
                    <td align="justify">
                        <bean:write name="AdvertenciaForm" property="dsTipoAdvertencia" filter="false"/>
                    </td>
                </tr>
                <tr><td>&nbsp;</td></tr>
                <logic:notEqual name="AdvertenciaForm" property="observacao" value="">
                    <tr>
                        <td style="border: 1px solid black; padding: 20px">
                            <b>OBS.:</b> <bean:write name="AdvertenciaForm" property="observacao"/> 
                        </td>
                    </tr>
                </logic:notEqual>
                <tr><td>&nbsp;</td></tr>
                <tr>
                    <td align="justify">
                        Solicito, portanto as devidas providências dos senhores pais, alertando seu(ua) filho(a) sobre <u>EDUCAÇÃO</u> e <u>RESPEITO</u>, 
                        a fim de se evitar maiores problemas no futuro, pois comportamentos como esses <u>NÃO SERÃO TOLERADOS POR ESTA INSTITUIÇÃO DE ENSINO.</u>
                    </td>
                </tr>
                <tr><td>&nbsp;</td></tr>
                <tr>
                    <td align="right">
                        Yokkaichi, <bean:write name="AdvertenciaForm" property="dataPorExtenso"/> 
                    </td>
                </tr>
                <tr><td>&nbsp;</td></tr>
                <tr><td>&nbsp;</td></tr>
                <tr><td>&nbsp;</td></tr>
            </table>
            <table border="0" align="center" width="60%">
                <tr>
                    <td width="40%" align="center" style="border-bottom: 1px solid black">
                        &nbsp;
                    </td>
                    <td>&nbsp;</td>
                    <td width="40%" align="center" style="border-bottom: 1px solid black">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        Assinatura do Pai/Mãe <br/>e/ou Responsável
                    </td>
                    <td>&nbsp;</td>
                    <td align="center">
                        Fujimi Hanazono Kataoka <br/>
                        Diretora da Escola
                    </td>
                </tr>
            </table>


        </html:form>
    </body>
</html>
<script language="javascript">
    function fImprimir(idAdvertencia) {
        window.print()
    }


</script>


