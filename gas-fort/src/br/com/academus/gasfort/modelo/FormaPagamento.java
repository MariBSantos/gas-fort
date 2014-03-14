package br.com.academus.gasfort.modelo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "forma_pagamento")
public class FormaPagamento {

	@Id
	@GeneratedValue
	private Long id;
	private String descricaoForma;
	@JoinColumn(name = "forma", referencedColumnName = "id")
	@ManyToOne
	private Forma forma;
	private Integer parcelas;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
	
	public String getDescricaoForma() {
		return descricaoForma;
	}

	public void setDescricaoForma(String descricaoForma) {
		this.descricaoForma = descricaoForma;
	}
	
	public Forma getForma() {
		return forma;
	}

	public void setForma(Forma forma) {
		this.forma = forma;
	}

	public Integer getParcelas() {
		return parcelas;
	}

	public void setParcelas(Integer parcelas) {
		this.parcelas = parcelas;
	}

}
