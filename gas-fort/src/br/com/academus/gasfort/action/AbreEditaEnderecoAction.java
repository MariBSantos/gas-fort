package br.com.academus.gasfort.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.hibernate.Session;

import br.com.academus.gasfort.dao.DAODao;
import br.com.academus.gasfort.modelo.Endereco;
import br.com.academus.gasfort.util.HibernateUtil;

public class AbreEditaEnderecoAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		String retorno = "ok";

		HttpSession httpSession = request.getSession();

		Session session = new HibernateUtil().getSession();
		String idEndereco = (String) request.getParameter("id");

		Endereco endereco = new DAODao(session).loadEndereco(Long.parseLong(idEndereco));

		httpSession.setAttribute("endereco", endereco);

		return mapping.findForward(retorno);
	}
}