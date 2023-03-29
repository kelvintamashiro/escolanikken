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
            function fEnviar() {
                var login = document.getElementById('login').value.trim();
                var dtNascimento = document.getElementById('dtNascimento').value.trim();
                if (login.length < 2) {
                    alert("Deve ser informado o login corretamente!");
                    document.getElementById('login').focus();
                } else if (dtNascimento.length < 2) {
                    alert("Deve ser informado a Data de Nascimento corretamente!");
                    document.getElementById('dtNascimento').focus();
                } else {
                    document.LoginForm.action = "Login.do?action=resetarSenha";
                    document.LoginForm.submit();
                }
            }

            function fVoltar() {
                document.LoginForm.action = "index.jsp";
                document.LoginForm.submit();
            }
        </script>
    </head>
    <body>
        <section class="vh-100">
            <div class="container-fluid h-custom">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-md-9 col-lg-6 col-xl-4">
                        <img src="imagens/draw2.webp" class="img-fluid"/>
                    </div>

                    <div class="col-md-8 col-lg-6 col-xl-4">
                        <html:form action="Login" name="LoginForm" type="br.com.Form.LoginForm" scope="request">
                            <div class="card">
                                <div align="center">
                                    <img src="imagens/logo-nikken.png" width="70%"/>
                                </div>
                                <div class="card-body">
                                    <div class="mb-3" align="center">
                                        <p class="small">Informe seu e-mail e sua data de nascimento cadastrado, <br/> para receber uma nova senha no seu e-mail.</p>
                                    </div>
                                    <div class="p-2">
                                        <input type="email" class="form-control" id="login" name="login" placeholder="E-mail. ex: name@example.com">
                                    </div>
                                    <div class="p-2">
                                        <input type="date" class="form-control" id="dtNascimento" name="dtNascimento" placeholder="dd/mm/yyyy">
                                    </div>
                                    <div class="p-2" align="center">
                                        <input class="btn btn-success" type="button" value="Solicitar nova senha" onClick="fEnviar();">
                                        <input class="btn btn-dark" type="button" value="Voltar página inicial" onClick="fVoltar();">
                                    </div>
                                </div>
                            </div>
                        </html:form>
                    </div>


                </div>
            </div>

            <div class=" py-4 px-4 bg-success" align="center">
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
