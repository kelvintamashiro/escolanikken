// JavaScript Document



var _webtrack_domain = "http://www.chatcomercial03.com.br/livehelp/", _webtrack_company_id = 542, _webtrack_site_id = 584;
var _webtrack_variables = new Array();
//Voce pode inserir quantas informaçoes desejar nesta variável, ela será mostrada ao atendente.
_webtrack_variables['Informaçao de exemplo'] = 'Informaçao de exemplo';

//<script>

///////// INVITATION FUNCTIONS //////////


	if (typeof(_start_chat_support_window) != 'function') {

		var _chat_support_window;
		function _start_chat_support_window(operator, dept) {
		
			var querystring = "";
		
			var _chat_support_variables = parent._chat_support_variables;
//			var _chat_support_variables = parent._chat_support_variables;

			//alert(_chat_support_variables);
			if (dept)
				querystring += "&DEPT_STATUS["+dept+"]=1&DEPT=" + dept;
			
			if (operator)
				querystring += "&info[invited_by_operator]="+operator;
		
			try {
				if  (typeof(_chat_support_variables)!='object') {
					if  (typeof(_webtrack_variables)=='object') {
						var _chat_support_variables = _webtrack_variables;
					} else {
						var _chat_support_variables = new Array();
					}
				}
			
				var _WTK_appName;
				
				if (navigator.userAgent.indexOf("Opera") != -1)
					_WTK_appName = "Opera";
				else if (navigator.userAgent.indexOf("Firefox") != -1)
					_WTK_appName = "Firefox";
				else if (navigator.userAgent.indexOf("Netscape") != -1)
					_WTK_appName = "Netscape";
				else if (navigator.userAgent.indexOf("MSIE") != -1)
					_WTK_appName = "Microsoft Internet Explorer";
				else
					_WTK_appName = navigator.appName;
			
				_chat_support_variables['appName']		= _WTK_appName;
				_chat_support_variables['appVersion']	= navigator.appVersion;
			//	_chat_support_variables['appUserAgent']	= navigator.userAgent;
			
				if (navigator.platform)
				_chat_support_variables['platform']		= navigator.platform;
			
				for (var infoname in _chat_support_variables) {
					querystring += "&info[" + escape(infoname) + "]=" + escape(_chat_support_variables[infoname]);
				}
			} catch(e) { /*alert(e.description);*/ }
		
				
			var uid = _webtrack_getCookie("WEBTRACK_USER_ID");
//			alert("http://" + _webtrack_domain + "/livehelp/www/visitor/?userId=" + uid + "&COMPANY_ID="+_webtrack_company_id+"&SITE_ID=" + _webtrack_site_id + querystring);
			var supp_window = window.open(_webtrack_domain + "www/visitor/?userId=" + uid + "&COMPANY_ID="+_webtrack_company_id+"&SITE_ID=" + _webtrack_site_id + querystring, "_chat_support_window", "width=450,height=400,resizable=yes,status=no");
			try {supp_window.focus();}  catch(e) {}
		}
	} // redefine _start_chat_support_window

	var ws;
	var invitation_step = 1;
	var invitation_direction_top = invitation_step;
	var invitation_direction_left = invitation_step;
	var ismouseover = false;
	var invitation_showing = false;
	var invitation_dept=0, invitation_operator = 0;

	var invitation_float_interval = 0;

	function accept_invitation() {
		if (typeof(_start_chat_support_window) == 'function') {
			_start_chat_support_window(invitation_operator, invitation_dept);
		}
		hide_invitation();
	}

	function close_invitation() {
		hide_invitation();
		if (_wtk_track_interval) {
			_wtk_track_interval = 0;
			clearTimeout(_wtk_track_interval);
		}
		try {
			WTK_do_Track(true);	
		} catch(e) {	
		}
	}

	function hide_invitation() {
		if (invitation_float_interval) {
			clearInterval(invitation_float_interval);
			invitation_float_interval = 0;
		}
		document.getElementById("_invitation").style.visibility = "hidden";
	}

	function getWindowSize() {
		var size;
	    if (document.documentElement && document.documentElement.clientWidth) {
	        size = { 'w' : document.documentElement.clientWidth, 'h' : document.documentElement.clientHeight};
	    } else if (document.body && document.body.clientWidth) {
	        size = { 'w' : document.body.clientWidth, 'h' : document.body.clientHeight};
	    } else { 
	        size = { 'w' : window.innerWidth, 'h' : window.innerHeight};
		}
		return size;
	}

	function float_invitation() {
		if (ismouseover) return false;
		var left = parseInt(document.getElementById("_invitation").style.left);
		var top	= parseInt(document.getElementById("_invitation").style.top) 	;
		
		left += invitation_direction_left;
		top += invitation_direction_top;
		//document.getElementById("debug").innerHTML = left + " - " + top;

		if ((left + invitation_width) >= ws['w']) {
			invitation_direction_left = -invitation_step;
			return false;
		} else if (left <= 0) {
			invitation_direction_left = invitation_step;
			return false;
		} 
		
		 if ((top + invitation_height) >= ws['h']) {
			invitation_direction_top = -invitation_step;
			return;
		} else if (top <= 0) {
			invitation_direction_top = invitation_step;
			return;
		}
		document.getElementById("_invitation").style.left = left;
		document.getElementById("_invitation").style.top = top;
	}

	function show_invitation(mode) {
		var top, left;
		switch (mode) {
			case 'center_screen':
				left = parseInt((ws['w']/2)-(invitation_width/2));
				top	= parseInt((ws['h']/2)-(invitation_height/2));
				document.getElementById("_invitation").style.left = left;
				document.getElementById("_invitation").style.top = top;
			break;

			case 'top_screen':
				left = parseInt((ws['w']/2)-(invitation_width/2));
				top	= 32;
				document.getElementById("_invitation").style.left = left;
				document.getElementById("_invitation").style.top = top;
			break;

			case 'floating':
				left = 10;
				top	= 10;
				document.getElementById("_invitation").style.left = left;
				document.getElementById("_invitation").style.top = top;
				invitation_float_interval = setInterval("float_invitation();", 10);
			break;

		}

		document.getElementById("_invitation").style.visibility = "visible";

	}

