//<script language="javascript">
// $id: lib.js, tabajara@bpg.com.br

 function show_layer(fname,visible){
   if (document.layers) { // Netscape
     if( visible ) { s = 'show' ; b = 'block' ; } else { s = 'hide' ; b = 'none' ; }
     document.layers[eval('"'+fname+'"')].visibility = s ;
   } else if (document.all) { // Internet Explorer
     if( visible ) { s = 'visible' ; b = 'block' ; } else { s = 'hidden' ; b = 'none' ; }
     document.all[eval('"'+fname+'"')].style.visibility = s ;
   } else if (document.getElementById) { // Netscape 6
     if( visible ) { s = 'visible' ; b = 'block' ; } else { s = 'hidden' ; b = 'none' ; }
     document.getElementById(eval('"'+fname+'"')).style.visibility = s ;
   }
 }

 function set_display(fname,b){
   (b) ? s = 'block' : s = 'none' ;
   if (document.layers) { // Netscape
     document.layers[eval('"'+fname+'"')].display = s ;
   } else if (document.all) { // Internet Explorer
     document.all[eval('"'+fname+'"')].style.display = s ;
   } else if (document.getElementById) { // Netscape 6
     document.getElementById(eval('"'+fname+'"')).style.display = s ;
   }
 }

 function showl(fname,b){
   set_display(fname,b);
   show_layer(fname,b);
 }

 function nav(url) {
//   document.forms['form1'].submit();
     top.location.href = url ; 
 }
//</script>
