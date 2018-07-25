(function () {
    'use strict';

    angular
        .module('app')
        .controller('calcularController', Controller);

	// controller da janela modal
    function Controller(ModalService) {
        var vm = this;

	        vm.openModal = openModal;
	        vm.closeModal = closeModal;

	        initController();

	        function initController() {
	            vm.bodyText = 'Clique para simular empréstimo:';
	        }
	        
	        function openModal(id){
	            ModalService.Open(id);
	        }

	        function closeModal(id){
	            ModalService.Close(id);
	            
	        	// realiza cálculos do empréstimo disponível p/o cliente
	        	if($scope.risco == "A") {
	        		$scope.disponivel = $scope.emprestimo * 0.019 * $scope.meses; 
	        	}  else if($scope.risco == "B"){
	        		$scope.disponivel = $scope.emprestimo * 0.050 * $scope.meses;
	        	}  else if($scope.risco == "C"){
	        		$scope.disponivel = $scope.emprestimo * 0.010 * $scope.meses;
	        	}  else {
	        		$scope.disponivel = 0;
	        	}
	            
	        }
	    }
})();