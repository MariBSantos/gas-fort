package br.com.academus.gasfort.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.hibernate.Session;

import br.com.academus.gasfort.dao.DAODao;
import br.com.academus.gasfort.form.ControleAcessoForm;
import br.com.academus.gasfort.modelo.ControleAcesso;
import br.com.academus.gasfort.modelo.Usuario;
import br.com.academus.gasfort.util.HibernateUtil;

public class ControleAcessoAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		String retorno = "ok";

		HttpSession httpSession = request.getSession();
		Usuario usuarios = (Usuario) httpSession.getAttribute("user");

		if (usuarios == null) {
			retorno = "expirado";
		} else {

			if (usuarios.getAdmin() == true) {

				Session session = new HibernateUtil().getSession();
				DAODao daoDao = new DAODao(session);

				ControleAcessoForm formulario = (ControleAcessoForm) form;

				List<ControleAcesso> controle = formulario.getControl();

				for (ControleAcesso controleAcesso : controle) {
					
					controleAcesso.setCria(controleAcesso.isCria());
					controleAcesso.setEdita(controleAcesso.isEdita());
					controleAcesso.setDeleta(controleAcesso.isDeleta());
					controleAcesso.setVisualiza(controleAcesso.isVisualiza());
					daoDao.atualiza(controleAcesso);
				}

				session.close();
			}

			else {
				retorno = "negado";
			}
		}

		return mapping.findForward(retorno);
	}
}