package br.com.shipping.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import br.com.shipping.model.Etinerarios;

public interface EtinerariosRepository extends JpaRepository<Etinerarios, Long>{

}