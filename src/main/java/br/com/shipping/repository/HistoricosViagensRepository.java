package br.com.shipping.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import br.com.shipping.model.HistoricosViagens;

public interface HistoricosViagensRepository extends JpaRepository<HistoricosViagens, Long>{
	
	public List<HistoricosViagens> findByViagem(Long id);

}
