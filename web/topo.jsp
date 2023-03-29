<style>
    .div-centralizada {
        display: flex;
        align-items: center;
    }

    body {
        /*font-family: Arial, sans-serif;*/
        font-family: "lato", sans-serif;
        font-size: 14px;
        font-weight: 200;
    }

</style>


<div class="container-fluid" style="background-color: #000">
    <div class="row p-4 div-centralizada">
        <div class="col-12 col-sm-2" align="center">
            <a href="tela_interativa.jsp">
                <img src="imagens/logo-nikken-branca.png" width="100%"/>
            </a>
        </div>
        <div class="col-12 col-sm-8" align="center">
            <br/>
            <p style="color: #FFF; font-size: 12px">
                Bem vindo ao Portal Nikken, 
                <b> 
                    <%if (session.getAttribute("nome") != null) {%>
                    <%=session.getAttribute("nome").toString()%>
                    <%}%>
                </b>
            </p>
        </div>
        <div class="col-12 col-sm-2" align="center">
            <button type="button" onclick="window.location.href = 'AlterarSenha.do'" class="btn btn-sm btn-light">Alterar Senha</button>
            <button type="button" onclick="window.location.href = 'desconectar.jsp'" class="btn btn-sm btn-danger">Sair</button>
        </div>
    </div>
</div>
