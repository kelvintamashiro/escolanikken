<%-- 
    Document   : tela_interativa
    Created on : 24/02/2020, 20:47:19
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
            .menu {
                color: #696969;
            }
            .menu:hover {
                background-color: #F0FFFF;
                color: #000;
                font-weight: bold;
            }
            .div-centralizada {
                display: flex;
                align-items: center;
            }
        </style>
    </head>
    <body>
        <jsp:include page="topo.jsp"/>

        <logic:equal name="tipoPerfil" scope="session" value="diretoria">
            <div class="container pt-5 pb-5">
                <div class="row row-cols-1 row-cols-md-5 g-3">
                    <div class="col">
                        <div class="card" align="center">
                            <a href="gerenciador_aluno.jsp" style="text-decoration: none" class="menu">
                                <div class="pt-4">
                                    <img src="imagens/graduates.png" class="card-img-top" style="width: 40%">
                                    <div class="card-body" align="center">
                                        <p class="card-title">Gerenciador de <br/>Alunos</p>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card" align="center">
                            <a href="gerenciador_professor.jsp" style="text-decoration: none" class="menu">
                                <div class="pt-4">
                                    <img src="imagens/teacher2.png"  class="card-img-top" style="width: 40%">
                                    <div class="card-body">
                                        <p class="card-title">Gerenciador de <br/>Professores</p>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card" align="center">
                            <a href="Disciplinas.do" style="text-decoration: none" class="menu">
                                <div class="pt-4">
                                    <img src="imagens/book-stack.png"  class="card-img-top" style="width: 40%">
                                    <div class="card-body">
                                        <p class="card-title">Gerenciador de <br/>Disciplinas</p>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card" align="center">
                            <a href="Itinerario.do" style="text-decoration: none" class="menu">
                                <div class="pt-4">
                                    <img src="imagens/data-science.png"  class="card-img-top" style="width: 40%">
                                    <div class="card-body">
                                        <p class="card-title">Gerenciador de <br/>Itinerários</p>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card" align="center">
                            <a href="gerenciador_notas.jsp" style="text-decoration: none" class="menu">
                                <div class="pt-4">
                                    <img src="imagens/exam.png"  class="card-img-top" style="width: 40%">
                                    <div class="card-body">
                                        <p class="card-title">Gerenciador de <br/>Notas</p>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card" align="center">
                            <a href="PlanejamentoAulas.do?action=pagePesquisarPorProfessor&idPF=<%=session.getAttribute("idPF").toString()%>" style="text-decoration: none" class="menu">
                                <div class="pt-4">
                                    <img src="imagens/lesson.png"  class="card-img-top" style="width: 40%">
                                    <div class="card-body">
                                        <p class="card-title">Planejamento de <br/>Aulas</p>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card" align="center">
                            <a href="gerenciador_presenca.jsp" style="text-decoration: none" class="menu">
                                <div class="pt-4">
                                    <img src="imagens/assignment.png"  class="card-img-top" style="width: 40%">
                                    <div class="card-body">
                                        <p class="card-title">Diário de <br/>Classe Online</p>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card" align="center">
                            <a href="planejamento_oficina_page.jsp" style="text-decoration: none" class="menu">
                                <div class="pt-4">
                                    <img src="imagens/workshop.png"  class="card-img-top" style="width: 40%">
                                    <div class="card-body">
                                        <p class="card-title">Planejamento de <br/>Oficinas</p>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card" align="center">
                            <a href="Comunicados.do" style="text-decoration: none" class="menu">
                                <div class="pt-4">
                                    <img src="imagens/megaphone.png"  class="card-img-top" style="width: 40%">
                                    <div class="card-body">
                                        <p class="card-title">Comunicados <br/>Professores</p>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card" align="center">
                            <a href="Comunicados.do?action=pageDirecao" style="text-decoration: none" class="menu">
                                <div class="pt-4">
                                    <img src="imagens/marketing.png"  class="card-img-top" style="width: 40%">
                                    <div class="card-body">
                                        <p class="card-title">Comunicados <br/>Direção</p>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card" align="center">
                            <a href="Advertencia.do" style="text-decoration: none" class="menu">
                                <div class="pt-4">
                                    <img src="imagens/warning2.png"  class="card-img-top" style="width: 40%">
                                    <div class="card-body">
                                        <p class="card-title">Advertência /<br/>Suspensão</p>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card" align="center">
                            <a href="Relatorios.do" style="text-decoration: none" class="menu">
                                <div class="pt-4">
                                    <img src="imagens/report2.png"  class="card-img-top" style="width: 40%">
                                    <div class="card-body">
                                        <p class="card-title">Gerenciador de <br/>Relatórios</p>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card" align="center">
                            <a href="RecuperacaoAnual.do" style="text-decoration: none" class="menu">
                                <div class="pt-4">
                                    <img src="imagens/test.png"  class="card-img-top" style="width: 40%">
                                    <div class="card-body">
                                        <p class="card-title">Recuperação <br/>Anual</p>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card" align="center">
                            <a href="gerenciador_pauta.jsp" style="text-decoration: none" class="menu">
                                <div class="pt-4">
                                    <img src="imagens/petition.png"  class="card-img-top" style="width: 40%">
                                    <div class="card-body">
                                        <p class="card-title">Gerenciador de <br/>Pautas</p>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card" align="center">
                            <a href="JustificativaFalta.do" style="text-decoration: none" class="menu">
                                <div class="pt-4">
                                    <img src="imagens/absence2.png"  class="card-img-top" style="width: 40%">
                                    <div class="card-body">
                                        <p class="card-title">Justificativa de <br/>Faltas</p>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </logic:equal>

        <logic:equal name="tipoPerfil" scope="session" value="coordenacao">
            <div class="container pt-5 pb-5">
                <div class="row row-cols-1 row-cols-md-5 g-3">
                    <div class="col">
                        <div class="card" align="center">
                            <a href="gerenciador_aluno.jsp" style="text-decoration: none" class="menu">
                                <div class="pt-4">
                                    <img src="imagens/graduates.png" class="card-img-top" style="width: 40%">
                                    <div class="card-body" align="center">
                                        <p class="card-title">Gerenciador de <br/>Alunos</p>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
