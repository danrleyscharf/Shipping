package br.com.shipping.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import br.com.shipping.model.Cargos;

public interface CargosRepository extends JpaRepository<Cargos, Long> {

}