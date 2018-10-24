package br.com.shipping.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.Data;

@Entity
@Data
public class Veiculos implements Serializable{
private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(length = 255, nullable = false)
	private String descricao;
	
	@Column(length = 25, nullable = false)
	private String fabricante;
	
	@Column(length = 25, nullable = false)
	private String modelo;
	
	@Column(length = 20, nullable = false)
	private String placa1;
	
	@Column(length = 20, nullable = false)
	private String placa2;
	
	@Column(length = 20, nullable = false)
	private String placa3;
	
	@Column(length = 4, nullable = false)
	private String anoModelo;
	
	@Column(length = 4, nullable = false)
	private String anoFabricacao;
	
	@Column(nullable = false)
	private Double pesoMax;
	
}