<!--                    <div class="col">
                        <div class="card" align="center">
                            <a href="gerenciador_professor.jsp" style="text-decoration: none" class="menu">
                                <div class="pt-4">
                                    <img src="imagens/teacher2.png"  class="card-img-top" style="width: 40%">
                                    <div class="card-body">
                                        <p class="card-title">Gerenciador de <br/>Professores</p>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>-->

                    <div class="col">
                        <div class="card" align="center">
                            <a href="planejamento_aulas_page_coordenacao.jsp" style="text-decoration: none" class="menu">
                                <div class="pt-4">
                                    <img src="imagens/lesson.png"  class="card-img-top" style="width: 40%">
                                    <div class="card-body">
                                        <p class="card-title">Planejamento de <br/>Aulas</p>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card" align="center">
                            <a href="planejamento_oficina_page.jsp" style="text-decoration: none" class="menu">
                                <div class="pt-4">
                                    <img src="imagens/workshop.png"  class="card-img-top" style="width: 40%">
                                    <div class="card-body">
                                        <p class="card-title">Planejamento de <br/>Oficinas</p>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card" align="center">
                            <a href="gerenciador_presenca.jsp" style="text-decoration: none" class="menu">
                                <div class="pt-4">
                                    <img src="imagens/assignment.png"  class="card-img-top" style="width: 40%">
                                    <div class="card-body">
                                        <p class="card-title">Diário de <br/>Classe Online</p>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>


                    <div class="col">
                        <div class="card" align="center">
                            <a href="gerenciador_notas.jsp" style="text-decoration: none" class="menu">
                                <div class="pt-4">
                                    <img src="imagens/exam.png"  class="card-img-top" style="width: 40%">
                                    <div class="card-body">
                                        <p class="card-title">Gerenciador de <br/>Notas</p>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card" align="center">
                            <a href="Comunicados.do" style="text-decoration: none" class="menu">
                                <div class="pt-4">
                                    <img src="imagens/megaphone.png"  class="card-img-top" style="width: 40%">
                                    <div class="card-body">
                                        <p class="card-title">Comunicados <br/>Professores</p>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card" align="center">
                            <a href="Comunicados.do?action=pageDirecao" style="text-decoration: none" class="menu">
                                <div class="pt-4">
                                    <img src="imagens/marketing.png"  class="card-img-top" style="width: 40%">
                                    <div class="card-body">
                                        <p class="card-title">Comunicados <br/>Direção</p>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card" align="center">
                            <a href="Advertencia.do" style="text-decoration: none" class="menu">
                                <div class="pt-4">
                                    <img src="imagens/warning2.png"  class="card-img-top" style="width: 40%">
                                    <div class="card-body">
                                        <p class="card-title">Advertência /<br/>Suspensão</p>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card" align="center">
                            <a href="Relatorios.do" style="text-decoration: none" class="menu">
                                <div class="pt-4">
                                    <img src="imagens/report2.png"  class="card-img-top" style="width: 40%">
                                    <div class="card-body">
                                        <p class="card-title">Gerenciador de <br/>Relatórios</p>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card" align="center">
                            <a href="RecuperacaoAnual.do" style="text-decoration: none" class="menu">
                                <div class="pt-4">
                                    <img src="imagens/test.png"  class="card-img-top" style="width: 40%">
                                    <div class="card-body">
                                        <p class="card-title">Recuperação <br/>Anual</p>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card" align="center">
                            <a href="gerenciador_pauta.jsp" style="text-decoration: none" class="menu">
                                <div class="pt-4">
                                    <img src="imagens/petition.png"  class="card-img-top" style="width: 40%">
                                    <div class="card-body">
                                        <p class="card-title">Gerenciador de <br/>Pautas</p>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </logic:equal>

        <logic:equal name="tipoPerfil" scope="session" value="professor">
            <div class="container pt-5 pb-5">
                <div class="row row-cols-1 row-cols-md-4 g-3">