///////// END INVITATION FUNCTIONS //////////

var WTKresult;
//var _webtrack_domain = "http://127.0.0.1/livehelp";
function _webtrack_setCookie(WTKNameOfCookie, WTKvalue, WTKexpirehours) {
	var WTKExpireDate = new Date ();
  	WTKExpireDate.setTime(WTKExpireDate.getTime() + (WTKexpirehours * 3600 * 1000));
  	document.cookie = WTKNameOfCookie + "=" + escape(WTKvalue) + "; path=/" + ((WTKexpirehours == null) ? "" : "; expires=" + WTKExpireDate.toGMTString());
}

function _webtrack_detectIE(WTKClassID) {
	WTKresult = false;
	document.write('<SCR' + 'IPT LANGUAGE=VBScript>\n on error resume next \n WTKresult = IsObject(CreateObject("' + WTKClassID + '")) \n </SCR' + 'IPT>\n');

	if (WTKresult) return 'y';
	else return 'n';
}

function _webtrack_detectNS(WTKClassID) {
	var WTKn = "n";
	if (WTKnse.indexOf(WTKClassID) != -1) if (navigator.mimeTypes[WTKClassID].enabledPlugin != null) WTKn = "y";
	return WTKn;
}

function _webtrack_getCookie(WTKNameOfCookie){
	if (document.cookie.length > 0){
		var WTKbegin = document.cookie.indexOf(WTKNameOfCookie+"=");
	    if (WTKbegin != -1) {
			WTKbegin += WTKNameOfCookie.length+1; 
			WTKend = document.cookie.indexOf(";", WTKbegin);
			if (WTKend == -1) WTKend = document.cookie.length;
    	  	return unescape(document.cookie.substring(WTKbegin, WTKend));
		}
		return null; 
  	}
	return null; 
}

