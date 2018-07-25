package br.com.appcrr.controller;

import java.util.List;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
 
import br.com.appcrr.model.ResultadoModel;
import br.com.appcrr.model.ClienteModel;
import br.com.appcrr.repository.ClienteRepository;
 
@Controller
@RequestMapping("/cliente")
public class ClienteController {
 
	@Autowired
	ResultadoModel resultadoModel;
 
	@Autowired
	ClienteRepository clienteRepository;
 
	@RequestMapping(value ="/cadastrar.html", method= RequestMethod.GET)
	public ModelAndView Cadastrar(){
		return new ModelAndView("cadastrar");
	}	
 
	@RequestMapping(value ="/consultarRegistros.html", method= RequestMethod.GET)
	public ModelAndView Consultar(){
		return new ModelAndView("consultarRegistros");
	}
 
	@RequestMapping(value ="/editarRegistro.html/{codigo}", method= RequestMethod.GET)
	public ModelAndView EditarRegistro(@PathVariable int codigo){
		ClienteModel clienteModel = clienteRepository.ConsultarPorCodigo(codigo);
		return new ModelAndView("editarRegistro","clienteModel",clienteModel);
	}
 
	@RequestMapping(value="/salvar", method= RequestMethod.POST)
	public @ResponseBody ResultadoModel Salvar(@RequestBody ClienteModel clienteModel){
 
		try {
			clienteRepository.Salvar(clienteModel);
			resultadoModel.setCodigo(1);
			resultadoModel.setMensagem("Registro inserido com sucesso!");
		} catch (Exception e) {
			resultadoModel.setCodigo(2);
			resultadoModel.setMensagem("Erro ao salvar o registro ("+e.getMessage()+")");
		}
 
		return resultadoModel;
	}
 
	@RequestMapping(value="/alterar", method= RequestMethod.POST)
	public @ResponseBody ResultadoModel Alterar(@RequestBody ClienteModel clienteModel){
 
		try {
			clienteRepository.Alterar(clienteModel);
			resultadoModel.setCodigo(1);
			resultadoModel.setMensagem("Registro alterado com sucesso!");
		} catch (Exception e) {
			resultadoModel.setCodigo(2);
			resultadoModel.setMensagem("Erro ao salvar o registro ("+e.getMessage()+")");
		}
 
		return resultadoModel;
	}
 
	@RequestMapping(value="/consultarTodos", method= RequestMethod.GET)
	public @ResponseBody List<ClienteModel> ConsultarTodos(){
		return clienteRepository.TodosClientes();
	}
 
	@RequestMapping(value="/excluirRegistro/{codigo}", method= RequestMethod.DELETE)
	public @ResponseBody void ExcluirRegistro(@PathVariable int codigo){
		clienteRepository.Excluir(codigo);
	}
}