<!--                    <div class="col">
                        <div class="card" align="center">
                            <a href="Aluno.do?action=pageConsultar" style="text-decoration: none" class="menu">
                                <div class="pt-4">
                                    <img src="imagens/graduates.png" class="card-img-top" style="width: 40%">
                                    <div class="card-body" align="center">
                                        <p class="card-title">Consulta de <br/>Alunos</p>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>-->
                    <div class="col">
                        <div class="card" align="center">
                            <a href="NotaBimestre.do?action=pageConsulta&idPF=<%=session.getAttribute("idPF").toString()%>&tipoPerfil=professor" style="text-decoration: none" class="menu">
                                <div class="pt-4">
                                    <img src="imagens/seo.png"  class="card-img-top" style="width: 40%">
                                    <div class="card-body">
                                        <p class="card-title">Consulta de <br/>Notas</p>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card" align="center">
                            <a href="gerenciador_notas.jsp" style="text-decoration: none" class="menu">
                                <div class="pt-4">
                                    <img src="imagens/exam.png"  class="card-img-top" style="width: 40%">
                                    <div class="card-body">
                                        <p class="card-title">Lançamento de <br/>Notas</p>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card" align="center">
                            <a href="gerenciador_presenca.jsp" style="text-decoration: none" class="menu">
                                <div class="pt-4">
                                    <img src="imagens/assignment.png"  class="card-img-top" style="width: 40%">
                                    <div class="card-body">
                                        <p class="card-title">Diário de <br/>Classe Online</p>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card" align="center">
                            <a href="RecuperacaoAnual.do" style="text-decoration: none" class="menu">
                                <div class="pt-4">
                                    <img src="imagens/test.png"  class="card-img-top" style="width: 40%">
                                    <div class="card-body">
                                        <p class="card-title">Recuperação <br/>Anual</p>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>




                    <div class="col">
                        <div class="card" align="center">
                            <a href="planejamento_aulas_page_coordenacao.jsp" style="text-decoration: none" class="menu">
                                <div class="pt-4">
                                    <img src="imagens/lesson.png"  class="card-img-top" style="width: 40%">
                                    <div class="card-body">
                                        <p class="card-title">Planejamento de <br/>Aulas</p>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>

                    <div class="col">
                        <div class="card" align="center">
                            <a href="planejamento_oficina_page.jsp" style="text-decoration: none" class="menu">
                                <div class="pt-4">
                                    <img src="imagens/workshop.png"  class="card-img-top" style="width: 40%">
                                    <div class="card-body">
                                        <p class="card-title">Planejamento de <br/>Oficinas</p>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card" align="center">
                            <a href="Comunicados.do" style="text-decoration: none" class="menu">
                                <div class="pt-4">
                                    <img src="imagens/megaphone.png"  class="card-img-top" style="width: 40%">
                                    <div class="card-body">
                                        <p class="card-title">Comunicados <br/>Professores</p>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
