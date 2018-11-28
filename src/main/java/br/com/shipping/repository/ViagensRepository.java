package br.com.shipping.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import br.com.shipping.model.Viagens;

public interface ViagensRepository extends JpaRepository<Viagens, Long>{

	public List<Viagens> findByViagem(Long idViagem);
}
