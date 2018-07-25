<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="editarRegistroControllerApp">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Editar Cliente</title>
 
<style type="text/css">
 
	label{
	    display: inline-block;
	    width: 90px;
	}
 
</style>
<script type="text/javascript" src="<spring:url value="/resources/javascript/angular.min.js"/>"></script>
<script type="text/javascript" src="<spring:url value="/resources/javascript/editarRegistroController.js"/>"></script>
 
</head>
<body>
 
<form ng-controller="editarRegistroController">
 
	<h2>Cadastro de Clientes</h2>
	<br/>
 
	<label for="input-codigo" >Código:</label>
	<input type="text" id="input-codigo" style="width:80px;" ng-model="codigo" readonly="readonly"  ng-init="codigo='${usuarioModel.codigo}'"/>
 
	<br/><br/>
 
	<label for="input-nome" >Nome do Cliente:</label>
	<input type="text" id="input-nome" style="width:220px;" ng-model="nome" ng-init="nome='${clienteModel.nome}'"/>
 
	<br/><br/>
 
	<label for="input-renda">Rendimento Mensal:</label>
	<input type="text" id="input-renda" style="width:120px;" ng-model="renda" ng-init="renda='${clienteModel.renda}'"/>
 
	<br/><br/>
 
	<label for="output-risco">Risco:</label>
 	<output type="text" id="output-risco" style="width:20px;" ng-model="risco" ng-init="risco='${clienteModel.risco}'"/>
 
	<br/><br/>
 
	<label for="input-endereco" >Endereço:</label>
	<input type="text" id="input-endereco" style="width:320px;" ng-model="endereco" ng-init="endereco'${clienteModel.endereco}'"/>
 
	<br/><br/>
 
	<button ng-click="vm.openModal('modal-1')">Simular</button>
 
	<br/><br/>
	
	<label for="output-disponivel">Empréstimo disponível no valor de:</label>
	<output type="text" id="output-disponivel" style="width:20px;" ng-model="disponivel"/>
  
	<br/><br/>
 
	<p>
		<a href= "../consultarRegistros.html">Voltar</a>
 		<input type="button" value="Salvar" ng-click="alterarCliente()"/>
 	</p>
 	
</form>

<!-- Janela modal para calcular o valor do empréstimo -->
<modal id="modal-1">

    <div class="modal">
    
		<label for="input-emprestimo" >Valor do Empréstimo:</label>
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