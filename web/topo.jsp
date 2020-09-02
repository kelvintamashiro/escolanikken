<style>
    .topoHeader {
        /*position: fixed;*/
        left: 0;
        bottom: 0;
        width: 100%;
        background-color: #F4F4F4;
        text-align: center;
    }
</style>

<div class="topoHeader" style="color: black">
    <table width="90%" align="center">
        <tr>
            <td colspan="3">&nbsp;</td>
        </tr>
        <tr>
            <td width="25%">
                <a href="tela_interativa.jsp">
                    <img src="imagens/logo.png" width="100%"/>
                </a>
            </td>
            <td align="center" width="50%" style="font-size: 11px">
                Bem vindo ao Portal Nikken, 
                <strong> 
                    <%if (session.getAttribute("nome") != null) {%>
                    <%=session.getAttribute("nome").toString()%>
                    <%}%>
                </strong>
            </td>
            <td width="25%" align="right">
                <a href="AlterarSenha.do" class="btn btn-big btn-grey">Alterar Senha</a>
                <a href="desconectar.jsp" class="btn btn-big btn-grey">Deslogar</a>
            </td>
        </tr>
        <tr>
            <td colspan="3" style="border-bottom: 0px solid #CCCCCC;">&nbsp;</td>
        </tr>
    </table>
</div>