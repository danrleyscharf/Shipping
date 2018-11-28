package br.com.shipping.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import br.com.shipping.model.Encomendas_Viagens;

public interface Encomendas_ViagensRepository extends JpaRepository<Encomendas_Viagens, Long>{

	public List<Encomendas_Viagens> findByViagem(Long idViagem);
	public List<Encomendas_Viagens> findByEncomenda(Long idEncomenda);
	
}
