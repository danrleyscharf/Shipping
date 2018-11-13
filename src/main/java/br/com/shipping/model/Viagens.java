package br.com.shipping.model;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;

import lombok.Data;

@Entity
@Data
public class Viagens implements Serializable{
private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(nullable = false)
	private Date dataSaida;
	
	@Column(nullable = true)
	private Date dataChegada;
	
	@Column()
	private boolean entrega;
	
	@ManyToOne
	@JoinColumn(name = "id_cddOrigem", referencedColumnName = "id")
	private CentrosDistribuicao cddOrigem;
	
	@ManyToOne
	@JoinColumn(name = "id_cddDestino", referencedColumnName = "id")
	private CentrosDistribuicao cddDestino;
	
	@ManyToOne
	@JoinColumn(name = "id_funcionario", referencedColumnName = "id")
	private Funcionarios funcionarios;
	
	@ManyToOne
	@JoinColumn(name = "id_veiculos", referencedColumnName = "id")
	private Veiculos veiculos;

}
