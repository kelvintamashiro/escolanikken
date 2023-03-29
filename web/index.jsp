<%-- 
    Document   : index
    Created on : 18/02/2020, 21:54:10
    Author     : macuser
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
        <style>
            .divider:after,
            .divider:before {
                content: "";
                flex: 1;
                height: 1px;
                background: #eee;
            }
            .h-custom {
                height: calc(100% - 73px);
            }
            @media (max-width: 450px) {
                .h-custom {
                    height: 90%;
                }
            }
            a {
                text-decoration: none;
            }

        </style>
        <script language="javascript">
            function fEntrar() {
                var login = document.getElementById('login').value.trim();
                var password = document.getElementById('password').value.trim();
                var tipoPerfil = document.getElementById('tipoPerfil').value.trim();
                if (login.length < 2) {
                    alert("Deve ser informado o login corretamente!");
                    document.getElementById('login').focus();
                } else if (password.length < 2) {
                    alert("Deve ser informado a Senha corretamente!");
                    document.getElementById('password').focus();
                } else if (tipoPerfil === "") {
                    alert("Deve ser informado o Tipo de Perfil!!");
                } else {
                    document.LoginForm.action = "Login.do";
                    document.LoginForm.submit();
                }
            }

            function fEsqueceuSenha() {
                document.LoginForm.action = "Login.do?action=pageEsqueceuSenha";
                document.LoginForm.submit();
            }
        </script>
    </head>
    <body>
        <section class="vh-100">
            <div class="container-fluid h-custom">
                <div class="row d-flex justify-content-center align-items-center h-100">


                    <div class="col-md-8 col-lg-6 col-xl-4">
                        <html:form action="Login" name="LoginForm" type="br.com.Form.LoginForm" scope="request">
                            <div class="card">
                                <div align="center">
                                    <img src="imagens/logo-nikken.png" width="70%"/>
                                </div>
                                <div class="card-body">
                                    <div class="mb-3" align="center">
                                        <p class="small">Sistema de Gestão Escolar. Para acessar informe seu e-mail e senha de acesso.</p>
                                    </div>
                                    <div class="p-2">
                                        <input type="email" class="form-control" id="login" name="login" placeholder="E-mail. ex: name@example.com">
                                    </div>
                                    <div class="p-2">
                                        <input type="password" class="form-control" id="password" name="password" placeholder="Informe a senha de acesso">
                                    </div>
                                    <div class="p-2">
                                        <select class="form-select" name="tipoPerfil" id="tipoPerfil" aria-label="Default select example">
                                            <option value="">Selecione</option>
                                            <option value="aluno">Aluno / Pais</option>
                                            <option value="coordenacao">Coordenação</option>
                                            <option value="diretoria">Diretoria</option>
                                            <option value="professor">Professor</option>
                                        </select>
                                    </div>
                                    <div class="d-grid gap-2 p-2">
                                        <input class="btn btn-primary" type="button" value="Acessar Sistema" onClick="fEntrar();">
                                    </div>
                                    <div class="p-2">
                                        <p class="small mt-2 pt-1 mb-0">Esqueceu a senha?
                                            <a href="Login.do?action=pageEsqueceuSenha" class="link-danger">Clique aqui</a></p>
                                    </div>
                                </div>
                            </div>
                        </html:form>
                    </div>

                    <div class="col-md-9 col-lg-6 col-xl-4">
                        <img src="imagens/img-login-page.png" class="img-fluid"/>
                    </div>
                </div>
            </div>

            <div class=" py-4 px-4 bg-primary" align="center">
                <!-- Copyright -->
                <div class="text-white small mb-3 mb-md-0">
                    Desenvolvido por <a href="https://www.mitsistemas.com.br" target="_blank"> 
                        <img src="imagens/logo_mitsistemas_nova_preta.png" width="10%"/>
                    </a>
                </div>
            </div>
        </section>
    </body>
</html>
