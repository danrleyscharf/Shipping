package br.com.shipping.model;

import java.io.Serializable;
import java.util.Date;

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
public class Encomendas implements Serializable{
private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(length = 255, nullable = false)
	private String descricao;
	
	@Column(length = 255, nullable = false)
	private String chaveRastreio;
	
	@Column(nullable = false)
	private Double peso;
	
	@Column(nullable = false)
	private Double valor;
	
	@Column(nullable = false)
	private Date dataColeta;
	
	@Column(nullable = false)
	private Date prevEntrega;
	
	@Column()
	private boolean fragil;
	
	@Column(nullable = false)
	private Double altura;
	
	@Column(nullable = false)
	private Double largura;
	
	@Column(nullable = false)
	private Double profundidade;

	@Column(nullable = false)
	private boolean entregue;
		
	@ManyToOne
	@JoinColumn(name = "id_entidadeOrigem", referencedColumnName = "id")
	private Entidades entidadeOrigem;
	
	@ManyToOne
	@JoinColumn(name = "id_entidadeDestino", referencedColumnName = "id")
	private Entidades entidadeDestino;

}
