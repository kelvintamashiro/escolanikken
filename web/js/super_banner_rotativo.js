function Banners(){
	
        var MNews = new Array(); 
	//MNews[0]= '<a href="http://latin3.directtrack.com/z/98/cd4999/" target="_blank"><img src="http://latin3.directtrack.com/42/4999/98/" alt="" border="0"></a>';
	MNews[0]= '<script language="JavaScript1.1" src=http://www.submarino.com.br/afiliados/get_banner.asp?tipo=super&franq=140754></script>';
	//MNews[2]= '<a href="http://latin3.directtrack.com/z/97/cd4999/" target="_blank"><img src="http://latin3.directtrack.com/42/4999/97/" alt="" border="0"></a>';
	MNews[1]= '<script language=JavaScript1.1 src=http://www.submarino.com.br/afiliados/get_banner.asp?tipo=super2&franq=140754></script>';

	var Numero = Math.floor(Math.random()*100) % 2;
        
	document.write(MNews[Numero]);
}

function popup(){
        window.open('popup.html','popup','status=no,resizable=no,scrollbars=no,menubar=no,width=710,height=235,scrolling=auto')
}