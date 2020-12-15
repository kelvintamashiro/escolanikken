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
        <jsp:include page="topo.jsp"/>

        <logic:equal name="tipoPerfil" scope="session" value="professor">
            <div class="row" align="center" style="padding-top: 50px">
                <div class="col-12 col-s-12">
                    <button class="btn-nikken" onclick="window.location.href = 'Aluno.do?action=pageConsultar'">
                        Consulta <br/>de Alunos
                    </button>                    
                    <button class="btn-nikken" onclick="window.location.href = 'NotaBimestre.do?action=pageConsulta&idPF=<%=session.getAttribute("idPF").toString()%>&tipoPerfil=professor'">
                        Consulta <br/>de Notas
                    </button>
                    <button class="btn-nikken" onclick="window.location.href = 'NotaBimestre.do?idPF=<%=session.getAttribute("idPF").toString()%>'">
                        Lançamento <br/>de Notas
                    </button>
                    <button class="btn-nikken" onclick="window.location.href = 'RecuperacaoAnual.do'">
                        Recuperação <br/>Anual
                    </button>
                </div>
                <div class="col-12 col-s-12">
                    <%--<button class="btn-nikken" onclick="window.location.href = 'PlanejamentoAulas.do?idPF=<%= //session.getAttribute("idPF").toString()%>'">--%>
                    <button class="btn-nikken" onclick="window.location.href = 'planejamento_aulas_page_coordenacao.jsp'">
                        Planejamento <br/>de Aulas
                    </button>
                    <button class="btn-nikken" onclick="window.location.href = 'planejamento_oficina_page.jsp'">
                        Planejamento <br/>de Oficinas
                    </button>
                    <button class="btn-nikken" onclick="window.location.href = 'Comunicados.do'">
                        Comunicados <br/>Professores
                    </button>
                    <!--                    <button class="btn-nikken" onclick="window.location.href = 'UploadArquivo.do?action=visualizarCardapio'">
                                            Cardápio <br/>Nikken
                                        </button>-->
                </div>
            </div>
        </logic:equal>

        <logic:equal name="tipoPerfil" scope="session" value="aluno">
            <div class="row" align="center">
                <div class="col-12 col-s-12">
                    <button class="btn-nikken" onclick="window.location.href = 'NotaBimestre.do?action=pageConsultaAluno&idPF=<%=session.getAttribute("idPF").toString()%>&tipoPerfil=aluno'">
                        Consulta <br/>de Notas
                    </button>
                    <button class="btn-nikken" onclick="window.location.href = 'TirarDuvidas.do?idPF=<%=session.getAttribute("idPF").toString()%>&tipoPerfil=aluno'">
                        Contato / <br/>Dúvidas
                    </button>