//if (window.location.search == "" || window.location.search == "?") {
    // If no query string
	var WTKnow = new Date();
	var WTKscreen=screen.width+"x"+screen.height;
	if (navigator.appName != "Netscape") { WTKcdi=screen.colorDepth; }
	else {WTKcdi=screen.pixelDepth};
	var WTKjava = navigator.javaEnabled() ? 'y' : 'n';
	var _webtrack_user_id;
	var WTKuserid = _webtrack_user_id ? _webtrack_user_id : _webtrack_getCookie("WEBTRACK_USER_ID");

	var WTKsessionid=_webtrack_getCookie("WEBTRACK_SESSION_ID");
	var WTKrandomnumber=Math.floor(Math.random()*10000);
	if (WTKuserid == null || (WTKuserid=="")) { WTKuserid = WTKnow.getTime() +""+ WTKrandomnumber; }
	if (WTKsessionid == null || (WTKsessionid=="")) { WTKsessionid = WTKnow.getTime() +""+ WTKrandomnumber; }
	_webtrack_setCookie("WEBTRACK_USER_ID", WTKuserid, 20000);
	_webtrack_setCookie("WEBTRACK_SESSION_ID", WTKsessionid);
	WTKuserid=""; WTKuserid=_webtrack_getCookie("WEBTRACK_USER_ID");
	WTKsessionid=""; WTKsessionid=_webtrack_getCookie("WEBTRACK_SESSION_ID");
	
	var WTKagt=navigator.userAgent.toLowerCase();
	var WTKie  = (WTKagt.indexOf("msie") != -1);
	var WTKns  = (navigator.appName.indexOf("Netscape") != -1);
	var WTKwin = ((WTKagt.indexOf("win")!=-1) || (WTKagt.indexOf("32bit")!=-1));
	var WTKmac = (WTKagt.indexOf("mac")!=-1);

    // Detect the browser internal width and height
    var WTKwinsize;
    if (document.documentElement && document.documentElement.clientWidth)
        WTKwinsize = document.documentElement.clientWidth + 'x' + document.documentElement.clientHeight;
    else if (document.body && document.body.clientWidth)
        WTKwinsize = document.body.clientWidth + 'x' + document.body.clientHeight;
    else if (window.innerWidth)
        WTKwinsize = window.innerWidth + 'x' + window.innerHeight;
	else
		  WTKwinsize = '';
	 
	
	var WTKshk;
	var WTKfla;
	var WTKrp;
	var WTKmov;
	var WTKwma;
	var WTKpdf;

	if (WTKie && WTKwin) {
		WTKshk = _webtrack_detectIE("SWCtl.SWCtl.1")
		WTKfla = _webtrack_detectIE("ShockwaveFlash.ShockwaveFlash.1")
		WTKrp  = _webtrack_detectIE("rmocx.RealPlayer G2 Control.1")
		WTKmov = _webtrack_detectIE("QuickTimeCheckObject.QuickTimeCheck.1")
		WTKwma = _webtrack_detectIE("MediaPlayer.MediaPlayer.1")
		WTKpdf = 'n'; 
		if (_webtrack_detectIE("PDF.PdfCtrl.1") == 'y') { WTKpdf = 'y'; }
		if (_webtrack_detectIE('PDF.PdfCtrl.5') == 'y') { WTKpdf = 'y'; }
		if (_webtrack_detectIE('PDF.PdfCtrl.6') == 'y') { WTKpdf = 'y'; }
	}
	if (WTKns || !WTKwin) {
		var WTKnse = ""; 
		for (var WTKi=0;WTKi<navigator.mimeTypes.length;WTKi++) 
			WTKnse += navigator.mimeTypes[WTKi].type.toLowerCase();
		WTKshk = _webtrack_detectNS("application/x-director")
		WTKfla = _webtrack_detectNS("application/x-shockwave-flash")
		WTKrp  = _webtrack_detectNS("audio/x-pn-realaudio-plugin")
		WTKmov = _webtrack_detectNS("video/quicktime")
		WTKwma = _webtrack_detectNS("application/x-mplayer2")
		WTKpdf = _webtrack_detectNS("application/pdf");
	}
	
	var _webtrack_vars = new Array();
	
	var _WTK_appName
	if (!_webtrack_ignore)	
		var _webtrack_ignore = false;
	
	if (navigator.userAgent.indexOf("Opera") != -1)
		_WTK_appName = "Opera";
	else if (navigator.userAgent.indexOf("Firefox") != -1)
		_WTK_appName = "Firefox";
	else if (navigator.userAgent.indexOf("Netscape") != -1)
		_WTK_appName = "Netscape";
	else if (navigator.userAgent.indexOf("MSIE") != -1)
		_WTK_appName = "Microsoft Internet Explorer";
	else
		_WTK_appName = "[unknow]";

	_webtrack_vars['page_title']	= top.document.title ? top.document.title : '(sem título)';
	_webtrack_vars['location']		= document.location;
	_webtrack_vars['app_name']		= _WTK_appName;
	_webtrack_vars['app_version']	= navigator.appVersion;
	_webtrack_vars['app_user_agent']	= navigator.userAgent;

	if (navigator.systemLanguage)
	_webtrack_vars['sLanguage']		= navigator.systemLanguage;
	if (navigator.userLanguage)
	_webtrack_vars['uLanguage']		= navigator.userLanguage;
	if (navigator.cpuClass)
	_webtrack_vars['cpuClass']		= navigator.cpuClass;
	if (navigator.platform)
	_webtrack_vars['platform']		= navigator.platform;
