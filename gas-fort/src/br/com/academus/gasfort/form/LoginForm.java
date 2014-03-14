package br.com.academus.gasfort.form;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.hibernate.Session;

import br.com.academus.gasfort.dao.DAODao;
import br.com.academus.gasfort.modelo.Usuario;
import br.com.academus.gasfort.util.HibernateUtil;

public class LoginForm extends ActionForm {

	private static final long serialVersionUID = -5969841832060272405L;

	private String login;
	private String senha;

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

	@Override
	public ActionErrors validate(ActionMapping mapping,
			HttpServletRequest request) {

		ActionErrors erros = new ActionErrors();

		if (login == null || login.equals("")) {
			erros.add("login", new ActionMessage("erro.usuario-invalido"));
		}

		if (senha == null || senha.equals("")) {
			erros.add("senha", new ActionMessage("erro.senha-invalida"));
		}

		else {
			Session session = new HibernateUtil().getSession();
			Usuario usuario = new DAODao(session).verificaLogin(login, senha);

			if (usuario == null) {
				erros.add("dadosLogin", new ActionMessage("erro.usuario-senha-invalidos"));

			}

		}
		return erros;
	}

}
