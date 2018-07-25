<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="cadastrarControllerApp">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cadastrar Cliente</title>
 
<style type="text/css">
 
	label{
	    display: inline-block;
	    width: 90px;
	}
 
</style>
<script type="text/javascript" src="../resources/javascript/angular.min.js"></script>
<script type="text/javascript" src="../resources/javascript/cadastrarController.js"></script>
 
</head>
<body>
 
<form ng-controller="cadastrarController">
 
	<h2>Cadastro de Clientes</h2>
	<br/>
 
	<label for="input-nome" >Nome do Cliente:</label>
	<input type="text" id="input-nome" style="width:220px;" ng-model="nome"/>
 
	<br/><br/>
 
	<label for="input-renda">Rendimento Mensal:</label>
	<input type="text" id="input-renda" style="width:120px;" ng-model="renda"/>
 
	<br/><br/>
 
	<label for="output-risco">Risco:</label>
	<output type="text" id="output-risco" style="width:20px;" ng-model="risco"/>
  
	<br/><br/>
 
	<label for="input-endereco" >Endere�o:</label>
	<input type="text" id="input-endereco" style="width:320px;" ng-model="endereco"/>
 
	<br/><br/>
	
	<button ng-click="vm.openModal('modal-1')">Simular</button>
 
	<br/><br/>
	
	<label for="output-disponivel">Empr�stimo dispon�vel no valor de:</label>
	<output type="text" id="output-disponivel" style="width:20px;" ng-model="disponivel"/>
  
	<br/><br/>
 
	<p>
		<a href= "../">Voltar</a>
		<input type="button" value="Salvar" ng-click="salvarCliente()"/>
	</p>
	
</form>

<!-- Janela modal para calcular o valor do empr�stimo -->
<modal id="modal-1">

    <div class="modal">
    
		<label for="input-emprestimo" >Valor do Empr�stimo:</label>
		<input type="text" id="input-emprestimo" style="width:80px;" ng-model="emprestimo"/>
	 
		<br/><br/>
		
		<label for="input-meses" >Meses:</label>
		<input type="text" id="input-meses" style="width:80px;" ng-model="meses"/>
 
		<br/><br/>
		
        <button ng-click="vm.closeModal('modal-1');">Calcular</button>
        
    </div>
    
</modal>

</body>
</html>