package br.com.academus.gasfort.form;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

public class FormaPagamentoForm extends ActionForm {

	private static final long serialVersionUID = -1629992506919811712L;

	private Long id;
	private String descricaoForma;
	private Long forma;
	private String parcelas;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getForma() {
		return forma;
	}

	public void setForma(Long forma) {
		this.forma = forma;
	}

	public String getDescricaoForma() {
		return descricaoForma;
	}

	public void setDescricaoForma(String descricaoForma) {
		this.descricaoForma = descricaoForma;
	}
	public String getParcelas() {
		return parcelas;
	}

	public void setParcelas(String parcelas) {
		this.parcelas = parcelas;
	}


	@Override
	public ActionErrors validate(ActionMapping mapping,
			HttpServletRequest request) {

		ActionErrors erros = new ActionErrors();

		if (getDescricaoForma() == null || getDescricaoForma() == "") {
			erros.add("descricaoForma", new ActionMessage("erro.campoDescricao"));
		}

		if (getForma() == 0) {
			erros.add("forma", new ActionMessage("erro.campoForma"));
		}

		return erros;
	}

}
