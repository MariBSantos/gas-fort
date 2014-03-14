package br.com.academus.gasfort.form;

import org.apache.struts.action.ActionForm;

public class BuscaForm extends ActionForm {

	private static final long serialVersionUID = 5292931411190394672L;
	private Integer indice;
	private String valor;
	private Long valorCombo;
	private Integer pagina;
	private Integer cliente;
	private String dataInicial;
	private String dataFinal;

	public void setIndice(Integer indice) {
		this.indice = indice;
	}

	public Integer getIndice() {
		return indice;
	}

	public void setValor(String valor) {
		this.valor = valor;
	}

	public String getValor() {
		return valor;
	}

	public void setValorCombo(Long valorCombo) {
		this.valorCombo = valorCombo;
	}

	public Long getValorCombo() {
		return valorCombo;
	}

	public Integer getPagina() {
		return pagina;
	}

	public void setPagina(Integer pagina) {
		this.pagina = pagina;
	}

	public Integer getCliente() {
		return cliente;
	}

	public void setCliente(Integer cliente) {
		this.cliente = cliente;
	}

	public String getDataInicial() {
		return dataInicial;
	}

	public void setDataInicial(String dataInicial) {
		this.dataInicial = dataInicial;
	}

	public String getDataFinal() {
		return dataFinal;
	}

	public void setDataFinal(String dataFinal) {
		this.dataFinal = dataFinal;
	}

}