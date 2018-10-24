package br.com.shipping.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import br.com.shipping.model.Entregas;

public interface EntregasRepository extends JpaRepository<Entregas, Long>{

}
