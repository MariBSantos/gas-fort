package br.com.academus.gasfort.action;

import java.util.ArrayList;
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

public class AbreControleAcessoAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		String retorno = "ok";

		HttpSession httpSession = request.getSession();
		Usuario usuario = (Usuario) httpSession.getAttribute("user");

		Session session = new HibernateUtil().getSession();
		DAODao daoDao = new DAODao(session);

		String idUsuario = (String) request.getParameter("id");
		Usuario usu = daoDao.loadUsuario(Long.parseLong("1"));

		List<Usuario> usuarios = daoDao.listaUsuarios();

		List<ControleAcesso> controle = new ArrayList<ControleAcesso>();
		controle = daoDao.listaControle(usu);

		ControleAcessoForm formulario = (ControleAcessoForm) form;
		formulario.setControl(controle);

		httpSession.setAttribute("usuarios", usuarios);
		httpSession.setAttribute("usuario", usuario);
		httpSession.setAttribute("controle", controle);
		httpSession.setAttribute("idUsuario", idUsuario);

		return mapping.findForward(retorno);
	}
}