//	_webtrack_vars['ip']		= '<!--#echo var="REMOTE_ADDR"-->';
	
	_webtrack_vars['screensize']	= WTKscreen;
	_webtrack_vars['winsize']		= WTKwinsize;
	_webtrack_vars['cdi']			= WTKcdi;
	_webtrack_vars['java']			= WTKjava;
	_webtrack_vars['shk']			= WTKshk;
	_webtrack_vars['fla']			= WTKfla;
	_webtrack_vars['rp']				= WTKrp;
	_webtrack_vars['mov']			= WTKmov;
	_webtrack_vars['wma']			= WTKwma;
	_webtrack_vars['pdf']			= WTKpdf;
	_webtrack_vars['uid']			= WTKuserid;
	_webtrack_vars['sid']			= WTKsessionid;
	//alert(WTKuserid);
	var _wtk_the_src = _webtrack_domain + 'www/visitor/webtrack.php?COMPANY_ID='+_webtrack_company_id + '&SITE_ID=' + _webtrack_site_id;

	if (_webtrack_variables) {
		for (var _wtv in _webtrack_variables) {
			_wtk_the_src += '&info['+escape(_wtv)+']=' + escape(_webtrack_variables[_wtv]);
		}
	}

	for (var _wtv in _webtrack_vars) {
		_wtk_the_src += '&info['+_wtv+']=' + escape(_webtrack_vars[_wtv]);
	}

//	window.frames['trackframe'].location = _wtk_the_src;
	
/*	function WTKReceiveAnswer() {
		var answer = document.getElementById("WTKImgLoader").width;
		if (parseInt(answer)==1) {
//			document.open();

			//document.write("<SCR" + "IPT language='JavaScript' src=\"" + _webtrack_domain + "www/visitor/showinvitation.php?COMPANY_ID=" + _webtrack_company_id + "&uid=" + WTKuserid + "\"></SCR" + "IPT>");
			//document.getElementById("_wtk_load_invitation").src = _webtrack_domain + "www/visitor/showinvitation.php?COMPANY_ID=" + _webtrack_company_id + "&uid=" + WTKuserid;
			//alert("you are invited");
			status = 'width = ' + answer;
		}
	}*/
	
	
	var _wtk_first_time = true, _wtk_count_times = 0 ; 
	var _wtk_track_interval;
	function WTK_do_Track(invitation_refused) {

		var current_src = _wtk_the_src + "&invitation_refused="+(invitation_refused ? 1 : 0) + "&invitation_showing="+(invitation_showing ? 1 : 0)+"&_wtk_first_time="+(_wtk_first_time ? 1 : 0) + "&rnd=" + Math.floor(Math.random()*10000);
		//alert(current_src);
//		window.open(current_src, 'teste222');
//		return;
		/*_wtk_first_time = false;
		setTimeout("WTK_do_Track();", 5000);
		return;
		*/
		//return;

		var script_tag = "<SCR" + "IPT id='_wtk_script_loader' language='JavaScript' src=\"" + current_src +"\"></SCR" + "IPT>";
		if (_wtk_first_time) {
			
			document.write("<table border=0 style='position:absolute; top:0; left:0' id='_wtk_table_invitation'><td id='_wtk_invitation_place'></td></table>" + script_tag);
			_wtk_first_time = false;
		} else {

			if (document.all) {

				document.all['_wtk_script_loader'].src = current_src;

			} else if (document.createElementNS) {

		    	var l=document.createElementNS("http://www.w3.org/1999/xhtml","script");
		        l.setAttribute("src", current_src );
		        document.getElementsByTagName("body")[0].appendChild(l);

			}
		}
		
	}
	if (!_webtrack_ignore) {
		try {
			WTK_do_Track();	
			/*
			var wtk_old_onload = window.onload;
			window.onload = function() {
				WTK_do_Track();	
				if (typeof(wtk_old_onload)=='function') {
					//wtk_old_onload();
				}
			}
			*/
		} catch(e) {	
		}
	}