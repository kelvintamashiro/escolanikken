	function ControllerChat($scope, $http){

		$scope.user = "";
		$scope.estados = [];
		$scope.cidades = [];
		$scope.word = /^\s*\w*\s*$/;
		$scope.valida  = false; 
		$scope.setores   = [
			{idSetor : 14 , descricao : 'Atendimento a Candidatos'},
			{idSetor : 2  , descricao : 'Atendimento a Empresas'},
			{idSetor : 4  , descricao : 'Atendimento Financeiro'},
			{idSetor : 15 , descricao : 'Atendimento Juridico'},
			{idSetor : 3  , descricao : 'Departamento Comercial'},
			{idSetor : 13 , descricao : 'Departamento Publicidade'},
			{idSetor : 9  , descricao : 'Departamento TI'},
			{idSetor : 11 , descricao : 'Diretoria'},
			{idSetor : 12 , descricao : 'Supervisao'}
		];
		$scope.setorvoceeh  = [
			{idVoce : 1 , descricao : 'Candidato'},
			{idVoce : 2 , descricao : 'Empresa'},
			{idVoce : 3 , descricao : 'Instituicao de Ensino'},
			{idVoce : 4 , descricao : 'Interessado em Franquia'},
			{idVoce : 5 , descricao : 'Outros'}
		];


		$scope.init = function(){
			$scope.requestListarEstado();

		};	

		$scope.requestListarEstado = function(){
			$http.post("./lista_estado.php").success(function(data, status) {
               $scope.estados = data;
            }).error(function(data, status) {               
               alert("Erro ao buscar estados!");
            });
        };

        $scope.requestListarCidade = function(id_estado){
        	$http.get("./lista_cidade.php", {
        		params : { 
        			idEstado : id_estado
        		}
        	}).success(function(data, status) {
        		$scope.cidades = data;
        	}).error(function(data, status) {
        		alert("Erro ao buscar cidades!");
        	});
        };

        $scope.submit = function(){
	        	window.location.assign('http://portalabre.mysuite.com.br/empresas/abe/atendimentoform.php?lfa='+ $scope.user.nome +'_*_'+ $scope.user.email +'&inf='+  
    	    	$scope.user.cidade.nome +' - '+ $scope.user.estado.uf +'*_*'+ $scope.user.voceeh.descricao +'&modulos=sochat_chatdep_@dc:'+ $scope.user.setor.idSetor);
        }

	}