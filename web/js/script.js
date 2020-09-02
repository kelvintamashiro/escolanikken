$(document).ready(function(){
	
	$.backstretch("img/fundo.png");

	Shadowbox.init({
		skipSetup: true
	});


	Cufon.replace('.cufonp', { fontFamily: 'Calibri' });
	Cufon.replace('.futura', { fontFamily: 'Futura Md BT' });

	$('#quadro-container').load('home.html', function() {
		Cufon.refresh('.cufonp');
		Cufon.refresh('.futura');

		$(".externas").click(function(e){
			e.preventDefault();
			var href = $(this).attr('href');
			$('#quadro-container').load(href,function(){
				Cufon.refresh('.cufonp');
				Cufon.refresh('.futura');
				
				$("#formulario-contato").validate({
					rules:{
						nome:{required: true, minlength: 2},
						email:{required: true, email: true},
						assunto:{required: true},
						mensagem:{required: true, minlength: 2}
					},
					messages:{
						nome:{required: "Digite o seu nome", minlength: "O seu nome deve conter, no mínimo, 2 caracteres"},
						email:{required: "Digite o seu e-mail para contato", email: "Digite um e-mail válido"},
						assunto:{required: "Digite um assunto"},
						mensagem:{required: "Digite a sua mensagem", minlength: "A sua mensagem deve conter, no mínimo, 2 caracteres"}
					}
				});
			   

				$("a.validaclasse").click(function() {
					$("#formulario-cadastro").validate({
						rules:{
							nome: {required: true},
							cpf:{required: true},
							datai:{required: true},
							cidade:{required: true},
							estado:{required: true},
							cep:{required: true},
							fone:{required: true},
							email:{required: true, email: true}										
						},
						messages:{
							nome: {required: "Digite seu nome"},
							cpf:{required: "Digite um cpf válido"},
							datai:{required: "Digite sua data de nascimento"},
							cidade:{required: "Digite sua cidade"},
							estado:{required: "Selecione um estado"},
							cep:{required: "Digite seu CEP"},
							fone:{required: "Digite seu telefone"},
							email:{required: "Digite o seu e-mail", email: "Digite um e-mail válido"}		
						}

					});
				  //return true;
				  
					if( ($("#formulario-cadastro").valid()) == false){
						alert('Preencha os campos Obrigatórios')
						$('#cadastro2').fadeToggle(0);	
						$('#cadastro1').fadeToggle(0); 
					}

				});


			  /*  $("#formulario-cadastro").validate({
					rules:{
						nome:{required: true, minlength: 2},
						cpf:{required: true},
						datai:{required: true},
						cidade:{required: true},
						estado:{required: true},
						cep:{required: true},
						fone:{required: true},
						email:{required: true, email: true}
					},
					messages:{
						nome:{required: "Digite o seu nome", minlength: "O seu nome deve conter, no m�nimo, 2 caracteres"},
						cpf:{required: "Digite um cpf v�lido"},
						datai:{required: "Digite sua data de nascimento"},
						cidade:{required: "Digite sua cidade"},
						estado:{required: "Selecione um estado"},
						cep:{required: "Digite seu CEP"},
						fone:{required: "Digite seu telefone"},
						email:{required: "Digite o seu e-mail", email: "Digite um e-mail v�lido"}
					}
				});*/


			

				jQuery(function($){
					$(".data").mask("99/99/9999");
					$(".fone").mask("(99) 9999-9999");
					$(".cpf").mask("999.999.999-99");
				});

				$('#termo').fadeToggle();

				$("#cad1").click(function(){
					$('#termo').fadeToggle(0); 
					$('#cadastro1').fadeToggle();	
				});	

				$("#cad2").click(function(){
					$('#cadastro1').fadeToggle(0); 
					$('#cadastro2').fadeToggle();	
				});	

				$("#cad3").click(function(){
					$('#cadastro2').fadeToggle(0); 
					$('#cadastro3').fadeToggle();	
				});

				$("#cad4").click(function(){
					$('#cadastro3').fadeToggle(0); 
					$('#cadastro4').fadeToggle();	
				});

				$("#ant3").click(function(){
					$('#cadastro4').fadeToggle(0); 
					$('#cadastro3').fadeToggle();	
				});

				$("#ant2").click(function(){
					$('#cadastro3').fadeToggle(0); 
					$('#cadastro2').fadeToggle();	
				});	
				
				$("#ant1").click(function(){
					$('#cadastro2').fadeToggle(0); 
					$('#cadastro1').fadeToggle();	
				});	

				Shadowbox.setup("#unidades li a", {
					gallery: "unidades",
					onFinish: true,
					height:     200,
					width:      500        
				});
				
				Shadowbox.setup("#links-contato ul li.abr a", {
					gallery: "links-contato",
					onFinish: true,
					height:     170,
					width:      500        
				});
			});

		});

		$(".internas").click(function(e){  
			e.preventDefault();
			var href = $(this).attr('href');
			$('#quadro-container').load(href, function(){
				Cufon.refresh('.cufonp');
				Cufon.refresh('.futura');
						
				jQuery(function($){
				   $(".data").mask("99/99/9999");
				   $(".fone").mask("(99) 9999-9999");
				   $(".cpf").mask("999.999.999-99");
				});

				$("a.validaclasse").click(function() {
					$("#formulario-cadastro").validate({
						rules:{
							nome: {required: true},
							cpf:{required: true},
							datai:{required: true},
							cidade:{required: true},
							estado:{required: true},
							cep:{required: true},
							fone:{required: true},
							email:{required: true, email: true}										
						},
						messages:{
							nome: {required: "Digite seu nome"},
							cpf:{required: "Digite um cpf válido"},
							datai:{required: "Digite sua data de nascimento"},
							cidade:{required: "Digite sua cidade"},
							estado:{required: "Selecione um estado"},
							cep:{required: "Digite seu CEP"},
							fone:{required: "Digite seu telefone"},
							email:{required: "Digite o seu e-mail", email: "Digite um e-mail válido"}		
						}

					});
				  //return true;
				  
					if( ($("#formulario-cadastro").valid()) == false){
						alert('Preencha os campos Obrigatórios')
						$('#cadastro2').fadeToggle(0);	
						$('#cadastro1').fadeToggle(0); 
					}

				});

				$('#termo').fadeToggle();

				$("#cad1").click(function(){
					$('#termo').fadeToggle(0); 
					$('#cadastro1').fadeToggle();	
				});	

				$("#cad2").click(function(){
					$('#cadastro1').fadeToggle(0); 
					$('#cadastro2').fadeToggle();	
				});	

				$("#cad3").click(function(){
					$('#cadastro2').fadeToggle(0); 
					$('#cadastro3').fadeToggle();	
				});

				$("#cad4").click(function(){
					$('#cadastro3').fadeToggle(0); 
					$('#cadastro4').fadeToggle();	
				});

				$("#ant3").click(function(){
					$('#cadastro4').fadeToggle(0); 
					$('#cadastro3').fadeToggle();	
				});

				$("#ant2").click(function(){
					$('#cadastro3').fadeToggle(0); 
					$('#cadastro2').fadeToggle();	
				});	
				
				$("#ant1").click(function(){
					$('#cadastro2').fadeToggle(0); 
					$('#cadastro1').fadeToggle();	
				});	

				Shadowbox.setup("#videos li a", {
					gallery: "Videos",
					onFinish: true
				});
				Shadowbox.setup("#fotos li a", {
					gallery: "Fotos",
					onFinish: true
				});
				//negocio

				function abrindo(){	
					if($(".lnk-negocio").click){
						$(".lnk-negocio").click(function(e){
							e.preventDefault();
							var href = $(this).attr('href');
							$('#quadro-container').load(href, function(){
								Cufon.refresh('.cufonp');
								Cufon.refresh('.futura');
									abrindo();						
							});
						});
					}
				}
				
				abrindo();						
				
			});
		});
	});

});

