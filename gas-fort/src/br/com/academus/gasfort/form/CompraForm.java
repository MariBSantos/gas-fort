package br.com.academus.gasfort.form;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

public class CompraForm extends ActionForm {

	private static final long serialVersionUID = 5763303381195394756L;

	private Long id;
	private Long fornecedor;
	private Long formaPagamento;
	private Long endereco;
	private Date data;

	private Long pedido;
	private Long produto;
	private Float valor;
	private Integer quantidade;
	private Float valor_total;

	private String listaFornecedor;
	private String listaFormaPagamento;

	private Boolean edicao;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getFornecedor() {
		return fornecedor;
	}

	public void setFornecedor(Long fornecedor) {
		this.fornecedor = fornecedor;
	}

	public Long getFormaPagamento() {
		return formaPagamento;
	}

	public void setFormaPagamento(Long formaPagamento) {
		this.formaPagamento = formaPagamento;
	}

	public Long getEndereco() {
		return endereco;
	}

	public void setEndereco(Long endereco) {
		this.endereco = endereco;
	}

	public Date getData() {
		return data;
	}

	public void setData(Date data) {
		this.data = data;
	}

	public Long getPedido() {
		return pedido;
	}

	public void setPedido(Long pedido) {
		this.pedido = pedido;
	}

	public Long getProduto() {
		return produto;
	}

	public void setProduto(Long produto) {
		this.produto = produto;
	}

	public Float getValor() {
		return valor;
	}

	public void setValor(Float valor) {
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

	public String getListaFornecedor() {
		return listaFornecedor;
	}

	public void setListaFornecedor(String listaFornecedor) {
		this.listaFornecedor = listaFornecedor;
	}

	public String getListaFormaPagamento() {
		return listaFormaPagamento;
	}

	public void setListaFormaPagamento(String listaFormaPagamento) {
		this.listaFormaPagamento = listaFormaPagamento;
	}

	public Boolean getEdicao() {
		return edicao;
	}

	public void setEdicao(Boolean edicao) {
		this.edicao = edicao;
	}

	@Override
	public ActionErrors validate(ActionMapping mapping,
			HttpServletRequest request) {

		ActionErrors erros = new ActionErrors();

		if (getEdicao() == false) {

			if (getFornecedor() == 0 || getFornecedor() == -1) {
				erros.add("fornecedor", new ActionMessage(
						"erro.campoFornecedor"));
			}

			if (getFormaPagamento() == 0 || getFormaPagamento() == -1) {
				erros.add("formaPagamento",
						new ActionMessage("erro.campoForma"));
			}
		}

		return erros;
	}

}