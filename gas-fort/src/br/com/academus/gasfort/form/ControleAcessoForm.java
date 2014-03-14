package br.com.academus.gasfort.form;

import java.util.ArrayList;
import java.util.List;

import org.apache.struts.action.ActionForm;

import br.com.academus.gasfort.modelo.ControleAcesso;

public class ControleAcessoForm extends ActionForm {

	private static final long serialVersionUID = 5292931411190394672L;

	private List<ControleAcesso> control = new ArrayList<ControleAcesso>();

	public List<ControleAcesso> getControl() {
		return control;
	}

	public void setControl(List<ControleAcesso> control) {
		this.control = control;
	}

}