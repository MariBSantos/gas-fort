package br.com.academus.gasfort.form;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

public class EnderecoForm extends ActionForm {

	private static final long serialVersionUID = 5292931411190394672L;
	private Long id;
	private Long cliente;
	private Integer tipoEndereco;
	private String endereco;
	private String bairro;
	private String cidade;
	private String cep;
	private Long estado;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getCliente() {
		return cliente;
	}

	public void setCliente(Long cliente) {
		this.cliente = cliente;
	}
	
	public Integer getTipoEndereco() {
		return tipoEndereco;
	}

	public void setTipoEndereco(Integer tipoEndereco) {
		this.tipoEndereco = tipoEndereco;
	}


	public String getEndereco() {
		return endereco;
	}

	public void setEndereco(String endereco) {
		this.endereco = endereco;
	}

	public String getBairro() {
		return bairro;
	}

	public void setBairro(String bairro) {
		this.bairro = bairro;
	}

	public String getCidade() {
		return cidade;
	}

	public void setCidade(String cidade) {
		this.cidade = cidade;
	}

	public String getCep() {
		return cep;
	}

	public void setCep(String cep) {
		this.cep = cep;
	}

	public Long getEstado() {
		return estado;
	}

	public void setEstado(Long estado) {
		this.estado = estado;
	}
	
	@Override
	public ActionErrors validate(ActionMapping mapping,
			HttpServletRequest request) {

		ActionErrors erros = new ActionErrors();

		if (getTipoEndereco() == 0) {
			erros.add("tipoEndereco", new ActionMessage("erro.tipoEndereco"));
		}
		
		if (getEndereco() == null || getEndereco().equals("")) {
			erros.add("endereco", new ActionMessage("erro.campoEndereco"));
		}
		
		if (getBairro() == null || getBairro().equals("")) {
			erros.add("bairro", new ActionMessage("erro.campoBairro"));
		}

		return erros;

	}


}