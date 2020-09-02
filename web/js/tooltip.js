//<script language="javascript1.2">
// $id: tooltip.js, tabajara@bpg.com.br

document.write("<span id='myalert' name='myalert' align='center' style='z-index:20;z-order:20;position:absolute;top:0;left:0;border-color:'#FFFFFF';border-style:solid;border-width:thin;background-color:'#FFFFFF';visibility:hidden;overflow:visible'></span>");

function showtip(s){ 
  var iTop  = yMousePos - 20 ;
  var iLeft = xMousePos + 20 ; 
  if(document.layers) {
    document.layers["myalert"].left = iLeft ;
    document.layers["myalert"].top = iTop 
    document.layers["myalert"].innerHTML = s ; 
  } else if( document.all ) { 
    document.all["myalert"].style.top = iTop ; 
    document.all["myalert"].style.left = iLeft ; 
    document.all["myalert"].innerHTML = s ; 
  } else if( document.getElementById ) { 
    document.getElementById("myalert").style.top = iTop+"px";
    document.getElementById("myalert").style.left = iLeft+"px";
    document.getElementById("myalert").innerHTML = s ; 
  }
  show_layer('myalert',true) ; 
}

function hidetip(){
  show_layer('myalert',false) ; 
}

if (document.layers) { // Netscape 4.x
    document.captureEvents(Event.MOUSEMOVE);
    document.onmousemove = captureMousePosition;
} else if (document.all) { // Internet Explorer +
    document.onmousemove = captureMousePosition;
} else if (document.getElementById) { // Netscape 6
    document.onmousemove = captureMousePosition;
}

xMousePos = 0; // Horizontal 
yMousePos = 0; // Vertical 
xMousePosMax = 0; // Comprimento da Pagina
yMousePosMax = 0; // Altura da pagina 

function captureMousePosition(e) {
    if (document.layers) {
        xMousePos = e.pageX;
        yMousePos = e.pageY;
        xMousePosMax = window.innerWidth+window.pageXOffset;
        yMousePosMax = window.innerHeight+window.pageYOffset;
    } else if (document.all) {
        xMousePos = window.event.x+document.body.scrollLeft;
        yMousePos = window.event.y+document.body.scrollTop;
        xMousePosMax = document.body.clientWidth+document.body.scrollLeft;
        yMousePosMax = document.body.clientHeight+document.body.scrollTop;
    } else if (document.getElementById) {
        xMousePos = e.pageX;
        yMousePos = e.pageY;
        xMousePosMax = window.innerWidth+window.pageXOffset;
        yMousePosMax = window.innerHeight+window.pageYOffset;
    }
}

//</script>
