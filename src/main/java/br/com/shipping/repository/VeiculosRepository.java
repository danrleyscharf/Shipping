package br.com.shipping.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import br.com.shipping.model.Veiculos;

public interface VeiculosRepository extends JpaRepository<Veiculos, Long>{

}
