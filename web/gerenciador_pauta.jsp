<%-- 
    Document   : gerenciador_pauta
    Created on : 24 de ago de 2021, 18:45:31
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

        <logic:equal name="tipoPerfil" scope="session" value="diretoria">
            <div class="container my-div">
                <div class="row row-cols-1 row-cols-md-3 g-3">
                    <div class="col-12 col-sm-4">
                        <div class="card" align="center">
                            <a href="Pauta.do?action=pagePerfilAluno" style="text-decoration: none" class="menu">
                                <div class="pt-4">
                                    <img src="imagens/resume.png" class="card-img-top" style="width: 40%">
                                    <div class="card-body" align="center">
                                        <p class="card-title">Perfil do Aluno/<br/>Pauta</p>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-12 col-sm-4">
                        <div class="card" align="center">
                            <a href="Pauta.do?action=pageCriarPautaBimestre" style="text-decoration: none" class="menu">
                                <div class="pt-4">
                                    <img src="imagens/edit.png" class="card-img-top" style="width: 40%">
                                    <div class="card-body" align="center">
                                        <p class="card-title">Crição Pauta<br/>por Bimestre</p>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-12 col-sm-4">
                        <div class="card" align="center">
                            <a href="Pauta.do?action=pagePautaAlunoBimestre" style="text-decoration: none" class="menu">
                                <div class="pt-4">
                                    <img src="imagens/student.png" class="card-img-top" style="width: 40%">
                                    <div class="card-body" align="center">
                                        <p class="card-title">Pauta<br/>por Aluno</p>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </logic:equal>
        <logic:equal name="tipoPerfil" scope="session" value="coordenacao">
            <div class="container my-div">
                <div class="row row-cols-1 row-cols-md-2 g-3">
                    <div class="col-12 col-sm-4">
                        <div class="card" align="center">
                            <a href="Pauta.do?action=pagePerfilAluno" style="text-decoration: none" class="menu">
                                <div class="pt-4">
                                    <img src="imagens/resume.png" class="card-img-top" style="width: 40%">
                                    <div class="card-body" align="center">
                                        <p class="card-title">Perfil do Aluno/<br/>Pauta</p>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-12 col-sm-4">
                        <div class="card" align="center">
                            <a href="Pauta.do?action=pagePautaAlunoBimestre" style="text-decoration: none" class="menu">
                                <div class="pt-4">
                                    <img src="imagens/student.png" class="card-img-top" style="width: 40%">
                                    <div class="card-body" align="center">
                                        <p class="card-title">Pauta<br/>por Aluno</p>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>                   
                </div>
            </div>
        </logic:equal>
        <logic:equal name="tipoPerfil" scope="session" value="professor">
            <div class="container my-div">
                <div class="row row-cols-1 row-cols-md-2 g-3">
                    <div class="col-12 col-sm-4">
                        <div class="card" align="center">
                            <a href="Pauta.do?action=pagePerfilAluno" style="text-decoration: none" class="menu">
                                <div class="pt-4">
                                    <img src="imagens/resume.png" class="card-img-top" style="width: 40%">
                                    <div class="card-body" align="center">
                                        <p class="card-title">Perfil do Aluno/<br/>Pauta</p>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-12 col-sm-4">
                        <div class="card" align="center">
                            <a href="Pauta.do?action=pagePautaAlunoBimestre" style="text-decoration: none" class="menu">
                                <div class="pt-4">
                                    <img src="imagens/student.png" class="card-img-top" style="width: 40%">
                                    <div class="card-body" align="center">
                                        <p class="card-title">Pauta<br/>por Aluno</p>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>                   
                </div>
            </div>
        </logic:equal>

        <%--
         <logic:equal name="tipoPerfil" scope="session" value="diretoria">
             <div class="row" align="center">
                 <div class="col-12 col-s-12 mt100px">
                     <button class="btn-nikken2" onclick="window.location.href = 'Pauta.do?action=pagePerfilAluno'">
                         Perfil do Aluno/<br/>Pauta
                     </button>
                     <button class="btn-nikken2" onclick="window.location.href = 'Pauta.do?action=pageCriarPautaBimestre'">
                         Crição Pauta<br/>por Bimestre
                     </button>
                     <button class="btn-nikken2" onclick="window.location.href = 'Pauta.do?action=pagePautaAlunoBimestre'">
                         Pauta<br/>por Aluno
                     </button>
                 </div>
             </div>
         </logic:equal>
         <logic:equal name="tipoPerfil" scope="session" value="coordenacao">
             <div class="row" align="center">
                 <div class="col-12 col-s-12 mt100px">
                     <button class="btn-nikken2" onclick="window.location.href = 'Pauta.do?action=pagePerfilAluno'">
                         Perfil do Aluno/<br/>Pauta
                     </button>
                     <button class="btn-nikken2" onclick="window.location.href = 'Pauta.do?action=pagePautaAlunoBimestre'">
                         Pauta<br/>por Aluno
                     </button>
                 </div>
             </div>
         </logic:equal>
         <logic:equal name="tipoPerfil" scope="session" value="professor">
             <div class="row" align="center">
                 <div class="col-12 col-s-12 mt100px">
                     <button class="btn-nikken2" onclick="window.location.href = 'Pauta.do?action=pagePerfilAluno'">
                         Perfil do Aluno/<br/>Pauta
                     </button>
                     <button class="btn-nikken2" onclick="window.location.href = 'Pauta.do?action=pagePautaAlunoBimestre'">
                         Pauta<br/>por Aluno
                     </button>
                 </div>
             </div>
         </logic:equal> --%>
        <div>
            <jsp:include page="footer.jsp"/>
        </div>
    </body>
</html>
