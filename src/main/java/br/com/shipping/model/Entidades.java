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
public class Entidades implements Serializable{
private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(length = 255, nullable = false)
	private String nome;
	
	@Column(length = 20, nullable = false)
	private String cpfCnpj;
	
	@Column(nullable = true)
	private Date dataNasc;
	
	@Column(length = 255, nullable = false)
	private String endereco;
	
	@Column(length = 10, nullable = false)
	private String numero;
	
	@Column(length = 255, nullable = false)
	private String bairro;
	
	@Column(length = 255, nullable = false)
	private String cep;
	
	@Column(length = 255, nullable = false)
	private String complemento;
	
	//@Column(length = 1, nullable = false)
	//private ETPEntidade tpEntidade;
	
	@ManyToOne
	@JoinColumn(name = "id_cidade", referencedColumnName = "id")
	private Cidades cidades;

}
