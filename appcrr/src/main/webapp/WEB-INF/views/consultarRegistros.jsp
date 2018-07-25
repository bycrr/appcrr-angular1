<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="consultarRegistrosControllerApp">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Consultar e Excluir Clientes</title>
 
<script type="text/javascript" src="../resources/javascript/angular.min.js"></script>
<script type="text/javascript" src="../resources/javascript/consultarRegistrosController.js"></script>
 
</head>
<body>
 
	<!--monta cabeçalho de clientes -->
	<table ng-controller="consultarRegistrosController"  data-ng-init="init()">
     <thead>
       <tr>
         <th>Código</th>
         <th>Nome do Cliente</th>
         <th>Rendimento</th>
         <th>Risco</th>
         <th>Endereço</th>
         <th></th>
         <th></th>
       </tr>
     </thead>
     
	<!--monta lista de clientes -->
     <tbody>
       <tr ng-repeat="cliente in clientes">
         <td>{{ cliente.codigo }}</td>
         <td>{{ cliente.nome }}</td>
         <td>{{ cliente.renda }}</td>
         <td>{{ cliente.risco }}</td>
         <td>{{ cliente.endereco }}</td>
         <td><a ng-href="editarRegistro.html/{{cliente.codigo}}" >Editar</a></td>
         <td><a href="#" ng-click="excluirRegistro(cliente.codigo)">Excluir</a></td>         
       </tr>
     </tbody>
   </table>
 
   <a href= "../">Voltar</a>
 
</body>
</html>