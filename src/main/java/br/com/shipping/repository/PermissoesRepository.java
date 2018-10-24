package br.com.shipping.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import br.com.shipping.model.Permissoes;

public interface PermissoesRepository extends JpaRepository<Permissoes, Long>{

	public Permissoes findByDescricao(String descricao);
	
}
