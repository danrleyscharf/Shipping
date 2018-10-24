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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import lombok.Data;

@Entity
@Data
public class Funcionarios implements Serializable{
private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(length = 255, nullable = false)
	private String nome;
	
	@Temporal(TemporalType.DATE)
	@Column(nullable = false)
	private Date dataNasc;
	
	@Column(length = 20, nullable = false)
	private String cpf;
	
	@ManyToOne
	@JoinColumn(name = "id_usuario", referencedColumnName = "id")
	private Usuario usuario;
	
	@ManyToOne
	@JoinColumn(name = "id_cargo", referencedColumnName = "id")
	private Cargos cargos;
	
	@ManyToOne
	@JoinColumn(name = "id_centrosDistribuicao", referencedColumnName = "id")
	private CentrosDistribuicao centrosDistribuicao;

}
