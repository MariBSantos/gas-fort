package br.com.academus.gasfort.form;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

public class ClienteForm extends ActionForm {

	private static final long serialVersionUID = 5292931411190394672L;
	private Long id;
	private Integer tipoCadastro;
	private String nomeFantasia;
	private String razaoSocial;
	private String cpf;
	private String rg;
	private String cnpj;
	private String ie;
	private String telefone1;
	private String telefone2;
	private String celular;
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
	
	public Integer getTipoCadastro() {
		return tipoCadastro;
	}

	public void setTipoCadastro(Integer tipoCadastro) {
		this.tipoCadastro = tipoCadastro;
	}
	
	public String getNomeFantasia() {
		return nomeFantasia;
	}

	public void setNomeFantasia(String nomeFantasia) {
		this.nomeFantasia = nomeFantasia;
	}

	public String getRazaoSocial() {
		return razaoSocial;
	}

	public void setRazaoSocial(String razaoSocial) {
		this.razaoSocial = razaoSocial;
	}
	
	public String getCpf() {
		return cpf;
	}

	public void setCpf(String cpf) {
		this.cpf = cpf;
	}

	public String getRg() {
		return rg;
	}

	public void setRg(String rg) {
		this.rg = rg;
	}

	public String getCnpj() {
		return cnpj;
	}

	public void setCnpj(String cnpj) {
		this.cnpj = cnpj;
	}

	public String getIe() {
		return ie;
	}

	public void setIe(String ie) {
		this.ie = ie;
	}
	
	@Override
	public ActionErrors validate(ActionMapping mapping,
			HttpServletRequest request) {

		ActionErrors erros = new ActionErrors();

		if (getTipoCadastro() == 0) {
			erros.add("tipoCadastro", new ActionMessage("erro.campoTipoCadastro"));
		}
		
		if(getTipoCadastro() == 1)
		{
			
			if (getRazaoSocial() == null || getRazaoSocial().equals("")) {
				erros.add("razaoSocial", new ActionMessage("erro.campoRazaoSocial"));
			}
			
			if (getCpf() == null || getCpf().equals("")) {
				erros.add("cpf", new ActionMessage("erro.campoCpf"));
			}
		}
		
		if(getTipoCadastro() == 2)
		{
			
			if (getRazaoSocial() == null || getRazaoSocial().equals("")) {
				erros.add("razaoSocial", new ActionMessage("erro.campoRazaoSocial"));
			}
			
			if (getCnpj() == null || getCnpj().equals("")) {
				erros.add("cnpj", new ActionMessage("erro.campoCnpj"));
			}
			
		}

		return erros;

	}

	public String getTelefone1() {
		return telefone1;
	}

	public void setTelefone1(String telefone1) {
		this.telefone1 = telefone1;
	}

	public String getTelefone2() {
		return telefone2;
	}

	public void setTelefone2(String telefone2) {
		this.telefone2 = telefone2;
	}

	public String getCelular() {
		return celular;
	}

	public void setCelular(String celular) {
		this.celular = celular;
	}

}