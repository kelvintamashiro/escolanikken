<%-- 
    Document   : rel_geral_ativo_inativo_turma
    Created on : 21/08/2020, 23:42:55
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
        <table border="0" align="center" style="background-color: #F4F4F4" width="100%">
            <tr><td>&nbsp;</td></tr>
            <tr>
                <td align="center">
                    <img src="imagens/logo.png" width="20%"/>
                </td>
            </tr>
            <tr>
                <td align="center">
                    <h2>Relatório Geral</h2>
                </td>
            </tr>
        </table>
        <div class="row" align="center" style="padding-top: 50px">
            <table border="1" width="30%" align="center" style="font-size: 24px" class="table-condensed">
                <tr>
                    <td width="50%" align="center">
                        <b>TOTAL:</b>
                    </td>
                    <td width="50%" align="center">
                        <b><bean:write name="qtdTotal" scope="request"/></b>
                    </td>
                </tr>
            </table>
        </div>
        <div class="row" align="center" style="padding-top: 50px">
            <table border="1" width="30%" align="center" style="font-size: 18px;" class="table-condensed">
                <tr>
                    <td width="50%" align="center" style="color: blue">
                        <b>Masculino:</b>
                    </td>
                    <td width="50%" align="center" style="color: blue">
                        <b><bean:write name="qtdMasculino" scope="request"/></b>
                    </td>
                </tr>
                <tr>
                    <td width="50%" align="center" style="color: red">
                        <b>Feminino:</b>
                    </td>
                    <td width="50%" align="center" style="color: red">
                        <b><bean:write name="qtdFeminino" scope="request"/></b>
                    </td>
                </tr>
            </table>
        </div>

        <div class="row" align="center" style="padding-top: 50px">

            <table border="0" width="90%" align="center">
                <tr>
                    <!--Infantil-->
                    <td width="25%">
                        <table width="50%" border="1" align="center" style="font-size: 16px">
                            <logic:present name="listaCategoriaInfantil" scope="request">
                                <tr>
                                    <td colspan="2" align="center">
                                        <b>INFANTIL</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <bean:write name="listaCategoriaInfantil" property="qtdAmbosSexo"/>
                                    </td>
                                    <td align="center">
                                        <span style="color: blue"> M: <bean:write name="listaCategoriaInfantil" property="qtdMasculino"/></span>
                                        <br/>
                                        <span style="color: red">F: <bean:write name="listaCategoriaInfantil" property="qtdFeminino"/></span>
                                    </td>
                                </tr>
                            </logic:present>
                        </table>
                    </td> 
                    <!--Fundamental 1-->
                    <td width="25%">
                        <table width="50%" border="1" align="center" style="font-size: 16px">
                            <logic:present name="listaCategoriaFundamental1" scope="request">
                                <tr>
                                    <td colspan="2" align="center">
                                        <b>Ens. Fundamental I</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <bean:write name="listaCategoriaFundamental1" property="qtdAmbosSexo"/>
                                    </td>
                                    <td align="center">
                                        <span style="color: blue"> M: <bean:write name="listaCategoriaFundamental1" property="qtdMasculino"/></span>
                                        <br/>
                                        <span style="color: red">F: <bean:write name="listaCategoriaFundamental1" property="qtdFeminino"/></span>
                                    </td>
                                </tr>
                            </logic:present>
                        </table>
                    </td>
                    <!--Fundamental 2-->
                    <td width="25%">
                        <table width="50%" border="1" align="center" style="font-size: 16px">
                            <logic:present name="listaCategoriaFundamental2" scope="request">
                                <tr>
                                    <td colspan="2" align="center">
                                        <b>Ens. Fundamental II</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <bean:write name="listaCategoriaFundamental2" property="qtdAmbosSexo"/>
                                    </td>
                                    <td align="center">
                                        <span style="color: blue"> M: <bean:write name="listaCategoriaFundamental2" property="qtdMasculino"/></span>
                                        <br/>
                                        <span style="color: red">F: <bean:write name="listaCategoriaFundamental2" property="qtdFeminino"/></span>
                                    </td>
                                </tr>
                            </logic:present>
                        </table>
                    </td>
                    <!--Ensino Medio-->
                    <td width="25%">
                        <table width="50%" border="1" align="center" style="font-size: 16px">
                            <logic:present name="listaCategoriaEnsinoMedio" scope="request">
                                <tr>
                                    <td colspan="2" align="center">
                                        <b>Ens. Médio</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <bean:write name="listaCategoriaEnsinoMedio" property="qtdAmbosSexo"/>
                                    </td>
                                    <td align="center">
                                        <span style="color: blue"> M: <bean:write name="listaCategoriaEnsinoMedio" property="qtdMasculino"/></span>
                                        <br/>
                                        <span style="color: red">F: <bean:write name="listaCategoriaEnsinoMedio" property="qtdFeminino"/></span>
                                    </td>
                                </tr>
                            </logic:present>
                        </table>
                    </td>
                </tr>
                <tr><td colspan="4">&nbsp;</td></tr>
                <tr>
                    <td align="center">
                        <img src="imagens/seta.png" width="30%"/>
                    </td>
                    <td align="center">
                        <img src="imagens/seta.png" width="30%"/>
                    </td>
                    <td align="center">
                        <img src="imagens/seta.png" width="30%"/>
                    </td>
                    <td align="center">
                        <img src="imagens/seta.png" width="30%"/>
                    </td>
                </tr>
                <tr><td colspan="4">&nbsp;</td></tr>

                <tr>
                    <!--Infantil-->
                    <td valign="top">
                        <table width="50%" border="0" align="center">
                            <tr>
                                <td>
                                    <table width="100%" border="1" align="center" style="font-size: 16px">
                                        <logic:present name="listaInfantil1" scope="request">
                                            <tr>
                                                <td colspan="2" align="center">
                                                    <b>INFANTIL I</b>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center">
                                                    <bean:write name="listaInfantil1" property="qtdAmbosSexo"/>
                                                </td>
                                                <td align="center">
                                                    <span style="color: blue"> M: <bean:write name="listaInfantil1" property="qtdMasculino"/></span>
                                                    <br/>
                                                    <span style="color: red">F: <bean:write name="listaInfantil1" property="qtdFeminino"/></span>
                                                </td>
                                            </tr>
                                        </logic:present>
                                    </table>
                                </td>
                            </tr>
                            <tr><td>&nbsp;</td></tr>
                            <tr>
                                <td>
                                    <table width="100%" border="1" align="center" style="font-size: 16px">
                                        <logic:present name="listaInfantil2" scope="request">
                                            <tr>
                                                <td colspan="2" align="center">
                                                    <b>INFANTIL II</b>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center">
                                                    <bean:write name="listaInfantil2" property="qtdAmbosSexo"/>
                                                </td>
                                                <td align="center">
                                                    <span style="color: blue"> M: <bean:write name="listaInfantil2" property="qtdMasculino"/></span>
                                                    <br/>
                                                    <span style="color: red">F: <bean:write name="listaInfantil2" property="qtdFeminino"/></span>
                                                </td>
                                            </tr>
                                        </logic:present>
                                    </table>
                                </td>
                            </tr>
                            <tr><td>&nbsp;</td></tr>
                            <tr>
                                <td>
                                    <table width="100%" border="1" align="center" style="font-size: 16px">
                                        <logic:present name="listaInfantil3" scope="request">
                                            <tr>
                                                <td colspan="2" align="center">
                                                    <b>INFANTIL III</b>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center">
                                                    <bean:write name="listaInfantil3" property="qtdAmbosSexo"/>
                                                </td>
                                                <td align="center">
                                                    <span style="color: blue"> M: <bean:write name="listaInfantil3" property="qtdMasculino"/></span>
                                                    <br/>
                                                    <span style="color: red">F: <bean:write name="listaInfantil3" property="qtdFeminino"/></span>
                                                </td>
                                            </tr>
                                        </logic:present>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <!--Fundamental I-->
                    <td valign="top">
                        <table width="50%" border="0" align="center">
                            <tr>
                                <td>
                                    <table width="100%" border="1" align="center" style="font-size: 16px">
                                        <logic:present name="listaAno1" scope="request">
                                            <tr>
                                                <td colspan="2" align="center">
                                                    <b>1º ANO</b>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center">
                                                    <bean:write name="listaAno1" property="qtdAmbosSexo"/>
                                                </td>
                                                <td align="center">
                                                    <span style="color: blue"> M: <bean:write name="listaAno1" property="qtdMasculino"/></span>
                                                    <br/>
                                                    <span style="color: red">F: <bean:write name="listaAno1" property="qtdFeminino"/></span>
                                                </td>
                                            </tr>
                                        </logic:present>
                                    </table>
                                </td>
                            </tr>
                            <tr><td>&nbsp;</td></tr>
                            <tr>
                                <td>
                                    <table width="100%" border="1" align="center" style="font-size: 16px">
                                        <logic:present name="listaAno2" scope="request">
                                            <tr>
                                                <td colspan="2" align="center">
                                                    <b>2º ANO</b>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center">
                                                    <bean:write name="listaAno2" property="qtdAmbosSexo"/>
                                                </td>
                                                <td align="center">
                                                    <span style="color: blue"> M: <bean:write name="listaAno2" property="qtdMasculino"/></span>
                                                    <br/>
                                                    <span style="color: red">F: <bean:write name="listaAno2" property="qtdFeminino"/></span>
                                                </td>
                                            </tr>
                                        </logic:present>
                                    </table>
                                </td>
                            </tr>
                            <tr><td>&nbsp;</td></tr>
                            <tr>
                                <td>
                                    <table width="100%" border="1" align="center" style="font-size: 16px">
                                        <logic:present name="listaAno3" scope="request">
                                            <tr>
                                                <td colspan="2" align="center">
                                                    <b>3º ANO</b>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center">
                                                    <bean:write name="listaAno3" property="qtdAmbosSexo"/>
                                                </td>
                                                <td align="center">
                                                    <span style="color: blue"> M: <bean:write name="listaAno3" property="qtdMasculino"/></span>
                                                    <br/>
                                                    <span style="color: red">F: <bean:write name="listaAno3" property="qtdFeminino"/></span>
                                                </td>
                                            </tr>
                                        </logic:present>
                                    </table>
                                </td>
                            </tr>
                            <tr><td>&nbsp;</td></tr>
                            <tr>
                                <td>
                                    <table width="100%" border="1" align="center" style="font-size: 16px">
                                        <logic:present name="listaAno4" scope="request">
                                            <tr>
                                                <td colspan="2" align="center">
                                                    <b>4º ANO</b>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center">
                                                    <bean:write name="listaAno4" property="qtdAmbosSexo"/>
                                                </td>
                                                <td align="center">
                                                    <span style="color: blue"> M: <bean:write name="listaAno4" property="qtdMasculino"/></span>
                                                    <br/>
                                                    <span style="color: red">F: <bean:write name="listaAno4" property="qtdFeminino"/></span>
                                                </td>
                                            </tr>
                                        </logic:present>
                                    </table>
                                </td>
                            </tr>
                            <tr><td>&nbsp;</td></tr>
                            <tr>
                                <td>
                                    <table width="100%" border="1" align="center" style="font-size: 16px">
                                        <logic:present name="listaAno5" scope="request">
                                            <tr>
                                                <td colspan="2" align="center">
                                                    <b>5º ANO</b>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center">
                                                    <bean:write name="listaAno5" property="qtdAmbosSexo"/>
                                                </td>
                                                <td align="center">
                                                    <span style="color: blue"> M: <bean:write name="listaAno5" property="qtdMasculino"/></span>
                                                    <br/>
                                                    <span style="color: red">F: <bean:write name="listaAno5" property="qtdFeminino"/></span>
                                                </td>
                                            </tr>
                                        </logic:present>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <!--Fundamental II-->
                    <td valign="top">
                        <table width="50%" border="0" align="center">
                            <tr>
                                <td>
                                    <table width="100%" border="1" align="center" style="font-size: 16px">
                                        <logic:present name="listaAno6" scope="request">
                                            <tr>
                                                <td colspan="2" align="center">
                                                    <b>6º ANO</b>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center">
                                                    <bean:write name="listaAno6" property="qtdAmbosSexo"/>
                                                </td>
                                                <td align="center">
                                                    <span style="color: blue"> M: <bean:write name="listaAno6" property="qtdMasculino"/></span>
                                                    <br/>
                                                    <span style="color: red">F: <bean:write name="listaAno6" property="qtdFeminino"/></span>
                                                </td>
                                            </tr>
                                        </logic:present>
                                    </table>
                                </td>
                            </tr>
                            <tr><td>&nbsp;</td></tr>
                            <tr>
                                <td>
                                    <table width="100%" border="1" align="center" style="font-size: 16px">
                                        <logic:present name="listaAno7" scope="request">
                                            <tr>
                                                <td colspan="2" align="center">
                                                    <b>7º ANO</b>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center">
                                                    <bean:write name="listaAno7" property="qtdAmbosSexo"/>
                                                </td>
                                                <td align="center">
                                                    <span style="color: blue"> M: <bean:write name="listaAno7" property="qtdMasculino"/></span>
                                                    <br/>
                                                    <span style="color: red">F: <bean:write name="listaAno7" property="qtdFeminino"/></span>
                                                </td>
                                            </tr>
                                        </logic:present>
                                    </table>
                                </td>
                            </tr>
                            <tr><td>&nbsp;</td></tr>
                            <tr>
                                <td>
                                    <table width="100%" border="1" align="center" style="font-size: 16px">
                                        <logic:present name="listaAno8" scope="request">
                                            <tr>
                                                <td colspan="2" align="center">
                                                    <b>8º ANO</b>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center">
                                                    <bean:write name="listaAno8" property="qtdAmbosSexo"/>
                                                </td>
                                                <td align="center">
                                                    <span style="color: blue"> M: <bean:write name="listaAno8" property="qtdMasculino"/></span>
                                                    <br/>
                                                    <span style="color: red">F: <bean:write name="listaAno8" property="qtdFeminino"/></span>
                                                </td>
                                            </tr>
                                        </logic:present>
                                    </table>
                                </td>
                            </tr>
                            <tr><td>&nbsp;</td></tr>
                            <tr>
                                <td>
                                    <table width="100%" border="1" align="center" style="font-size: 16px">
                                        <logic:present name="listaAno9" scope="request">
                                            <tr>
                                                <td colspan="2" align="center">
                                                    <b>9º ANO</b>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center">
                                                    <bean:write name="listaAno9" property="qtdAmbosSexo"/>
                                                </td>
                                                <td align="center">
                                                    <span style="color: blue"> M: <bean:write name="listaAno9" property="qtdMasculino"/></span>
                                                    <br/>
                                                    <span style="color: red">F: <bean:write name="listaAno9" property="qtdFeminino"/></span>
                                                </td>
                                            </tr>
                                        </logic:present>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <!--Ensino Medio-->
                    <td valign="top">
                        <table width="50%" border="0" align="center">
                            <tr>
                                <td>
                                    <table width="100%" border="1" align="center" style="font-size: 16px">
                                        <logic:present name="listaSerie1" scope="request">
                                            <tr>
                                                <td colspan="2" align="center">
                                                    <b>1ª SÉRIE</b>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center">
                                                    <bean:write name="listaSerie1" property="qtdAmbosSexo"/>
                                                </td>
                                                <td align="center">
                                                    <span style="color: blue"> M: <bean:write name="listaSerie1" property="qtdMasculino"/></span>
                                                    <br/>
                                                    <span style="color: red">F: <bean:write name="listaSerie1" property="qtdFeminino"/></span>
                                                </td>
                                            </tr>
                                        </logic:present>
                                    </table>
                                </td>
                            </tr>
                            <tr><td>&nbsp;</td></tr>
                            <tr>
                                <td>
                                    <table width="100%" border="1" align="center" style="font-size: 16px">
                                        <logic:present name="listaSerie2" scope="request">
                                            <tr>
                                                <td colspan="2" align="center">
                                                    <b>2ª SÉRIE</b>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center">
                                                    <bean:write name="listaSerie2" property="qtdAmbosSexo"/>
                                                </td>
                                                <td align="center">
                                                    <span style="color: blue"> M: <bean:write name="listaSerie2" property="qtdMasculino"/></span>
                                                    <br/>
                                                    <span style="color: red">F: <bean:write name="listaSerie2" property="qtdFeminino"/></span>
                                                </td>
                                            </tr>
                                        </logic:present>
                                    </table>
                                </td>
                            </tr>
                            <tr><td>&nbsp;</td></tr>
                            <tr>
                                <td>
                                    <table width="100%" border="1" align="center" style="font-size: 16px">
                                        <logic:present name="listaSerie3" scope="request">
                                            <tr>
                                                <td colspan="2" align="center">
                                                    <b>3ª SÉRIE</b>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center">
                                                    <bean:write name="listaSerie3" property="qtdAmbosSexo"/>
                                                </td>
                                                <td align="center">
                                                    <span style="color: blue"> M: <bean:write name="listaSerie3" property="qtdMasculino"/></span>
                                                    <br/>
                                                    <span style="color: red">F: <bean:write name="listaSerie3" property="qtdFeminino"/></span>
                                                </td>
                                            </tr>
                                        </logic:present>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>




            <!--            <table border="1" width="80%">
            <logic:present name="listaCategoriaInfantil" scope="request">
                <tr>
                    <td colspan="2" align="center">
                        <b>INFANTIL</b>
                    </td>
                </tr>
                <tr>
                    <td>
                        3
                    </td>
                    <td>
                        Masculino: <bean:write name="listaCategoriaInfantil" property="qtdMasculino"/>
                        <br/>
                        Feminino: <bean:write name="listaCategoriaInfantil" property="qtdFeminino"/>
                    </td>
                </tr>
            </logic:present>
        </table>-->
        </div>
        <table width="100%" style="margin-top: 150px">
            <tr>
                <td align="center">
                    <html:button property="btImprimir" styleClass="btn btn-green" onclick="javascript: style.display='none', window.print()">Imprimir</html:button>
                </td>
            </tr>
        </table>

    </body>
</html>
<script language="JavaScript">
    function DoPrinting() {
        window.print()
    }

</script>


