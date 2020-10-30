<%-- 
    Document   : error
    Created on : 20/10/2020, 19:23:03
    Author     : macuser
--%>

<!DOCTYPE html>

<%
    request.getSession(false).invalidate();
%>
<html lang="pt-br" class="js-disabled">
    <!-- META -->
    <meta charset="UTF-8" />
    <meta name="author" content="Portal ABRE" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=0">
    <title>Portal Nikken - Error</title>

    <!-- CSS -->
    <link rel="stylesheet" media="all" type="text/css" href="assets/css/reset.css" />
    <link rel="stylesheet" media="all" type="text/css" href="assets/css/fix.css" />
    <link rel="stylesheet" media="all" type="text/css" href="assets/css/style.css" />

    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>

    <!-- SCRIPT -->
    <script language="javascript1.2" src="js/mizanscene.js"></script>
    <link rel="shortcut icon" href="imagens/favico.png" />
</head>

<body class="bg-light-gray cadastro">
    <header>
        <div class="header">
            <div>
                <a href="Index.do">
                    <img src="imagens/logo.png" width="30%" alt="Portal Nikken" title="Portal Nikken"/>
                </a>
            </div>
        </div>
    </header>

    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel"><b>Atenção!!!</b></h4>
                </div>
                <div class="modal-body">
                    Prezado(a) usuário(a) ABRE <br/><br/>
                    Você foi redirecionado para esta página pois você esta tentando acessar um perfil que não tem autorização.  
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-green" data-dismiss="modal">Fechar</button>
                </div>
            </div>
        </div>
    </div>
    <script>
    $(document).ready(function () {
        $('#myModal').modal('show');
    });
    </script>

    <!-- nav and form -->
    <section class="form-page mt15 pt4 recover-password">
        <div class="container">
            <div class="col-10 offset-2">
                <div class="col-10">
                    <h3 class="mb1">Atenção.</h3>
                    <p class="title">
                        Prezado(a) usuário(a) <br/><br/>
                        Você foi redirecionado para esta página pois você esta tentando acessar um perfil que não tem autorização.  
                    </p>
                </div>


            </div>
        </div>

    </section>

</body>
</html>
