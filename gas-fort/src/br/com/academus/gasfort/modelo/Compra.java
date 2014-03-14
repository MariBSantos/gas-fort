package br.com.academus.gasfort.modelo;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "identificacao_compra")
public class Compra {

	@Id
	@GeneratedValue
	private Long id;
	@JoinColumn(name = "fornecedor", referencedColumnName = "id")
	@ManyToOne
	private Fornecedor fornecedor;
	@JoinColumn(name = "formaPagamento", referencedColumnName = "id")
	@ManyToOne
	private FormaPagamento formaPagamento;
	private Date data;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Fornecedor getFornecedor() {
		return fornecedor;
	}

	public void setFornecedor(Fornecedor fornecedor) {
		this.fornecedor = fornecedor;
	}

	public FormaPagamento getFormaPagamento() {
		return formaPagamento;
	}

	public void setFormaPagamento(FormaPagamento formaPagamento) {
		this.formaPagamento = formaPagamento;
	}

	public Date getData() {
		return data;
	}

	public void setData(Date data) {
		this.data = data;
	}

}