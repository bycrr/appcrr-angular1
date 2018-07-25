var consultarRegistrosControllerApp = angular.module("consultarRegistrosControllerApp",[]);
 
//controller de consulta do cliente
consultarRegistrosControllerApp.controller("consultarRegistrosController",function($scope, $window, $http){

	 // inicializa matriz p/clientes
	 $scope.clientes = new Array();
	 
	 // função de consulta dos clientes
	 $scope.init = function(){
		 
		 var response = $http.get("consultarTodos");
		 
		 // consulta clientes
		 response.success(function(data, status, headers, config) {
			 $scope.clientes = data;
 		 });

		 // caso ocorra erro, mostra mensagem
		 response.error(function(data, status, headers, config) {
			 $window.alert(data);
		 });
	 }
 
	 // função de exclusão de um cliente
	 $scope.excluirRegistro = function(codigo){
 
		 if($window.confirm("Deseja excluir este cliente?")){
 
			 var response = $http.delete("excluirRegistro/" + codigo);
 
			 // exclui cliente
			 response.success(function(data, status, headers, config) {
				 $scope.init();
			 });
 
			 // caso ocorra erro, mostra mensagem
			 response.error(function(data, status, headers, config) {
				 $window.alert(data);
			 });
		 }
	 }
});