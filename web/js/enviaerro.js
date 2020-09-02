if(typeof(FullOpacity)=="undefined")
  document.write("<scr"+"ipt src=\"fullopacity.js\"></scr"+"ipt>");

function ShowEnviaErro(){
  if(typeof(FullOpacity)!="undefined")
    FullOpacity.show('FullOpacityPopUpErro');
  else
    setTimeout(function(){ShowEnviaErro()},1000);
}

function validaErros() {
	df1 = document.formerros; df2 = document.reportar;
	var seuemail = df1.seuemail.value;
	if (df1.seunome.value=="") { alert ("Favor preencher seu nome"); df1.seunome.focus(); }
	else if (seuemail=="") { alert ("Favor preencher seu e-mail"); df1.seuemail.focus(); }
	else if (!seuemail.match(/\w+@\w+\.\w+/)) { alert ("E-mail inválido"); df1.seuemail.focus(); }
	else if (df1.descricao.value=="") { alert ("Favor preencher a descrição"); df1.descricao.focus(); }
	else { 
		df2.seunome.value=df1.seunome.value;
		df2.seuemail.value=df1.seuemail.value;
		df2.descricao.value=df1.descricao.value;
		df2.obrigado.value=df1.obrigado.value;
		df2.urlmateria.value=location.href;
		//df2.sistema.value=navigator.userAgent;
		var autohide = setTimeout("FullOpacity.hide()", 30000);
		document.getElementById('iframeErros').style.display='block';
		df2.submit();
	}
}

function EnviarErro() {
document.write('<style>'
+'div#FullOpacityPopUpErro {display:none;position:absolute;top:50%;left:50%;z-index:1001;}'
+'div#FullOpacityPopUpErro .errosconteudo {background:white; padding:10px}'
+'div#FullOpacityPopUpErro .errosconteudo #errostop .errosfechar { background:transparent;display:inline; padding:5px 0 5px 263px; _padding:5px 0 5px 268px; margin-bottom:10px; text-align:right}'
+'div#FullOpacityPopUpErro .errosconteudo #errostop .errosfechar img { padding:0 0 3px 3px; *padding:0 0 0 3px; _margin-left:3px; *margin-top:3px; border:0}'
+'div#FullOpacityPopUpErro .errosconteudo #errostop .errosfechar a {font:bold 10px arial; color:#84774a; text-decoration:none}'
+'div#FullOpacityPopUpErro .errosconteudo #errostop .errostit {background:transparent;display:inline; padding:5px 0; margin-bottom:10px; font:bold 13px arial; color:#986631; }'
+'div#FullOpacityPopUpErro .errosconteudo #errostop .errostit img {*margin-top:3px; margin-right:3px }'
+'#erros {background: #fff; font: x-small arial, verdana, sans-serif; color:#000; width:460px; height:360px; position:relative}'
+'#erros #errosformulario {margin-top:15px;}'
+'#erros #errosformulario {width:440px;font:13px arial; margin:10px;}'
+'#erros #errosformulario .input {width:230px; margin-bottom:5px; border:1px solid #7e9db9; background:white}'
+'#erros .bot-envia {text-transform:uppercase;background-color:#84774a;border-color:#BDBDBD;border-width:1px;font-family:arial;font-size:10px;width:55px;height:19px;color:white; margin-top:5px;}'
+'#erros .v10nb {font:10px verdana}'
+'#erros .a18bb {font:bold 18px arial}'
+'#iframeErros {border:0; position:absolute; top:25px; left:0; width:460px; height:345px; margin:10px; display:none}'
+'</style>'
+'<div id="FullOpacityPopUpErro" class="apagarEquipe">'
+'  <div class="errosconteudo">'
+'  <div id=errostop>'
+'  </div>'
+'  <div id=erros>'
+'  <div id=errosformulario onSubmit="return false">'
+'  <div class=v10nb>'+document.reportar.chmateria.value+'</div><div class=a18bb>'+document.reportar.titmateria.value+'</div>'
+'  <br clear=left>'
+'  Se você encontrou erro neste site, preencha os campos abaixo que iremos corrigir o erro.<br><br>'
+'  <form name="formerros">'
+'  <div style="margin-left:105px; font:bold 10px verdana">'
+'  Nome:<br><input type="Text" class=input name="nome"><br />'
+'  E-mail:<br><input type="Text" class=input name="email"><br />'
+'  Descrição do erro:<br><textarea rows=5 class=input name="descricao"></textarea><br />'
+'  </div>'
+'  <div style="text-align:center"><input type="reset" class="bot-envia" value="Limpar">&nbsp;&nbsp;&nbsp;<input type="button" class="bot-envia" value="Enviar" onclick="validaErros();"></div>'
+'  </form>'
+'  </div>'
+'  </div>'
+'  <iframe id="iframeErros" name="iframeErros" border=0 frameborder=0></iframe>'
+'  </div>'
+'</div>');
}
