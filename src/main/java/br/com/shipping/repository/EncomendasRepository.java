package br.com.shipping.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import br.com.shipping.model.Encomendas;

public interface EncomendasRepository extends JpaRepository<Encomendas, Long>{

    public Encomendas findByEncomendasEntregue(boolean entregue);
    public Encomendas findByEncomendasChaveRastreio(String chaveRastreio);

}
