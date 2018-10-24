package br.com.shipping.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import br.com.shipping.model.Despesas;

public interface DespesasRepository extends JpaRepository<Despesas, Long>{

}
