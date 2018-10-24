package br.com.shipping.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import br.com.shipping.model.TiposDespesa;

public interface TiposDespesaRepository extends JpaRepository<TiposDespesa, Long>{

}
