var editarRegistroControllerApp = angular.module("editarRegistroControllerApp",[]);

// controller de edição do cliente
editarRegistroControllerApp.controller("editarRegistroController",function($scope, $window, $http){

	// inicializa variáveis
	$scope.codigo = null;
	$scope.nome   = null;
	$scope.renda  = null;
	$scope.risco = null;
	$scope.endereco = null;
 
	// função de alteração
	$scope.alterarUsuario = function(){
 
		var clienteModel =  new Object();
		
		// valida nome
		if($scope.nome == "") {
			$window.alert("O nome deve ser preenchido!");
			window.location.href = "../consultarRegistros.html";
		} else {
			clienteModel.nome  = $scope.nome;
		}
		
		// valida renda
		if($scope.renda == "") {
			$window.alert("A renda deve ser preenchida!");
			window.location.href = "../consultarRegistros.html";
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
			window.location.href = "../consultarRegistros.html";
		} else {
			clienteModel.risco = $scope.risco;
		}
		
		// valida endereco
		if($scope.endereco == "") {
			$window.alert("O endereço deve ser preenchido!");
			window.location.href = "../consultarRegistros.html";
		} else {
			clienteModel.endereco  = $scope.endereco;
		}
		
		// define o caminho p/rota de tela 
		var response = $http.post("../alterar", clienteModel);
		
		// testa o sucesso ou não da edição
 		response.success(function(data, status, headers, config) {
 			if(data.codigo == 1){
				$window.alert(data.mensagem);
				window.location.href = "../consultarRegistros.html";
			} else{
				$window.alert(data.mensagem);
			}
		});

		 // caso ocorra erro, mostra mensagem
		response.error(function(data, status, headers, config) {
			$window.alert(data);
		});		
 	}; 
});