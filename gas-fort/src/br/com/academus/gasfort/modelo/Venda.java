package br.com.academus.gasfort.modelo;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "identificacao_venda")
public class Venda {

	@Id
	@GeneratedValue
	private Long id;
	@JoinColumn(name = "cliente", referencedColumnName = "id")
	@ManyToOne
	private Cliente cliente;
	@JoinColumn(name = "formaPagamento", referencedColumnName = "id")
	@ManyToOne
	private FormaPagamento formaPagamento;
	@JoinColumn(name = "endereco", referencedColumnName = "id")
	@ManyToOne
	private Endereco endereco;
	private Date data;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Cliente getCliente() {
		return cliente;
	}

	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}

	public Endereco getEndereco() {
		return endereco;
	}

	public void setEndereco(Endereco endereco) {
		this.endereco = endereco;
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
