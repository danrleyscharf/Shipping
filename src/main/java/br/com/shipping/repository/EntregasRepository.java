package br.com.shipping.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import br.com.shipping.model.Encomendas;
import br.com.shipping.model.Entregas;

public interface EntregasRepository extends JpaRepository<Entregas, Long>{

	public List<Entregas> findByEncomendas(Encomendas encomendas);
}
