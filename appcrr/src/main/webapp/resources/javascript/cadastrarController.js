var cadastrarControllerApp = angular.module("cadastrarControllerApp",[]);

//controller de cadastro do cliente
cadastrarControllerApp.controller("cadastrarController",function($scope, $window, $http){

	// inicializa variáveis
	$scope.codigo = null;
	$scope.nome   = null;
	$scope.renda  = null;
	$scope.risco = null;
	$scope.endereco = null;

	// função de gravação
	$scope.salvarCliente = function(){

		var clienteModel =  new Object();
		
		// valida nome
		if($scope.nome == "") {
			$window.alert("O nome deve ser preenchido!");
			window.location.href = "../cadastrar.html";
		} else {
			clienteModel.nome  = $scope.nome;
		}
		
		// valida renda
		if($scope.renda == "") {
			$window.alert("A renda deve ser preenchida!");
			window.location.href = "../cadastrar.html";
		} else {
			clienteModel.renda = $scope.renda;
		}
		
		// define o risco cfe. a renda do cliente
		if(clienteModel.renda <= BigDecimal(2000)) {
			clienteModel.risco = "C";		
		} else if(clienteModel.renda > BigDecimal(2000) &&
				  clienteModel.renda <= BigDecimal(8000)) {
			clienteModel.risco = "B";		
		} else if(clienteModel.renda > BigDecimal(8000)) {
			clienteModel.risco = "A";		
		}  
  
		// valida risco (caso algum dia passe a ser digitado)
		if($scope.risco == "") {
			$window.alert("O risco deve ser preenchido!");
			window.location.href = "../cadastrar.html";
		} else {
			clienteModel.risco = $scope.risco;
		}
		
		// valida endereco
		if($scope.endereco == "") {
			$window.alert("O endereço deve ser preenchido!");
			window.location.href = "../cadastrar.html";
		} else {
			clienteModel.endereco  = $scope.endereco;
		}
		
		// define o caminho p/rota de tela 
		var response = $http.post("salvar", clienteModel);
 
		// testa o sucesso ou não do cadastro
		response.success( function(data, status, headers, config) {
 			 if(data.codigo == 1){
				$window.alert(data.mensagem);
				$scope.nome  = null;
				$scope.renda = null;
				$scope.risco = null;
				$scope.endereco = null;
			 } else{
				$window.alert(data.mensagem);
			 }
		});

		 // caso ocorra erro, mostra mensagem
		response.error( function(data, status, headers, config) {
			$window.alert(data);
		});					
	};
});