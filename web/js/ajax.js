function paginaAjax(url, div){
    var ajax;
    // Procura o componente nativo do Mozilla/Safari para rodar o AJAX
    if(window.XMLHttpRequest){
        // Inicializa o Componente XMLHTTP do Mozilla
        ajax = new XMLHttpRequest();
    // Caso ele não encontre, procura por uma versão ActiveX do IE
    }else if(window.ActiveXObject){
        // Inicializa o Componente ActiveX para o AJAX
        ajax = new ActiveXObject("Microsoft.XMLHTTP");
    }else{
        // Caso não consiga inicializar nenhum dos componentes, exibe um erro
        alert("Seu navegador não tem suporte a AJAX.");
    }

    //Limpa os conteudos das Divs
    limparHTMLDivs(div);

    // Carrega a função de execução do AJAX
    ajax.onreadystatechange = function() {
        if(ajax.readyState == 1){
            // Quando estiver "Carregando a página", exibe a mensagem
            document.getElementById(div).innerHTML = "<img src='imagens/2016/ajax-loader.gif' alt='Carregando' />";
        }else if(ajax.readyState == 4 && ajax.status == 200){
            // Quando estiver completado o Carregamento e o status completo
            // Procura pela DIV com o id="div" e insere as  informações
            document.getElementById(div).innerHTML = ajax.responseText;
        }
    };
    // Envia via método GET as informações
    ajax.open("GET",url,true);
    ajax.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=iso-8859-1")
    ajax.send(null);
}


function limparHTMLDivs(div) {
//    if(div == "cidade") {
//        document.getElementById("descCid").innerHTML = "";
//        document.getElementById("detalhes").innerHTML = "";
//    } else if(div == "descCid"){
//        document.getElementById("detalhes").innerHTML = "";
//    }
}