package br.com.academus.gasfort.form;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

public class ProdutoForm extends ActionForm {

	private static final long serialVersionUID = 9059073400233379332L;

	private Long id;
	private String descricao;
	private String sigla;
	private String volume;
	private Integer valor;
	private int saldo;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public String getSigla() {
		return sigla;
	}

	public void setSigla(String sigla) {
		this.sigla = sigla;
	}

	public String getVolume() {
		return volume;
	}

	public void setVolume(String volume) {
		this.volume = volume;
	}

	public Integer getValor() {
		return valor;
	}

	public void setValor(Integer valor) {
		this.valor = valor;
	}
	
	public int getSaldo() {
		return saldo;
	}

	public void setSaldo(int saldo) {
		this.saldo = saldo;
	}
	
	@Override
	public ActionErrors validate(ActionMapping mapping,
			HttpServletRequest request) {

		ActionErrors erros = new ActionErrors();

		if (getDescricao() == null || getDescricao() == "") {
			erros.add("descricao", new ActionMessage("erro.campoDescricao"));
		}
		
		if (getValor() == 0.0){
			erros.add("valor", new ActionMessage("erro.campoValor"));
		}

		return erros;
	}

}
