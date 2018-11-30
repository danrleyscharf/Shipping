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
public class HistoricosViagens implements Serializable{
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Temporal(TemporalType.DATE)
	@Column(nullable = false)
	private Date dataHistorico;
	
	@Column(length = 255, nullable = false)
	private String descricao;
	
	@Column(length = 255, nullable = false)
	private String latitude;
	
	@Column(length = 255, nullable = false)
	private String longitude;
	
	@ManyToOne
	@JoinColumn(name = "id_viagem", referencedColumnName = "id")
	private Viagens viagem;

}
