<%-- 
    Document   : gerenciador_presenca
    Created on : 8/jan/2021, 23:53:32
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
        <title>Escola Nikken - Lista de Presença</title>
        <link rel="shortcut icon" href="imagens/favico.png" />
        <!--        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
                <script language="javascript1.2" src="js/mizanscene.js"></script>
                <script type="text/javascript" src="js/JQuery/js/jquery-1.3.2.js"></script>
                <link rel="stylesheet" media="all" type="text/css" href="assets/css/fix.css" />
                <link rel="stylesheet" media="all" type="text/css" href="assets/css/style_original.css" />
                <link rel="stylesheet" media="all" type="text/css" href="assets/css/mobile.css" />-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
        <style>
            body {
                margin:0;
                padding:0;
            }

            .my-div {
                display: flex;
                justify-content: center;
                align-items: center;
                padding-top: 80px;
            }

            .menu {
                color: #696969;
            }
            .menu:hover {
                background-color: #F0FFFF;
                color: #000;
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
            </div>
        </div>

        <div class="container my-div">
            <div class="row row-cols-1 row-cols-md-5 g-3">
                <div class="col-12 col-sm-4">
                    <div class="card" align="center">
                        <a href="ListaPresenca.do" style="text-decoration: none" class="menu">
                            <div class="pt-4">
                                <img src="imagens/assignment.png" class="card-img-top" style="width: 40%">
                                <div class="card-body" align="center">
                                    <p class="card-title">Lançar Lista de Presença<br/>/ Plano de Aula</p>
                                </div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-12 col-sm-4">
                    <div class="card" align="center">
                        <a href="ListaPresenca.do?action=pageConsultar" style="text-decoration: none" class="menu">
                            <div class="pt-4">
                                <img src="imagens/seo.png" class="card-img-top" style="width: 40%">
                                <div class="card-body" align="center">
                                    <p class="card-title">Consultar Lista de Presença<br/>/ Plano de Aula</p>
                                </div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-12 col-sm-4">
                    <div class="card" align="center">
                        <a href="ListaPresenca.do?action=pageImprimirDiario" style="text-decoration: none" class="menu">
                            <div class="pt-4">
                                <img src="imagens/printer.png" class="card-img-top" style="width: 40%">
                                <div class="card-body" align="center">
                                    <p class="card-title">Imprimir <br/>Diário de Classe</p>
                                </div>
                            </div>
                        </a>
                    </div>
                </div>

                <div class="col-12 col-sm-4">
                    <div class="card" align="center">
                        <a href="ListaPresencaItinerario.do" style="text-decoration: none" class="menu">
                            <div class="pt-4">
                                <img src="imagens/petition.png" class="card-img-top" style="width: 40%">
                                <div class="card-body" align="center">
                                    <p class="card-title">Lançar Lista de Presença <br/>Itinerário</p>
                                </div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-12 col-sm-4">
                    <div class="card" align="center">
                        <a href="ListaPresencaItinerario.do?action=pageConsultar" style="text-decoration: none" class="menu">
                            <div class="pt-4">
                                <img src="imagens/search.png" class="card-img-top" style="width: 40%">
                                <div class="card-body" align="center">
                                    <p class="card-title">Consultar Lista de Presença <br/>Itinerário</p>
                                </div>
                            </div>
                        </a>
                    </div>
                </div>

            </div>
        </div>

        <!--        <div class="row" align="center">
                    <div class="col-12 col-s-12 mt100px">
                        <button class="btn-nikken2" onclick="window.location.href = 'ListaPresenca.do'">
                            Lançar Lista <br/>de Presença/ <br/>Plano de Aula
                        </button>
                        <button class="btn-nikken2" onclick="window.location.href = 'ListaPresenca.do?action=pageConsultar'">
                            Consultar Lista <br/>de Presença/ <br/>Plano de Aula
                        </button>
                        <button class="btn-nikken2" onclick="window.location.href = 'ListaPresenca.do?action=pageImprimirDiario'">
                            Imprimir <br/>Diário de Classe
                        </button>
                    </div>
                
                    <div class="col-12 col-s-12">
                        <button class="btn-nikken2" onclick="window.location.href = 'ListaPresencaItinerario.do'">
                            Lançar Lista <br/>de Presença <br/>Itinerário
                        </button>
                        <button class="btn-nikken2" onclick="window.location.href = 'ListaPresencaItinerario.do?action=pageConsultar'">
                            Consultar Lista <br/>de Presença <br/>Itinerário
                        </button>
                    </div>
                </div>-->
        <div>
            <jsp:include page="footer.jsp"/>
        </div>
    </body>
</html>
