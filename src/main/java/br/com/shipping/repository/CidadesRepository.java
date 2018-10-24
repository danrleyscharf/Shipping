package br.com.shipping.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import br.com.shipping.model.Cidades;

public interface CidadesRepository extends JpaRepository<Cidades, Long>{

}
