package br.com.academus.gasfort.form;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

public class UsuarioForm extends ActionForm {

	private static final long serialVersionUID = 9059073400233379332L;

	private Long id;
	private String nome;
	private String login;
	private String senha;
	private String email;
	private Boolean admin;
	private Boolean ativo;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Boolean getAdmin() {
		return admin;
	}

	public void setAdmin(Boolean admin) {
		this.admin = admin;
	}

	public Boolean getAtivo() {
		return ativo;
	}

	public void setAtivo(Boolean ativo) {
		this.ativo = ativo;
	}
	
	@Override
	public ActionErrors validate(ActionMapping mapping,
			HttpServletRequest request) {

		ActionErrors erros = new ActionErrors();

		if (getNome() == null || getNome() == "") {
			erros.add("nome", new ActionMessage("erro.campoNome"));
		}
		
		if (getLogin() == null || getLogin() == "") {
			erros.add("login", new ActionMessage("erro.campoLogin"));
		}
		
		if (getSenha() == null || getSenha() == "") {
			erros.add("senha", new ActionMessage("erro.campoSenha"));
		}
		
		if (getEmail() == null || getEmail() == "") {
			erros.add("email", new ActionMessage("erro.campoEmail"));
		}

		return erros;
	}

}
