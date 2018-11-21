package br.com.shipping.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import br.com.shipping.model.Encomendas_Viagens;

public interface Encomendas_ViagensRepository extends JpaRepository<Encomendas_Viagens, Long>{

	//public Encomendas_Viagens findByViagemId(String id_viagem);
	//public Encomendas_Viagens findByEncomendaId(String id_encomenda);
	
}
