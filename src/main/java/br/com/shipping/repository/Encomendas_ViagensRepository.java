package br.com.shipping.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import br.com.shipping.model.Encomendas;
import br.com.shipping.model.Encomendas_Viagens;

public interface Encomendas_ViagensRepository extends JpaRepository<Encomendas_Viagens, Long>{

	public List<Encomendas_Viagens> findByViagem(Viagens viagem);
	public List<Encomendas_Viagens> findByEncomenda(Encomendas encomenda);
	
}
