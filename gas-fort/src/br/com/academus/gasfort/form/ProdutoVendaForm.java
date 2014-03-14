package br.com.academus.gasfort.form;

import org.apache.struts.action.ActionForm;

import br.com.academus.gasfort.modelo.Produto;
import br.com.academus.gasfort.modelo.Venda;

public class ProdutoVendaForm extends ActionForm {
	
	private static final long serialVersionUID = 5292931411190394672L;
	private Long id;
	private Venda pedido;
	private Produto produto;
	private Integer valor;
	private Integer quantidade;
	private Float valor_total;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Venda getPedido() {
		return pedido;
	}
	public void setPedido(Venda pedido) {
		this.pedido = pedido;
	}
	public Produto getProduto() {
		return produto;
	}
	public void setProduto(Produto produto) {
		this.produto = produto;
	}
	public Integer getValor() {
		return valor;
	}
	public void setValor(Integer valor) {
		this.valor = valor;
	}
	public Integer getQuantidade() {
		return quantidade;
	}
	public void setQuantidade(Integer quantidade) {
		this.quantidade = quantidade;
	}
	public Float getValor_total() {
		return valor_total;
	}
	public void setValor_total(Float valor_total) {
		this.valor_total = valor_total;
	}

}
	