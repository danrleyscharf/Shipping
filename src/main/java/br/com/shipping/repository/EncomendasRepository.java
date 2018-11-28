package br.com.shipping.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import br.com.shipping.model.Encomendas;

public interface EncomendasRepository extends JpaRepository<Encomendas, Long>{

    public List<Encomendas> findByEntregue(boolean entregue);
    public Encomendas findByChaveRastreio(String chaveRastreio);

}
