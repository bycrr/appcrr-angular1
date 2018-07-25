package br.com.appcrr.repository;
 
import java.util.List;
 
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceContextType;
import org.springframework.stereotype.Repository;
 
import br.com.appcrr.model.ClienteModel;
 
@Repository
public class ClienteRepository {
 
	@PersistenceContext(type = PersistenceContextType.EXTENDED)
	private EntityManager manager;
 
	@javax.transaction.Transactional
	public void Salvar(ClienteModel clienteModel){
		manager.persist(clienteModel);		
	}
 
	@javax.transaction.Transactional
	public void Alterar(ClienteModel clienteModel){
		manager.merge(clienteModel);		
	}
 
	public ClienteModel ConsultarPorCodigo(int codigo){
		return manager.find(ClienteModel.class, codigo);		
	} 
 
	@javax.transaction.Transactional
	public void Excluir(int codigo){
		ClienteModel clienteModel = this.ConsultarPorCodigo(codigo);
		manager.remove(clienteModel);
	}
 
	public List<ClienteModel> TodosClientes(){
		return manager.createQuery("SELECT c FROM ClienteModel c ORDER BY c.nome ", ClienteModel.class).getResultList();	
	}
}