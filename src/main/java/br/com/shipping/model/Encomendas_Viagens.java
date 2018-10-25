package br.com.shipping.model;

import lombok.Data;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
@Data
public class Encomendas_Viagens implements Serializable{
private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@ManyToOne
	@JoinColumn(name = "id_encomenda", referencedColumnName = "id")
	private Encomendas encomendas;
	
	@ManyToOne
	@JoinColumn(name = "id_viagem", referencedColumnName = "id")
	private Viagens viagens;

}