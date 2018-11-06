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
public class Entregas implements Serializable{
private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(nullable = false)
	private Date dataEntrega;
	
	@Column(length = 255, nullable = false)
	private String obs;
	
	@Column()
	private boolean sucesso;

	@ManyToOne
	@JoinColumn(name = "id_encomenda", referencedColumnName = "id")
	private Encomendas encomendas;
	
}