<!--                    <div class="col">
                        <div class="card" align="center">
                            <a href="Relatorios.do" style="text-decoration: none" class="menu">
                                <div class="pt-4">
                                    <img src="imagens/report2.png"  class="card-img-top" style="width: 40%">
                                    <div class="card-body">
                                        <p class="card-title">Gerenciador de <br/>Relatórios</p>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>-->

                    <div class="col">
                        <div class="card" align="center">
                            <a href="gerenciador_pauta.jsp" style="text-decoration: none" class="menu">
                                <div class="pt-4">
                                    <img src="imagens/petition.png"  class="card-img-top" style="width: 40%">
                                    <div class="card-body">
                                        <p class="card-title">Gerenciador de <br/>Pautas</p>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </logic:equal>
        <logic:equal name="tipoPerfil" scope="session" value="aluno">
            <div class="container pt-5 pb-5">
                <div class="row row-cols-1 row-cols-md-4 g-3">

                    <div class="col">
                        <div class="card" align="center">
                            <a href="NotaBimestre.do?action=pageNotasBimestrais&idPF=<%=session.getAttribute("idPF").toString()%>&tipoPerfil=aluno" style="text-decoration: none" class="menu">
                                <div class="pt-4">
                                    <img src="imagens/seo.png"  class="card-img-top" style="width: 40%">
                                    <div class="card-body">
                                        <p class="card-title">Notas Bimestrais</p>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card" align="center">
                            <a href="NotaBimestre.do?action=pageConsultaAluno&idPF=<%=session.getAttribute("idPF").toString()%>&tipoPerfil=aluno" style="text-decoration: none" class="menu">
                                <div class="pt-4">
                                    <img src="imagens/exam.png"  class="card-img-top" style="width: 40%">
                                    <div class="card-body">
                                        <p class="card-title">Boletim Escolar</p>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card" align="center">
                            <a href="TirarDuvidas.do?idPF=<%=session.getAttribute("idPF").toString()%>&tipoPerfil=aluno" style="text-decoration: none" class="menu">
                                <div class="pt-4">
                                    <img src="imagens/question-mark.png"  class="card-img-top" style="width: 40%">
                                    <div class="card-body">
                                        <p class="card-title">Contato e/ou Dúvidas</p>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card" align="center">
                            <a href="links_doc_alunos.jsp" style="text-decoration: none" class="menu">
                                <div class="pt-4">
                                    <img src="imagens/link.png"  class="card-img-top" style="width: 40%">
                                    <div class="card-body">
                                        <p class="card-title">Links Importantes</p>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card" align="center">
                            <a href="Comunicados.do?action=listaComunicados&idPF=<%=session.getAttribute("idPF").toString()%>&tipoPerfil=aluno&tipoComunicado=PROFESSOR" style="text-decoration: none" class="menu">
                                <div class="pt-4">
                                    <img src="imagens/megaphone.png"  class="card-img-top" style="width: 40%">
                                    <div class="card-body">
                                        <p class="card-title">Comunicados Professores</p>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card" align="center">
                            <a href="Comunicados.do?action=listaComunicados&idPF=<%=session.getAttribute("idPF").toString()%>&tipoPerfil=aluno&tipoComunicado=DIRECAO" style="text-decoration: none" class="menu">
                                <div class="pt-4">
                                    <img src="imagens/marketing.png"  class="card-img-top" style="width: 40%">
                                    <div class="card-body">
                                        <p class="card-title">Comunicados Direção</p>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card" align="center">
                            <a href="Advertencia.do?action=pagePesquisarAluno&idPF=<%=session.getAttribute("idPF").toString()%>" style="text-decoration: none" class="menu">
                                <div class="pt-4">
                                    <img src="imagens/warning2.png"  class="card-img-top" style="width: 40%">
                                    <div class="card-body">
                                        <p class="card-title">Advertência / Suspensão</p>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card" align="center">
                            <a href="http://webmail.escolanikken.com/" target="_blank" style="text-decoration: none" class="menu">
                                <div class="pt-4">
                                    <img src="imagens/email.png"  class="card-img-top" style="width: 40%">
                                    <div class="card-body">
                                        <p class="card-title">Acessar e-mail Nikken</p>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </logic:equal>
    </div>

    <%--  <logic:equal name="tipoPerfil" scope="session" value="professor">
          <div class="row" align="center">
              <div class="col-12 col-s-12">
                  <button class="btn-nikken" onclick="window.location.href = 'Aluno.do?action=pageConsultar'">
                      Consulta <br/>de Alunos
                  </button>                    
                  <button class="btn-nikken" onclick="window.location.href = 'NotaBimestre.do?action=pageConsulta&idPF=<%=session.getAttribute("idPF").toString()%>&tipoPerfil=professor'">
                      Consulta <br/>de Notas
                  </button>
                  <button class="btn-nikken" onclick="window.location.href = 'gerenciador_notas.jsp'">
                      Lançamento <br/>de Notas
                  </button>
                  <button class="btn-nikken" onclick="window.location.href = 'RecuperacaoAnual.do'">
                      Recuperação <br/>Anual
                  </button>
              </div>
              <div class="col-12 col-s-12" style="margin-top: -25px">
                  <button class="btn-nikken" onclick="window.location.href = 'gerenciador_presenca.jsp'">
                      Diário de  <br/>Classe Online
                  </button>
                  <button class="btn-nikken" onclick="window.location.href = 'planejamento_aulas_page_coordenacao.jsp'">
                      Planejamento <br/>de Aulas
                  </button>
                  <button class="btn-nikken" onclick="window.location.href = 'planejamento_oficina_page.jsp'">
                      Planejamento <br/>de Oficinas
                  </button>
                  <button class="btn-nikken" onclick="window.location.href = 'Comunicados.do'">
                      Comunicados <br/>Professores
                  </button>
              </div>
              <div class="col-12 col-s-12" style="margin-top: -25px">
                  <button class="btn-nikken" onclick="window.location.href = 'Relatorios.do'">
                      Relatórios
                  </button>
                  <button class="btn-nikken" onclick="window.location.href = 'gerenciador_pauta.jsp'">
                      Gerenciador<br/>de Pauta
                  </button>
              </div>
          </div>
      </logic:equal>

        <logic:equal name="tipoPerfil" scope="session" value="aluno">
            <div class="row" align="center">
                <div class="col-12 col-s-12">
                    <button class="btn-nikken" onclick="window.location.href = 'NotaBimestre.do?action=pageNotasBimestrais&idPF=<%=session.getAttribute("idPF").toString()%>&tipoPerfil=aluno'">
                        Notas <br/>Bimestrais
                    </button>
                    <button class="btn-nikken" onclick="window.location.href = 'NotaBimestre.do?action=pageConsultaAluno&idPF=<%=session.getAttribute("idPF").toString()%>&tipoPerfil=aluno'">
                        Boletim <br/>Escolar
                    </button>
                    <button class="btn-nikken" onclick="window.location.href = 'TirarDuvidas.do?idPF=<%=session.getAttribute("idPF").toString()%>&tipoPerfil=aluno'">
                        Contato / <br/>Dúvidas
                    </button>
                    <button class="btn-nikken" onclick="window.location.href = 'links_doc_alunos.jsp'">
                        Links <br/>Importantes
                    </button>
                </div>
                <div class="col-12 col-s-12">
                    <button class="btn-nikken" onclick="window.location.href = 'Comunicados.do?action=listaComunicados&idPF=<%=session.getAttribute("idPF").toString()%>&tipoPerfil=aluno&tipoComunicado=PROFESSOR'">
                        Comunicados  <br/>Professores
                    </button>
                    <button class="btn-nikken" onclick="window.location.href = 'Comunicados.do?action=listaComunicados&idPF=<%=session.getAttribute("idPF").toString()%>&tipoPerfil=aluno&tipoComunicado=DIRECAO'">
                        Comunicados <br/>Direção
                    </button>
                    <button class="btn-nikken" onclick="window.location.href = 'Advertencia.do?action=pagePesquisarAluno&idPF=<%=session.getAttribute("idPF").toString()%>'">
                        Advertência <br/>
                    </button>
                    <button class="btn-nikken" onclick="window.open('http://webmail.escolanikken.com/')">
                        Acessar <br/> E-mail Nikken
                    </button>
                </div>                       
            </div>
        </logic:equal>
        <logic:equal name="tipoPerfil" scope="session" value="coordenacao">
            <div class="row" align="center">
                <div class="col-12 col-s-12">
                    <button class="btn-nikken" onclick="window.location.href = 'gerenciador_aluno.jsp'">
                        Gerenciador <br/>de Aluno
                    </button>
                    <button class="btn-nikken" onclick="window.location.href = 'gerenciador_professor.jsp'">
                        Gerenciador <br/>de Professor
                    </button>
                    <button class="btn-nikken" onclick="window.location.href = 'planejamento_aulas_page_coordenacao.jsp'">
                        Planejamento <br/>de Aulas
                    </button>
                    <button class="btn-nikken" onclick="window.location.href = 'planejamento_oficina_page.jsp'">
                        Planejamento <br/>de Oficinas
                    </button>
                    <button class="btn-nikken" onclick="window.location.href = 'RecuperacaoAnual.do'">
                        Recuperação <br/>Anual
                    </button>
                </div>
                <div class="col-12 col-s-12" style="margin-top: -25px">
                    <button class="btn-nikken" onclick="window.location.href = 'gerenciador_presenca.jsp'">
                        Diário de  <br/>Classe Online
                    </button>
                    <button class="btn-nikken" onclick="window.location.href = 'gerenciador_notas.jsp'">
                        Gerenciador <br/>de Notas
                    </button>
                    <button class="btn-nikken" onclick="window.location.href = 'Comunicados.do'">
                        Comunicados <br/>Professores
                    </button>
                    <button class="btn-nikken" onclick="window.location.href = 'Comunicados.do?action=pageDirecao'">
                        Comunicados <br/>Direção
                    </button>
                    <button class="btn-nikken" onclick="window.location.href = 'Advertencia.do'">
                        Advertência/<br/>Suspensão
                    </button>
                </div>
                <div class="col-12 col-s-12" style="margin-top: -25px">
                    <button class="btn-nikken" onclick="window.location.href = 'Relatorios.do'">
                        Relatórios
                    </button>
                    <button class="btn-nikken" onclick="window.location.href = 'gerenciador_pauta.jsp'">
                        Gerenciador<br/>de Pauta
                    </button>
                </div>
            </div>
        </logic:equal>
        <logic:equal name="tipoPerfil" scope="session" value="diretoria">
            <div class="row" align="center">
                <div class="col-12 col-s-12">
                    <button class="btn-nikken" onclick="window.location.href = 'gerenciador_aluno.jsp'">
                        Gerenciador <br/>de Aluno
                    </button>
                    <button class="btn-nikken" onclick="window.location.href = 'gerenciador_professor.jsp'">
                        Gerenciador <br/>de Professor
                    </button>
                    <button class="btn-nikken" onclick="window.location.href = 'Disciplinas.do'">
                        Gerenciador <br/>de Disciplinas
                    </button>
                    <button class="btn-nikken" onclick="window.location.href = 'Itinerario.do'">
                        Gerenciador <br/>de Itinerários
                    </button>
                    <button class="btn-nikken" onclick="window.location.href = 'gerenciador_notas.jsp'">
                        Gerenciador <br/>de Notas
                    </button>


                </div>
                <div class="col-12 col-s-12" style="margin-top: -25px">
                    <button class="btn-nikken" onclick="window.location.href = 'PlanejamentoAulas.do?action=pagePesquisarPorProfessor&idPF=<%=session.getAttribute("idPF").toString()%>'">
                        Planejamento <br/>de Aulas
                    </button>
                    <button class="btn-nikken" onclick="window.location.href = 'gerenciador_presenca.jsp'">
                        Diário de  <br/>Classe Online
                    </button>
                    <button class="btn-nikken" onclick="window.location.href = 'planejamento_oficina_page.jsp'">
                        Planejamento <br/>de Oficinas
                    </button>
                    <button class="btn-nikken" onclick="window.location.href = 'Comunicados.do'">
                        Comunicados <br/>Professores
                    </button>
                    <button class="btn-nikken" onclick="window.location.href = 'Comunicados.do?action=pageDirecao'">
                        Comunicados <br/>Direção
                    </button>
                </div>
                <div class="col-12 col-s-12" style="margin-top: -25px">
                    <button class="btn-nikken" onclick="window.location.href = 'Advertencia.do'">
                        Advertência/<br/>Suspensão
                    </button>
                    <button class="btn-nikken" onclick="window.location.href = 'Relatorios.do'">
                        Relatórios
                    </button>
                    <button class="btn-nikken" onclick="window.location.href = 'RecuperacaoAnual.do'">
                        Recuperação <br/>Anual
                    </button>
                    <button class="btn-nikken" onclick="window.location.href = 'gerenciador_pauta.jsp'">
                        Gerenciador<br/>de Pauta
                    </button>
                    <button class="btn-nikken" onclick="window.location.href = 'JustificativaFalta.do'">
                        Justificativa<br/>Falta
                    </button>
                </div>
            </div>
        </logic:equal> --%>

    <div>&nbsp;</div>
    <!--        <div class="footer" style="color: black">
                Desenvolvido por <a href="https://www.mitsistemas.com.br" target="_blank"> 
                    <img src="imagens/logo_mitsistemas_nova_preta.png" width="17%"/>
                </a>
            </div>-->
    <div>
        <jsp:include page="footer.jsp"/>
    </div>
</body>
</html>
<script language="javascript">
    function fVisualizar(idComunicado) {
//        showWindow('Comunicados.do?action=visualizar&idComunicado=' + idComunicado, 'ShowComunicado', 780, 580);
        window.open("Comunicados.do?action=visualizar&idComunicado=" + idComunicado, "", "width=800,height=600,left=" + (document.documentElement.clientWidth - 800) / 2 + ",top=" + (document.documentElement.clientHeight - 600) / 2);
    }
</script>
