<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <script type="text/javascript" >
            function forward(){
            mensagem = "Atenção, sua sessão permaneceu inativa por mais de 30 minutos ";
            mensagem += "e por motivos de segurança você terá que se logar novamente!";
            alert(mensagem);
            parent.window.location = "http://162.214.120.203:10000/";
        }
            </script>
    </head>
    <body onload="forward()">
        
    </body>
    
</html>
