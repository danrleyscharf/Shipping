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
public class Despesas implements Serializable{
private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(length = 255, nullable = false)
	private String descricao;
	
	@Column(nullable = false)
	private Date dataDespesa;
	
	@Column(nullable = false)
	private Double valor;
	
	@ManyToOne
	@JoinColumn(name = "id_tiposDespesa", referencedColumnName = "id")
	private TiposDespesa tiposDespesa;
	
	@ManyToOne
	@JoinColumn(name = "id_viagem", referencedColumnName = "id")
	private Viagens viagens;

}
