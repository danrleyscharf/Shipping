package br.com.shipping.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import lombok.Data;

@Entity
@Data
public class Etinerarios implements Serializable{
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(nullable = false)
	private Double valor;
	
	@Column(nullable = false)
	private int dias;
	
	@ManyToOne
	@JoinColumn(name = "id_cidade_origem", referencedColumnName = "id")
    private Cidades cidadeOrigem;
    
    @ManyToOne
	@JoinColumn(name = "id_cidade_destino", referencedColumnName = "id")
	private Cidades cidadeDestino;

}