<!--                    <button class="btn-nikken" onclick="window.location.href = 'Rematricula.do?idPF=<%=session.getAttribute("idPF").toString()%>&tipoPerfil=aluno'">
                        Rematrícula<br/>2021
                    </button>-->
                    <!--                    <button class="btn-nikken" onclick="window.location.href = 'UploadArquivo.do?action=visualizarCardapio'">
                                            Cardápio <br/>Nikken
                                        </button>-->
                </div>
                <div class="col-12 col-s-12">
                    <button class="btn-nikken" onclick="window.location.href = 'Comunicados.do?action=listaComunicados&idPF=<%=session.getAttribute("idPF").toString()%>&tipoPerfil=aluno&tipoComunicado=PROFESSOR'">
                        <!--Visualizar <br/>Avisos-->
                        Comunicados  <br/>Professores
                    </button>
                    <button class="btn-nikken" onclick="window.location.href = 'Comunicados.do?action=listaComunicados&idPF=<%=session.getAttribute("idPF").toString()%>&tipoPerfil=aluno&tipoComunicado=DIRECAO'">
                        <!--Visualizar <br/>Avisos-->
                        Comunicados <br/>Direção
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
                    <button class="btn-nikken" onclick="window.location.href = 'Aluno.do?action=pageCadastrar'">
                        Cadastro <br/>de Alunos
                    </button>
                    <button class="btn-nikken" onclick="window.location.href = 'Professor.do?action=pageCadastrar'">
                        Cadastro <br/>de Professor
                    </button>
                    <!--<button class="btn-nikken" onclick="window.location.href = 'PlanejamentoAulas.do?action=pagePesquisarPorProfessor'">-->
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
                <div class="col-12 col-s-12">
                    <button class="btn-nikken" onclick="window.location.href = 'Aluno.do?action=pageConsultar'">
                        Consulta <br/>de Alunos
                    </button>
                    <button class="btn-nikken" onclick="window.location.href = 'Professor.do?action=pageConsultar'">
                        Consulta <br/>de Professor
                    </button>
                    <button class="btn-nikken" onclick="window.location.href = 'NotaBimestre.do?action=pageConsulta&idPF=<%=session.getAttribute("idPF").toString()%>&tipoPerfil=professor'">
                        Consulta <br/>de Notas
                    </button>
                    <button class="btn-nikken" onclick="window.location.href = 'NotaBimestre.do?idPF=<%=session.getAttribute("idPF").toString()%>'">
                        Lançamento <br/>de Notas
                    </button>
                    <button class="btn-nikken" onclick="window.location.href = 'Comunicados.do'">
                        Comunicados <br/>Professores
                    </button>
                    <!--                    <button class="btn-nikken" onclick="window.location.href = 'UploadArquivo.do?action=visualizarCardapio'">
                                            Cardápio <br/>Nikken
                                        </button>-->
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

                    <!--                    <button class="btn-nikken" onclick="window.location.href = 'Aluno.do?action=pageCadastrar'">
                                            Cadastro <br/>de Alunos
                                        </button>-->
                    <!--                    <button class="btn-nikken" onclick="window.location.href = 'Professor.do?action=pageCadastrar'">
                                            Cadastro <br/>de Professor
                                        </button>-->
                    <button class="btn-nikken" onclick="window.location.href = 'NotaBimestre.do?idPF=<%=session.getAttribute("idPF").toString()%>'">
                        Lançamento <br/>de Notas
                    </button>
                    <button class="btn-nikken" onclick="window.location.href = 'PlanejamentoAulas.do?action=pagePesquisarPorProfessor&idPF=<%=session.getAttribute("idPF").toString()%>'">
                        Planejamento <br/>de Aulas
                    </button>
                    <button class="btn-nikken" onclick="window.location.href = 'RecuperacaoAnual.do'">
                        Recuperação <br/>Anual
                    </button>


                    <!--                    <button class="btn-nikken" onclick="window.location.href = 'UploadArquivo.do?action=pageCardapio'">
                                            Cardápio <br/>Nikken
                                        </button>-->
                </div>
                <div class="col-12 col-s-12">
                    <!--                    <button class="btn-nikken" onclick="window.location.href = 'Aluno.do?action=pageConsultar'">
                                            Consulta <br/>de Alunos
                                        </button>-->
                    <!--                    <button class="btn-nikken" onclick="window.location.href = 'Professor.do?action=pageConsultar'">
                                            Consulta <br/>de Professor
                                        </button>-->
                    <button class="btn-nikken" onclick="window.location.href = 'planejamento_oficina_page.jsp'">
                        Planejamento <br/>de Oficinas
                    </button>
                    <button class="btn-nikken" onclick="window.location.href = 'NotaBimestre.do?action=pageConsulta&idPF=<%=session.getAttribute("idPF").toString()%>&tipoPerfil=professor'">
                        Consulta <br/>de Notas
                    </button>
                    <button class="btn-nikken" onclick="window.location.href = 'Comunicados.do'">
                        Comunicados <br/>Professores
                    </button>
                    <button class="btn-nikken" onclick="window.location.href = 'Comunicados.do?action=pageDirecao'">
                        Comunicados <br/>Direção
                    </button>
                    <button class="btn-nikken" onclick="window.location.href = 'Relatorios.do'">
                        Relatórios
                    </button>
                </div>
            </div>
        </logic:equal>

        <!--        <style>
                    .footer {
                        position: fixed;
                        left: 0;
                        bottom: 0;
                        width: 100%;
                        background-color: red;
                        color: white;
                        text-align: center;
                    }
                </style>-->


        <div>
            <br/>
            <br/>
            <br/>
            <br/>
            <br/>
            <br/>
        </div>
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
