package br.com.academus.gasfort.form;

import java.util.ArrayList;
import java.util.List;

import org.apache.struts.action.ActionForm;

import br.com.academus.gasfort.modelo.ProdutoVenda;

public class ProdutoPedidoVendaForm extends ActionForm {
	
	private static final long serialVersionUID = 5292931411190394672L;
	
	private List<ProdutoVenda> control = new ArrayList<ProdutoVenda>();

	public List<ProdutoVenda> getControl() {
		return control;
	}

	public void setControl(List<ProdutoVenda> control) {
		this.control = control;
	}

	
}